## Specify phone tech before including mini_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Photon

# Boot animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/mini.mk)

# Inherit device configuration
$(call inherit-product, device/htc/photon/photon.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := photon
PRODUCT_NAME := cm_photon
PRODUCT_BRAND := htc
PRODUCT_MODEL := Photon
PRODUCT_MANUFACTURER := HTC
