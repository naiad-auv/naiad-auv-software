---------------------------------------------------------------------------
-- This code tests the ADC.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-22

---------------------------------------------------------------------------

with Digital_IO;
with AVR.AT90CAN128.USART;
with AVR.AT90CAN128.CLOCK;
with AVR.AT90CAN128.ADC;
with Interfaces;

procedure ADC_test is
   pragma Suppress (All_Checks);

   PORT : Constant AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.USART1;
   bTemp : Boolean;
   u16Value : Interfaces.Unsigned_16;

   -- sBuffer : String(1..5);
   u8 : Interfaces.Unsigned_8;

--     procedure u16ToStr(u16 : Interfaces.Unsigned_16; sRet : out String) is
--        use Interfaces;
--        iDigit : Integer;
--        iLeft : Integer := Integer(u16);
--        iValue : Integer := 1000;
--     begin
--
--        for i in reverse 1..4 loop
--           iDigit := iLeft / iValue;
--           iLeft := iLeft - (iDigit * iValue);
--
--           if iDigit = 0 then
--              sRet(5-i) := ' ';
--           else
--              sRet(5-i) := Character'Val(iDigit + Character'Pos('0'));
--           end if;
--           iValue := iValue / 10;
--        end loop;
--       sRet(5) := Character'Val(0);
--
--     end u16ToStr;

begin

 --  Digital_IO.User_Led(true);

--     loop
--        Digital_IO.User_Led(true);
--        Avr.AT90CAN128.CLOCK.Delay_ms(1000);
--        Digital_IO.User_Led(false);
--        Avr.AT90CAN128.CLOCK.Delay_ms(1000);
--     end loop;


   AVR.AT90CAN128.USART.Init(PORT, AVR.AT90CAN128.USART.BAUD38400);

   for i in 0..7 loop
      AVR.AT90CAN128.ADC.ADC_Init(Interfaces.Unsigned_8(i));
   end loop;

   loop
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);

      for i in 0..7 loop
         u16Value := AVR.AT90CAN128.ADC.Get(AVR.AT90CAN128.Channel_Type(i));

         u16Value := Interfaces.Shift_Right(u16Value, 2);

         bTemp := AVR.AT90CAN128.USART.Put(Character'Val(Interfaces.Unsigned_8(u16Value)), PORT);
      end loop;


   end loop;
end ADC_test;



