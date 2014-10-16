# Enable logs on file system for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += device/intel/common/debug/init.logs.rc:root/init.logs.rc
PRODUCT_PACKAGES += logcatext
endif
