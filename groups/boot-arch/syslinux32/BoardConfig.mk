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

TARGET_RECOVERY_UI_LIB := libgmin_recovery_ui

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
BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini

#
# FASTBOOT
#

TARGET_STAGE_USERFASTBOOT := true
TARGET_USE_USERFASTBOOT := true

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

#
# Bootloader
#
TARGET_USE_SYSLINUX := true
TARGET_INSTALL_CUSTOM_SYSLINUX_CONFIG := true
TARGET_SYSLINUX_FILES = \
	$(SYSLINUX_BASE)/isolinux.bin \
	$(SYSLINUX_BASE)/vesamenu.c32 \
	$(SYSLINUX_BASE)/android.c32

BOARD_MBR_BLOCK_BIN ?= external/syslinux/mbr/gptmbr.bin

