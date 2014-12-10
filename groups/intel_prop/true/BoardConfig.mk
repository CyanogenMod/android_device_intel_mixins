BOARD_SEPOLICY_DIRS += device/intel/common/sepolicy/intel_prop

BOARD_SEPOLICY_UNION += \
	intel_prop.te \
	file_contexts

ifneq ($(TARGET_UEFI_ARCH),)
INTEL_PROP_LIBDMI := true
endif

