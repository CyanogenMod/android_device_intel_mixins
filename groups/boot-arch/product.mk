PRODUCT_PACKAGES += \
	setup_fs \
	pstore-clean

ifneq ($(BOARD_SFU_UPDATE),)
PRODUCT_COPY_FILES += $(BOARD_SFU_UPDATE):system/etc/firmware/BIOSUPDATE.fv
endif

