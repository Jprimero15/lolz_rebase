obj-y += timekeeping.o ntp.o clocksource.o jiffies.o timer_list.o timecompare.o
obj-y += timeconv.o posix-clock.o alarmtimer.o

obj-$(CONFIG_GENERIC_CLOCKEVENTS_BUILD)		+= clockevents.o
obj-$(CONFIG_GENERIC_CLOCKEVENTS)		+= tick-common.o
ifeq ($(CONFIG_GENERIC_CLOCKEVENTS_BROADCAST),y)
 obj-y						+= tick-broadcast.o
 obj-$(CONFIG_TICK_ONESHOT)			+= tick-broadcast-hrtimer.o
endif
obj-$(CONFIG_GENERIC_SCHED_CLOCK)		+= sched_clock.o
obj-$(CONFIG_TICK_ONESHOT)			+= tick-oneshot.o
obj-$(CONFIG_TICK_ONESHOT)			+= tick-sched.o
obj-$(CONFIG_TIMER_STATS)			+= timer_stats.o

ccflags-y += -Idrivers/cpuidle

