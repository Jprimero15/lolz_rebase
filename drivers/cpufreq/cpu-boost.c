/*
 * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
 * Copyright (c) 2013-2016, Pranav Vashi <neobuddy89@gmail.com>
 * Merge Alucard & Dorimanx Touch-boost driver 2016
 * Mostafa Zarghami<mostafazarghami@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#define pr_fmt(fmt) "cpu-boost: " fmt

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/notifier.h>
#include <mach/cpufreq.h>
#include <linux/cpufreq.h>
#include <linux/cpu.h>
#include <linux/sched.h>
#include <linux/jiffies.h>
#include <linux/smpboot.h>
#include <linux/moduleparam.h>
#include <linux/slab.h>
#include <linux/input.h>
#include <linux/time.h>
#ifdef CONFIG_STATE_NOTIFIER
#include <linux/state_notifier.h>
#endif

/*
 * debug = 1 will print all
 */
static unsigned int debug = 0;
module_param_named(debug_mask, debug, uint, 0644);

#define dprintk(msg...)		\
do {				\
	if (debug)		\
		pr_info(msg);	\
} while (0)

struct cpu_sync {
	int cpu;
	unsigned int input_boost_min;
	unsigned int input_boost_freq;
};

static DEFINE_PER_CPU(struct cpu_sync, sync_info);
static struct workqueue_struct *cpu_boost_wq;
static struct delayed_work input_boost_rem;
static struct work_struct input_boost_work;

#ifdef CONFIG_STATE_NOTIFIER
static struct notifier_block notif;
#endif

static unsigned int input_boost_enabled = 0;
module_param(input_boost_enabled, uint, 0644);

static unsigned int input_boost_freq = 960000;
module_param(input_boost_freq, uint, 0644);

static unsigned int input_boost_ms = 40;
module_param(input_boost_ms, uint, 0644);

static unsigned int nr_boost_cpus = 2;
module_param(nr_boost_cpus, uint, 0644);

static bool hotplug_boost;
module_param(hotplug_boost, bool, 0644);

static bool wakeup_boost;
module_param(wakeup_boost, bool, 0644);

static u64 last_input_time;

static unsigned int min_input_interval = 150;
module_param(min_input_interval, uint, 0644);

static struct min_cpu_limit {
	uint32_t user_min_freq_lock[4];
	uint32_t user_boost_freq_lock[4];
} limit = {
	.user_min_freq_lock[0] = 0,
	.user_min_freq_lock[1] = 0,
	.user_min_freq_lock[2] = 0,
	.user_min_freq_lock[3] = 0,
	.user_boost_freq_lock[0] = 0,
	.user_boost_freq_lock[1] = 0,
	.user_boost_freq_lock[2] = 0,
	.user_boost_freq_lock[3] = 0,
};

/*
 * The CPUFREQ_ADJUST notifier is used to override the current policy min to
 * make sure policy min >= boost_min. The cpufreq framework then does the job
 * of enforcing the new policy.
 */
static int boost_adjust_notify(struct notifier_block *nb, unsigned long val,
				void *data)
{
	struct cpufreq_policy *policy = data;
	unsigned int cpu = policy->cpu;
	struct cpu_sync *s = &per_cpu(sync_info, cpu);
	unsigned int ib_min = s->input_boost_min;
	unsigned int min;

	if (val != CPUFREQ_ADJUST)
		return NOTIFY_OK;

	if (!ib_min)
		return NOTIFY_OK;

	min = min(ib_min, policy->max);

	dprintk("CPU%u policy min before boost: %u kHz\n",
		 cpu, policy->min);
	dprintk("CPU%u boost min: %u kHz\n", cpu, min);

	cpufreq_verify_within_limits(policy, min, UINT_MAX);

	dprintk("CPU%u policy min after boost: %u kHz\n",
		 cpu, policy->min);

	return NOTIFY_OK;
}

static struct notifier_block boost_adjust_nb = {
	.notifier_call = boost_adjust_notify,
};

static void do_input_boost_rem(struct work_struct *work)
{
	unsigned int cpu;

	for_each_possible_cpu(cpu) {
		if (limit.user_boost_freq_lock[cpu] > 0) {
			dprintk("Removing input boost for CPU%u\n", cpu);
			msm_cpufreq_set_freq_limits(cpu,
					limit.user_min_freq_lock[cpu], 0);
			limit.user_boost_freq_lock[cpu] = 0;
		}
	}
}

static void do_input_boost(struct work_struct *work)
{
	unsigned int cpu;
	unsigned nr_cpus = nr_boost_cpus;

	cancel_delayed_work_sync(&input_boost_rem);

	if (nr_cpus <= 0)
		nr_cpus = 1;
	else if (nr_cpus > NR_CPUS)
		nr_cpus = NR_CPUS;

	if (input_boost_freq != 0) {
		if (input_boost_freq > 1958400)
			input_boost_freq = 1958400;
		if (input_boost_freq < 300000)
			input_boost_freq = 960000;
	}

	for (cpu = 0; cpu < nr_cpus; cpu++) {
		struct cpufreq_policy policy;
		unsigned int cur = 0;

		/* Save user current min & boost lock */
		limit.user_min_freq_lock[cpu] = 0;
		limit.user_boost_freq_lock[cpu] = input_boost_freq;

		dprintk("Input boost for CPU%u\n", cpu);
		msm_cpufreq_set_freq_limits(cpu, limit.user_boost_freq_lock[cpu], 0);

		if (cpu_online(cpu)) {
			cur = cpufreq_quick_get(cpu);
			if (cur < limit.user_boost_freq_lock[cpu] && cur > 0) {
				policy.cpu = cpu;
				cpufreq_driver_target(&policy,
					limit.user_boost_freq_lock[cpu],
							CPUFREQ_RELATION_L);
			}
		}
	}

	queue_delayed_work(cpu_boost_wq, &input_boost_rem,
					msecs_to_jiffies(input_boost_ms));

}

