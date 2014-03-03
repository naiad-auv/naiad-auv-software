with MissionControl.TCP.Tasks; -- must be with'ed to start tasks
with MissionControl.TCP.Resource;

with MissionControl.SharedTypes;
with MissionControl.Object_Handling;

with VirtualMachine.Interpreter;

with Ada.Real_Time; -- measure time

--with Ada.Text_IO; -- for testing

-- TODO List:

-- Complete protected objects TCP_Resource (in TCP project) and
-- CAN_Resource (in CAN project) to send and receive messages.


procedure Main is
   use Ada.Real_Time;

   bMissionUpdate : boolean := false;

   fDeltaTime : float := 0.0;
   xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   xTimeStop : Ada.Real_Time.Time;
   xTimeSpan : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
   iSeconds : integer;
   iMilliSeconds : integer;
   iMicroSeconds : integer;
   iNanoSeconds : integer;

   pxVMInterpreter : VirtualMachine.Interpreter.pCInterpreter;

   pxObject : MissionControl.SharedTypes.pTListObject;
begin

   -- BOOT UP STUFF HERE
   --Ada.Text_IO.New_Line; Ada.Text_IO.New_Line; Ada.Text_IO.New_Line; Ada.Text_IO.New_Line; -- for testing
   --Ada.Text_IO.Put_Line("Booting up main frame."); -- for testing
   pxVMInterpreter := new VirtualMachine.Interpreter.CInterpreter;


   loop -- BOOT UP COMPLETE... NOW LOOP FOREVER


      if MissionControl.SharedTypes.xObjectsInList.iCount > 0 then

         MissionControl.SharedTypes.xObjectsInList.Remove(pxObjectRemoved => pxObject);
         MissionControl.Object_Handling.Handle_Object(xObject => pxObject.all);
         MissionControl.SharedTypes.Dealloc(pxListObject => pxObject);

      end if;

---------Virtual Machine starts here---------------------------------------------------------------------------------------

      xTimeStop := Ada.Real_Time.Clock;
      xTimeSpan := xTimeSpan + (xTimeStop - xTimeStart);

      iSeconds := xTimeSpan / Ada.Real_Time.Seconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Seconds(1) * iSeconds);

      iMilliSeconds := xTimeSpan / Ada.Real_Time.Milliseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Milliseconds(1) * iMilliSeconds);

      iMicroSeconds := xTimeSpan / Ada.Real_Time.Microseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Microseconds(1) * iMicroSeconds);

      iNanoSeconds := xTimeSpan / Ada.Real_Time.Nanoseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Nanoseconds(1) * iNanoSeconds);

      fDeltaTime := fDeltaTime + float(iSeconds) + (float(iMilliSeconds) * 0.001) + (float(iMicroSeconds) * 0.000001) +
        (float(iNanoSeconds) * 0.000000001);
      pxVMInterpreter.Step(fDeltaTime => fDeltaTime);
      xTimeStart := xTimeStop;

---------Virtual Machine ends here-----------------------------------------------------------------------------------------

      MissionControl.TCP.Resource.TCP_Resource.bMissionUpdateReceived(bMissionUpdate);
      if bMissionUpdate then
         VirtualMachine.Interpreter.Free(pxVMInterpreter);
         pxVMInterpreter := new VirtualMachine.Interpreter.CInterpreter;
         bMissionUpdate := false;
      end if;


      --delay 0.5; -- for testing
   end loop;

end Main;
