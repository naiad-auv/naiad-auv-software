Dependencies
============
When the Naiad project started the aim was to develop on Ubuntu 12.04.3 LTS.
During the first "state of the art phase" the BeagleBone Blacks were chosen as
board for the Mission Control System and another for the Sensor Fusion. The goal
here was to run Ubuntu 12.04 for ARMhf on these.

Throughout the development phase we have hit some obstacles on the way when it
comes to dependencies on different packages/libraries. This file will include
a complete list of the dependencies the Naiad Project has.


### Building/Compiling for 8-bit AVR
avr-ada: http://sourceforge.net/projects/avr-ada/

Avr-ada requires gnat-4.7 and the packages supplied with Ubuntu 12.04, 12.10,
13.04, 13.10 and probably 14.04 as well will have gnat-4.6 (imported from debian).
This means that gnat-4.7 must be compiled with gnat-4.6 before being able to
compile for the AVRs.

### BeagleBone Black serial communication (UART/USART)
The adaincludes for gnat-4.6 concerning serieal communication throws unimplemented
exception. It seems like serial implementation was done for gnat-4.7 though
not confirmed.
