
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-19

with Interfaces;
with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;

with Math.Vectors;
with Math.Matrices;

package Imu_Handler is

   pragma Suppress (All_Checks);

   procedure Init(port : AVR.AT90CAN128.USART.USARTID);

   procedure Get_Orientation(f_Roll : out Float; f_Pitch : out Float; f_Yaw : out Float);

   procedure Get_Position(fX : out Float; fY : out Float; fZ : out Float);

private

   -- the robot's velocity relative to an inertial reference system
   xFixedVelocityVector : math.Vectors.CVector := math.Vectors.xCreate(0.0, 0.0, 0.0);

   -- the robot's position relative to an inertial reference system
   xFixedPositionVector : math.Vectors.CVector := math.Vectors.xCreate(0.0, 0.0, 0.0);

   xOrientationMatrix 		: Math.Matrices.CMatrix;

   fDeltaTime : Constant float := 0.005;

   fYaw 	: float;
   fPitch 	: float;
   fRoll 	: float;

   usart_port : AVR.AT90CAN128.USART.USARTID;

   procedure sChecksum(sData : String; iSize : Integer; sStr : out String);
   function Wrap_Around(fAngle : Float) return Float;

   procedure Imu_Interrupt;
   pragma Machine_Attribute (Imu_Interrupt, "signal");
   pragma Export (C, Imu_Interrupt, AVR.AT90CAN128.Vector_Int2);


end Imu_Handler;
