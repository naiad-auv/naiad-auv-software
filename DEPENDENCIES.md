Dependencies
============
When the Naiad project started the aim was to develop on Ubuntu 12.04.3 LTS.
During the first "state of the art phase" the BeagleBone Blacks were chosen as
board for the Mission Control System and another for the Sensor Fusion. The goal
here was to run Ubuntu 12.04 for ARMhf on these. For other parts in the
distributed system the Avr AT90CAN128 were chosen.

Throughout the development phase we have hit some obstacles on the way when it
comes to dependencies on different packages/libraries. This file will include
a complete list of the dependencies the Naiad Project has.

### Terms and defintions
"GNAT" is the GNU Compiler Collection (GCC) front-end for Ada compiling. When
compiling GCC with "Ada" as one of the enabled languages all the "GNAT
functionality" will be installed as well. As an example gcc-4.7 with Ada
enabled is often called gnat-4.7.

### Building/Compiling for 8-bit AVR
avr-ada: http://sourceforge.net/projects/avr-ada/

Avr-ada requires gnat-4.7 and the packages supplied with Ubuntu 12.04, 12.10,
13.04, 13.10 and probably 14.04 as well will have gnat-4.6 (imported from debian).
This means that gnat-4.7 must be compiled with gnat-4.6 before being able to
compile for the AVRs.

Make sure to test the functionality you expect to use with the correct compiler.
With AVR-Ada there are some basic limitiations to start with, that is exceptions
and tasks, neither works with gnat-4.7 and AVR-Ada 1.2.2. During the Naiad
project we have also had some problems with interfaces, tagged types and abstracts.
We are still trying to figure out if that functionality is expected to work
(2013-11-29).

### BeagleBone Black serial communication (UART/USART)
The adaincludes for gnat-4.6 concerning serieal communication throws unimplemented
exception. It seems like serial implementation was done for gnat-4.7 though
not confirmed.
