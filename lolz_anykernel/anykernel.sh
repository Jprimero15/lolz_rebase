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
device.name4=hltekor
device.name5=hlteskt
device.name6=hltespr
device.name7=hltetmo
device.name8=hltexx
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
  backup_file /system/vendor/etc/init/hw/init.qcom.rc;
#  insert_line /system/vendor/etc/init/hw/init.qcom.rc "init.lolz.rc" after "import /system/vendor/etc/init/hw/init.target.rc" "import /system/vendor/etc/init/hw/init.lolz.rc";
  rm -rf /system/vendor/etc/init/hw/init.lolz.rc;
  cp -fr $ramdisk/init.lolz.rc /system/etc/init/init.lolz.rc;
  cp -fr $ramdisk/init.lolzboot.sh /system/bin/init.lolzboot.sh;
  chmod 755 /system/bin/init.lolzboot.sh;
  chmod 644 /system/etc/init/init.lolz.rc;
  rm $ramdisk/fstab.qcom;
  rm $ramdisk/init.lolz.rc;
  rm $ramdisk/init.lolzboot.sh;
  rm $ramdisk/init.qcom.rc;
  rm $ramdisk/init.target.rc;
 else
  ui_print "- Android 9(PIE) Detected!!";
  ui_print "- Configuring Ramdisk...";
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

# UnMount System
mount -o ro,remount -t auto /system;

# end ramdisk changes

write_boot;
## end install

