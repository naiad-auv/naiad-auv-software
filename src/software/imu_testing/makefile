all:

	gcc -c ../../firmware/UartWrapper/src/uartlib.c -o ../../firmware/UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../../firmware/UartWrapper/uartwrapper.gpr
	gnatmake -c -P  ../../lib/str2float/str2float.gpr
	gnatmake -c -P  imu_testing.gpr

	gnatbind build/imu_testing_main.ali  -I../../firmware/UartWrapper/obj/ -I../../lib/str2float/build/
	gnatlink build/imu_testing_main.ali ../../firmware/UartWrapper/obj/uartlib.o 

