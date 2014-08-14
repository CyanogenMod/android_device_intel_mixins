PRODUCT_PACKAGES += \
    gps.conf \
    gps.xml \
    gps.$(TARGET_BOARD_PLATFORM) \
    flp.$(TARGET_BOARD_PLATFORM) \
    gpsd \
    gpscerd \

PRODUCT_PROOPERTY_OVERRIDES += \
        ro.spid.gps.FrqPlan=$[FrqPlan]\
        ro.spid.gps.RfType=$[RfType]

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \

