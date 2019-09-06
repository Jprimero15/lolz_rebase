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

    # We are done here
    echo "LolZ-Kernel: Boot Script Executed Sucesfully !! " | tee /dev/kmsg
fi;

