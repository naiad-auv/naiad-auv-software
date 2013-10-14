---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-05

-- TODO:

---------------------------------------------------------------------------


with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;
with AVR.AT90CAN128.CAN;
with Interfaces;
with CAN_Link_pack;
with Text_IO;

procedure CAN_Link is
   pragma Suppress (All_Checks);



begin
   CAN_Link_pack.hardware_init;
   Text_IO.Put_Line("main");
   CAN_Link_pack.Main_Loop;

end CAN_Link;



