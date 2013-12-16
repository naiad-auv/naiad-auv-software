--------------------------------------------------------------------------
--  IMU firmware
--  This code handles the gyro and UART communication with the IMU.
--  Orientation and acceleration data as well as the gyro data is
--  outputted on the can bus at 200 Hz.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-12-13

--  TODO: Bootload functionallity
--  TODO: Receiving CAN messages for bootload functionallity.
--  TODO: Test everything...
--------------------------------------------------------------------------


--pragma Profile (Ravenscar);

with Interfaces;		use Interfaces;
with AVR.AT90CAN128.USART;
--  with AVR.AT90CAN128.CAN;	use AVR.AT90CAN128.CAN;
--  with CAN_Defs;
--  with AVR.AT90CAN128.CLOCK;
--  with AVR.AT90CAN128.Digital_IO;


with AT90CAN_Ins_Controller;

procedure AT90CAN_Ins_Controller_Main is

   pragma Suppress (All_Checks);

--     msg : Can_Defs.CAN_Message;
   bMessageReceived : Boolean := false;

--     use CAN_Defs;

--     tempMSG : CAN_Defs.CAN_Message;

   iTemp : Integer;
begin


   AVR.AT90CAN128.USART.Init(AVR.AT90CAN128.USART.USART0, AVR.AT90CAN128.USART.BAUD115200);

   iTemp := AVR.AT90CAN128.USART.Write("Hello world", AVR.AT90CAN128.USART.USART0, 11);

      loop
--        AVR.AT90CAN128.Digital_IO.User_Led(true);
--        Avr.AT90CAN128.CLOCK.Delay_ms(1000);
--        AVR.AT90CAN128.Digital_IO.User_Led(false);
--        Avr.AT90CAN128.CLOCK.Delay_ms(1000);
      null;
   end loop;


--     AT90CAN_Ins_Controller.Init(AVR.AT90CAN128.USART.USART0, Can_Defs.K250, false); --this will initiate the can bus as well
--
--     tempMSG.ID := (2, false);
--     tempMSG.Len := 8;
--     tempMSG.Data := (1, 2, 3, 4, 5, 6, 7, 8);
--     AVR.AT90CAN128.CAN.Can_Send(tempMSG);
--
--
--     loop
--
--        AT90CAN_Ins_Controller.Update;
--
--        AVR.AT90CAN128.CAN.Can_Get(msg, bMessageReceived, 0);
--
--        if bMessageReceived then
--           if msg.ID.Identifier = CAN_Defs.MSG_SIMULATION_MODE_ID.Identifier then
--              if msg.Data(1) = CAN_Defs.MSG_SIMULATION_MODE_ACTIVE.Data(1) then
--                 AT90CAN_Ins_Controller.SimulationModeOn;
--              elsif msg.Data(1) = CAN_Defs.MSG_SIMULATION_MODE_NOT_ACTIVE.Data(1) then
--                 AT90CAN_Ins_Controller.SimulationModeOff;
--              end if;
--           end if;
--        end if;
--     end loop;
end AT90CAN_Ins_Controller_Main;

