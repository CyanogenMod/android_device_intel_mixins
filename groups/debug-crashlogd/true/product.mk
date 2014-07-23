# Enable crashlogd for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += device/intel/common/debug/init.crashlogd.rc:root/init.crashlogd.rc
PRODUCT_PACKAGES += crashlogd
endif
