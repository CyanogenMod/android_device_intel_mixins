PRODUCT_COPY_FILES += \
    device/intel/common/wlan/wpa_supplicant-common.conf:system/etc/wifi/wpa_supplicant.conf \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

PRODUCT_PACKAGES += wpa_supplicant \
    brcmfmac43241b4-sdio.bin \
    brcmfmac43241b4-sdio.txt \
    brcmfmac43241b4-oob-sdio.txt
