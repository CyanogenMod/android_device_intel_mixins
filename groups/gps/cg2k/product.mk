PRODUCT_PACKAGES += \
    cws_manu \
    gps.$(TARGET_BOARD_PLATFORM) \
    gnssCG2000 \
    libgnssconf \
    libgnsspatch \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
