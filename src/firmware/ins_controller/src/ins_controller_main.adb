
--  IMU firmware
--  This code handles the UART communication with the IMU and does integration to get position.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-18

--  TODO: Everything...
--  TODO: Bootload functionallity
--  TODO: Receiving CAN messages for bootload functionallity.
--  TODO: Test everything...



pragma Profile (Ravenscar);

with AVR.AT90CAN128.CAN;
with Ins_Controller;

procedure Ins_Controller_Main is

   pragma Suppress (All_Checks);

 --  tLastLoop   		: AVR.AT90CAN128.Clock.Time;  --  in milliseconds
  -- tLOOP_PERIOD 	: Constant AVR.AT90CAN128.Clock.Time := 50; --  loop period in milliseconds

   msg : AVR.AT90CAN128.CAN.CAN_Message;
   bMessageReceived : Boolean := false;

begin

   Ins_Controller.Init(USART0, AVR.AT90CAN128.CAN.K250); --this will initiate the can bus as well

   loop
      AVR.AT90CAN128.CAN.Can_Get(msg, bMessageReceived, 0);

      if bMessageReceived then
         if msg.ID.Identifier = CAN_Defs.MSG_SIMULATION_MODE_ID.Identifier then
            if msg.Data(1) = CAN_Defs.MSG_SIMULATION_MODE_ACTIVE.Data(1) then
               Ins_Controller.SimulationModeOn;
            elsif msg.Data(1) = CAN_Defs.MSG_SIMULATION_MODE_NOT_ACTIVE.Data(1) then
               Ins_Controller.SimulationModeOff;
            end if;
         end if;
      end if;
   end loop;
end Ins_Controller_Main;

