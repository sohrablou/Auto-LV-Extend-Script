#!/bin/bash
# Script to extend LV size if there is free space in the VG
# Auto LV Extend Script for ubuntu server
# Mohammad Sohrablou – https://github.com/sohrablou/

LV_PATH="/dev/ubuntu-vg/ubuntu-lv"

clear
echo "🔍 Checking free space in VG..."
FREE_SPACE=$(vgs --noheadings --units g -o vg_free | tr -d ' G')

if (( $(echo "$FREE_SPACE > 0" | bc -l) )); then
    echo "✅ Free space of ${FREE_SPACE}GB is available."
    echo "🚀 Extending LV size..."
    sudo lvextend -l +100%FREE "$LV_PATH"

    echo "🔄 Expanding the filesystem..."
    FS_TYPE=$(df -T "$LV_PATH" | awk 'NR==2 {print $2}')

    if [ "$FS_TYPE" == "ext4" ]; then
        sudo resize2fs "$LV_PATH"
    elif [ "$FS_TYPE" == "xfs" ]; then
        sudo xfs_growfs /
    else
        echo "⚠ Filesystem not supported: $FS_TYPE"
        exit 1
    fi

    echo "🎯 Size successfully increased."
    df -h | grep "$LV_PATH"
else
    echo "❌ No free space in VG. You need to add a new disk."
fi
echo "-----------------"
