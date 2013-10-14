
-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-11


with AVR.AT90CAN128;
with AVR.AT90CAN128.Clock;
--with Ada.Float_Text_IO;
with Digital_IO;


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


   procedure i16ToStr(i16Temperature : Interfaces.Integer_16; sRet : out String) is

      use Interfaces;

      iPos : Integer := 1;
      i16Temp   : Interfaces.Integer_16 := i16Temperature;
      i16Tenths : Interfaces.Integer_16;
      i16Mod : Interfaces.Integer_16;

   begin

      if i16Temp < 0 then
         i16Temp := -i16Temp;
         sRet(iPos) := '-';
         iPos := iPos + 1;
      end if;

      i16Mod := i16Temp rem 16;
      i16Temp := i16Temp / 16;

      if i16Temp < -100 then
         sRet(iPos) := '1';
         iPos := iPos + 1;
         i16Temp := (-i16Temp) - 100;
      elsif i16Temp > 100 then
         sRet(iPos) := '1';
         iPos := iPos + 1;
         i16Temp := i16Temp - 100;
      end if;

      i16Tenths := i16Temp / Interfaces.Integer_16(10);
      if i16Tenths /= 0 then
         sRet(iPos) := Character'Val(i16Tenths + Character'Pos('0'));
         iPos := iPos + 1;
      end if;

      i16Temp := i16Temp - (i16Tenths*10);
      sRet(iPos) := Character'Val(Integer(i16Temp) + Character'Pos('0'));
      iPos := iPos + 1;

      -- i16Temperature is given in 1/16 of degrees, but since the sensor only has 12
      -- bits of resolution, i16Temperature will be a multiple of 4
      sRet(iPos) := '.';
      iPos := iPos + 1;

      if i16Mod = 4 then
         sRet(iPos) := '2';
         iPos := iPos + 1;
         sRet(iPos) := '5';
      elsif i16Mod = 8 then
         sRet(iPos) := '5';
      elsif i16Mod = 12 then
         sRet(iPos) := '7';
         iPos := iPos + 1;
         sRet(iPos) := '5';
      else
         sRet(iPos) := '0';
      end if;

      for i in (iPos+1)..sRet'Last loop
         sRet(i) := ASCII.NUL;
      end loop;
   end i16ToStr;


   function i16Get_Temp_Int(u8Pin : Interfaces.Unsigned_8) return Interfaces.Integer_16 is
      u8Data : array(0..8) of Interfaces.Unsigned_8;
      bTemporary : Boolean;
      use Interfaces;
   begin

      bTemporary := bReset_Pulse(u8Pin); --bTemporary not used

      Write_Byte(204, u8Pin); -- Skip ROM command
      Write_Byte(68, u8Pin);  -- Convert T command (measures the temperature

      AVR.AT90CAN128.Clock.Delay_ms(188);   --waits during temperature measurement

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

      use Interfaces;

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

      u8Mask :  Interfaces.Unsigned_8 := 1;
   begin

      for i in 1..8 loop
         if (u8Value and u8Mask) = 1 then --if bit number i is 1
            Write_One;
         else
            Write_Zero;
         end if;
         u8Mask := u8Mask * 2;
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

      use Interfaces;

      function bRead_Bit_OneWire(u8Pin : Interfaces.Unsigned_8) return Interfaces.Unsigned_8 is
         u8Ret : Unsigned_8;
      begin
         Digital_IO.Make_Output_Pin(u8Pin);
         Digital_IO.Clear_Pin(u8Pin);
         Wait_Us(2);
         Digital_IO.Make_Input_Pin(u8Pin);

         Wait_Us(9);

         if Digital_IO.bRead_Pin(u8Pin) then
            u8Ret := 1;
         else
            u8Ret := 0;
         end if;

         Wait_Us(55);

         return u8Ret;
      end bRead_Bit_OneWire;

      u8Ret : Interfaces.Unsigned_8;
   begin

      u8Ret := bRead_Bit_OneWire(u8Pin);
      u8Ret := u8Ret + bRead_Bit_OneWire(u8Pin) * 2;
      u8Ret := u8Ret + bRead_Bit_OneWire(u8Pin) * 4;
      u8Ret := u8Ret + bRead_Bit_OneWire(u8Pin) * 8;
      u8Ret := u8Ret + bRead_Bit_OneWire(u8Pin) * 16;
      u8Ret := u8Ret + bRead_Bit_OneWire(u8Pin) * 32;
      u8Ret := u8Ret + bRead_Bit_OneWire(u8Pin) * 64;
      u8Ret := u8Ret + bRead_Bit_OneWire(u8Pin) * 128;

      return u8Ret;
   end u8Read_Byte;

   function i16From_Bytes(u8LowByte : Interfaces.Unsigned_8;
                          u8HighByte : Interfaces.Unsigned_8)
                          return Interfaces.Integer_16 is
      -- Google "two's complement" to understand this function
      use Interfaces;
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
