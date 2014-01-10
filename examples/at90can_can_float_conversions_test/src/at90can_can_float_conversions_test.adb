---------------------------------------------------------------------------
-- This code shows how to use the Can_Float_Conversions.
-- Note that there are aunit tests that test this more thoroughly
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-13

---------------------------------------------------------------------------

with AVR.AT90CAN128.USART;
with Can_Float_Conversions;
with CAN_Defs;
with AVR.AT90CAN128.CLOCK;


procedure AT90CAN_Can_Float_Conversions_Test is
   pragma Suppress (All_Checks);


   f1, f2, f3 : float;
   s : String(1..8) := "+123.456";

   i : Integer;

   msg_data : CAN_Defs.Byte8;

begin

   AVR.AT90CAN128.USART.Init(AVR.AT90CAN128.USART.USART0, AVR.AT90CAN128.USART.BAUD115200);

   i := AVR.AT90CAN128.USART.Write("before", AVR.AT90CAN128.USART.USART0, 6);
   AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   -----

   Can_Float_Conversions.Orientation_To_Message(1.0, 1.0, 1.0, msg_data);
   i := AVR.AT90CAN128.USART.Write("Orientation_To_Message ", AVR.AT90CAN128.USART.USART0, 24);
   AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   Can_Float_Conversions.Message_To_Orientation(f1, f2, f3, msg_data);
   i := AVR.AT90CAN128.USART.Write("Message_To_Orientation ", AVR.AT90CAN128.USART.USART0, 24);
   AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   if abs(f1 - 1.0) < 0.01 and abs(f2 - 1.0) < 0.01 and abs(f3 - 1.0) < 0.01 then
      i := AVR.AT90CAN128.USART.Write("correct ", AVR.AT90CAN128.USART.USART0, 8);
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   else
      i := AVR.AT90CAN128.USART.Write("incorrect ", AVR.AT90CAN128.USART.USART0, 10);
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
   end if;

      ----

   Can_Float_Conversions.Vector_To_Message(2.0, 2.0, 2.0, msg_data, 180.0);
   i := AVR.AT90CAN128.USART.Write("Acceleration_To_Message ", AVR.AT90CAN128.USART.USART0, 25);
   AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   Can_Float_Conversions.Message_To_Vector(f1, f2, f3, msg_data, 180.0);
   i := AVR.AT90CAN128.USART.Write("Message_To_Acceleration ", AVR.AT90CAN128.USART.USART0, 25);
   AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   if abs(f1 - 2.0) < 0.01 and abs(f2 - 2.0) < 0.01 and abs(f3 - 2.0) < 0.01 then
      i := AVR.AT90CAN128.USART.Write("correct ", AVR.AT90CAN128.USART.USART0, 8);
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
   end if;

   ----

   Can_Float_Conversions.GyroReading_To_Message(3.0, msg_data);
   i := AVR.AT90CAN128.USART.Write("GyroReading_To_Message ", AVR.AT90CAN128.USART.USART0, 24);
   AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   Can_Float_Conversions.Message_To_GyroReading(f1, msg_data);
   i := AVR.AT90CAN128.USART.Write("Message_To_GyroReading ", AVR.AT90CAN128.USART.USART0, 24);
   AVR.AT90CAN128.CLOCK.Delay_ms(1000);

   if abs(f1 - 3.0) < 0.01 then
      i := AVR.AT90CAN128.USART.Write("correct ", AVR.AT90CAN128.USART.USART0, 8);
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
   end if;




   loop
      null;
   end loop;

end AT90CAN_Can_Float_Conversions_Test;



