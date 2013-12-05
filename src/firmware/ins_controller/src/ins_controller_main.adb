--------------------------------------------------------------------------
--  IMU firmware
--  This code handles the gyro and UART communication with the IMU.
--  Orientation and acceleration data as well as the gyro data is
--  outputted on the can bus at 200 Hz.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-28

--  TODO: Bootload functionallity
--  TODO: Receiving CAN messages for bootload functionallity.
--  TODO: Test everything...
--------------------------------------------------------------------------


--  pragma Profile (Ravenscar);

with Interfaces;		use Interfaces;
with AVR.AT90CAN128.USART;
with AVR.AT90CAN128.CAN;	use AVR.AT90CAN128.CAN;
with CAN_Defs;

with Ins_Controller;

procedure Ins_Controller_Main is

   pragma Suppress (All_Checks);

   msg : Can_Defs.CAN_Message;
   bMessageReceived : Boolean := false;

   use CAN_Defs;

begin

   Ins_Controller.Init(AVR.AT90CAN128.USART.USART0, Can_Defs.K250, false); --this will initiate the can bus as well

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

