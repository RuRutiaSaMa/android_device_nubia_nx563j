#
# Copyright (C) 2017 The LineageOS Open Source Project
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

# Get non-open-source specific aspects
$(call inherit-product, vendor/nubia/nx563j/nx563j-vendor.mk)

# Device was launched with N-MR1
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)


# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay 

# Inherit from msm8998-common
$(call inherit-product, device/nubia/msm8998-common/msm8998.mk)

# Individual audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
    $(LOCAL_PATH)/audio/speaker.ftcfg:$(TARGET_COPY_OUT_VENDOR)/etc/speaker.ftcfg

# Bootanimation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Camera
PRODUCT_PACKAGES += \
    camera.msm8998

# Consumerir
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Consumerir
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/input_proxy.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/input_proxy.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/nubia_synaptics_dsx.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/nubia_synaptics_dsx.kl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8998

PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# NubiaParts
PRODUCT_PACKAGES += \
    NubiaParts

# Ramdisk scripts
PRODUCT_PACKAGES += \
    init.nubia.touch.lcd.rc

# Key disabler
JAVA_SOURCE_OVERLAYS := org.pixelexperience.keydisabler|$(LOCAL_PATH)/keydisabler|**/*.java

# properties
-include $(LOCAL_PATH)/vendor_prop.mk


