# Tinyalsa
PRODUCT_PACKAGES_DEBUG += \
         tinymix \
         tinyplay \
         tinycap

# Audio HAL
PRODUCT_PACKAGES += \
    audio_hal_configurable \
    libroute-subsystem \
    libfs-subsystem \
    libtinyamixer-subsystem \
    libtinyalsactl-subsystem \

# parameter-framework debug/tuning/engineering
PRODUCT_PACKAGES_ENG += \
    remote-process

audiohal_config := device/intel/common/audio/bytcr-rt564x
define copy-pfw
$(eval PRODUCT_COPY_FILES += \
    $(audiohal_config)/pfw/$(strip $(1)):system/etc/parameter-framework/$(strip $(1)) \
)
endef
define copy-pfw-ch-name
$(eval PRODUCT_COPY_FILES += \
    $(audiohal_config)/pfw/$(strip $(1)):system/etc/parameter-framework/$(strip $(2)) \
)
endef


ifneq ($(filter $(TARGET_BUILD_VARIANT),eng),)
$(call copy-pfw, ParameterFrameworkConfiguration-bytcr-rt5642-t100.xml)
$(call copy-pfw, ParameterFrameworkConfiguration-bytcr-rt5640-mrd7.xml)
$(call copy-pfw, ParameterFrameworkConfigurationRoute-bytcr-rt5642-t100.xml)
$(call copy-pfw, ParameterFrameworkConfigurationRoute-bytcr-rt5640-mrd7.xml)
else
$(call copy-pfw-ch-name, ParameterFrameworkConfiguration-bytcr-rt5642-t100-NoTuning.xml, ParameterFrameworkConfiguration-bytcr-rt5642-t100.xml)
$(call copy-pfw-ch-name, ParameterFrameworkConfiguration-bytcr-rt5640-mrd7-NoTuning.xml, ParameterFrameworkConfiguration-bytcr-rt5640-mrd7.xml)
$(call copy-pfw-ch-name, ParameterFrameworkConfigurationRoute-bytcr-rt5642-t100-NoTuning.xml, ParameterFrameworkConfigurationRoute-bytcr-rt5642-t100.xml)
$(call copy-pfw-ch-name, ParameterFrameworkConfigurationRoute-bytcr-rt5640-mrd7-NoTuning.xml, ParameterFrameworkConfigurationRoute-bytcr-rt5640-mrd7.xml)
endif

$(call copy-pfw, RouteClass-bytcr-rt5642-t100.xml)
$(call copy-pfw, RouteSubsystem-bytcr-rt5642-t100.xml)
$(call copy-pfw, RouteConfigurableDomains-bytcr-rt5642-t100.xml)
$(call copy-pfw, AudioClass-bytcr-rt5642-t100.xml)
$(call copy-pfw, AudioConfigurableDomains-bytcr-rt5642-t100.xml)
$(call copy-pfw, CodecSubsystem-bytcr-rt5642-t100.xml)
$(call copy-pfw, LpeSubsystem-bytcr-rt5642-t100.xml)

$(call copy-pfw, RouteClass-bytcr-rt5640-mrd7.xml)
$(call copy-pfw, RouteSubsystem-bytcr-rt5640-mrd7.xml)
$(call copy-pfw, RouteConfigurableDomains-bytcr-rt5640-mrd7.xml)
$(call copy-pfw, AudioClass-bytcr-rt5640-mrd7.xml)
$(call copy-pfw, AudioConfigurableDomains-bytcr-rt5640-mrd7.xml)
$(call copy-pfw, CodecSubsystem-bytcr-rt5640-mrd7.xml)
$(call copy-pfw, LpeSubsystem-bytcr-rt5640-mrd7.xml)

$(call copy-pfw, CodecSubsystem-bytcr-rt564x-common.xml)
$(call copy-pfw, LpeSubsystem-bytcr-rt564x-common.xml)
$(call copy-pfw, RouteSubsystem-common.xml)
$(call copy-pfw, SysfsPmdownTimeBytcrSubsystem.xml)
$(call copy-pfw, ConfigurationSubsystem.xml)
$(call copy-pfw, intel/AcousticEchoCanceler_V1_6.xml)
$(call copy-pfw, intel/Algos_Gen3_5.xml)
$(call copy-pfw, intel/AmbientNoiseAdapter_V2_5.xml)
$(call copy-pfw, intel/AutomaticGainControl_V1_3.xml)
$(call copy-pfw, intel/BandWidthExtender_V1_0.xml)
$(call copy-pfw, intel/Beamforming_V1.1.xml)
$(call copy-pfw, intel/ComfortNoiseInjector_V1_1.xml)
$(call copy-pfw, intel/ComfortNoiseInjector_V1_2.xml)
$(call copy-pfw, intel/CommonAlgoTypes.xml)
$(call copy-pfw, intel/Dcr.xml)
$(call copy-pfw, intel/DualMicrophoneNoiseReduction_V1_5.xml)
$(call copy-pfw, intel/DynamicRangeProcessor_V1_4.xml)
$(call copy-pfw, intel/EchoDelayLine_V1_1.xml)
$(call copy-pfw, intel/FbaFir_V1_1.xml)
$(call copy-pfw, intel/FbaIir_V1_1.xml)
$(call copy-pfw, intel/GainLossControl_V1_0.xml)
$(call copy-pfw, intel/Gain.xml)
$(call copy-pfw, intel/Lpro.xml)
$(call copy-pfw, intel/Mdrc.xml)
$(call copy-pfw, intel/ModuleVoiceProcessingLock_V1_0.xml)
$(call copy-pfw, intel/MultibandDynamicRangeProcessor_V1_0.xml)
$(call copy-pfw, intel/NoiseReduction_V1_1.xml)
$(call copy-pfw, intel/NonLinearFilter_V1_0.xml)
$(call copy-pfw, intel/ReferenceLine_V1_1.xml)
$(call copy-pfw, intel/SbaFir.xml)
$(call copy-pfw, intel/SbaIir.xml)
$(call copy-pfw, intel/SlowVoice_V1_0.xml)
$(call copy-pfw, intel/SpectralEchoReduction_V2_5.xml)
$(call copy-pfw, intel/ToneGenerator_V2_4.xml)
$(call copy-pfw, intel/TrafficNoiseReduction_V1_0.xml)
$(call copy-pfw, intel/VoiceVolume.xml)
$(call copy-pfw, intel/WindNoiseReduction_V1_0.xml)

PRODUCT_COPY_FILES += $(audiohal_config)/audio_policy.conf:system/etc/audio_policy.conf

# SST Firmware
PRODUCT_PACKAGES += \
    fw_sst_0f28_ssp0.bin \
    fw_sst_0f28_ssp2.bin

