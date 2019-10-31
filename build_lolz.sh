#!/bin/bash

#
# Lolz Kernel Build Script
# Jprimero15@XDA
#

# DO NOT DELETE/MODIFY THIS
if [ $USER == jprim ]; then

# Definitions Here
KERNEL_NAME="LolZ"
KERNEL_VARIANT="hlte"
KERNEL_VERSION="11-Q-Edition"
KERNEL_DATE="$(date +"%Y%m%d")"
BUILD_DIR="output_$KERNEL_VARIANT"
KERNEL_IMAGE="$BUILD_DIR/arch/arm/boot/zImage"
COMPILE_DT="y"
# CLANG or NO??
USE_CLANG="y"
if [ "y" == "$USE_CLANG" ]; then
    # Lets use CLANG 10.0 from DragonTC
    CLANG_TC="/home/jprim/dtc10/bin/clang"
    # Lets use ARM GNU GCC 9.2.1
    TOOLCHAIN="/home/jprim/gcc9/bin/arm-linux-gnueabi-"
    TC="arm-linux-gnu"
else
    # Lets use ARM GCC 10.0.0(Experimental)
    TOOLCHAIN="$HOME/gcc10/bin/arm-eabi-"
fi
DT="$BUILD_DIR/arch/arm/boot/dt.img"
ANYKERNEL_DIR="lolz_anykernel"
RELEASE_DIR="release"
NUM_CPUS=""

# ***** ***** ***** ***** ***THE END*** ***** ***** ***** ***** #

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[1;32m"
COLOR_NEUTRAL="\033[0m"

# Lolz is ARM32
export ARCH=arm

if [ -z "$NUM_CPUS" ]; then
    NUM_CPUS=`grep -c ^processor /proc/cpuinfo`
fi

if [ "hltekor" == "$KERNEL_VARIANT" ]; then
    KERNEL_DEFCONFIG="lolz_hltekor_defconfig"
elif [ "hltetmo" == "$KERNEL_VARIANT" ]; then
    KERNEL_DEFCONFIG="lolz_hltetmo_defconfig"
elif [ "hltechn" == "$KERNEL_VARIANT" ]; then
    KERNEL_DEFCONFIG="lolz_hltechn_defconfig"
else
    KERNEL_VARIANT="hlte" && KERNEL_DEFCONFIG="lolz_hlte_defconfig"
fi

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
make $KERNEL_DEFCONFIG O=$BUILD_DIR
# Update Kernel version
sed -i "s;Lolz;$KERNEL_NAME-V$KERNEL_VERSION;" $BUILD_DIR/.config;

if [ "y" == "$USE_CLANG" ]; then
    # Let's Compile with CLANG
    make -j$NUM_CPUS \
		CC=$CLANG_TC \
		HOSTCC=$CLANG_TC \
		CROSS_COMPILE=$TOOLCHAIN \
		CLANG_TRIPLE=$TC \
		O=$BUILD_DIR;
else
    # Let's Compile with GCC
    export CROSS_COMPILE=$TOOLCHAIN
    make -j$NUM_CPUS O=$BUILD_DIR
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
   echo "bash cannot run this script exiting now..."
fi; 

