# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

# Enable Secure Debugging
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif
