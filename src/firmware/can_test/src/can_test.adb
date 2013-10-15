---------------------------------------------------------------------------
-- This code tests the CAN by sending a CAN message every second

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-14

-- TODO:

---------------------------------------------------------------------------


with AVR.AT90CAN128.CAN;
with AVR.AT90CAN128.CLOCK;

procedure CAN_Test is
   pragma Suppress (All_Checks);

   msg :  AVR.AT90CAN128.CAN.CAN_Message;

begin
   AVR.AT90CAN128.CAN.Can_Init(AVR.AT90CAN128.CAN.K250);
  
   msg.ID := 200;
   msg.Len := 2;
   msg.Data := (200, 10, 125, 250, 205, 240, 2, 8);
                  
   
   loop
      AVR.AT90CAN128.CLOCK.Delay_ms(1000);
      
      AVR.AT90CAN128.CAN.Can_Send(msg);
      
   end loop;
   
      

end CAN_Test;



