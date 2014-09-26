# Force using bash as a shell, otherwise, on Ubuntu, dash will break some
# dependency due to its bad handling of echo \1
MAKE += SHELL=/bin/bash

ifeq ($(KERNEL_SRC_DIR),)
$(error KERNEL_SRC_DIR is not set)
endif

ifeq ($(KERNEL_DEFCONFIG),)
$(error KERNEL_DEFCONFIG is not set)
endif

ifeq ($(TARGET_KERNEL_ARCH),x86_64)
KERNEL_TOOLCHAIN_ARCH := $(TARGET_KERNEL_ARCH)
else
KERNEL_TOOLCHAIN_ARCH := i686
endif
KERNEL_EXTRA_FLAGS := ANDROID_TOOLCHAIN_FLAGS=-mno-android
KERNEL_CROSS_COMP := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/host/$(KERNEL_TOOLCHAIN_ARCH)-linux-glibc2.7-4.6/bin/$(KERNEL_TOOLCHAIN_ARCH)-linux-

KERNEL_CCACHE :=$(firstword $(TARGET_CC))

ifeq ($(notdir $(KERNEL_CCACHE)),ccache)
KERNEL_CROSS_COMP := "ccache $(KERNEL_CROSS_COMP)"
KERNEL_PATH := $(ANDROID_BUILD_TOP)/$(dir $(KERNEL_CCACHE))
endif

#remove time_macros from ccache options, it breaks signing process
KERNEL_CCSLOP := $(filter-out time_macros,$(subst $(comma), ,$(CCACHE_SLOPPINESS)))
KERNEL_CCSLOP := $(subst $(space),$(comma),$(KERNEL_CCSLOP))

KERNEL_OUT_DIR := $(PRODUCT_OUT)/linux/kernel

KERNEL_MODINSTALL := modules_install
KERNEL_OUT_MODINSTALL := $(PRODUCT_OUT)/linux/$(KERNEL_MODINSTALL)
KERNEL_MODULES_ROOT := $(PRODUCT_OUT)/system/lib/modules
KERNEL_CONFIG := $(KERNEL_OUT_DIR)/.config

KERNEL_BLD_FLAGS := \
    ARCH=$(TARGET_KERNEL_ARCH) \
    INSTALL_MOD_PATH=../$(KERNEL_MODINSTALL) \
    INSTALL_MOD_STRIP=1 \
    DEPMOD=_fake_does_not_exist_ \
    $(KERNEL_EXTRA_FLAGS)

KERNEL_BLD_FLAGS :=$(KERNEL_BLD_FLAGS) \
     O=../../$(KERNEL_OUT_DIR) \

KERNEL_BLD_ENV := CROSS_COMPILE=$(KERNEL_CROSS_COMP) \
    PATH=$(KERNEL_PATH):$(PATH) \
    CCACHE_SLOPPINESS=$(KERNEL_CCSLOP)
KERNEL_FAKE_DEPMOD := $(KERNEL_OUT_DIR)/fakedepmod/lib/modules

KERNEL_VERSION_FILE := $(KERNEL_OUT_DIR)/include/config/kernel.release
KERNEL_BZIMAGE := $(PRODUCT_OUT)/kernel

HOST_OPENSSL := $(HOST_OUT_EXECUTABLES)/openssl

$(KERNEL_CONFIG): $(KERNEL_DEFCONFIG) $(wildcard $(KERNEL_DIFFCONFIG))
	@echo Regenerating kernel config $(KERNEL_OUT_DIR)
	@mkdir -p $(KERNEL_OUT_DIR)
	@cat $^ > $@
	@! $(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) listnewconfig | grep -q CONFIG_ ||  \
		(echo "There are errors in defconfig $^, please run cd $(KERNEL_SRC_DIR) && ./scripts/updatedefconfigs.sh" ; exit 1)

ifeq (,$(filter build_kernel-nodeps,$(MAKECMDGOALS)))
$(KERNEL_BZIMAGE): $(HOST_OPENSSL) $(MINIGZIP)
endif

$(KERNEL_BZIMAGE): $(KERNEL_CONFIG)
	@$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS)
	@cp -f $(KERNEL_OUT_DIR)/arch/x86/boot/bzImage $@

