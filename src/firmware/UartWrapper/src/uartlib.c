#include "uartlib.h"

int set_interface_attribs (int fd, int speed, int parity)
{
        struct termios tty;
        
	memset (&tty, 0, sizeof(tty));

        if (tcgetattr (fd, &tty) != 0)
        {
                printf("error %d from tcgetattr", errno);
                return -1;
        }

	switch (speed)
	{
        case 1:
		cfsetospeed (&tty, B9600);
		cfsetispeed (&tty, B9600);
		break;
	case 2:
		cfsetospeed (&tty, B115200);
		cfsetispeed (&tty, B115200);
		break;
    	}

        tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;     // 8-bit chars
        // disable IGNBRK for mismatched speed tests; otherwise receive break
        // as \000 chars
        tty.c_iflag &= ~IGNBRK;         // ignore break signal
        tty.c_lflag = 0;                // no signaling chars, no echo,
                                        // no canonical processing
  	tty.c_oflag = 0;                // no remapping, no delays
  
 	// kks :  this attributes will get overwrite by function set_blocking()
        tty.c_cc[VMIN]  = 0;            // read doesn't block
        tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

        tty.c_iflag &= ~(IXON | IXOFF | IXANY | ICRNL); // shut off xon/xoff ctrl

        tty.c_cflag |= (CLOCAL | CREAD);// ignore modem controls,
                                        // enable reading
        tty.c_cflag &= ~(PARENB | PARODD);      // shut off parity
        tty.c_cflag |= parity;
        tty.c_cflag &= ~CSTOPB;
        tty.c_cflag &= ~CRTSCTS;

        if (tcsetattr (fd, TCSANOW, &tty) != 0)
        {
                printf("error %d from tcsetattr", errno);
                return -1;
        }
        return 0;
}

void set_blocking (int fd, int vmin, int vtime)
{
        struct termios tty;
        memset (&tty, 0, sizeof tty);
        if (tcgetattr (fd, &tty) != 0)
        {
                printf("error %d from tggetattr", errno);
                return;
        }

  	// kks: VMIN = blocking for number of characters.
	// kks:	VTIME = blocking time between each character.
        tty.c_cc[VMIN]  = vmin;// ? 1 : 0;
        tty.c_cc[VTIME] = vtime;//5;           

        if (tcsetattr (fd, TCSANOW, &tty) != 0)
                printf("error %d setting term attributes", errno);
}

int openPort(char* portname, int speed, int vmin, int vtime)
{
	printf("trying to open port %s\n", portname);

	int fd = open (portname, O_RDWR | O_NOCTTY | O_SYNC);

	if (fd < 0)
	{
	        printf("error %d opening %s: %s\n", errno, portname, strerror (errno));
	        return;
	}

	set_interface_attribs (fd, speed, 0);  
	set_blocking (fd, vmin, vtime);

	return fd;
}

int uartWrite(int fileDescriptor, char* message, int messageSize)
{
	return write (fileDescriptor, message, messageSize);
}

int uartRead(int fileDescriptor, char* buffer, int bufferSize)
{
	return read (fileDescriptor, buffer, bufferSize);
}
