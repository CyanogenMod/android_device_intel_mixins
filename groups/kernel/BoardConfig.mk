# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := device/intel/gmin-kernel/kernel-headers

KERNEL_LOGLEVEL ?= 7

BOARD_KERNEL_CMDLINE += \
        loglevel=$(KERNEL_LOGLEVEL) \
        androidboot.hardware=$(TARGET_DEVICE)\
	i915.fastboot=1

