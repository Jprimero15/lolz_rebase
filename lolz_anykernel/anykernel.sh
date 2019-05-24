# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers
# Modified by jprimero15 @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=*  LolZ-Kernel For Oreo and PIE
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=hltexx
device.name2=hlte
device.name3=hltekor
device.name4=hltetmo
device.name5=hltechn
device.name6=hltespr
device.name7=hltecan
device.name8=hlteskt
device.name9=hltedcm
supported.versions=8.1.0, 9
'; } # end properties

# shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.qcom.rc
backup_file init.qcom.rc;
remove_line init.qcom.rc "start mpdecision";
insert_line init.qcom.rc "init.lolz.rc" after "import init.target.rc" "import init.lolz.rc";

# init.target.rc
backup_file init.target.rc;
replace_section init.target.rc "service mpdecision" " " "#service mpdecision /vendor/bin/mpdecision --avg_comp\n#   class main\n#   user root\n#   group root readproc\n#   disabled";

# permissive mode
patch_cmdline "androidboot.selinux=permissive" "androidboot.selinux=permissive"

# end ramdisk changes

write_boot;

## end install

