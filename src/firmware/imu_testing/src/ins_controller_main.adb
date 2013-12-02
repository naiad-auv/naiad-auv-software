--------------------------------------------------------------------------
--  This tests IMU firmware


--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-28

--------------------------------------------------------------------------


pragma Profile (Ravenscar);

with Interfaces;		use Interfaces;
with Ins_Controller;

procedure Imu_Testing_Main is

   pragma Suppress (All_Checks);


begin

  -- Ins_Controller.Init(AVR.AT90CAN128.USART.USART0, Can_Defs.K250, false); --this will initiate the can bus as well

   loop
      
   end loop;
end Imu_Testing_Main;

