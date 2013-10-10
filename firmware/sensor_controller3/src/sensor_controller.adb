
--  Sensor controller firmware
--  This code handles the 1-Wire communication with the Temp sensor,
--  the UART communication with the Salinity sensor and the ADC
--  readings of the pressure sensor. The sensor data is put into a CAN message
--  and sent.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-10-02

--  TODO: Bootload functionallity
--  TODO: Receiving CAN messages for bootload functionallity. This is to be
--  done in the Sensor_Controller_pack.Handle_Can procedure
--  TODO: Test everything...



pragma Profile (Ravenscar);

with AVR.AT90CAN128.Calendar;	use AVR.AT90CAN128.Calendar;

with Text_IO;


with Temp_Sensor;
with Salinity_Sensor;
with Pressure_Sensor;
with Sensor_Controller_pack;
with Interfaces;

procedure Sensor_Controller is

   pragma Suppress (All_Checks);

--   tLastLoop   		: AVR.AT90CAN128.Calendar.Time;  --  in milliseconds
 --  tLOOP_PERIOD 	: Constant AVR.AT90CAN128.Calendar.Time := 500; --  loop period in milliseconds

   use Interfaces;
begin

 --  Sensor_Controller_pack.Init;

--     Text_IO.Put_Line(Integer'Image(Integer(Temp_Sensor.i16From_Bytes(248, 255))));
--     return;
   loop
     -- tLastLoop := AVR.AT90CAN128.Calendar.Clock;

    --  Sensor_Controller_pack.Handle_Can; 	--  check CAN
      Sensor_Controller_pack.Handle_Sensors; 	--  read sensors
--------------------- FOR DEBUGGING PURPOSES !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    --  AVR.AT90CAN128.Calendar.Delay_Until(tLOOP_PERIOD + tLastLoop);

   end loop;

end Sensor_Controller;

