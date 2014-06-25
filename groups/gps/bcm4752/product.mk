PRODUCT_PACKAGES += \
    gps.conf \
    gps.xml \
    gps.$(TARGET_BOARD_PLATFORM) \
    flp.$(TARGET_BOARD_PLATFORM) \
    gpsd \
    gpscerd \

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \

