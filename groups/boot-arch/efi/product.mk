TARGET_UEFI_ARCH := {{{uefi_arch}}}
ifeq ($(TARGET_BUILD_VARIANT),user)
    BIOS_VARIANT := release
else
    BIOS_VARIANT := debug
endif

$(call inherit-product,build/target/product/verity.mk)

PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/by-name/android_system

PRODUCT_PACKAGES += \
	pstore-clean

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

BOARD_SFU_UPDATE := hardware/intel/efi_capsules/$(BIOS_VARIANT)/$(TARGET_PRODUCT).fv
EFI_IFWI_BIN := hardware/intel/efi_capsules/$(BIOS_VARIANT)/$(TARGET_PRODUCT)_ifwi.bin
EFI_EMMC_BIN := hardware/intel/efi_capsules/$(BIOS_VARIANT)/$(TARGET_PRODUCT)_emmc.bin

ifneq ($(CALLED_FROM_SETUP),true)
ifeq ($(wildcard $(BOARD_SFU_UPDATE)),)
$(warning $(BOARD_SFU_UPDATE) not found, OTA updates will not provide a firmware capsule)
BOARD_SFU_UPDATE :=
endif
ifeq ($(wildcard $(EFI_EMMC_BIN)),)
$(warning $(EFI_EMMC_BIN) not found, flashfiles will not include 2nd stage EMMC firmware)
EFI_EMMC_BIN :=
endif
ifeq ($(wildcard $(EFI_IFWI_BIN)),)
$(warning $(EFI_IFWI_BIN) not found, IFWI binary will not be provided in out/dist/)
EFI_IFWI_BIN :=
endif
endif

ifneq ($(BOARD_SFU_UPDATE),)
PRODUCT_COPY_FILES += $(BOARD_SFU_UPDATE):system/etc/firmware/BIOSUPDATE.fv
endif

