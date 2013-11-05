
--  Sensor controller firmware
--  This code handles the UART communication with the Salinity sensor and the ADC
--  readings of the pressure and temperature sensors. The sensor data is put into a CAN message
--  and sent.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-10-02

--  TODO: Bootload functionallity
--  TODO: Receiving CAN messages for bootload functionallity. This is to be
--  done in the Sensor_Controller_pack.Handle_Can procedure
--  TODO: Test everything...



pragma Profile (Ravenscar);

with AVR.AT90CAN128.Clock;	use AVR.AT90CAN128.Clock;

with Sensor_Controller_pack;

procedure Sensor_Controller is

   pragma Suppress (All_Checks);

   tLastLoop   		: AVR.AT90CAN128.Clock.Time;  --  in milliseconds
   tLOOP_PERIOD 	: Constant AVR.AT90CAN128.Clock.Time := 500; --  loop period in milliseconds

begin


   Sensor_Controller_pack.Init;

   loop
      tLastLoop := AVR.AT90CAN128.Clock.getClockTime;

      Sensor_Controller_pack.Handle_Can; 	--  check CAN
      Sensor_Controller_pack.Handle_Sensors; 	--  read sensors

      AVR.AT90CAN128.Clock.Delay_Until(tLOOP_PERIOD + tLastLoop);

   end loop;

end Sensor_Controller;

