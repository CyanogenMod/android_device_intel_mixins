# Enable logs on file system for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.apklogfs.enable=1
BOARD_SEPOLICY_UNION += logsvc.te
endif
