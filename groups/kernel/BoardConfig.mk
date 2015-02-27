# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := device/intel/{{{path}}}-kernel{{#dev-kernel}}-dev{{/dev-kernel}}/kernel-headers

KERNEL_LOGLEVEL ?= {{{loglevel}}}

BOARD_KERNEL_CMDLINE += \
        loglevel=$(KERNEL_LOGLEVEL) \
        androidboot.hardware=$(TARGET_DEVICE)\
        firmware_class.path=/system/etc/firmware \
{{#interactive_governor}}
BOARD_KERNEL_CMDLINE += \
	intel_pstate=disable
{{/interactive_governor}}

