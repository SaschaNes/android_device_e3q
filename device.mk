#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_CHECK_ELF_FILES := false

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

# Init
PRODUCT_PACKAGES += \
    init.e3q

PRODUCT_PACKAGES := $(filter-out \
    libkeymint \
    libkeymint_support \
    libkm_compat \
    android.hardware.security.keymint-service.default \
, $(PRODUCT_PACKAGES))

SOONG_CONFIG_NAMESPACES += android_keymint
SOONG_CONFIG_android_keymint := exclude
SOONG_CONFIG_android_keymint_exclude := true

#PRODUCT_PACKAGES := $(filter-out android.hardware.security.keymint-service, $(PRODUCT_PACKAGES))

#PRODUCT_PACKAGES_REMOVE += \
#    android.hardware.security.keymint-service \
#    android.hardware.security.keymint-service.rc

PRODUCT_COPY_FILES_REMOVE += \
    hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.security.keymint-service.rc


# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResE3q \
    LineageResE3q \
    SystemUIResE3q \
    WifiResTargetE3q

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/samsung/sm8650-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/samsung/e3q/e3q-vendor.mk)
