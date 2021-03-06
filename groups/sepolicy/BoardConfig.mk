# SELinux Policy
BOARD_SEPOLICY_DIRS := device/intel/common/sepolicy
BOARD_SEPOLICY_REPLACE := \
    domain.te

# please keep this list in alphabetical order
BOARD_SEPOLICY_UNION := \
    adbd.te \
    bluetooth.te \
    cg2k.te \
    coreu.te \
    cws_manu.te \
    device.te \
    drmserver.te \
    efiprop.te \
    file_contexts \
    file.te \
    genfs_contexts \
    gpsd.te \
    hdcpd.te \
    hostapd.te \
    init.te \
    kernel.te \
    keymaster.te \
    keystore.te \
    mediaserver.te \
    netd.te \
    platform_app.te \
    power_hal_helper.te \
    property_contexts \
    property.te \
    pstore-clean.te \
    recovery.te \
    service_contexts \
    service.te \
    shell.te \
    surfaceflinger.te \
    system_app.te \
    system_server.te \
    te_macros \
    thermal.te \
    ueventd.te \
    untrusted_app.te \
    userfastboot.te \
    vold.te \
    wlan_prov.te \
    wpa.te
