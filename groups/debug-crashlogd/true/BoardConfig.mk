# Enable crashlogd for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)

BOARD_SEPOLICY_DIRS += device/intel/common/sepolicy/crashlogd

BOARD_SEPOLICY_UNION += \
	crashlogd.te \
	file_contexts

CRASHLOGD_LOGS_PATH := "/data/logs"
CRASHLOGD_APLOG := true
CRASHLOGD_FULL_REPORT := true
endif
