clean:
	gnat clean -r -P bbb_imu_test.gpr
	@rm -v main

all:	
	gnat clean -r -P bbb_imu_test.gpr
	gcc -c ../../src/firmware/UartWrapper/src/uartlib.c -o ../../src/firmware/UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../../src/firmware/UartWrapper/uartwrapper.gpr
	gnatmake -c -P bbb_imu_test.gpr

	gnatbind obj/main.ali  -I../../src/firmware/UartWrapper/obj/
	gnatlink obj/main.ali ../../src/firmware/UartWrapper/obj/uartlib.o

