Pragma Profile (Ravenscar);

with Interfaces; 		--use Interfaces;
with Temp_Sensor;		--use Temp_Sensor;
with Salinity_Sensor;		--use Salinity_Sensor;
with Pressure_Sensor;		--use Pressure_Sensor;
with AVR.AT90CAN128.CAN;

with Ada.Unchecked_Conversion;

procedure Sensor_Controller is

   iTemperaturePin 	: Constant Interfaces.Unsigned_8 	:= 0; --which pin the temp sensor is at
   iPressurePin 	: Constant Interfaces.Unsigned_8 	:= 0; --which pin the pressure sensor is at
   UARTPort 		: Salinity_Sensor.USARTID 		:= Salinity_Sensor.USART0;

   sTemp : String := "+125.6";
   i16Temp : Interfaces.Integer_16;
   u16Pressure : Interfaces.Unsigned_16;
   u8Salinity : Interfaces.Unsigned_8;

   tLastLoop : AVR.AT90CAN128.CALENDAR.Time;
   LOOP_PERIOD : constant AVR.AT90CAN128.CALENDAR.Time := 500; --loop period in milliseconds

   send_message		: AVR.AT90CAN128.CAN.CAN_Message;
   received_message 	: AVR.AT90CAN128.CAN.CAN_Message;

   SEND_MESSAGE_ID : constant AVR.AT90CAN128.CAN.CAN_ID := 100;

   bMessageReceived : Boolean;

   --Converts the sensor readings to byte data that is to be sent in the CAN-message
   function u8Readings_To_Bytes(i16Temp : Interfaces.Integer_16 ; u16Pressure : Interfaces.Unsigned_16 ; u8Salinity : Interfaces.Unsigned_8)
                                return AVR.AT90CAN128.CAN.Byte8 is
      type TPayLoad is
         record
            i16 : Interfaces.Integer_16;
            u16 : Interfaces.Unsigned_16;
            u8 : Interfaces.Unsigned_8;
         end record;
      for TPayLoad use record
         i16 at 0 range 0 .. 15;
         u16 at 0 range 16 .. 31;
         u8  at 0 range 32 .. 39;
      end record;
      for TPayLoad'Size use 40;

      type TRecordArray is array (1..5) of Interfaces.Unsigned_8; --byte array of the same size as TPayLoad

      function To_Bytes is new Ada.Unchecked_Conversion(TPayLoad, TRecordArray);

      Load  : TPayLoad;
      u8Arr : TRecordArray;

      ret : AVR.AT90CAN128.CAN.Byte8;
   begin

      Load.i16 := i16Temp;
      Load.u16 := u16Pressure;
      Load.u8  := u8Salinity;

      u8Arr := To_Bytes(Load);

      for i in 1..5 loop
         ret(AVR.AT90CAN128.DLC_Type(i)) := u8Arr(i);
      end loop;
      return ret;
   end u8Readings_To_Bytes;


begin

   AVR.AT90CAN128.CAN.Can_Init(K250);

   --Can_Enable_Reception (10, 16#7_00#, 8);  --to be filled in once more is determined about CAN-messages


   send_message.ID := SEND_MESSAGE_ID;
   send_message.Len := 5;

   Temp_Sensor.sGetTempStr(iTemperaturePin, i16Temp, sTemp);
   Salinity_Sensor.Initate_Salinity_Sensor(UARTPort, sTemp(3..6));

   loop

      tLastLoop := AVR.AT90CAN128.CALENDAR.Clock;


      --check CAN:
      Can_Get(received_message, bMessageReceived);
      while bMessageReceived loop
         --Handle the message

         Can_Get(received_message, bMessageReceived);
      end loop;


      --read sensors:
      Temp_Sensor.sGetTempStr(iTemperaturePin, i16Temp, sTemp);
      u8Salinity  := Salinity_Sensor.Get_Salinity;
      u16Pressure := Pressure_Sensor.u16GetPressure(iPressurePin);

      send_message.Data := u8Readings_To_Bytes(i16Temp, u16Pressure, u8Salinity);

      Can_Send(send_message);

   end loop;

end Sensor_Controller;
