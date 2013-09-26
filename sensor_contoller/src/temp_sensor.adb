


-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-26

package body Temp_Sensor is

   -- THIS FUNCTION ASSUMES LITTLE ENDIANNESS (LOWEST VALUE BITS/BYTES FIRST/TO THE LEFT)!!!
   function i16GetTempInt(u8Pin : Interfaces.Unsigned_8) return Interfaces.Integer_16 is
      u8Data : array(0..7) of Interfaces.Unsigned_8;

      i16Ret : Interfaces.Integer_16;

      bTemp : Boolean;
   begin

      bTemp := bReset_Pulse(u8Pin); --temp not used

      write_byte(204, u8Pin); -- Skip ROM command
      write_byte(68, u8Pin);  -- Convert T command (measures the temperature

      AVR.AT90CAN128.Calendar.Delay_ms(750);   --waits during temp measurement

      bTemp := bReset_Pulse(u8Pin); --temp not used
      Write_Byte(204, u8Pin); -- Skip ROM command
      Write_Byte(190, u8Pin); -- Read scratchpad command (tells the sensor to send its data)

      --reads the 9 bytes sent by the sensor
      for i in 0..9 loop
         u8Data(i) := u8Read_Byte(u8Pin);
      end loop;

      -- at the moment, no checksum check is done...

      -- byte 0 is lowbyte of the temperature reading
      -- byte 1 is highbyte of the temperature reading
      i16Ret := Interfaces.Integer_16(
                                       Interfaces.Shift_Right(Interfaces.Unsigned_16(u8Data(1)), 8) --shifts the highbyte 8 steps to the right
                                      );
      i16Ret := i16Ret + Interfaces.Integer_16(u8Data(0));

      return i16Ret;
   end i16GetTempInt;


   procedure sGetTempStr(u8Pin : Interfaces.Unsigned_8; i16Temperature : out Interfaces.Integer_16; sTemperature : out String) is
      SRet1 : String := "S";
      SRet2 : String := "XXX";
      SRet3 : String := "Z";

   begin
      i16Temperature := i16GetTempInt(u8Pin);
      --i16Temperature := 2000;

      -- Convert from binary reading to degrees Celsius:
      -- see the DS18B20 datasheet for information
      -- From -55 to +125 degrees: 16 steps per degree
      -- the output will be in 0.5 degree steps, leftshift 3 steps = division by 8

      i16Temperature := Interfaces.Integer_16(Interfaces.Shift_Left(Interfaces.Unsigned_16(i16Temperature), 3));

      --determine sign, and get i16Temperature's abs value
      if i16Temperature > 0 then
         SRet1 := "+";
      else
         SRet1 := "-";
         i16Temperature := -i16Temperature;
      end if;

      --determine decimal (.0 or .5)
      if (Interfaces.Unsigned_16(i16Temperature) and Interfaces.Unsigned_16(1)) = 1 then
         SRet3 := "5";
         i16Temperature := i16Temperature - 1;
      else
         SRet3 := "0";
      end if;

      --get string for the two first digits:
      i16Temperature := Interfaces.Integer_16(Interfaces.Shift_Left(Interfaces.Unsigned_16(i16Temperature), 1)); --leftshift again to get i16Temperature into whole degrees
      SRet2 := Integer'Image(Integer(i16Temperature));

      if SRet2'Length = 1 then  --add zeros if neccessary
         SRet2 := "00" & SRet2;
      elsif SRet2'Length = 2 then
         SRet2 := "0" & SRet2;
      end if;


      sTemperature := SRet1 & SRet2 & "." & SRet3;

   end sGetTempStr;

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
         if (u8Value and Interfaces.Shift_Right(Interfaces.Unsigned_8(1), Integer(i))) = 1 then --if bit number i is 1
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

      function bRead_Bit(u8Pin : Interfaces.Unsigned_8) return Boolean is
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
      end bRead_Bit;

      --These lines creates an Interfaces.Unsigned_8 and a General_Register that is the same
      --data space, this way changing bits in pu8Ret changes u8Ret
      u8Ret : Interfaces.Unsigned_8;
      pu8Ret : AVR.AT90CAN128.General_Register;
      for pu8Ret'Address use u8Ret'Address;

   begin

      pu8Ret.Bit_0 := Digital_IO.bRead_Pin(u8Pin);
      pu8Ret.Bit_1 := Digital_IO.bRead_Pin(u8Pin);
      pu8Ret.Bit_2 := Digital_IO.bRead_Pin(u8Pin);
      pu8Ret.Bit_3 := Digital_IO.bRead_Pin(u8Pin);
      pu8Ret.Bit_4 := Digital_IO.bRead_Pin(u8Pin);
      pu8Ret.Bit_5 := Digital_IO.bRead_Pin(u8Pin);
      pu8Ret.Bit_6 := Digital_IO.bRead_Pin(u8Pin);
      pu8Ret.Bit_7 := Digital_IO.bRead_Pin(u8Pin);

      return u8Ret;
   end u8Read_Byte;

end Temp_Sensor;
