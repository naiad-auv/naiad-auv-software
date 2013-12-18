all:	
	gcc -c ../../firmware/UartWrapper/src/uartlib.c -o ../../firmware/UartWrapper/obj/uartlib.o
	gnatmake -c -P  ../../firmware/UartWrapper/uartwrapper.gpr
	gnatmake -c -P  ../../firmware/bbb_can/bbb_can.gpr
	gnatmake -c -P  ../../lib/can_float_conversions/can_float_conversions.gpr
	gnatmake -c -P  ../../lib/can_utils/can_utils.gpr
	gnatmake -c -P  ../../lib/can_defs/can_defs.gpr
	gnatmake -c -P  ../../lib/queue/queue.gpr
	gnatmake -c -P  ../../lib/math/matrices/matrices.gpr
	gnatmake -c -P  ../../lib/math/vectors/vectors.gpr
	gnatmake -c -P  ../../lib/exception_handling/exception_handling.gpr
	gnatmake -c -P  ../../lib/math/math.gpr
	gnatmake -c -P  ../../lib/math/angles/angles.gpr
	gnatmake -c -P  ../../lib/math/planes/planes.gpr
	gnatmake -c -P  ../../lib/math/quaternions/quaternions.gpr
	gnatmake -c -P  sensor_fusion.gpr

	gnatbind build/sensor_fusion_main.ali  -I../../firmware/UartWrapper/obj/ -I../../firmware/bbb_can/build/ -I../../lib/queue/build/  -I../../lib/can_defs/build/ -I../../lib/can_float_conversions/build/ -I../../lib/can_utils/build/ -I../../lib/math/vectors/obj/   -I../../lib/math/matrices/obj/  -I../../lib/exception_handling/obj/ -I../../lib/math/obj/ -I../../lib/math/planes/obj/ -I../../lib/math/angles/obj/ -I../../lib/math/quaternions/obj/
	gnatlink build/sensor_fusion_main.ali ../../firmware/UartWrapper/obj/uartlib.o 

