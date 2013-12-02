with Simulator;
with Simulator.Motor_Info;
with Math.Matrices;
with Math.Vectors;
with Math.Angles;
with Math.Quaternions;

package simulator.submarine is

   type CSubmarine is tagged private;-- private;
   type pCSubmarine is access CSubmarine;

   type TMotors is array (1..6) of Simulator.Motor_Info.pCMotorInfo;
   type TMotorForce is array (1..6) of Float;
   function pxCreate_Naiad return pCSubmarine;

   function pxCreate return pCSubmarine;
   procedure Free(pxSubmarine : in out pCSubmarine);

   function xGet_Position_Vector(this : in CSubmarine) return math.Vectors.CVector;
   function xGet_Velocity_Vector(this : in CSubmarine) return math.Vectors.CVector;
   function xGet_Orientation_Matrix(this : in CSubmarine) return math.Matrices.CMatrix;
   function xGet_Angular_Velocity_Vector(this : in CSubmarine) return math.Vectors.CVector;
   function xGet_Motor_Values(this : in CSubmarine) return TMotorForce;
   function xGet_Wanted_Position(this : in CSubmarine) return math.Vectors.CVector;
   function xGet_Wanted_Orientation(this : in CSubmarine) return math.Matrices.CMatrix;

   procedure Set_Position_Vector(this : in out CSubmarine ; xPositionVector : in math.Vectors.CVector);
   procedure Set_Orientation_Matrix(this : in out CSubmarine; xOrientationMatrix : in Math.Matrices.CMatrix);
   procedure Set_Velocity_Vector(this : in out CSubmarine; xVelocityVector : in Math.Vectors.CVector);
   procedure Set_Angular_Velocity_Vector(this : in out CSubmarine; xAngularVelocityVector : in Math.Vectors.CVector);

   procedure Set_Motor_Info(this : in out CSubmarine; txMotorInfo : in TMotors);
   procedure Set_Motor_Force(this : in out CSubmarine; txMotorForce : in TmotorForce);

   procedure Set_Wanted_Position(this : in out CSubmarine; xWantedPosition : in math.Vectors.CVector);
   procedure Set_Wanted_Orientation(this : in out CSubmarine; xWantedOrientation : in math.Matrices.CMatrix);

   procedure Set_Weight(this : in out CSubmarine; fWeight : in float);
   procedure Set_Buoyancy_Force(this : in out CSubmarine; fBuoyancyForce : in float);
   procedure Set_Buoyancy_Force_Position_Vector(this : in out CSubmarine; xBuoyancyForcePositionVector : in math.Vectors.CVector);
   procedure Set_Rotation_Friction_Vector(this : in out CSubmarine; xRotationFrictionVector : in math.Vectors.CVector);
   procedure Set_Veclocity_Friction_Vector(this : in out CSubmarine; xVelocityFrictionVector : in math.Vectors.CVector);

   procedure Set_Inertia_Matrix(this : in out CSubmarine; xInertiaMatrix : in math.Matrices.CMatrix);

   procedure Calculate_Acceleration(this : in out CSubmarine);
   procedure Calculate_Angular_Acceleration(this : in out CSubmarine);
   procedure Integrate_Submarine_Variables(this : in out CSubmarine; fTimeDuration : in float);

   procedure Time_Step_Motor_Force_To_Integrate(this : in out CSubmarine ; txMotorForce : in TmotorForce; fDeltaTime : in float);

   procedure Set_Gripper_Left_Status(this : in out CSubmarine ; bGripperLeft : boolean);
   procedure Set_Gripper_Right_Status(this : in out CSubmarine ; bGripperRight : boolean);
   procedure Set_Dropper_Left_Status(this : in out CSubmarine ; bDropperLeft : boolean);
   procedure Set_Dropper_Right_Status(this : in out CSubmarine ; bDropperRight : boolean);
   procedure Set_Depth(this : in out CSubmarine; fDepth : float);

   function bGet_Gripper_Left_Status(this : in CSubmarine) return boolean;
   function bGet_Gripper_Right_Status(this : in CSubmarine) return boolean;
   function bGet_Dropper_Left_Status(this : in CSubmarine) return boolean;
   function bGet_Dropper_Right_Status(this : in CSubmarine) return boolean;
   function fGet_Depth(this : in Csubmarine) return float;

private
      type CSubmarine is tagged
      record
         pxPositionVector : Math.Vectors.pCVector;
         pxVelocityVector : Math.Vectors.pCVector;
         pxOrientationMatrix : Math.Matrices.pCMatrix;
         pxAngularVelocityVector : Math.Vectors.pCVector;
         pxInertiaMatrix : Math.Matrices.pCMatrix;
         txMotorInfo : TMotors;
         txMotorForce : TMotorForce;

         fWeight : Float;
         fBuoyancyForce : Float;
         pxBuoyancyForcePositionVector : math.Vectors.pCVector;
         pxRotationFrictionVector : Math.Vectors.pCVector;
         pxVelocityFrictionVector : Math.Vectors.pCVector;

         pxAccelerationVector : Math.Vectors.pCVector;
         pxAngularAccelerationVector : Math.Vectors.pCVector;

         pxWantedPositionVector : math.Vectors.pCVector;
         pxWantedOrientationMatrix : math.Matrices.pCMatrix;

         bGripperLeft : Boolean;
         bGripperRight : Boolean;
         bDropperLeft : Boolean;
         bDropperRight : Boolean;
         fDepth : Float;
      end record;
end simulator.submarine;
