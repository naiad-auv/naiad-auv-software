all:	
	gcc -c ../lib/UartWrapper/src/uartlib.c -o ../lib/UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../lib/UartWrapper/uartwrapper.gpr
	gnatmake -c -P  ../can_link_utils/can_link_utils_testing.gpr
	gnatmake -c -P  ../../lib/exception_handling/exception_handling.gpr
	gnatmake -c -P  ../queue/queue.gpr
	gnatmake -c -P  bbb_can.gpr

	gnatbind build/bbb_can_main.ali  -I../lib/UartWrapper/obj/ -I../can_link_utils/build/ -I../../lib/exception_handling/obj/ -I../queue/build/
	gnatlink build/bbb_can_main.ali ../lib/UartWrapper/obj/uartlib.o

