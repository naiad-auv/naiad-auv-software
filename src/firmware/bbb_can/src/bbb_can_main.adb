
with BBB_CAN;


procedure BBB_CAN_main is
   pragma Suppress (All_Checks);


   msg : BBB_CAN.CAN_Message;

   bMsg : Boolean;
   bOk  : Boolean;

begin

   BBB_CAN.Init;

   loop
      BBB_CAN.Get(msg, bMsg, bOk);

      if bMsg then
         if Integer(msg.ID) = 15 then
            msg.ID := 16;
            BBB_CAN.Send(msg);
         end if;
      end if;

   end loop;


end BBB_CAN_main;
