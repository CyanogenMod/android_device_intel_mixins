PRODUCT_COPY_FILES += \
    device/intel/gmin/brcmfmac43241b4-sdio.bin:system/vendor/firmware/brcm/brcmfmac43241b4-sdio.bin \
    device/intel/gmin/brcmfmac43241b4-sdio.txt:system/vendor/firmware/brcm/brcmfmac43241b4-sdio.txt \
    device/intel/common/wlan/wpa_supplicant-common.conf:system/etc/wifi/wpa_supplicant.conf \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

PRODUCT_PACKAGES += wpa_supplicant

