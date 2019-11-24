# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers
# Modified by jprimero15 @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=*   LolZ-Kernel For Android 9 and 10
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=hlte
device.name2=hltecan
device.name3=hltechn
device.name5=hltekor
device.name6=hlteskt
device.name7=hltespr
device.name8=hltetmo
device.name9=hltexx
supported.versions=9 - 10
'; } # end properties

# shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 750 750 $ramdisk/*;
chmod -R 640 $ramdisk/fstab.qcom;
chmod -R 644 $ramdisk/ueventd.qcom.rc;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# Mount System
mount -o rw,remount -t auto /system;

# Get Android Version from /system/vendor
OSV="$(file_getprop /system/vendor/build.prop ro.vendor.build.version.release)";
#  Check Android Version
if [ "$OSV" == "10" ] || [ "$OSV" == "10.0" ] || [ "$OSV" == "10.0.0" ]; then
  ui_print "- Android 10 Detected!!";
  ui_print "- Configuring Ramdisk...";
  rm $ramdisk/fstab.qcom;
  rm $ramdisk/init.lolz.rc;
  rm $ramdisk/init.lolzboot.sh;
  rm $ramdisk/init.qcom.rc;
  rm $ramdisk/init.target.rc;
 else
  ui_print "- Android 9(PIE) Detected!!";
  ui_print "- Configuring Ramdisk...";
  rm -rf $ramdisk/overlay.d;
fi;
  ui_print "- Ramdisk has been Configured!!";

# Check Mpdecision
  ui_print "- MPDecision Found! Disabling..."
if [ -f /system/vendor/bin/mpdecision ]; then
  mv /system/vendor/bin/mpdecision /system/vendor/bin/mpdecision.bak;
  ui_print "- MPDecision has been Disabled!";
 else
  ui_print "- MPDecision has been Disabled!";
fi;

# UnMount System
mount -o ro,remount -t auto /system;

# end ramdisk changes

write_boot;
## end install

