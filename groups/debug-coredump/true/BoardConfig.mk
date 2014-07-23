# Enable core dump for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
ADDITIONAL_DEFAULT_PROPERTIES += persist.core.enabled=1
CRASHLOGD_COREDUMP := true
endif
