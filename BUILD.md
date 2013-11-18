Build instructions
==================
Throughout the Naiad project we are using different embedded devices and different
architectures. This file includes the basic commands we have used.

### General Ada compilation commands
Compile a project

    gnatmake -p -d -P <project.gpr>

Clean a project build

    gnat clean -r -P <project.gpr>

### PC, Ubuntu 12.04.1-3


### BeagleBone Black Rev. A5C
Throughout the Naiad project we had Ubuntu armhf kernel 3.8.X installed.
Made it easy to compile for the device directly on board.
The BeagleBone Black main cpu is the Cortex-A8.

Same commands as for PC (Ubuntu 12.04.1-3). No cross-compilation
of Ada made on PC for the BeagleBone Black.

### Gimme2 from Xilinx (Vision detection)
http://www.xilinx.com/products/boards-and-kits/1-3BWL4K.htm

The Gimme 2 consist of a Cortex-A9 chip which is compatible with the BeagleBone Blacks Cortex-A8 architecture. On the BeagleBone Blacks we compiled with the followingstatement.

    gnatmake -p -d -P example1.gpr -bargs -static -largs -static

The final executable can run on the Gimme2 board.
