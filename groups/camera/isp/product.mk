ifeq ($(TARGET_BOARD_PLATFORM),)
    $(error Please define TARGET_BOARD_PLATFORM in product-level Makefile)
endif

# Hald blacklist config
# REMOVE THIS WHEN hald IS REMOVED
PRODUCT_COPY_FILES += $(LOCAL_PATH)/../atomisp.conf:system/etc/modprobe.d/atomisp.conf

# Camera HAL (libcamera2)
PRODUCT_PACKAGES += camera.$(TARGET_BOARD_PLATFORM)

# Kernel module initialization helper script
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.atomisp.sh:system/etc/init.atomisp.sh

# 3A/AIQ
PRODUCT_PACKAGES += \
    libmfldadvci \
    dummy.cpf \
    CGamma_DIS5MP.bin \
    noise.fpn \
    YGamma_DIS5MP.bin \
    Mor_8MP_8BQ.txt

# ISP Firmware
PRODUCT_PACKAGES += \
    hdr_v2_fw_css21_2400b0 \
    shisp_2400b0_v21.bin \

# libmix
PRODUCT_PACKAGES += \
    libmix_videovpp \
    libintelmetadatabuffer

# Only include libmix_videovpp test program in eng builds.
ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_PACKAGES += csc_vpp
endif
