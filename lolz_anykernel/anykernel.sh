# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers
# Modified by jprimero15 @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=*    LolZ-Kernel For Android 10
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=hlte
device.name2=hltecan
device.name3=hltechn
device.name5=hltedcm
device.name5=hltekor
device.name6=hlteskt
device.name7=hltespr
device.name8=hltetmo
device.name9=hltexx
supported.versions=10
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

## AnyKernel install
dump_boot;

# begin ramdisk changes

# Migrate from /overlay to /overlay.d to enable SAR Magisk
if [ -d $ramdisk/overlay ]; then
  rm -rf $ramdisk/overlay;
fi;

# Nuke MPdecision
$bb mount -o rw,remount -t auto /system
if [ -q /system ] && [ -f /system/vendor/bin/mpdecision ]; then
  ui_print "- MPDecision Found! Disabling.."
  mv /system/vendor/bin/mpdecision /system/vendor/bin/mpdecision.bak
  else
  ui_print "- MPDecision Disabled!! Good"
  fi
$bb mount -o ro,remount -t auto /system;

# end ramdisk changes

write_boot;
## end install

