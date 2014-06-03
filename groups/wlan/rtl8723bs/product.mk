# Uses same supplicant config as the bcm43241
PRODUCT_COPY_FILES += \
    device/intel/common/wlan/wpa_supplicant-common.conf:system/etc/wifi/wpa_supplicant.conf \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

PRODUCT_PACKAGES += wpa_supplicant

