clean:
	gnat clean -r -P bbb1_imu_tester.gpr
	@rm -v main

all:	
	gnat clean -r -P bbb1_imu_tester.gpr
	gcc -c ../../../src/firmware/UartWrapper/src/uartlib.c -o ../../../src/firmware/UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../../../src/firmware/UartWrapper/uartwrapper.gpr
	gnatmake -c -P  ../../../src/lib/can_utils/can_utils.gpr
	gnatmake -c -P  ../../../src/lib/can_defs/can_defs.gpr
	gnatmake -c -P  ../../../src/lib/exception_handling/exception_handling.gpr
	gnatmake -c -P  ../../../src/lib/queue/queue.gpr
	gnatmake -c -P  ../../../src/firmware/bbb_can/bbb_can.gpr
	gnatmake -c -P bbb1_imu_tester.gpr

	gnatbind obj/main.ali  -I../../../src/firmware/UartWrapper/obj/ -I../../../src/lib/can_utils/build/ -I../../../src/lib/can_defs/build/ -I../../../src/lib/exception_handling/obj/ -I../../../src/lib/queue/build/ -I../../../src/firmware/bbb_can/build/
	gnatlink obj/main.ali ../../../src/firmware/UartWrapper/obj/uartlib.o

