#
# -- SECURE BOOT --
#


ifeq ($(TARGET_UEFI_ARCH),i386)
    LOADER_TYPE := linux-x86
else
    LOADER_TYPE := linux-x86_64
endif
LOADER_PREBUILT := hardware/intel/efi_prebuilts/

kernelflinger_prefix := $(LOADER_PREBUILT)/kernelflinger/$(LOADER_TYPE)/kernelflinger

ifeq ($(BOARD_USE_UEFI_SHIM),true)

ifeq ($(TARGET_BUILD_VARIANT),eng)
kernelflinger := $(kernelflinger_prefix).insecure.vendor.efi
else
kernelflinger := $(kernelflinger_prefix).vendor.efi
endif

# EFI binaries that go in the installed device's EFI system partition
BOARD_FIRST_STAGE_LOADER := \
    $(LOADER_PREBUILT)/uefi_shim/$(LOADER_TYPE)/shim.efi

BOARD_EXTRA_EFI_MODULES := \
    $(LOADER_PREBUILT)/uefi_shim/$(LOADER_TYPE)/MokManager.efi \
    $(kernelflinger)

# We need kernelflinger.efi packaged inside the fastboot boot image to be
# able to work with MCG's EFI fastboot stub
USERFASTBOOT_2NDBOOTLOADER := $(kernelflinger)

else # !BOARD_USE_UEFI_SHIM

ifeq ($(TARGET_BUILD_VARIANT),eng)
kernelflinger := $(kernelflinger_prefix).insecure.db.efi
else
kernelflinger := $(kernelflinger_prefix).db.efi
endif

BOARD_FIRST_STAGE_LOADER := $(kernelflinger)
BOARD_EXTRA_EFI_MODULES :=
USERFASTBOOT_2NDBOOTLOADER :=
endif

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
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 268435456
ifneq ($(BOARD_USERDATAIMAGE_PARTITION_SIZE),)
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
else
$(warning "BOARD_USERDATAIMAGE_PARTITION_SIZE not defined, please specify at the top of your device's BoardConfig.mk")
endif

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Partition table configuration file
BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini
BOARD_FLASHFILES += $(BOARD_GPT_INI):gpt.ini

#
# FASTBOOT
#

TARGET_STAGE_USERFASTBOOT := true
TARGET_USE_USERFASTBOOT := true

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

#
# Trusted Factory Reset - persistent partition
#
DEVICE_PACKAGE_OVERLAYS += device/intel/common/boot/overlay
ADDITIONAL_DEFAULT_PROPERTIES += ro.frp.pst=/dev/block/by-name/android_persistent
