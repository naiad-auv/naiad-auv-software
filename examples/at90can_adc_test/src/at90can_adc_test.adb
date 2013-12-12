---------------------------------------------------------------------------
-- This code tests the ADC.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-22

---------------------------------------------------------------------------

with AVR.AT90CAN128.Digital_IO;
with AVR.AT90CAN128.USART;
with AVR.AT90CAN128.CLOCK;
with AVR.AT90CAN128.ADC;
with Interfaces;

procedure AT90CAN_ADC_test is
   pragma Suppress (All_Checks);

   PORT : Constant AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.USART0;
   bTemp : Boolean;
   u16Value : Interfaces.Unsigned_16;

   u8 : Interfaces.Unsigned_8;

begin

 --  Digital_IO.User_Led(true);

   AVR.AT90CAN128.Digital_IO.User_Led(true);
   Avr.AT90CAN128.CLOCK.Delay_ms(1000);
   AVR.AT90CAN128.Digital_IO.User_Led(false);
   Avr.AT90CAN128.CLOCK.Delay_ms(1000);


   AVR.AT90CAN128.USART.Init(PORT, AVR.AT90CAN128.USART.BAUD115200);

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
end AT90CAN_ADC_test;



