
-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-05

with Ada.Unchecked_Conversion;

with AVR.AT90CAN128;
with AVR.AT90CAN128.Calendar;
with Ada.Float_Text_IO;
with Digital_IO;

with Ada.Strings;
with Ada.Strings.Fixed;

--with Text_IO;

package body Temp_Sensor is
   pragma Suppress (All_Checks);

   procedure Init(u8Pin : Interfaces.Unsigned_8) is
      bTemporary : Boolean;
   begin
      bTemporary := bReset_Pulse(u8Pin); --bTemporary not used

      Write_Byte(204, u8Pin); -- Skip ROM command
      Write_Byte(78, u8Pin);  -- Write scratchpad command

      -- Write T-high and T-low registers, compleatly irrellevant in our application,
      -- but need to be written in order to set the Configuration register
      Write_Byte(78, u8Pin);
      Write_Byte(78, u8Pin);
      Write_Byte(64, u8Pin); -- set Configuration register to 10 bit resolution
   end Init;


   function i16ToStr(iTemp : Interfaces.Integer_16) return String is
      sRet : String(1..10);
   begin
      Ada.Float_Text_IO.Put(sRet, Float(iTemp) / 16.0, 1, 0);
      sRet := Ada.Strings.Fixed.Trim(sRet, Ada.Strings.Both); --removes spaces
      return sRet;
   end i16ToStr;


   function i16Get_Temp_Int(u8Pin : Interfaces.Unsigned_8) return Interfaces.Integer_16 is
      u8Data : array(0..8) of Interfaces.Unsigned_8;
      bTemporary : Boolean;

      function  i16Fromu16 is new Ada.Unchecked_Conversion (Interfaces.Unsigned_16, Interfaces.Integer_16);
   begin

      bTemporary := bReset_Pulse(u8Pin); --bTemporary not used

      Write_Byte(204, u8Pin); -- Skip ROM command
      Write_Byte(68, u8Pin);  -- Convert T command (measures the temperature

   --   AVR.AT90CAN128.Calendar.Delay_ms(188);   --waits during temperature measurement

      bTemporary := bReset_Pulse(u8Pin); --bTemporary not used
      Write_Byte(204, u8Pin); -- Skip ROM command
      Write_Byte(190, u8Pin); -- Read scratchpad command (tells the sensor to send its data)

      --reads the 9 bytes sent by the sensor
      for i in 0..8 loop
         u8Data(i) := u8Read_Byte(u8Pin);
      end loop;
      --------------------- FOR DEBUGGING PURPOSES !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--        u8Data(1) := 2#00000111#; --these values should give 125 degrees
--        u8Data(0) := 2#11010000#;
      --------------------- FOR DEBUGGING PURPOSES !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      -- Byte 0 is lowbyte of the temperature reading
      -- Byte 1 is highbyte of the temperature reading
      -- At the moment, no checksum check is done...

      --Since we measure with 10 bit resolution,
      --the 2 least signigicant bits are undefined and need to be cleared:
      u8Data(0) := u8Data(0) and 2#11111100#;

      return i16From_Bytes(u8Data(0), u8Data(1));
   end i16Get_Temp_Int;

   -----------------------------------------------------------------------------------------------
   --private functions:
   -----------------------------------------------------------------------------------------------

   function bReset_Pulse(u8Pin : Interfaces.Unsigned_8) return Boolean is
      bRet : Boolean;
   begin
      Digital_IO.Make_Output_Pin(u8Pin);
      Digital_IO.Clear_Pin(u8Pin);
      Wait_Us(480);
      Digital_IO.Make_Input_Pin(u8Pin);

      Wait_Us(70);
      bRet := not Digital_IO.bRead_Pin(u8Pin);
      Wait_Us(410);

      return bRet;
   end bReset_Pulse;

   -----------------------------------------------------------------------------------------------

   procedure Write_Byte(u8Value : Interfaces.Unsigned_8; u8Pin : Interfaces.Unsigned_8) is

      procedure Write_One is
      begin
         Digital_IO.Make_Output_Pin(u8Pin);
         Digital_IO.Clear_Pin(u8Pin);
         Wait_Us(6);
         Digital_IO.Make_Input_Pin(u8Pin);

         Wait_Us(64);

      end Write_One;

      procedure Write_Zero is
      begin
         Digital_IO.Make_Output_Pin(u8Pin);
         Digital_IO.Clear_Pin(u8Pin);
         Wait_Us(60);
         Digital_IO.Make_Input_Pin(u8Pin);

         Wait_Us(10);

      end Write_Zero;

   begin

      for i in 1..8 loop
         if (u8Value and Interfaces.Shift_Right(Interfaces.Unsigned_8(1), i)) = 1 then --if bit number i is 1
            Write_One;
         else
            Write_Zero;
         end if;
      end loop;
   end Write_Byte;

   -----------------------------------------------------------------------------------------------

   procedure Wait_Us(u1Time : Interfaces.Unsigned_16) is
   begin
      for i in Interfaces.Unsigned_16 range 1..u1Time loop
         null;
         null;

      end loop;
   end Wait_Us;

   -----------------------------------------------------------------------------------------------

   function u8Read_Byte(u8Pin : Interfaces.Unsigned_8) return Interfaces.Unsigned_8 is

      function bRead_Bit_OneWire(u8Pin : Interfaces.Unsigned_8) return Boolean is
         bRet : Boolean;
      begin
         Digital_IO.Make_Output_Pin(u8Pin);
         Digital_IO.Clear_Pin(u8Pin);
         Wait_Us(2);
         Digital_IO.Make_Input_Pin(u8Pin);

         Wait_Us(9);

         bRet := Digital_IO.bRead_Pin(u8Pin);
         Wait_Us(55);

         return bRet;
      end bRead_Bit_OneWire;

      --These lines creates an Interfaces.Unsigned_8 and a General_Register that is the same
      --data space, this way changing bits in pu8Ret changes u8Ret
      u8Ret : Interfaces.Unsigned_8;
      pu8Ret : AVR.AT90CAN128.General_Register;
      for pu8Ret'Address use u8Ret'Address;

   begin

      pu8Ret.Bit_0 := bRead_Bit_OneWire(u8Pin);
      pu8Ret.Bit_1 := bRead_Bit_OneWire(u8Pin);
      pu8Ret.Bit_2 := bRead_Bit_OneWire(u8Pin);
      pu8Ret.Bit_3 := bRead_Bit_OneWire(u8Pin);
      pu8Ret.Bit_4 := bRead_Bit_OneWire(u8Pin);
      pu8Ret.Bit_5 := bRead_Bit_OneWire(u8Pin);
      pu8Ret.Bit_6 := bRead_Bit_OneWire(u8Pin);
      pu8Ret.Bit_7 := bRead_Bit_OneWire(u8Pin);

      return u8Ret;
   end u8Read_Byte;

   function i16From_Bytes(u8LowByte : Interfaces.Unsigned_8;
                          u8HighByte : Interfaces.Unsigned_8)
                          return Interfaces.Integer_16 is
      -- Google "two's complement" to understand this function
   begin
      if u8HighByte > 127 then --most significant bit set => negative number
         declare
            u8Low  : Interfaces.Unsigned_8 := not u8LowByte;
            u8High : Interfaces.Unsigned_8 := not u8HighByte;
         begin
            return -((Interfaces.Integer_16(u8High) * 256) + Interfaces.Integer_16(u8Low) + 1);
         end;
      else
         return (Interfaces.Integer_16(u8HighByte) * 256) + Interfaces.Integer_16(u8LowByte);
      end if;
   end i16From_Bytes;
end Temp_Sensor;
