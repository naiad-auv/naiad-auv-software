---------------------------------------------------------------------------
-- This code tests the Uart.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-09

---------------------------------------------------------------------------

with AVR.AT90CAN128.USART;

procedure AT90CAN_usart_test_main is
   pragma Suppress (All_Checks);

   PORT : Constant AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.USART0;

   sString : String(1..10);

   iBytesRead : Integer;
   iTemp : Integer;

begin
   AVR.AT90CAN128.USART.Init(PORT, AVR.AT90CAN128.USART.BAUD115200);


   loop
      AVR.AT90CAN128.USART.Read(sString, PORT, 10, iBytesRead);

      if iBytesRead > 0 then
         iTemp := AVR.AT90CAN128.USART.Write(sString, PORT, iBytesRead);
      end if;
   end loop;
end AT90CAN_usart_test_main;



