
-- This code contains the main functions of the Sensor controller firmware

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-05

-- NOTE: Make sure that this code (and the Salinity_Sensor code) is the only
-- code that uses the USART port specified as UARTPort


with Interfaces;
with AVR.AT90CAN128.CAN;
with Salinity_Sensor;


package Sensor_Controller_pack is

   USE_EXTENDED_MSG : constant Boolean := true;
   uTEMP_PIN      : constant Interfaces.Unsigned_8   := 0; -- which pin the temp sensor is at
   uPRESSURE_PIN  : constant Interfaces.Unsigned_8   := 0; -- which pin the pressure sensor is at
   UARTPort       : constant Salinity_Sensor.USARTID := Salinity_Sensor.USART0;

   bSimulate : Boolean := false;

   --  Converts the sensor readings to byte data that is to be sent in the CAN-message
   function u8Readings_To_Bytes (i16Temp : Interfaces.Integer_16;
                                 u16Pressure : Interfaces.Unsigned_16;
                                 u8Salinity : Interfaces.Unsigned_8)
                                 return AVR.AT90CAN128.CAN.Byte8;

   --Receives Simulate CAN message and sets the bSimulate accordingly
   procedure Handle_Can;

   --Makes measurements on the sensors and sends the sensor readings as a CAN-message
   procedure Handle_Sensors;

   procedure Init;

end Sensor_Controller_pack;
