all:	
	gcc -c ../lib/UartWrapper/src/uartlib.c -o ../lib/UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../can_link_utils/can_link_utils_testing.gpr
	gnatmake -c -P  ../../lib/exception_handling/exception_handling.gpr
	gnatmake -c -P  ../queue/queue.gpr
	gnatmake -c -P  ../lib/UartWrapper/uartwrapper.gpr
	gnatmake -c -P  bbb_can.gpr
	gnatmake -c  ../lib/UartWrapper/src/uartwrapper.adb


	#gnatbind ../can_link_utils/build/can_link_utils.ali
	gnatbind build/bbb_can_main.ali -I../can_link_utils/build/ -I../../lib/exception_handling/obj/ -I../queue/build/
	gnatlink bbb_can.ali ../lib/UartWrapper/obj/uartlib.o
