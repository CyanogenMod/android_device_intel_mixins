GPS_CHIP_VENDOR := intel
GPS_CHIP := cg2000

GPS_POWER := $[power]
GPS_TRANS := $[trans]
GPS_CLOSE_INACTIVE := $[uart_close]
GPS_UART_PM := $[uart_pm]
GPS_SIMU := $[simu]
ifeq ($(BOARD_HAVE_MODEM), true)
GPS_AMIL := true
endif
