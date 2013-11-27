with MissionControl.CAN; -- must be with'ed to start tasks
with MissionControl.TCP; -- must be with'ed to start tasks

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

   fDeltaTime : float := 0.0;
   xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   xTimeStop : Ada.Real_Time.Time;

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
      pxVMInterpreter.Step(fDeltaTime => float(Ada.Real_Time.To_Duration(xTimeStop - xTimeStart)));
      xTimeStart := xTimeStop;

---------Virtual Machine ends here-----------------------------------------------------------------------------------------


      --delay 0.5; -- for testing
   end loop;

end Main;
