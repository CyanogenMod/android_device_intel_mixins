PRODUCT_PACKAGES += \
    hostapd \
    hostap_cli \
    wpa_supplicant \
    wpa_cli

#copy iwlwifi wpa p2p config files
PRODUCT_COPY_FILES += \
        device/intel/common/wlan/iwlwifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
        device/intel/common/wlan/iwlwifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

PRODUCT_COPY_FILES += \
        device/intel/common/wlan/iwlwifi/load_iwlwifi.sh:system/bin/load_iwlwifi.sh

$(call inherit-product-if-exists, vendor/intel/fw/iwl/iwl-fw-8000-cht-gmin.mk)