modules_install: $(KERNEL_BZIMAGE)
	@mkdir -p $(KERNEL_OUT_MODINSTALL)
	@$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) modules_install

clean_kernel:
	@$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) clean

#need to do this to have a modules.dep correctly set.
#it is not optimized (copying all modules for each rebuild) but better than kernel-build.sh
#fake depmod with a symbolic link to have /lib/modules/$(version_tag)/xxxx.ko
copy_modules_to_root: modules_install
	@$(RM) -rf $(KERNEL_MODULES_ROOT)
	@mkdir -p $(KERNEL_MODULES_ROOT)
	@find $(KERNEL_OUT_MODINSTALL)/lib/modules/`cat $(KERNEL_VERSION_FILE)` -name "*.ko" -exec cp -f {} $(KERNEL_MODULES_ROOT)/ \;
	@mkdir -p $(KERNEL_FAKE_DEPMOD)
	@echo "  DEPMOD `cat $(KERNEL_VERSION_FILE)`"
	@ln -fns ../../../../../system/lib/modules $(KERNEL_FAKE_DEPMOD)/`cat $(KERNEL_VERSION_FILE)`
	@/sbin/depmod -b $(KERNEL_OUT_DIR)/fakedepmod `cat $(KERNEL_VERSION_FILE)`

build_kernel: copy_modules_to_root
build_kernel-nodeps: build_kernel

menuconfig xconfig gconfig: $(KERNEL_CONFIG)
	@$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) $@
ifeq ($(wildcard $(KERNEL_DIFFCONFIG)),)
	@cp -f $(KERNEL_CONFIG) $(KERNEL_DEFCONFIG)
	@echo ===========
	@echo $(KERNEL_DEFCONFIG) has been modified !
	@echo ===========
else
	@./$(KERNEL_SRC_DIR)/scripts/diffconfig -m $(KERNEL_DEFCONFIG) $(KERNEL_CONFIG) > $(KERNEL_DIFFCONFIG)
	@echo ===========
	@echo $(KERNEL_DIFFCONFIG) has been modified !
	@echo ===========
endif

TAGS_files := TAGS
tags_files := tags
gtags_files := GTAGS GPATH GRTAGS GSYMS
cscope_files := $(addprefix cscope.,files out out.in out.po)

TAGS tags gtags cscope: $(KERNEL_CONFIG)
	@$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) $@
	@rm -f $(KERNEL_SRC_DIR)/$($@_files)
	@cp -fs $(addprefix `pwd`/$(KERNEL_OUT_DIR)/,$($@_files)) $(KERNEL_SRC_DIR)/


#used to build out-of-tree kernel modules
#$(1) is source path relative Android top, $(2) is module name
#$(3) is extra flags

define build_kernel_module
.PHONY: $(2)

$(2): $(KERNEL_BZIMAGE)
	@echo Building kernel module $(2) in $(1)
	@mkdir -p $(KERNEL_OUT_DIR)/../../$(1)
	@+$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) M=../../$(1) $(3)

$(2)_install: $(2)
	@+$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) M=../../$(1) $(3) modules_install

$(2)_clean:
	@echo Cleaning kernel module $(2) in $(1)
	@$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) M=../../$(1) clean

$(addprefix $(2)_,TAGS tags gtags cscope): $(KERNEL_CONFIG)
	@$(KERNEL_BLD_ENV) $(MAKE) -C $(KERNEL_SRC_DIR) $(KERNEL_BLD_FLAGS) M=../../$(1) $$(subst $(2)_,,$$@)
	@rm -f $(1)/$$($$(subst $(2)_,,$$@)_files)
	@cp -fs $$(addprefix `pwd`/$(KERNEL_OUT_DIR)/,$$($$(subst $(2)_,,$$@)_files)) $(1)/

ifneq ($(NO_KERNEL_EXT_MODULES),true)
copy_modules_to_root: $(2)_install

clean_kernel: $(2)_clean
endif
endef

.PHONY: menuconfig xconfig gconfig
.PHONY: copy_modules_to_root $(KERNEL_BZIMAGE)
.PHONY: build_kernel build_kernel-nodeps

$(PRODUCT_OUT)/boot.img: build_kernel
#kernel modules are installed in system
$(PRODUCT_OUT)/system.img: copy_modules_to_root

