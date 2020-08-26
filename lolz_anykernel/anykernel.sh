# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers
# Modified by Jprimero15 @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=*   LolZ-Kernel For Android 9 and 10
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=hlte
device.name2=hltecan
device.name3=hltechn
device.name4=hltekor
device.name5=hlteskt
device.name6=hltespr
device.name7=hltetmo
device.name8=hltexx
supported.versions=9 - 10
supported.patchlevels=
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
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# Mount System
$BB mount -o rw,remount -t auto /system;

# Get Android Version from system
OSV="$(file_getprop /system/build.prop ro.build.version.release)";
if [ "$OSV" == "9" ]; then
  ui_print "- Android 9(PIE) Detected!!";
  ui_print "- Configuring Ramdisk...";
elif [ "$OSV" == "10" ]; then
  ui_print "- Android 10 Detected!!";
  ui_print "- Configuring Ramdisk...";
  rm -rf /sbin/*lolz*;
  rm -rf /system/vendor/bin/*lolz*.sh;
  rm -rf /system/vendor/etc/init/hw/*lolz*;
  rm -rf /system/vendor/etc/init/*lolz*;
  cp -fr $ramdisk/init.lolz.rc /system/vendor/etc/init/init.lolz.rc;
  cp -fr $ramdisk/init.lolzboot.sh /system/bin/init.lolzboot.sh;
  chmod 755 /system/bin/init.lolzboot.sh;
  chown root.shell /system/bin/init.lolzboot.sh;
  chmod 644 /system/vendor/etc/init/init.lolz.rc;
  rm $ramdisk/fstab.qcom;
  rm $ramdisk/init.lolz.rc;
  rm $ramdisk/init.lolzboot.sh;
  rm $ramdisk/init.qcom.rc;
  rm $ramdisk/init.target.rc;
else
 abort "- ANDROID VERSION CAN'T BE DETECTED!!!. Aborting..."
fi;
  ui_print "- Ramdisk has been Configured!!";

# Check Mpdecision
if [ -f /system/vendor/bin/mpdecision ]; then
  ui_print "- MPDecision Found! Disabling..."
  mv /system/vendor/bin/mpdecision /system/vendor/bin/lolz.mpdecision;
  ui_print "- MPDecision has been Disabled!";
 else
  ui_print "- MPDecision is Disabled!!";
fi;

# Check Thermal Driver
if [ -f /system/vendor/bin/thermal-engine ] || [ -f /system/vendor/lib/libthermalclient.so ] || [ -f /system/vendor/lib/libthermalioctl.so ]; then
  ui_print "- Stock Thermal Found! Disabling..."
  mv /system/vendor/bin/thermal-engine /system/vendor/bin/lolz.thermal-engine;
  mv /system/vendor/lib/libthermalclient.so /system/vendor/lib/lolz.libthermalclient.so;
  mv /system/vendor/lib/libthermalioctl.so /system/vendor/lib/lolz.libthermalclient.so;
  ui_print "- Stock Thermal has been Disabled!";
  ui_print "- Enabling New Thermal Driver...";
  ui_print "- New Thermal Driver Enabled!!";
 else
  ui_print "- New Thermal Driver is Enabled!!";
fi;

# Unmount System
$BB mount -o ro,remount -t auto /system;

# end ramdisk changes

write_boot;
## end install

