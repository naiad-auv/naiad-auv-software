
--  Sensor controller firmware
--  This code handles the UART communication with the Salinity sensor and the ADC
--  readings of the pressure and temperature sensors. The sensor data is put into a CAN message
--  and sent.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2014-01-07

--  TODO: Test everything...



pragma Profile (Ravenscar);

with AVR.AT90CAN128.Clock;	use AVR.AT90CAN128.Clock;

with AT90CAN_Sensor_Controller;

procedure AT90CAN_Sensor_Controller_main is

   pragma Suppress (All_Checks);

   tLastLoop   		: AVR.AT90CAN128.Clock.Time;  --  in milliseconds
   tLOOP_PERIOD 	: Constant AVR.AT90CAN128.Clock.Time := 500; --  loop period in milliseconds

begin


   AT90CAN_Sensor_Controller.Init;

   loop
      tLastLoop := AVR.AT90CAN128.Clock.getClockTime;

     -- AT90CAN_Sensor_Controller.Handle_Can; 	--  check CAN, this part is obsolete
      AT90CAN_Sensor_Controller.Handle_Sensors; 	--  read sensors

      AVR.AT90CAN128.Clock.Delay_Until(tLOOP_PERIOD + tLastLoop);

   end loop;

end AT90CAN_Sensor_Controller_main;

