
with AVR.AT90CAN128;
with AVR.AT90CAN128.CAN;
with BBB_CAN;


procedure BBB_CAN_main is
   pragma Suppress (All_Checks);


   msg : AVR.AT90CAN128.CAN.CAN_Message;

   bMsg : Boolean;
   bOk  : Boolean;

begin

   BBB_CAN.Init;

   msg.ID := (10, false);
   msg.Len := 3;
   msg.Data := (1, 1, 1, 1, 1, 1, 1, 1);
   BBB_CAN.Send(msg);

   loop
      BBB_CAN.Get(msg, bMsg, bOk);

      if bMsg then
         if Integer(msg.ID.Identifier) = 15 then
            msg.ID.Identifier := AVR.AT90CAN128.CAN.CAN_Identifier(16);
            BBB_CAN.Send(msg);
         end if;
      end if;

   end loop;


end BBB_CAN_main;
