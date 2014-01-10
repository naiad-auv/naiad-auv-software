all:
	gcc -c uartlib.c
	gnatmake -c main.adb -gnat12
	gnatbind main.ali
	gnatlink main.ali uartlib.o
