PRODUCT_PACKAGES += \
    gps.conf \
    gps.xml \
    gps.$(TARGET_BOARD_PLATFORM) \
    flp.$(TARGET_BOARD_PLATFORM) \
    gpsd \
    gpscerd \

PRODUCT_DEFAULT_PROOPERTY_OVERRIDES += \
        ro.spid.gps.FrqPlan=FRQ_PLAN_26MHZ_2PPM_26MHZ_100PPB \
        ro.spid.gps.RfType=GL_RF_47521_BRCM

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \

