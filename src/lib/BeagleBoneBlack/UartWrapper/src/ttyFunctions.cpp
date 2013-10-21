#include <x86_64-linux-gnu/bits/termios.h>

void setNewOptions(int baudrate, int databits, const QString& parity, const QString& stop, bool softwareHandshake, bool hardwareHandshake)
{
   struct termios newtio;
//   memset(&newtio, 0, sizeof(newtio));
   if (tcgetattr(m_fd, &newtio)!=0)
   {
   }

   cfsetospeed(&newtio, (speed_t)baudrate);
   cfsetispeed(&newtio, (speed_t)baudrate);

   /* We generate mark and space parity ourself. */
 /*  if (databits == 7 && (parity=="Mark" || parity == "Space"))
   {
      databits = 8;
   }
   switch (databits)
   {
   case 5:
      newtio.c_cflag = (newtio.c_cflag & ~CSIZE) | CS5;
      break;
   case 6:
      newtio.c_cflag = (newtio.c_cflag & ~CSIZE) | CS6;
      break;
   case 7:
      newtio.c_cflag = (newtio.c_cflag & ~CSIZE) | CS7;
      break;
   case 8:
   default:
      newtio.c_cflag = (newtio.c_cflag & ~CSIZE) | CS8;
      break;
   }
   newtio.c_cflag |= CLOCAL | CREAD;

   //parity
   newtio.c_cflag &= ~(PARENB | PARODD);
   if (parity == "Even")
   {
      newtio.c_cflag |= PARENB;
   }
   else if (parity== "Odd")
   {
      newtio.c_cflag |= (PARENB | PARODD);
   }

   newtio.c_cflag &= ~CRTSCTS;

   //stopbits
   if (stop=="2")
   {
      newtio.c_cflag |= CSTOPB;
   }
   else
   {
      newtio.c_cflag &= ~CSTOPB;
   }

//   newtio.c_iflag=IGNPAR | IGNBRK;
   newtio.c_iflag=IGNBRK;
//   newtio.c_iflag=IGNPAR;

   //software handshake
   if (softwareHandshake)
   {
      newtio.c_iflag |= IXON | IXOFF;
   }
   else
   {
      newtio.c_iflag &= ~(IXON|IXOFF|IXANY);
   }

   newtio.c_lflag=0;
   newtio.c_oflag=0;

   newtio.c_cc[VTIME]=1;
   newtio.c_cc[VMIN]=60;

//   tcflush(m_fd, TCIFLUSH);
   if (tcsetattr(m_fd, TCSANOW, &newtio)!=0)
   {
   }

   int mcs=0;
   ioctl(m_fd, TIOCMGET, &mcs);
   mcs |= TIOCM_RTS;
   ioctl(m_fd, TIOCMSET, &mcs);

   if (tcgetattr(m_fd, &newtio)!=0)
   {
   }

   //hardware handshake
   if (hardwareHandshake)
   {
      newtio.c_cflag |= CRTSCTS;
   }
   else
   {
      newtio.c_cflag &= ~CRTSCTS;
   }

   if (tcsetattr(m_fd, TCSANOW, &newtio)!=0)
   {
   }
*/
}
