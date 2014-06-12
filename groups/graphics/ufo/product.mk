#
# Hardware Accelerated Graphics
#
PRODUCT_PACKAGES += \
    libdrm \
    libdrm_intel \
    ufo.prop

#
# Color conversion library
#
PRODUCT_PACKAGES += \
    libI420colorconvert

ifneq ($(BOARD_HAVE_GEN_GFX_SRC),true)
    # UFO prebuilts
    PRODUCT_PACKAGES += ufo_prebuilts

else # ufo packages when building from source
    PRODUCT_PACKAGES += ufo
    PRODUCT_PACKAGES += ufo_test
endif

PRODUCT_PROPERTY_OVERRIDES += ro.opengles.version = 196608
PRODUCT_COPY_FILES += \
    device/intel/common/ufo/init.ufo.sh:system/etc/init.ufo.sh

