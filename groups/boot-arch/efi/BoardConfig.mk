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
BOARD_BOOTLOADER_PARTITION_SIZE ?= 62914560
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 104857600
ifneq ($(BOARD_USERDATAIMAGE_PARTITION_SIZE),)
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
else
ifneq ($(CALLED_FROM_SETUP),true)
$(warning "BOARD_USERDATAIMAGE_PARTITION_SIZE not defined, please specify at the top of your device's BoardConfig.mk")
endif
endif

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Partition table configuration file
BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

#
# Trusted Factory Reset - persistent partition
#
DEVICE_PACKAGE_OVERLAYS += device/intel/common/boot/overlay
ADDITIONAL_DEFAULT_PROPERTIES += ro.frp.pst=/dev/block/by-name/android_persistent

ifeq ({{{fastboot}}},efi)
# For fastboot-uefi we need to parse gpt.ini into
# a binary format.

#can't use := here, as PRODUCT_OUT is not defined yet
BOARD_GPT_BIN = $(PRODUCT_OUT)/gpt.bin
BOARD_FLASHFILES += $(BOARD_GPT_BIN):gpt.bin
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_GPT_BIN)
else
#
# USERFASTBOOT Configuration
#
TARGET_STAGE_USERFASTBOOT := true
TARGET_USE_USERFASTBOOT := true

BOOTLOADER_ADDITIONAL_DEPS += $(PRODUCT_OUT)/fastboot.img
BOOTLOADER_ADDITIONAL_ARGS += --fastboot $(PRODUCT_OUT)/fastboot.img

BOARD_FLASHFILES += $(BOARD_GPT_INI):gpt.ini
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_GPT_INI)
endif

ifneq ($(EFI_EMMC_BIN),)
BOARD_FLASHFILES += $(EFI_EMMC_BIN):emmc.bin
endif

ifneq ($(EFI_IFWI_BIN),)
BOARD_FLASHFILES += $(EFI_IFWI_BIN):ifwi.bin
endif

