---------------------------------------------------------------------------
-- This code shows how to use the Str2Float.
-- Note that there are aunit tests that test this more thoroughly
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-13

---------------------------------------------------------------------------


with Str2Float;
with Can_Float_Conversions;

with Ada.Unchecked_Conversion;
with Interfaces;
with AVR.AT90CAN128.USART;
with AVR.AT90CAN128.CLOCK;

procedure AT90CAN_Str2Float_Test is
   pragma Suppress (All_Checks);


   f : float;
   s : String(1..8) := "+123.456";

   i : Integer;

begin


   AVR.AT90CAN128.USART.Init(AVR.AT90CAN128.USART.USART0, AVR.AT90CAN128.USART.BAUD115200);

   i := AVR.AT90CAN128.USART.Write("before", AVR.AT90CAN128.USART.USART0, 6);

   AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   f := Str2Float.fStr2Float(s);
   if abs(f - 123.456) < 0.1 then
      i := AVR.AT90CAN128.USART.Write(" 1st correct", AVR.AT90CAN128.USART.USART0, 11);
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
   else
      i := AVR.AT90CAN128.USART.Write(" 1st wrong", AVR.AT90CAN128.USART.USART0, 10);
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
   end if;


   f := Str2Float.fStr2Float("+456.123");
   if abs(f - 456.123) < 0.1 then
      i := AVR.AT90CAN128.USART.Write(" 2nd correct", AVR.AT90CAN128.USART.USART0, 11);
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
   else
      i := AVR.AT90CAN128.USART.Write(" 2nd wrong", AVR.AT90CAN128.USART.USART0, 10);
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
   end if;

   loop
      null;
   end loop;
end AT90CAN_Str2Float_Test;



