# If this a debugging build include the public debug modules
ifneq ($(filter eng userdebug,$(TARGET_BUILD_VARIANT)),)

PRODUCT_PACKAGES += AndroidTerm libjackpal-androidterm4

endif
