all:	
	gcc -c ../../src/firmware/UartWrapper/src/uartlib.c -o ../../src/firmware/UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../../src/firmware/UartWrapper/uartwrapper.gpr
	gnatmake -c -P  ../../src/lib/can_utils/can_utils.gpr
	gnatmake -c -P  ../../src/lib/can_defs/can_defs.gpr
	gnatmake -c -P  ../../src/lib/exception_handling/exception_handling.gpr
	gnatmake -c -P  ../../src/lib/queue/queue.gpr
	gnatmake -c -P  ../../src/firmware/bbb_can/bbb_can.gpr
    gnatmake -c -P  bbb_can_example.gpr

	gnatbind build/bbb_can_main.ali  -I../../src/firmware/UartWrapper/obj/ -I../../src/lib/can_utils/build/ -I../../src/lib/can_defs/build/ -I../../src/lib/exception_handling/obj/ -I../../src/lib/queue/build/
	gnatlink build/bbb_can_main.ali ../../src/firmware/UartWrapper/obj/uartlib.o

