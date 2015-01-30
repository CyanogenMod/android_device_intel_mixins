# Set default USB interface
ifeq ($(BUILD_FOR_CTS_AUTOMATION),true)
# Build for automated CTS
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp,adb
PRODUCT_COPY_FILES += device/intel/common/usb-gadget/adb_keys:root/adb_keys
else
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
endif

# Enable Secure Debugging
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif
