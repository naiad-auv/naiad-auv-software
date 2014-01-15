Simulator at the state of 2014-01-15

The simulator will be run through the file GUI that holds the main file for starting the simulator.

The simulator has three modes in offline mode, observe mode and Motion control over ethernet.

To set these modes no gui settings have been added, which means that one has to go into the file Model, and set in the ininitialization of the model which mode it should be in and comment or remove the commenting for the connection.

Offline mode: 
Straight of all functionality will be available and one just has to set the values and start the simulation


Observe mode:
The IP adress to connect to must be set at the same place as the mode, this combined with the fact that the system that it is to connect to need to be up at running before starting.

A test program for this is Simulator_Motio_Control_Test located in src/examples/Simulator_Motio_Control_Test

Simulated Movement over ethernet:
The IP adress to connect to must be set at the same place as the mode, this combined with the fact that the system that it is to connect to need to be up at running before starting.

A test program for this is Simulator_Observe_Mode_Tester located in src/examples/Simulator_Observe_Mode_Tester