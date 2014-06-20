# hard code Intel VID and PID here. These parameters are for g_ffs driver
# built in kernel.
#
# <arjan> we have an official assigned intel ID
# <arjan> 0x0a21

BOARD_KERNEL_CMDLINE += g_ffs.idVendor=0x8087 \
		g_ffs.idProduct=0x0a21 \

