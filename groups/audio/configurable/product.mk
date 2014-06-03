# Tinyalsa
PRODUCT_PACKAGES += \
         tinymix \
         tinyplay \
         tinycap

# Audio HAL
PRODUCT_PACKAGES += \
    audio_hal_configurable \
    libroute-subsystem \
    libfs-subsystem \
    libtinyamixer-subsystem \
    libtinyalsactl-subsystem

# parameter-framework debug/tuning/engineering
PRODUCT_PACKAGES += \
    remote-process

audiohal_config := device/intel/common/audio/configurable
define copy-pfw
$(eval PRODUCT_COPY_FILES += \
    $(audiohal_config)/$(strip $(1)):system/etc/parameter-framework/$(strip $(1)) \
)
endef
$(call copy-pfw, ParameterFrameworkConfigurationRoute-bytrt5640.xml)
$(call copy-pfw, RouteClass-bytrt5640.xml)
$(call copy-pfw, RouteSubsystem-bytrt5640.xml)
$(call copy-pfw, RouteSubsystem-common.xml)
$(call copy-pfw, RouteConfigurableDomains-bytrt5640.xml)

$(call copy-pfw, ParameterFrameworkConfiguration-bytrt5640.xml)
$(call copy-pfw, AudioClass-bytrt5640.xml)
$(call copy-pfw, AudioConfigurableDomains-bytrt5640.xml)
$(call copy-pfw, SysfsPmdownTimeBytcrSubsystem.xml)
$(call copy-pfw, Realtek_RT5640Subsystem.xml)

PRODUCT_COPY_FILES += device/intel/common/audio/configurable/audio_policy.conf:system/etc/audio_policy.conf

# SST Firmware
PRODUCT_COPY_FILES += vendor/intel/fw/sst/fw_sst_0f28.bin-i2s_master:/system/etc/firmware/intel/fw_sst_0f28.bin-i2s_master:intel_apache


