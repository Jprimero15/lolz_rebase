#!/system/bin/sh
#
# Copyright (c) 2019, The Lolz Kernel Project. All rights reserved.
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

sleep 20;
# Set Lolznappy CPU Governor
echo "lolznappy" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
echo "lolznappy" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor;
echo "lolznappy" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
echo "lolznappy" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;
echo "20000 1190400:60000 1728000:75000 1958400:80000 2265600:100000" > /sys/devices/system/cpu/cpufreq/lolznappy/above_hispeed_delay;
echo "1190400" >  /sys/devices/system/cpu/cpufreq/lolznappy/hispeed_freq;
echo "95" > /sys/devices/system/cpu/cpufreq/lolznappy/go_hispeed_load;
echo "0" > /sys/devices/system/cpu/cpufreq/lolznappy/io_is_busy;
echo "98 268800:28 300000:12 422400:34 652800:41 729600:12 883200:52 960000:9 1036800:8 1190400:73 1267200:6 1497600:87 1574400:5 1728000:89 1958400:91 2265600:94" > /sys/devices/system/cpu/cpufreq/lolznappy/target_loads;
echo "40000" > /sys/devices/system/cpu/cpufreq/lolznappy/min_sample_time;
echo "40000" > /sys/devices/system/cpu/cpufreq/lolznappy/timer_rate;
echo "80000" > /sys/devices/system/cpu/cpufreq/lolznappy/timer_slack;
echo "0" > /sys/devices/system/cpu/cpufreq/lolznappy/max_freq_hysteresis;

# Stop modifying scaling_governor now since we're done here
chown root.root /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
chown root.root /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor;
chown root.root /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
chown root.root /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;
chmod 0444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
chmod 0444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor;
chmod 0444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
chmod 0444  /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;

sleep 20;
# Set GPU Min/Max Frequency
echo "100000000" > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq;
echo "600000000" > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq;
echo "450000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk;

# Set TCP Congestion
chmod 0664 /proc/sys/net/ipv4/tcp_congestion_control;
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control;
chown root.root /proc/sys/net/ipv4/tcp_congestion_control;
chmod 0444 /proc/sys/net/ipv4/tcp_congestion_control;

# Set I/O Scheduler
echo "bfq" > /sys/block/mmcblk1/queue/scheduler;
echo "bfq" > /sys/block/mmcblk0/queue/scheduler;
chown root.root /sys/block/mmcblk1/queue/scheduler;
chown root.root /sys/block/mmcblk0/queue/scheduler;
chmod 0444 /sys/block/mmcblk1/queue/scheduler;
chmod 0444 /sys/block/mmcblk0/queue/scheduler;

# Turn off led lights becuase we are done
echo "0" > /sys/devices/leds-qpnp-24/leds/led:rgb_red/brightness
echo "0" > /sys/devices/leds-qpnp-24/leds/led:rgb_green/brightness
echo "0" > /sys/devices/leds-qpnp-24/leds/led:rgb_blue/brightness

