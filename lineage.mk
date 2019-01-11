#
# Copyright 2014 The Android Open-Source Project
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
# This file is the build configuration for an aosp Android
# build for rockchip rk3328 hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and rk3328, hence its name.

include device/rockchip/rk3328/BoardConfig.mk

GAPPS_VARIANT := nano
GAPPS_EXCLUDED_PACKAGES += SetupWraith SetupWizard

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.live_tv.xml:system/etc/permissions/android.software.live_tv.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \

# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk3328/product.mk)
$(call inherit-product, device/rockchip/common/device.mk)
$(call inherit-product, build/target/product/full_base.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_CHARACTERISTICS := box

PRODUCT_PROPERTY_OVERRIDES += \
    ro.target.product=box \
    ro.sf.lcd_density=160

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

# PRODUCT_AAPT_CONFIG := mdpi large xlarge
# PRODUCT_AAPT_PREF_CONFIG := mdpi

# Live Wallpapers
PRODUCT_PACKAGES += \
    Launcher3 \
    Provision \
    rild \
    displayd \
    hdmi_cec.$(TARGET_BOARD_HARDWARE)

#PRODUCT_MANUFACTURER := PINE64
#PRODUCT_BRAND := PINE64
#PRODUCT_DEVICE := rk3328
#PRODUCT_NAME := lineage_rk3328
#PRODUCT_MODEL := Rock64
# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rk3328
PRODUCT_NAME := lineage_rk3328
BOARD_VENDOR := TechOnTouch
PRODUCT_BRAND := TechOnTouch
PRODUCT_MODEL := Rock64
PRODUCT_MANUFACTURER := TechOnTouch
TARGET_VENDOR := TechOnTouch

# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml

# Build with GApps
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)
$(call inherit-product, vendor/widevine/widevine.mk)
$(call inherit-product-if-exists, vendor/ayufan/apps/vendor.mk)


# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rk3328
PRODUCT_NAME := lineage_rk3328
BOARD_VENDOR := TechOnTouch
PRODUCT_BRAND := TechOnTouch
PRODUCT_MODEL := Rock64
PRODUCT_MANUFACTURER := TechOnTouch
TARGET_VENDOR := TechOnTouch
