PRODUCT_CHARACTERISTICS := tablet

ADDITIONAL_DEFAULT_PROPERTIES += fw.max_users=10

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

