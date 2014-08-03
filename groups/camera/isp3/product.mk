ifeq ($(TARGET_BOARD_PLATFORM),)
    $(error Please define TARGET_BOARD_PLATFORM in product-level Makefile)
endif

# Android framework boilerplate.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \

# Camera HAL (camera3hal)
PRODUCT_PACKAGES += camera.$(TARGET_BOARD_PLATFORM)

# Kernel module initialization helper script
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.atomisp.sh:system/etc/init.atomisp.sh

# 3A/AIQ
PRODUCT_PACKAGES += \
    libmfldadvci \
    dummy.cpf \

# ISP Firmware
PRODUCT_PACKAGES += \
    shisp_2400b0_v21.bin \
