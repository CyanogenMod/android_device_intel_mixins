# hard code Intel VID and a fake PID here before
# we have a nicer solution to organize IDs. These
# parameters are for g_ffs driver built in kernel.
BOARD_KERNEL_CMDLINE += g_ffs.idVendor=0x8087 \
		g_ffs.idProduct=0x1234 \

