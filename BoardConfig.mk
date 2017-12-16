#
# Copyright (C) 2017 The LineageOS Project
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

DEVICE_PATH := device/lge/us996

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/Image.lz4-dtb
# fixes building twrp in lineage tree
TARGET_CRYPTFS_HW_PATH :=  vendor/qcom/opensource/cryptfs_hw

RECOVERY_VARIANT := twrp
PRODUCT_COPY_FILES += device/lge/us996/twrp.fstab:recovery/root/etc/twrp.fstab
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_OTA_ASSERT_DEVICE := us996
TW_INCLUDE_CRYPTO := true
TW_IGNORE_MISC_WIPE_DATA := true
#shift off second screen, not needed if using lineage kernel
TW_Y_OFFSET := 160
TW_H_OFFSET := -160
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/soc/6a00000.ssusb/6a00000.dwc3/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/devices/soc/900000.qcom\x2cmdss_mdp/900000.qcom\x2cmdss_mdp:qcom\x2cmdss_fb_primary/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 149
TW_SCREEN_BLANK_ON_BOOT := true

# Debug flags
TWRP_INCLUDE_LOGCAT := true

# inherit from common v20
-include device/lge/v20-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG := lineageos_us996_defconfig

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# inherit from the proprietary version
-include vendor/lge/us996/BoardConfigVendor.mk
