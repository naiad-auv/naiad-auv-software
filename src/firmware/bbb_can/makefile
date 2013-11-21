all:	
	gcc -c ../../lib/BeagleBoneBlack/UartWrapper/src/uartlib.c
	gnatmake -P  bbb_can.gpr
	gnatbind bbb_can.ali
	gnatlink main.ali uartlib.o
