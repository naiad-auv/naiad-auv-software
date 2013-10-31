---------------------------------------------------------------------------
-- This code tests the CAN by sending a CAN message every second.
-- every second it will read its receive buffer on both of the USART ports and 
-- sen it all back. Baudrate: 38400.

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-15

-- TODO:

---------------------------------------------------------------------------


with AVR.AT90CAN128.CAN;
with AVR.AT90CAN128.CLOCK;
with AVR.AT90CAN128.USART;

procedure CAN_Test is
   pragma Suppress (All_Checks);

   msg :  AVR.AT90CAN128.CAN.CAN_Message;

   
   procedure Reflect(port : AVR.AT90CAN128.USART.USARTID) is
      cChar : Character;
      bReceived : Boolean;
   begin
      while AVR.AT90CAN128.USART.Data_Available(port) loop
         AVR.AT90CAN128.USART.Get_Char(port, cChar, bReceived);
         if bReceived then
            bReceived := AVR.AT90CAN128.USART.Put(cChar, port);
         end if;
      end loop;
   end Reflect;

   iReceived : Integer;
   
begin
   AVR.AT90CAN128.CAN.Can_Init(AVR.AT90CAN128.CAN.K250);
   AVR.AT90CAN128.CAN.Can_Set_All_MOB_ID_MASK(0, 0);
   
 --  AVR.AT90CAN128.CAN.
   
--     AVR.AT90CAN128.USART.Init(AVR.AT90CAN128.USART.USART0, AVR.AT90CAN128.USART.BAUD38400);
--     AVR.AT90CAN128.USART.Init(AVR.AT90CAN128.USART.USART1, AVR.AT90CAN128.USART.BAUD38400);
  
   msg.ID := 200;
   msg.Len := 2;
   msg.Data := (200, 10, 125, 250, 205, 240, 2, 8);
   
--     iReceived := AVR.AT90CAN128.USART.Write("hello world", AVR.AT90CAN128.USART.USART0, 11);
--     iReceived := AVR.AT90CAN128.USART.Write("hello world", AVR.AT90CAN128.USART.USART1, 11);

   
   
   loop
      AVR.AT90CAN128.CAN.Can_Send(msg);
      
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
      
--        Reflect(AVR.AT90CAN128.USART.USART0);
--        Reflect(AVR.AT90CAN128.USART.USART1);
      
   end loop;
   
      

end CAN_Test;



