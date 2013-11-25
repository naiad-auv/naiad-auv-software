#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <string.h>	
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>

int openPort(char* portname, int speed, int should_block);
int uartWrite(int fileDescriptor, char* message, int messageSize);
int uartRead(int fileDescriptor, char* buffer, int bufferSize);


