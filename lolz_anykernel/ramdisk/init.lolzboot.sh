#!/system/bin/sh
#
# Copyright (C) 2018-2019 The Lolz Kernel Project. All rights reserved.
#
# LolZ-Kernel Boot Script
# Author: Joshua Primero <jprimero155@gmail.com>
#
# This script is licensed under the terms of the GNU General Public 
# License version 2, as published by the Free Software Foundation, 
# and may be copied, distributed, and modified under those terms.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#

if [ "$(grep -c Lol /proc/version)" -eq "1" ]; then
    echo "LolZ-Kernel: Execute Boot Script Now !!" | tee /dev/kmsg

    # Set Lolznappy CPU Governor
    echo "lolznappy" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo "lolznappy" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor 
    echo "lolznappy" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
    echo "lolznappy" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
    echo "20000 1190400:60000 1728000:74000 1958400:82000 2265600:120000" > /sys/devices/system/cpu/cpufreq/lolznappy/above_hispeed_delay
    echo "1190400" >  /sys/devices/system/cpu/cpufreq/lolznappy/hispeed_freq
    echo "110" > /sys/devices/system/cpu/cpufreq/lolznappy/go_hispeed_load
    echo "0" > /sys/devices/system/cpu/cpufreq/lolznappy/io_is_busy
    echo "98 268800:28 300000:12 422400:34 652800:41 729600:12 883200:52 960000:9 1036800:8 1190400:73 1267200:6 1497600:87 1574400:5 1728000:89 1958400:91 2265600:94" > /sys/devices/system/cpu/cpufreq/lolznappy/target_loads
    echo "40000" > /sys/devices/system/cpu/cpufreq/lolznappy/min_sample_time
    echo "40000" > /sys/devices/system/cpu/cpufreq/lolznappy/timer_rate
    echo "80000" > /sys/devices/system/cpu/cpufreq/lolznappy/timer_slack
    echo "0" > /sys/devices/system/cpu/cpufreq/lolznappy/max_freq_hysteresis

    # Set GPU Min/Max Frequency
    echo "100000000" > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
    echo "600000000" > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
    echo "450000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk

    # Set TCP Congestion
    chmod 0664 /proc/sys/net/ipv4/tcp_congestion_control
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control

    # Set I/O Scheduler
    echo "noop" > /sys/block/mmcblk1/queue/scheduler
    echo "noop" > /sys/block/mmcblk0/queue/scheduler

    # Enable RQbalance and Tweaks if boot completed
    echo "rqbalance" > /sys/devices/system/cpu/cpuquiet/current_governor
    echo "268000 0" > /sys/devices/system/cpu/cpuquiet/rqbalance/idle_bottom_freq
    echo "960000 0" > /sys/devices/system/cpu/cpuquiet/rqbalance/idle_top_freq

    # We are done here
    echo "LolZ-Kernel: Boot Script Executed Sucesfully !! " | tee /dev/kmsg
fi;