static void cpuboost_input_event(struct input_handle *handle,
		unsigned int type, unsigned int code, int value)
{
	u64 now;

#ifdef CONFIG_STATE_NOTIFIER
	if (state_suspended)
		return;
#endif

	if (!input_boost_enabled)
		return;

	now = ktime_to_us(ktime_get());
	if ((now - last_input_time) < (min_input_interval * USEC_PER_MSEC))
		return;

	if (work_pending(&input_boost_work))
		return;

	dprintk("Input boost for input event.\n");

	queue_work(cpu_boost_wq, &input_boost_work);
	last_input_time = ktime_to_us(ktime_get());
}

static int cpuboost_input_connect(struct input_handler *handler,
		struct input_dev *dev, const struct input_device_id *id)
{
	struct input_handle *handle;
	int error;

	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
	if (!handle)
		return -ENOMEM;

	handle->dev = dev;
	handle->handler = handler;
	handle->name = handler->name;

	error = input_register_handle(handle);
	if (error)
		goto err2;

	error = input_open_device(handle);
	if (error)
		goto err1;

	return 0;
err1:
	input_unregister_handle(handle);
err2:
	kfree(handle);
	return error;
}

static void cpuboost_input_disconnect(struct input_handle *handle)
{
	input_close_device(handle);
	input_unregister_handle(handle);
	kfree(handle);
}

static const struct input_device_id cpuboost_ids[] = {
	/* multi-touch touchscreen */
	{
		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
			INPUT_DEVICE_ID_MATCH_ABSBIT,
		.evbit = { BIT_MASK(EV_ABS) },
		.absbit = { [BIT_WORD(ABS_MT_POSITION_X)] =
			BIT_MASK(ABS_MT_POSITION_X) |
			BIT_MASK(ABS_MT_POSITION_Y) },
	},
	/* touchpad */
	{
		.flags = INPUT_DEVICE_ID_MATCH_KEYBIT |
			INPUT_DEVICE_ID_MATCH_ABSBIT,
		.keybit = { [BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH) },
		.absbit = { [BIT_WORD(ABS_X)] =
			BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) },
	},
	/* Keypad */
	{
		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
		.evbit = { BIT_MASK(EV_KEY) },
	},
	{ },
};

static struct input_handler cpuboost_input_handler = {
	.event          = cpuboost_input_event,
	.connect        = cpuboost_input_connect,
	.disconnect     = cpuboost_input_disconnect,
	.name           = "cpu-boost",
	.id_table       = cpuboost_ids,
};

static int cpuboost_cpu_callback(struct notifier_block *cpu_nb,
				 unsigned long action, void *hcpu)
{
#ifdef CONFIG_STATE_NOTIFIER
	if (state_suspended)
		return NOTIFY_OK;
#endif

	switch (action & ~CPU_TASKS_FROZEN) {
		case CPU_ONLINE:
			if (!hotplug_boost || !input_boost_enabled ||
			     work_pending(&input_boost_work))
				break;
			dprintk("Hotplug boost for CPU%lu\n", (long)hcpu);
			queue_work(cpu_boost_wq, &input_boost_work);
			last_input_time = ktime_to_us(ktime_get());
			break;
		default:
			break;
	}
	return NOTIFY_OK;
}

static struct notifier_block __refdata cpu_nblk = {
        .notifier_call = cpuboost_cpu_callback,
};

#ifdef CONFIG_STATE_NOTIFIER
static void __wakeup_boost(void)
{
	if (!wakeup_boost || !input_boost_enabled ||
	     work_pending(&input_boost_work))
		return;
	dprintk("Wakeup boost for display on event.\n");
	queue_work(cpu_boost_wq, &input_boost_work);
	last_input_time = ktime_to_us(ktime_get());
}

static int state_notifier_callback(struct notifier_block *this,
				unsigned long event, void *data)
{
	switch (event) {
		case STATE_NOTIFIER_ACTIVE:
			__wakeup_boost();
			break;
		default:
			break;
	}

	return NOTIFY_OK;
}
#endif

static int cpu_boost_init(void)
{
	int cpu, ret;
	struct cpu_sync *s;

 	cpu_boost_wq = alloc_workqueue("touch_boost_wq", WQ_HIGHPRI |
			WQ_MEM_RECLAIM |
			WQ_UNBOUND, 0);

	if (!cpu_boost_wq)
		return -EFAULT;

	INIT_WORK(&input_boost_work, do_input_boost);
	INIT_DELAYED_WORK(&input_boost_rem, do_input_boost_rem);

	for_each_possible_cpu(cpu) {
		s = &per_cpu(sync_info, cpu);
		s->cpu = cpu;
	}
	cpufreq_register_notifier(&boost_adjust_nb, CPUFREQ_POLICY_NOTIFIER);

	ret = input_register_handler(&cpuboost_input_handler);
	if (ret)
		pr_err("Cannot register cpuboost input handler.\n");

	ret = register_hotcpu_notifier(&cpu_nblk);
	if (ret)
		pr_err("Cannot register cpuboost hotplug handler.\n");

#ifdef CONFIG_STATE_NOTIFIER
	notif.notifier_call = state_notifier_callback;
	if (state_register_client(&notif))
		pr_err("Cannot register State notifier callback for cpuboost.\n");
#endif

	return ret;
}
late_initcall(cpu_boost_init);
