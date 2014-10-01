BOARD_SEPOLICY_DIRS := device/intel/common/sepolicy
BOARD_SEPOLICY_REPLACE := \
    domain.te \
    init.te \
    kernel.te
BOARD_SEPOLICY_UNION := \
    genfs_contexts \
    file_contexts \
    file.te \
    bluetooth.te \
    device.te \
    dhcp.te \
    gpsd.te \
    init_shell.te \
    keystore.te \
    mediaserver.te \
    netd.te \
    pstore-clean.te \
    sdcardd.te \
    surfaceflinger.te \
    system_server.te \
    userfastboot.te  \
    vold.te \
    wpa.te \
    setup_fs.te \
    watchdogd.te
