---------------------------------------------------------------------------
-- This code tests the CAN by first sending a CAN message and then
-- for every message it recieves it
-- returns a message with ID one higher than the message it recieved.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-13

---------------------------------------------------------------------------

with CAN_Defs;
with AVR.AT90CAN128.CAN;

procedure AT90CAN_CAN_Test is
   pragma Suppress (All_Checks);

   msg :  CAN_Defs.CAN_Message;
   bReceived : Boolean;

   use CAN_Defs;
begin

   AVR.AT90CAN128.CAN.Can_Set_All_MOB_ID_MASK((0, false), (0, false));
   AVR.AT90CAN128.CAN.Can_Init(CAN_Defs.K250);

   msg.ID.Identifier := 1337;
   msg.ID.isExtended := false;
   msg.Len := 8;
   msg.Data := (0, 1, 2, 3, 4, 5, 6, 7);

   AVR.AT90CAN128.CAN.Can_Send(msg);

   loop

      AVR.AT90CAN128.CAN.Can_Get(msg, bReceived, 0);

      if bReceived then
         msg.ID.Identifier := msg.ID.Identifier + 1;
         AVR.AT90CAN128.CAN.Can_Send(msg);
      end if;
   end loop;

end AT90CAN_CAN_Test;

