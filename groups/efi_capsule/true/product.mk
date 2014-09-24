ifeq ($(TARGET_BUILD_VARIANT),user)
    BIOS_VARIANT := release
else
    BIOS_VARIANT := debug
endif

BOARD_SFU_UPDATE := hardware/intel/efi_capsules/$(BIOS_VARIANT)/$[prefix].fv
PRODUCT_COPY_FILES += $(BOARD_SFU_UPDATE):system/etc/firmware/BIOSUPDATE.fv

