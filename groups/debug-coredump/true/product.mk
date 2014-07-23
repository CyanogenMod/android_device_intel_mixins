# Enable core dump on /data/logs/core for eng and userdebug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += device/intel/common/debug/init.coredump.rc:root/init.coredump.rc
endif
