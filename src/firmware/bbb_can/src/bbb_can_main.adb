

with BBB_CAN;


procedure BBB_CAN_main is
   pragma Suppress (All_Checks);


   msg : BBB_CAN.CAN_Message;

   bMsg : Boolean;
   bOk  : Boolean;

begin

   BBB_CAN.Init;

   msg.ID := 10;
   msg.Len := 3;
   msg.Data := (1, 1, 1, 1, 1, 1, 1, 1);
   BBB_CAN.Send(msg);

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
