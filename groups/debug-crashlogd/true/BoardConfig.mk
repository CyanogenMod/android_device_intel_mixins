# Enable crashlogd for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
CRASHLOGD_LOGS_PATH := "/data/logs"
CRASHLOGD_APLOG := true
CRASHLOGD_FULL_REPORT := true
endif
