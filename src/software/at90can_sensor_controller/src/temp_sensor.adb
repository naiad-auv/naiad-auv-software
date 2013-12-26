
-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-11


with AVR.AT90CAN128;
with AVR.AT90CAN128.ADC;


package body Temp_Sensor is
   pragma Suppress (All_Checks);

   u8ChannelPin : Interfaces.Unsigned_8;

   procedure Init(u8Pin : Interfaces.Unsigned_8) is
      bTemporary : Boolean;
   begin
      u8ChannelPin := u8Pin;
      AVR.AT90CAN128.ADC.ADC_Init(u8Pin);
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


   function i16Get_Temp_Int return Interfaces.Integer_16 is
   begin
      return i16Convert(AVR.AT90CAN128.ADC.Get (AVR.AT90CAN128.Channel_Type (u8ChannelPin)));
   end i16Get_Temp_Int;


   function i16Convert(u16In : Interfaces.Unsigned_16) return Interfaces.Integer_16 is

   begin

      return 0;

   end i16Convert;
end Temp_Sensor;
