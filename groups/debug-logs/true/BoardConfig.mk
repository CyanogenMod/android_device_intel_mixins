#enable aplogfs by default for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.apklogfs.enable=1
endif
