# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit from common msm7x27
-include device/htc/msm7x27-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/htc/liberty/BoardConfigVendor.mk

TARGET_KERNEL_SOURCE := kernel/htc/photon

ifneq (eng,$(TARGET_BUILD_VARIANT))
TARGET_KERNEL_CONFIG := htc_msm7227_defconfig
else
TARGET_KERNEL_CONFIG := htc_msm7227_recovery_defconfig
endif

TARGET_BOOTLOADER_BOARD_NAME := photon

TARGET_PROVIDES_INIT_TARGET_RC := true

BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x12c00000

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := photon

# # cat /proc/mtd (liberty)
# dev:    size   erasesize  name
# mtd0: 000a0000 00020000 "misc"
# mtd1: 00420000 00020000 "recovery"
# mtd2: 002c0000 00020000 "boot"
# mtd3: 0f000000 00020000 "system"
# mtd4: 02800000 00020000 "cache"
# mtd5: 0b920000 00020000 "userdata"

# Original 0x002c0000 size is too small & bigger sizes can be flashed anyway
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x002d0000
# Built recovery image is too big
# Raise the limit (for now) so a brunch will complete
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00420000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0f000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0b920000

BOARD_FLASH_BLOCK_SIZE := 131072

# Fix for Atmel touchscreens; trackball button
BOARD_USE_LEGACY_TOUCHSCREEN := true
BOARD_USE_LEGACY_TRACKPAD := true

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/photon/bluetooth
