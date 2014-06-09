mixin_update := $(wildcard device/intel/mixins/mixin-update)

ifneq ($(mixin_update),)

# TARGET_DEVICE_DIR doesn't get expanded until later. so OK to reference
# this in BoardConfig.mk
.PHONY: check-mixins
check-mixins:
	device/intel/mixins/mixin-update --dry-run --spec $(TARGET_DEVICE_DIR)/mixins.spec

# This invocation of dumpvar gets called during the 'lunch' command. Hook it to
# do some additional checking.
dumpvar-TARGET_DEVICE: check-mixins
droidcore: check-mixins

endif

