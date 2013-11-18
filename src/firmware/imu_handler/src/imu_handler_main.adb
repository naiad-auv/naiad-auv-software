
--  IMU firmware
--  This code handles the UART communication with the IMU and does integration to get position.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-18

--  TODO: Everything...
--  TODO: Bootload functionallity
--  TODO: Receiving CAN messages for bootload functionallity.
--  TODO: Test everything...



pragma Profile (Ravenscar);

--  with AVR.AT90CAN128.Clock;

with Imu_Handler;

procedure Imu_Handler_Main is

   pragma Suppress (All_Checks);


begin


   loop

	null;
   end loop;

end Imu_Handler_Main;

