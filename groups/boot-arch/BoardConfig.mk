#
# -- SECURE BOOT --
#

# Alternate mkbootimg implementation which can sign boot images
# with a provided key
BOARD_CUSTOM_MKBOOTIMG := out/host/linux-x86/bin/mkbootimg_secure

# Sign boot images with the "vendor" key which is embedded within
# the UEFI shim. Boot image verification only enforced if Secure
# Boot is turned on in the BIOS.
BOARD_MKBOOTIMG_ARGS := --signhash sha256 \
	--signkey device/intel/build/testkeys/vendor.pk8

ifeq ($(TARGET_UEFI_ARCH),i386)
    LOADER_TYPE := linux-x86
else
    LOADER_TYPE := linux-x86_64
endif
LOADER_PREBUILT := hardware/intel/efi_prebuilts/

# EFI binaries that go in the installed device's EFI system partition
BOARD_EFI_MODULES := \
    $(LOADER_PREBUILT)/uefi_shim/$(LOADER_TYPE)/shim.efi \
    $(LOADER_PREBUILT)/uefi_shim/$(LOADER_TYPE)/MokManager.efi \
    $(LOADER_PREBUILT)/gummiboot/$(LOADER_TYPE)/gummiboot.efi

# EFI binaries that go in the bootable USB fastboot image
BOARD_FASTBOOT_USB_EFI_MODULES := \
    $(LOADER_PREBUILT)/uefi_shim/$(LOADER_TYPE)/shim.efi \
    $(LOADER_PREBUILT)/uefi_shim/$(LOADER_TYPE)/MokManager.efi \
    $(LOADER_PREBUILT)/gummiboot/$(LOADER_TYPE)/gummiboot.efi \
    $(LOADER_PREBUILT)/efitools/$(LOADER_TYPE)/LockDown.efi \
    $(LOADER_PREBUILT)/efitools/$(LOADER_TYPE)/production-test/LockDownPT.efi

# We need gymmiboot.efi packaged inside the fastboot boot image to be
# able to work with MCG's EFI fastboot stub
USERFASTBOOT_2NDBOOTLOADER := $(LOADER_PREBUILT)/gummiboot/$(LOADER_TYPE)/gummiboot.efi

#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab. Userfastboot
# uses this too.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

# Used by ota_from_target_files to add platform-specific directives
# to the OTA updater scripts
TARGET_RELEASETOOLS_EXTENSIONS ?= device/intel/common/recovery/releasetools.py

# Adds edify commands swap_entries and copy_partition for robust
# update of the EFI system partition
TARGET_RECOVERY_UPDATER_LIBS := libupdater_esp

# Extra libraries needed to be rolled into recovery updater
# libgpt_static is needed by libupdater_esp
TARGET_RECOVERY_UPDATER_EXTRA_LIBS := libcommon_recovery libgpt_static

# By default recovery minui expects RGBA framebuffer
# also affects UI in Userfastboot
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"


#
# FILESYSTEMS
#

# NOTE: These values must be kept in sync with BOARD_GPT_INI
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 2684354560
BOARD_BOOTLOADER_PARTITION_SIZE ?= 104857600

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Partition table configuration file
BOARD_GPT_INI ?= device/intel/common/boot/gpt.ini

#
# FASTBOOT
#

TARGET_STAGE_USERFASTBOOT := true
TARGET_USE_USERFASTBOOT := true

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

