
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-18

with Interfaces;
with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;

package Imu_Handler is

   pragma Suppress (All_Checks);

   procedure Init(port : AVR.AT90CAN128.USART.USARTID);

   function Get_IMU_Data return Interfaces.Unsigned_16;


private

   iTIMESTEP_MS : Integer := 5;

   usart_port : AVR.AT90CAN128.USART.USARTID;

   function sChecksum(sData : String; iSize : Integer) return String;


   procedure Imu_Interrupt;
   pragma Machine_Attribute (Imu_Interrupt, "signal");
   pragma Export (C, Imu_Interrupt, AVR.AT90CAN128.Vector_Int2);


end Imu_Handler;
