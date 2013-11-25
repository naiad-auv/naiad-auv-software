all:
	gcc -c uartlib.c
	gnatmake -c  main.adb
	gnatbind main.ali
	gnatlink main.ali uartlib.o
