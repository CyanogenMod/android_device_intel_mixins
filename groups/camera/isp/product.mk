#
# Camera HAL (and dependencies)
#

# libmfldadvci
PRODUCT_PACKAGES += \
    libmfldadvci \
    dummy.cpf \
    CGamma_DIS5MP.bin \
    noise.fpn \
    Preview_UserParameter_imx135.prm \
    Primary_UserParameter_imx135.prm \
    Video_UserParameter_imx135.prm \
    YGamma_DIS5MP.bin \
    Mor_8MP_8BQ.txt

# libcamera
PRODUCT_PACKAGES += \
    camera.gmin

# ISP Firmware
PRODUCT_PACKAGES += \
    isp_acc_chromaproc_css21_2400b0.bin \
    isp_acc_deghosting_v2_css21_2400b0.bin \
    isp_acc_lumaproc_css21_2400b0.bin \
    isp_acc_multires_v2_css21_2400b0.bin \
    isp_acc_warping_v2_css21_2400b0.bin \
    shisp_2400b0_v21.bin \


