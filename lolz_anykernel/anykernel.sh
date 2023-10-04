### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
# Modified by Jprimero15 @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=*   LolZ-Kernel For Android 9/10/11/12/13
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
supported.versions=9 - 13
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
} # end attributes

# boot shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk

# Mount System
mount -o rw,remount -t auto /system;

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
elif [ "$OSV" == "11" ]; then
  ui_print "- Android 11 Detected!!";
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
elif [ "$OSV" == "12" ]; then
  ui_print "- Android 12 Detected!!";
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
elif [ "$OSV" == "13" ]; then
  ui_print "- Android 13 Detected!!";
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
mount -o ro,remount -t auto /system;

write_boot; # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
## end boot install


## init_boot files attributes
#init_boot_attributes() {
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
#} # end attributes

# init_boot shell variables
#block=init_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for init_boot patching
#reset_ak;

# init_boot install
#dump_boot; # unpack ramdisk since it is the new first stage init ramdisk where overlay.d must go

#write_boot;
## end init_boot install


## vendor_kernel_boot shell variables
#block=vendor_kernel_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_kernel_boot patching
#reset_ak;

# vendor_kernel_boot install
#split_boot; # skip unpack/repack ramdisk, e.g. for dtb on devices with hdr v4 and vendor_kernel_boot

#flash_boot;
## end vendor_kernel_boot install


## vendor_boot files attributes
#vendor_boot_attributes() {
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
#} # end attributes

# vendor_boot shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_boot patching
#reset_ak;

# vendor_boot install
#dump_boot; # use split_boot to skip ramdisk unpack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot

#write_boot; # use flash_boot to skip ramdisk repack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot
## end vendor_boot install

