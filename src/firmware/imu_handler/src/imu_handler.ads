
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

   fRoll 	: float := 0.0;
   fPitch 	: float := 0.0;
   fYaw 	: float := 0.0;

   fXPosition : float := 0.0;
   fYPosition : float := 0.0;
   fZPosition : float := 0.0;

   fXSpeed : float := 0.0;
   fYSpeed : float := 0.0;
   fZSpeed : float := 0.0;

   fXAcceleration : float := 0.0;
   fYAcceleration : float := 0.0;
   fZAcceleration : float := 0.0;

   iTIMESTEP_MS : Integer := 5;

   usart_port : AVR.AT90CAN128.USART.USARTID;

   procedure sChecksum(sData : String; iSize : Integer; sStr : out String);

   procedure Imu_Interrupt;
   pragma Machine_Attribute (Imu_Interrupt, "signal");
   pragma Export (C, Imu_Interrupt, AVR.AT90CAN128.Vector_Int2);


end Imu_Handler;
