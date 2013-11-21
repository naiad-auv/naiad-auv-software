
--  IMU firmware
--  This code handles the UART communication with the IMU and does integration to get position.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-18

--  TODO: Everything...
--  TODO: Bootload functionallity
--  TODO: Receiving CAN messages for bootload functionallity.
--  TODO: Test everything...



pragma Profile (Ravenscar);

with AVR.AT90CAN128.Clock;

with Ins_Controller;

procedure Ins_Controller_Main is

   pragma Suppress (All_Checks);

   tLastLoop   		: AVR.AT90CAN128.Clock.Time;  --  in milliseconds
   tLOOP_PERIOD 	: Constant AVR.AT90CAN128.Clock.Time := 50; --  loop period in milliseconds

begin

   Ins_Controller.Init(USART0);

   loop
      tLastLoop := AVR.AT90CAN128.Clock.getClockTime;

      AVR.AT90CAN128.Clock.Delay_Until(tLOOP_PERIOD + tLastLoop);
   end loop;

end Ins_Controller_Main;

