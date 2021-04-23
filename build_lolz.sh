#!/bin/bash
#
# Copyright (C) 2021 Jprimero15
# Lolz Kernel Build Script
#

# DO NOT DELETE/MODIFY THIS
if [ $USER == Jprimero15 ]; then

while (( ${#} )); do
  case ${1} in
       "hltechn") CHN=true ;;
       "hltekor") KOR=true ;;
       "hltetmo") TMO=true ;;
       "--gcc") GCC=true ;;
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

# CLANG or GCC??
if [[ -z ${GCC} ]]; then
    # Lets use CLANG
    CLANG_DIR="${HOME}/proton13"
    PATH="${CLANG_DIR}/bin:${PATH}"
    export LD_LIBRARY_PATH="${CLANG_DIR}/lib:${LD_LIBRARY_PATH}"
else
    # Lets use GCC
    TOOLCHAIN="$HOME/gcc10/bin/arm-eabi-"
fi

# Definitions Here
KERNEL_NAME="LOLZ"
KERNEL_VERSION="16"
KERNEL_DATE="$(date +"%Y%m%d")"
BUILD_DIR="output_$KERNEL_VARIANT"
KERNEL_IMAGE="$BUILD_DIR/arch/arm/boot/zImage"
COMPILE_DT="y"
DT="$BUILD_DIR/arch/arm/boot/dt.img"
ANYKERNEL_DIR="lolz_anykernel"
RELEASE_DIR="release"

# ***** ***** ***** ***** ***THE END*** ***** ***** ***** ***** #

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[1;32m"
COLOR_NEUTRAL="\033[0m"

# Initialize building...
if [ -e $BUILD_DIR ]; then
    if [ -e $BUILD_DIR/.config ]; then
        rm -f $BUILD_DIR/.config
        if [ -e $KERNEL_IMAGE ]; then
            rm -f $KERNEL_IMAGE
        fi
    fi
else
    mkdir $BUILD_DIR
fi

echo -e $COLOR_NEUTRAL"\nCompiling $KERNEL_NAME-V$KERNEL_VERSION for $KERNEL_VARIANT \n"$COLOR_NEUTRAL

# Update Kernel version
make O=$BUILD_DIR $KERNEL_DEFCONFIG
sed -i "s;Lolz;$KERNEL_NAME-V$KERNEL_VERSION;" $BUILD_DIR/.config;

if [[ -z ${GCC} ]]; then
# Let's Compile with CLANG
    make -j$(nproc --all) O=$BUILD_DIR \
                          ARCH=arm \
                          CC=clang \
                          CROSS_COMPILE=arm-linux-gnueabi-
else
    # Let's Compile with GCC
    CROSS_COMPILE=$TOOLCHAIN
    make -j$(nproc --all) O=$BUILD_DIR
fi

if [ -e $KERNEL_IMAGE ]; then
    echo -e $COLOR_GREEN"\n Copying zImage to $ANYKERNEL_DIR\n"$COLOR_NEUTRAL
    cp $KERNEL_IMAGE $ANYKERNEL_DIR/
    # compile dt if required
    if [ "y" == "$COMPILE_DT" ]; then
        echo -e $COLOR_GREEN"\n Compiling device tree blob (dt.img)\n"$COLOR_NEUTRAL
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
    echo -e $COLOR_GREEN"\n Generating Recovery Flashable Zip File\n"$COLOR_NEUTRAL
    cd $ANYKERNEL_DIR && zip -r9 $KERNEL_NAME-V$KERNEL_VERSION-$KERNEL_VARIANT-$KERNEL_DATE.zip * -x README.md $KERNEL_NAME-$KERNEL_VARIANT-$KERNEL_VERSION-$KERNEL_DATE.zip && cd ..
    echo -e $COLOR_GREEN"\n Cleaning...\n"$COLOR_NEUTRAL
    # check and create release folder.
    if [ ! -d "$RELEASE_DIR" ]; then
        mkdir $RELEASE_DIR
    fi
    rm $ANYKERNEL_DIR/zImage && rm $ANYKERNEL_DIR/dt
    mv $ANYKERNEL_DIR/$KERNEL_NAME-V$KERNEL_VERSION* $RELEASE_DIR
    echo -e $COLOR_GREEN"\n Lolz-$KERNEL_VARIANT is Compiled. Check '$RELEASE_DIR' Folder Now!\n"$COLOR_NEUTRAL
else
    echo -e $COLOR_RED"\n Building failed... Please fix the derp you made and try again...\n"$COLOR_RED;
fi
 else
  exit
fi;
