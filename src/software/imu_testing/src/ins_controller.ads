--------------------------------------------------------------------------
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-28

--  TODO: Hardware testing....
--------------------------------------------------------------------------

--  with Interfaces;
with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;

--  with Math.Vectors;
--  with Math.Matrices;


with CAN_Defs;

package Ins_Controller is

   pragma Suppress (All_Checks);

   procedure Init(port : AVR.AT90CAN128.USART.USARTID; canBaud_Rate : Can_Defs.Baud_Rate; bUseExtendedID : Boolean);

   procedure SimulationModeOn;
   procedure SimulationModeOff;

--     function Get_Orientation return Math.Matrices.CMatrix;
  -- procedure Get_Position(fX : out Float; fY : out Float; fZ : out Float);

private

   -- the robot's velocity relative to an inertial reference system
 --  xFixedVelocityVector : math.Vectors.CVector := math.Vectors.xCreate(0.0, 0.0, 0.0);

   -- the robot's position relative to an inertial reference system
 --  xFixedPositionVector : math.Vectors.CVector := math.Vectors.xCreate(0.0, 0.0, 0.0);

  -- xOrientationMatrix : Math.Matrices.CMatrix;
--   fDeltaTime : Constant float := 0.005;

   bSimulationMode : Boolean := false;
   bExtendedIds : Boolean;
   usart_port : AVR.AT90CAN128.USART.USARTID;

--     function Wrap_Around(fAngle : Float) return Float;

   procedure Imu_Interrupt;
   pragma Machine_Attribute (Imu_Interrupt, "signal");
   pragma Export (C, Imu_Interrupt, AVR.AT90CAN128.Vector_Int2);

end Ins_Controller;
