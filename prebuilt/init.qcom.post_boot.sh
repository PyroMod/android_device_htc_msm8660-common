#!/system/bin/sh
#
# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Modified by showp1984, memnoc and blahbl4hblah

target=`getprop ro.board.platform`
case "$target" in
    "msm8660" | "msm8660_csfb")
	 echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
	 echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
	 echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_dig
	 echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_mem
	 echo 1 > /sys/module/rpm_resources/enable_low_power/rpm_cpu
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu0/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu1/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu0/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu1/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu0/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu1/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu0/standalone_power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu1/standalone_power_collapse/idle_enabled
	 chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	 chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
	 chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
	 chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
	 chown root.system /sys/devices/system/cpu/mfreq
	 chmod 220 /sys/devices/system/cpu/mfreq
	 chown root.system /sys/devices/system/cpu/cpu1/online
	 chmod 664 /sys/devices/system/cpu/cpu1/online
         mount -t debugfs none /sys/kernel/debug
	 echo "0,1,2,4,6,15" > /sys/module/lowmemorykiller/parameters/adj
	 echo 1 > /sys/module/lowmemorykiller/parameters/check_filepages
	 echo 32 > /sys/module/lowmemorykiller/parameters/cost
	 echo 2 > /sys/module/lowmemorykiller/parameters/debug_level
	 echo "3584,4096,8192,10240,11264,12288" > /sys/module/lowmemorykiller/parameters/minfile
	 echo "1536,3072,44800,51200,64000,76800" > /sys/module/lowmemorykiller/parameters/minfree
	 echo "2048" > /sys/block/mmcblk0/bdi/read_ahead_kb
	 echo "2048" > /sys/block/mmcblk1/bdi/read_ahead_kb
	 echo "2048" > /sys/devices/virtual/bdi/179:0/read_ahead_kb
        ;;
esac

emmc_boot=`getprop ro.emmc`
case "$emmc_boot"
    in "1")
        chown system /sys/devices/platform/rs300000a7.65536/force_sync
        chown system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown system /sys/devices/platform/rs300100a7.65536/force_sync
        chown system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

