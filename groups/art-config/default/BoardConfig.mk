# Enable dex-preoptimization to speed up the first boot sequence
# Note that this operation only works on Linux for now
# Enable for user and eng builds
ifneq ($(TARGET_BUILD_VARIANT),userdebug)
WITH_DEXPREOPT := true
endif

