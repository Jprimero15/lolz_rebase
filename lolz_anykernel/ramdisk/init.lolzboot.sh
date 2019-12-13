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
    echo "1036800" >  /sys/devices/system/cpu/cpufreq/lolznappy/hispeed_freq
    echo "95" > /sys/devices/system/cpu/cpufreq/lolznappy/go_hispeed_load
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

    # Set I/O Scheduler Tweaks
    echo "fiops" > /sys/block/mmcblk0/queue/scheduler
    echo "fiops" > /sys/block/mmcblk1/queue/scheduler

    # Set Normal thermal Restrictions
    echo "1728000 55 53" > /sys/kernel/msm_thermal/zone0
    echo "1497600 60 56" > /sys/kernel/msm_thermal/zone1
    echo "1267200 65 59" > /sys/kernel/msm_thermal/zone2
    echo "1036800 70 64" > /sys/kernel/msm_thermal/zone3
    echo "8000" > /sys/kernel/msm_thermal/sampling_ms
    echo  "1" > /sys/kernel/msm_thermal/enabled

    # Turn off led lights becuase we are done
    echo "0" > /sys/devices/leds-qpnp-24/leds/led:rgb_red/brightness
    echo "0" > /sys/devices/leds-qpnp-24/leds/led:rgb_green/brightness
    echo "0" > /sys/devices/leds-qpnp-24/leds/led:rgb_blue/brightness

    # We are done here
    echo "LolZ-Kernel: Boot Script Executed Sucesfully !! " | tee /dev/kmsg
fi;

