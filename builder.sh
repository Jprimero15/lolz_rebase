#!/usr/bin/env bash
#
# Copyright (C) 2021 Jprimero15
# Lolz Kernel Build Script (CI Edition)
#
# shellcheck disable=SC2086

#set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

while (( ${#} )); do
  case ${1} in
       "hltechn") CHN=true ;;
       "hltekor") KOR=true ;;
       "hltetmo") TMO=true ;;
  esac
  shift
done

# Choose which variant to build
if [[ -n ${CHN} ]]; then
    KERNEL_VARIANT="hltechn"
    KERNEL_DEFCONFIG="lolz_hltechn_defconfig"
fi
if [[ -n ${KOR} ]]; then
    KERNEL_VARIANT="hltekor"
    KERNEL_DEFCONFIG="lolz_hltekor_defconfig"
fi
if [[ -n ${TMO} ]]; then
    KERNEL_VARIANT="hltetmo"
    KERNEL_DEFCONFIG="lolz_hltetmo_defconfig"
fi

[[ -z ${CHN} && -z ${KOR} && -z ${TMO} ]] && {
    KERNEL_VARIANT="hlte"
    KERNEL_DEFCONFIG="lolz_hlte_defconfig"; }

# Definitions Here
LDIR="${PWD}" 
KERNEL_NAME="LOLZ"
KERNEL_VERSION="16"
COMPILE_DT="y"
KERNEL_DATE="$(date +"%Y%m%d")"
BUILD_DIR="$LDIR/output_$KERNEL_VARIANT"
KERNEL_IMAGE="$BUILD_DIR/arch/arm/boot/zImage"
DT="$BUILD_DIR/arch/arm/boot/dt.img"
ANYKERNEL_DIR="$LDIR/lolz_anykernel"
CLANG_DIR="${LDIR}/clang14"
PATH="${CLANG_DIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${CLANG_DIR}/lib:${LD_LIBRARY_PATH}"

export KBUILD_BUILD_USER="Jprimero15"

# ***** ***** ***** ***** ***THE END*** ***** ***** ***** ***** #

# create the outdir
mkdir $BUILD_DIR 

# Update Kernel version
make O=$BUILD_DIR ARCH=arm $KERNEL_DEFCONFIG
sed -i "s;Lolz;$KERNEL_NAME-V$KERNEL_VERSION;" $BUILD_DIR/.config;

# Let's Compile with CLANG
    make -j"$(nproc --all)" O=$BUILD_DIR \
                          ARCH=arm \
                          CC=clang \
                          CLANG_TRIPLE=arm-linuxgnueabi- \
                          CROSS_COMPILE=arm-linux-gnueabi-

  if [ -f $KERNEL_IMAGE ]; then
    echo -e  "  LOLZ Kernel Compiled Successfully!!"
  else
    echo -e "  LOLZ Kernel Not Compiled!!"
    echo -e "  Fix Your Derp First!! Aborting..."
    exit
  fi

    cp $KERNEL_IMAGE $ANYKERNEL_DIR/
    # compile dt if required
    if [ "y" == "$COMPILE_DT" ]; then
        if [ -f $DT ]; then
            rm -f $DT
        fi
        chmod 777 scripts/dtbToolCM
        scripts/dtbToolCM -2 -o $DT -s 2048 -p $BUILD_DIR/scripts/dtc/ $BUILD_DIR/arch/arm/boot/
        # removing old dt file (if any)
        if [ -f $ANYKERNEL_DIR/dt ]; then
            rm -f $ANYKERNEL_DIR/dt
        fi
        # copying generated dt to anykernel directory
        if [ -e $DT ]; then
            mv -f $DT $ANYKERNEL_DIR/dt
        fi
    fi

    cd $ANYKERNEL_DIR && zip -r9 $KERNEL_NAME-V$KERNEL_VERSION-$KERNEL_VARIANT.zip * -x README.md $KERNEL_NAME-V$KERNEL_VERSION-$KERNEL_VARIANT.zip
    if [ -f $ANYKERNEL_DIR/$KERNEL_NAME-V$KERNEL_VERSION-$KERNEL_VARIANT.zip  ]; then
     echo -e "LOLZ Kernel Installer zipped Successfully"
    else
     echo -e "Zipping LOLZ Kernel Installer Failed!"
     exit
    fi;

curl -F "document=@$ANYKERNEL_DIR/$KERNEL_NAME-V$KERNEL_VERSION-$KERNEL_VARIANT.zip" --form-string "caption=<b>LOLZ Kernel Build Compiled&#33 </b>
<b>Build Version: <code> v17 -Test</code></b>
<b>Date: <code>$(date '+%B %d, %Y.') </code></b>
<b>Time: <code>$(date +'%r')</code></b>" "https://api.telegram.org/bot$TG_BOT_TOKEN/sendDocument?chat_id=-1001222358827&parse_mode=html" 
 
# END of script
