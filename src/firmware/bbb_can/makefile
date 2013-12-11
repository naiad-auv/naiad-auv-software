all:	
	gcc -c ../UartWrapper/src/uartlib.c -o ../UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../UartWrapper/uartwrapper.gpr
	gnatmake -c -P  ../../lib/can_utils/can_utils.gpr
	gnatmake -c -P  ../../lib/can_defs/can_defs.gpr
	gnatmake -c -P  ../../lib/exception_handling/exception_handling.gpr
	gnatmake -c -P  ../../lib/queue/queue.gpr
	gnatmake -c -P  bbb_can.gpr

	gnatbind build/bbb_can_main.ali  -I../UartWrapper/obj/ -I../../lib/can_utils/build/ -I../../lib/can_defs/build/ -I../../lib/exception_handling/obj/ -I../../lib/queue/build/
	gnatlink build/bbb_can_main.ali ../UartWrapper/obj/uartlib.o

