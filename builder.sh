#!/usr/bin/env bash
#
# Copyright (C) 2023 Jprimero15
# Lolz Kernel Build Script (CI Edition)
#
# shellcheck disable=SC2086

#set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

# timezone
export TZ="Asia/Manila"

# Inlined function to post a message
export BOT_MSG_URL="https://api.telegram.org/bot$TG_BOT_TOKEN/sendMessage"
function tg_post_msg() {
    curl -s -X POST "$BOT_MSG_URL" -d chat_id="-1001222358827" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$1"
}

while (( ${#} )); do
  case ${1} in
       "hltechn") CHN=true ;;
       "hltekor") KOR=true ;;
       "hltetmo") TMO=true ;;
       "--gcc") IS_GCC=true ;;
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
KERNEL_VERSION="19-test"
COMPILE_DT="y"
KERNEL_DATE="$(date +"%Y%m%d")"
BUILD_DIR="$LDIR/output_$KERNEL_VARIANT"
KERNEL_IMAGE="$BUILD_DIR/arch/arm/boot/zImage"
DT="$BUILD_DIR/arch/arm/boot/dt.img"
ANYKERNEL_DIR="$LDIR/lolz_anykernel"

# CLANG or GCC??
if [[ -z ${IS_GCC} ]]; then
    # Lets use CLANG
    CLANG_DIR="${LDIR}/clang_tc"
    PATH="${CLANG_DIR}/bin:${PATH}"
    export LD_LIBRARY_PATH="${CLANG_DIR}/lib:${LD_LIBRARY_PATH}"
else
    # Lets use GCC
    GCC_DIR="$LDIR/gcc_tc/bin/arm-eabi-"
fi

export KBUILD_BUILD_USER="Jprimero15"

# ***** ***** ***** ***** ***THE END*** ***** ***** ***** ***** #


# Send a notificaton to TG
tg_post_msg "<b>LOLZ KERNEL Compilation Started ($KERNEL_VARIANT)</b>"

# Repo link (to show on telegram)
KERN_REPO="$(git -C ${LDIR} config --get remote.origin.url)"

# Always reset changes and get latest commit head
git reset --hard origin/"$(git rev-parse --abbrev-ref HEAD)";
lolz_commit="$(git rev-parse HEAD)";

# create the outdir
mkdir $BUILD_DIR 

# Update Kernel version
make O=$BUILD_DIR ARCH=arm $KERNEL_DEFCONFIG
sed -i "s;Lolz;$KERNEL_NAME-V$KERNEL_VERSION;" $BUILD_DIR/.config;

if [[ -z ${IS_GCC} ]]; then
# Let's Compile with CLANG
    make -j$(nproc --all) O=$BUILD_DIR \
                          ARCH=arm \
                          CC=clang \
                          CROSS_COMPILE=arm-linux-gnueabi-
else
    # Let's Compile with GCC
    CROSS_COMPILE=$GCC_DIR
    make -j$(nproc --all) O=$BUILD_DIR
fi

  if [ -f $KERNEL_IMAGE ]; then
    echo -e  "  LOLZ Kernel Compiled Successfully!!"
  else
    echo -e "  LOLZ Kernel Not Compiled!!"
    echo -e "  Fix Your Derp First!! Aborting..."
# Upload to telegram with more info
curl -F "document=@${LDIR}/error.log" --form-string "caption=<b>LOLZ Kernel NOT Compiled</b>
<b>LOLZ Commits: ${KERN_REPO}/commits/${lolz_commit}</b>
<b>TimeZone: <code>GMT+8 (timezone)</code></b>
<b>Date: <code>$(date '+%B %d, %Y.') </code></b>
<b>Time: <code>$(date +'%r')</code></b>" "https://api.telegram.org/bot${TG_BOT_TOKEN}/sendDocument?chat_id=-1001222358827&parse_mode=html"
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
     # Send a notificaton to TG
     tg_post_msg "<b>LOLZ Kernel Not Zipped. Aborting</b>"
     exit
    fi;

LHASH="$(md5sum $ANYKERNEL_DIR/$KERNEL_NAME-V$KERNEL_VERSION-$KERNEL_VARIANT.zip | sed -r 's:\\*([^ ]*).*:\1:')"

# Upload to telegram with more info
curl -F "document=@$ANYKERNEL_DIR/$KERNEL_NAME-V$KERNEL_VERSION-$KERNEL_VARIANT.zip" --form-string "caption=<b>V${LOLZ_VERSION} Kernel Build Compiled&#33 </b>
<b>MD5 Hash: <code>${LHASH}</code></b>
<b>Build Version: <code>$KERNEL_VERSION</code></b>
<b>Build Status: <code>Test Build</code></b>
<b>Device Variant: <code>($KERNEL_VARIANT)</code></b>
<b>TimeZone: <code>GMT+8 (timezone)</code></b>
<b>Date: <code>$(date '+%B %d, %Y.') </code></b>
<b>Time: <code>$(date +'%r')</code></b>" "https://api.telegram.org/bot${TG_BOT_TOKEN}/sendDocument?chat_id=-1001222358827&parse_mode=html"

cd $BUILD_DIR

# Rename before zipping
mv ${BUILD_DIR}/.config ${BUILD_DIR}/${lolz_commit}_config.txt

# Zip .config
zip -r9 config.zip ${BUILD_DIR}/${lolz_commit}_config.txt
zip -r9 debugkernel.zip ${BUILD_DIR}/vmlinux ${BUILD_DIR}/System.map

# upload to other site just incase
curl https://up.sb -T debugkernel.zip > debugl.txt

MR_LINK="$(cat debugl.txt)"

# upload config to telegram while vmlinux and system.map on mirror site
curl -F "document=@${BUILD_DIR}/config.zip" --form-string "caption=<b>Files for Debugging Purposes(Ignore This)</b>
<b>MD5 Hash: <code>${LHASH}</code></b>
<b>Debug Files: ${MR_LINK}</b>
<b>LOLZ Commits: ${KERN_REPO}/commits/${lolz_commit}</b>" "https://api.telegram.org/bot${TG_BOT_TOKEN}/sendDocument?chat_id=-1001222358827&parse_mode=html"

# Send a notificaton to TG
tg_post_msg "<b>LOLZ KERNEL Compilation Completed ($KERNEL_VARIANT)</b>"

rm -rf $ANYKERNEL_DIR/*.zip
rm -rf $ANYKERNEL_DIR/zImage
rm -rf $ANYKERNEL_DIR/dt
rm -rf $BUILD_DIR

# END of script
