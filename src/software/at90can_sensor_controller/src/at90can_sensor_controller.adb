-- This code contains the main functions of the Sensor controller firmware

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2014-01-07

--with Text_IO;  -- for debugging


with TEMP_SENSOR_1WIRE;
with Pressure_Sensor;

with Board_and_Mode_Defs;
with AVR.AT90CAN128.CAN;

package body AT90CAN_Sensor_Controller is

   pragma Suppress (All_Checks);


   function u8Readings_To_Bytes (i16Temp : Interfaces.Integer_16;
                                 u16Pressure : Interfaces.Unsigned_16;
                                 u8Salinity : Interfaces.Unsigned_8)
                                 return CAN_Defs.Byte8 is
      use Interfaces;
      function u16_From_i16 is new Ada.Unchecked_Conversion (Interfaces.Integer_16, Interfaces.Unsigned_16);

      u8Ret : CAN_Defs.Byte8;
      u16Temporary : Interfaces.Unsigned_16;
   begin

      u16Temporary :=   u16_From_i16(i16Temp);

      u8Ret(1) := Interfaces.Unsigned_8(u16Temporary / 256);
      u8Ret(2) := Interfaces.Unsigned_8(u16Temporary rem 256);
      u8Ret(3) := Interfaces.Unsigned_8(u16Pressure / 256);
      u8Ret(4) := Interfaces.Unsigned_8(u16Pressure rem 256);
      u8Ret(5) := u8Salinity;
      return u8Ret;
   end u8Readings_To_Bytes;


   -- THIS PART OF THE CODE IS OBSOLETE
--     procedure Handle_Can is
--        use CAN_Defs;
--        use Interfaces;
--        received_message  : CAN_Defs.CAN_Message;
--        bMessageReceived 	: Boolean;
--     begin
--        AVR.AT90CAN128.CAN.Can_Get(received_message, bMessageReceived, 0);
--        while bMessageReceived loop
--           --  Handle the message
--           if received_message.ID = CAN_Defs.MSG_SIMULATION_MODE_ID then
--                if received_message.Data(1) = CAN_Defs.SIMULATION_MODE_NOT_ACTIVE then
--                 bSimulate := false;
--              elsif received_message.Data(1) = CAN_Defs.SIMULATION_MODE_ACTIVE then
--                 bSimulate := true;
--              end if;
--           end if;
--
--           AVR.AT90CAN128.CAN.Can_Get(received_message, bMessageReceived, 0);
--        end loop;
--     end Handle_Can;

   procedure Handle_Sensors is
      send_message         : CAN_Defs.CAN_Message;
      u8Temp : Interfaces.Unsigned_8;
      i16Temp : Interfaces.Integer_16;
      u16Pressure : Interfaces.Unsigned_16;
      u8Salinity : Interfaces.Unsigned_8;
      sTemp : String := "+125.6";


   begin
      send_message.ID := CAN_Defs.MSG_SENSOR_ID;
      send_message.Len := 5;

      ----------------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--        Text_IO.Put_Line("temperature:");
--        Text_IO.Put_Line(Temp_Sensor.i16ToStr(i16Temp));
--        return;
      ----------------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      TEMP_SENSOR_1WIRE.Read_temp(u8Temp);
      i16Temp := Interfaces.Integer_16(u8Toi8(u8Temp));

      Salinity_Sensor.i16ToStr(i16Temp, sTemp);

      Salinity_Sensor.Set_Temperature(sTemp);
      u8Salinity  := Salinity_Sensor.Get_Salinity;
      u16Pressure := Pressure_Sensor.u16GetPressure;

      if bSimulate = false then --send message if not simulating:
         send_message.Data := u8Readings_To_Bytes (i16Temp, u16Pressure, u8Salinity);
         AVR.AT90CAN128.CAN.Can_Send (send_message);
      end if;
   end Handle_Sensors;

   procedure Init is
      sTemp : String := "+125.6";
      i16Temp : Interfaces.Integer_16;
      u8Temp : Interfaces.Unsigned_8;

   begin

      Pressure_Sensor.Init(uPRESSURE_PIN);

      AVR.AT90CAN128.CAN.Can_Init (CAN_Defs.K250, Board_and_Mode_Defs.SENSOR_CONTROLLER);

      --enable reception on only simulation messages (OBSOLETE):
--        declare
--           mask : CAN_Defs.CAN_ID;
--        begin
--           if USE_EXTENDED_MSG then
--              mask := (536870911, true);
--           else
--              mask := (2047, false);
--           end if;
--           AVR.AT90CAN128.CAN.Can_Set_All_MOB_ID_MASK(CAN_Defs.MSG_SIMULATION_MODE_ID, mask);
--        end;

         --Start the salinity sensor:
         --The salinity sensor needs a temperature reading for accuracy
      TEMP_SENSOR_1WIRE.Read_temp(u8Temp);
      i16Temp := Interfaces.Integer_16(u8Toi8(u8Temp));

      Salinity_Sensor.i16ToStr(i16Temp, sTemp);
      Salinity_Sensor.Initate_Salinity_Sensor (UARTPort, sTemp(3 .. 6));
   end Init;

end AT90CAN_Sensor_Controller;
