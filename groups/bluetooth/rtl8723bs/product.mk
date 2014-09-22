PRODUCT_PACKAGES += \
    hciattach \
    audio.a2dp.default \
    rtl8723b_config \
    rtl8723b_fw \

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
		frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += device/intel/common/bluetooth/rfkill-init/init.rfkill.sh:system/etc/init.rfkill.sh

ADDITIONAL_BUILD_PROPERTIES += bluetooth.hwcfg=stop \
                bluetooth.rfkill=1
