ADDITIONAL_DEFAULT_PROPERTIES += wifi.interface=wlan0
# FIXME: use VER_0_8_X so lib_driver_cmd_bcmdhd can be built
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_PRIVATE_LIB      := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER           := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/vendor/firmware/brcm/brcmfmac43241b4-sdio.bin"
WIFI_DRIVER_FW_PATH_AP := "/vendor/firmware/brcm/brcmfmac43241b4-sdio_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/vendor/firmware/brcm/brcmfmac43241b4-sdio.bin"
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-pno
