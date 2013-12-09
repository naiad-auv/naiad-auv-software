all:

	gcc -c ../lib/UartWrapper/src/uartlib.c -o ../lib/UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../lib/UartWrapper/uartwrapper.gpr
	gnatmake -c -P  ../str2float/str2float.gpr
	gnatmake -c -P  imu_testing.gpr

	gnatbind build/imu_testing_main.ali  -I../lib/UartWrapper/obj/ -I../str2float/build/
	gnatlink build/imu_testing_main.ali ../lib/UartWrapper/obj/uartlib.o 

