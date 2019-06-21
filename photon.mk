#
# Copyright (C) 2012 The Android Open Source Project
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

$(call inherit-product, build/target/product/full_base_telephony.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/photon/overlay

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/photon/prebuilt/usr/keylayout/photon-keypad.kl:system/usr/keylayout/photon-keypad.kl \
    device/htc/photon/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/photon/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/photon/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/photon/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/photon/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/photon/prebuilt/usr/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc

PRODUCT_COPY_FILES += \
    device/htc/photon/init.photon.rc:root/init.photon.rc \
    device/htc/photon/ueventd.photon.rc:root/ueventd.photon.rc

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0 \
    ro.telephony.ril.v3=signalstrength \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411

## Get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/liberty/liberty-vendor.mk)

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PACKAGES += \
    gps.photon \
    sensors.photon

PRODUCT_COPY_FILES += \
    device/htc/photon/fstab.photon:root/fstab.photon \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/photon/prebuilt/lib/libcamera.so:system/lib/libcamera.so

# Copy prebuilt wifi module when it isn't being built with the kernel
ifeq ($(FULL_KERNEL_BUILD),false)
PRODUCT_COPY_FILES += \
    device/htc/photon/prebuilt/lib/modules/bcm4329.ko:system/lib/modules/bcm4329.ko
endif

# Sets copy files for all HTC-specific device
PRODUCT_COPY_FILES += device/htc/photon/prebuilt/etc/ecclist_for_mcc.conf:system/etc/ecclist_for_mcc.conf

# Prebuilt libraries that are needed to build open-source libraries
#PRODUCT_COPY_FILES += \
#    device/htc/photon/prebuilt/lib/libcamera.so:obj/lib/libcamera.so

# gps.conf
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# inherit from common msm7x27
$(call inherit-product, device/htc/msm7x27-common/msm7x27.mk)

PRODUCT_NAME := full_photon
PRODUCT_MANUFACTURER := HTC
PRODUCT_DEVICE := photon
