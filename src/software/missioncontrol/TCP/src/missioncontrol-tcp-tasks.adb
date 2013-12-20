package body MissionControl.TCP.Tasks is

   task body TASK_TCP_IN is
      bConnected : boolean := false;
   begin
      MissionControl.TCP.Resource.TCP_Resource.Listen;
      while not bConnected loop
         MissionControl.TCP.Resource.TCP_Resource.bConnected(bConnected);
      end loop;

      loop
         MissionControl.TCP.Resource.TCP_Resource.Query_Mission_Receiving;

         -- this should be done on another thread(task)
--           if MissionControl.TCP.Resource.TCP_Resource.bMissionUpdateReceived then
--              -- load new mission here
--              null;
--           end if;
      end loop;
   end TASK_TCP_IN;


end MissionControl.TCP.Tasks;
