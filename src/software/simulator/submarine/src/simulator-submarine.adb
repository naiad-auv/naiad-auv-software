with Ada.Exceptions;

package body simulator.submarine is

   --------------------
   -- pxCreate_Naiad --
   --------------------

   function pxCreate_Naiad return pCSubmarine is
      pxSubmarine : pCSubmarine;
      txMotorInfo : simulator.submarine.TMotors;
      tfRawMatrix : Math.Matrices.TMatrix;
   begin
      pxSubmarine := simulator.submarine.pxCreate;

      tfRawMatrix := ((0.36,0.001,0.037),
                      (0.001,0.9,0.0003),
                      (0.037,0.0003,1.094));
      pxSubmarine.pxOrientationMatrix := Math.Matrices.pxCreate(tfMatrix => tfRawMatrix);


      txMotorInfo(1) := simulator.Motor_Info.pxCreate(math.Vectors.pxCreate(-0.70710678118,0.70710678118,0.0),math.Vectors.pxCreate(-0.70710678118,-0.70710678118,0.0));
      txMotorInfo(2) := simulator.Motor_Info.pxCreate(math.Vectors.pxCreate(0.0,-1.0,0.0),math.Vectors.pxCreate(1.0,0.0,0.0));
      txMotorInfo(3) := simulator.Motor_Info.pxCreate(math.Vectors.pxCreate(0.70710678118,0.70710678118,0.0),math.Vectors.pxCreate(-0.70710678118,0.70710678118,0.0));
      txMotorInfo(4) := simulator.Motor_Info.pxCreate(math.Vectors.pxCreate(-0.70710678118,0.70710678118,0.0),math.Vectors.pxCreate(0.0,0.0,1.0));
      txMotorInfo(5) := simulator.Motor_Info.pxCreate(math.Vectors.pxCreate(0.0,-1.0,0.0),math.Vectors.pxCreate(0.0,0.0,1.0));
      txMotorInfo(6) := simulator.Motor_Info.pxCreate(math.Vectors.pxCreate(0.70710678118,0.70710678118,0.0),math.Vectors.pxCreate(0.0,0.0,1.0));


      pxSubmarine.pxPositionVector := math.Vectors.pxCreate(0.0 , 0.0 , 0.0);
      pxSubmarine.pxVelocityVector := math.Vectors.pxCreate(0.0 , 0.0 , 0.0);
      pxSubmarine.pxOrientationMatrix := math.Matrices.pxCreate_Identity;
      pxSubmarine.pxAngularVelocityVector := math.Vectors.pxCreate(0.0 , 0.0 , 0.0);
      pxSubmarine.txMotorInfo:=txMotorInfo;
      pxSubmarine.txMotorForce := (0.0,0.0,0.0,0.0,0.0,0.0);
      pxSubmarine.fWeight:=28.0;
      pxSubmarine.fBuoyancyForce:=30.0*9.82;
      pxSubmarine.pxBuoyancyForcePositionVector:= math.Vectors.pxCreate(0.0,0.0,0.1);
      pxSubmarine.pxRotationFrictionVector := math.Vectors.pxCreate(0.1 , 0.1 , 0.1);
      pxSubmarine.pxVelocityFrictionVector := math.Vectors.pxCreate(0.1 , 0.1 , 0.1);


      return pxSubmarine;
   end pxCreate_Naiad;

   --------------
   -- pxCreate --
   --------------

   function pxCreate return pCSubmarine is
      pxSubmarine : pCSubmarine;
   begin
      pxSubmarine := new CSubmarine;
      return pxSubmarine;
   end pxCreate;

   function pxGet_Position_Vector(this : in CSubmarine) return math.Vectors.pCVector is

   begin
      return this.pxPositionVector.pxGet_Copy;
   end pxGet_Position_Vector;


   function pxGet_Velocity_Vector(this : in CSubmarine) return math.Vectors.pCVector is

   begin
      return this.pxVelocityVector.pxGet_Copy;
   end pxGet_Velocity_Vector;

   function pxGet_Orientation_Matrix(this : in CSubmarine) return math.Matrices.pCMatrix is

   begin
      return this.pxOrientationMatrix.pxGet_Copy;
   end pxGet_Orientation_Matrix;

   function pxGet_Angular_Velocity_Vector(this : in CSubmarine) return math.Vectors.pCVector is

   begin
      return this.pxAngularVelocityVector.pxGet_Copy;

   end pxGet_Angular_Velocity_Vector;

   function pxGet_Motor_Values(this : in CSubmarine) return TMotorForce is

   begin
      return this.txMotorForce;
   end pxGet_Motor_Values;


   -------------------------
   -- Set_Position_Vector --
   -------------------------

   procedure Set_Position_Vector(this : in out CSubmarine; pxPositionVector : in math.Vectors.pCVector) is
   begin
      this.pxPositionVector:=pxPositionVector.pxGet_Copy;
   end Set_Position_Vector;

   ----------------------------
   -- Set_Orientation_Matrix --
   ----------------------------

   procedure Set_Orientation_Matrix(this : in out CSubmarine ; pxOrientationMatrix : in Math.Matrices.pCMatrix)is
   begin
      this.pxOrientationMatrix := pxOrientationMatrix.pxGet_Copy;
   end Set_Orientation_Matrix;

   -------------------------
   -- Set_Velocity_Vector --
   -------------------------

   procedure Set_Velocity_Vector(this : in out CSubmarine ; pxVelocityVector : in Math.Vectors.pCVector)is
   begin
      this.pxVelocityVector := pxVelocityVector.pxGet_Copy;
   end Set_Velocity_Vector;

   ---------------------------------
   -- Set_Angular_Velocity_Vector --
   ---------------------------------

   procedure Set_Angular_Velocity_Vector(this : in out CSubmarine ; pxAngularVelocityVector : in Math.Vectors.pCVector)is
   begin
      this.pxAngularVelocityVector := pxAngularVelocityVector.pxGet_Copy;
   end Set_Angular_Velocity_Vector;

   --------------------
   -- Set_Motor_Info --
   --------------------

   procedure Set_Motor_Info (this : in out CSubmarine ; txMotorInfo : in TMotors)is
   begin
      for iLoopThroughMotors in txMotorInfo'Range loop
         this.txMotorInfo(iLoopThroughMotors) := txMotorInfo(iLoopThroughMotors).pxGet_Copy;
      end loop;
   end Set_Motor_Info;

   ---------------------
   -- Set_Motor_Force --
   ---------------------

   procedure Set_Motor_Force(this : in out CSubmarine ; txMotorForce : in TmotorForce)is
   begin
      for iLoopThroughMotors in txMotorForce'Range loop
         this.txMotorForce(iLoopThroughMotors) := txMotorForce(iLoopThroughMotors);
      end loop;
   end Set_Motor_Force;

   ----------------
   -- Set_Weight --
   ----------------

   procedure Set_Weight (this : in out CSubmarine; fWeight : in float) is
   begin
      this.fWeight := fWeight;
   end Set_Weight;

   ---------------------
   -- Set_Buoyancy_Force --
   ---------------------

   procedure Set_Buoyancy_Force(this : in out CSubmarine ; fBuoyancyForce : in float)is
   begin
      this.fBuoyancyForce := fBuoyancyForce;
   end Set_Buoyancy_Force;

   -------------------------------------
   -- Set_Buoyancy_Force_Position_Vector --
   -------------------------------------

   procedure Set_Buoyancy_Force_Position_Vector(this : in out CSubmarine ; pxBuoyancyForcePositionVector : in math.Vectors.pCVector) is
   begin
      this.pxBuoyancyForcePositionVector := pxBuoyancyForcePositionVector.pxGet_Copy;
   end Set_Buoyancy_Force_Position_Vector;

   ----------------------------------
   -- Set_Rotation_Friction_Vector --
   ----------------------------------

   procedure Set_Rotation_Friction_Vector(this : in out CSubmarine ; pxRotationFrictionVector : in math.Vectors.pCVector) is
   begin
      this.pxRotationFrictionVector := pxRotationFrictionVector.pxGet_Copy;
   end Set_Rotation_Friction_Vector;

   -----------------------------------
   -- Set_Veclocity_Friction_Vector --
   -----------------------------------

   procedure Set_Veclocity_Friction_Vector(this : in out CSubmarine ; pxVelocityFrictionVector : in math.Vectors.pCVector) is
   begin
      this.pxVelocityFrictionVector := pxVelocityFrictionVector.pxGet_Copy;
   end Set_Veclocity_Friction_Vector;


   ------------------------
   -- Set_Interia_Matrix --
   ------------------------

   procedure Set_Inertia_Matrix(this : in out CSubmarine; pxInertiaMatrix : in math.Matrices.pCMatrix) is

   begin
      this.pxInertiaMatrix := pxInertiaMatrix.pxGet_Copy;
   end;




   ----------------------------
   -- Calculate_Acceleration --
   ----------------------------

   procedure Calculate_Acceleration (this : in out CSubmarine) is
      use Math.Vectors;
      use Math.Matrices;
      pxRelativeForce : math.Vectors.pCVector;
      pxFixedCordForce : math.Vectors.pCVector;
   begin
      pxRelativeForce := (this.pxOrientationMatrix.pxGet_Inverse)*this.pxVelocityVector*this.pxVelocityFrictionVector;
      for iLoopThroughMotors in this.txMotorForce'Range loop
         pxRelativeForce := pxRelativeForce+(this.txMotorInfo(iLoopThroughMotors).pxGet_Force_Vector*this.txMotorForce(iLoopThroughMotors));
      end loop;
      pxFixedCordForce := this.pxOrientationMatrix*pxRelativeForce;
      pxFixedCordForce := pxFixedCordForce+math.Vectors.pxCreate(0.0,0.0,-this.fWeight*9.82);
      pxFixedCordForce := pxFixedCordForce+math.Vectors.pxCreate(0.0,0.0,this.fBuoyancyForce);
      this.pxAccelerationVector := pxFixedCordForce *(1.0/this.fWeight);
   end Calculate_Acceleration;

   ------------------------------------
   -- Calculate_Angular_Acceleration --
   ------------------------------------

   procedure Calculate_Angular_Acceleration (this : in out CSubmarine) is
      use Math.Vectors;
      use Math.Matrices;
      pxRelativeTorque : math.Vectors.pCVector;
      pxRelativeAngularVelocity : math.Vectors.pCVector;
      pxRelativeAngularAccelerationVector : math.Vectors.pCVector;
   begin
      pxRelativeAngularVelocity := this.pxOrientationMatrix.pxGet_Inverse * this.pxAngularVelocityVector;


      pxRelativeTorque := math.Vectors.pxCross_Product(this.pxBuoyancyForcePositionVector , this.pxOrientationMatrix.pxGet_Inverse * math.Vectors.pxCreate(0.0,0.0,this.fBuoyancyForce)) - pxRelativeAngularVelocity*this.pxRotationFrictionVector;
      for iLoopThroughMotors in this.txMotorForce'Range loop
         pxRelativeTorque := pxRelativeTorque+(this.txMotorInfo(iLoopThroughMotors).pxGet_Torque_Vector*this.txMotorForce(iLoopThroughMotors));
      end loop;
      pxRelativeAngularAccelerationVector := this.pxInertiaMatrix.pxGet_Inverse*(pxRelativeTorque-math.Vectors.pxCross_Product(pxRelativeAngularVelocity, this.pxInertiaMatrix*pxRelativeAngularVelocity));
      this.pxAngularAccelerationVector := this.pxOrientationMatrix * pxRelativeAngularAccelerationVector;

   end Calculate_Angular_Acceleration;

   -----------------------------------
   -- Integrate_Submarine_Variables --
   -----------------------------------

   procedure Integrate_Submarine_Variables (this : in out CSubmarine; fTimeDuration : in float) is
      use Ada.Exceptions;
      use Math.Vectors;
      use Math.Matrices;
      pxDeltaMovement : math.Vectors.pCVector;
      UndefinedAccelerations : exception;
      pxRotationQuaternion : math.Quaternions.pCQuaternion;
   begin

      if this.pxAccelerationVector /= null and this.pxAngularAccelerationVector /= null then
         pxDeltaMovement := this.pxAngularVelocityVector*fTimeDuration;

         if pxDeltaMovement.fLength_Squared /= 0.0 then
            pxRotationQuaternion := math.Quaternions.pxCreate(pxAxisVector    => pxDeltaMovement,
                                                              fAngleInDegrees => math.Angles.fRadians_To_Degrees(fAngle => pxDeltaMovement.fLength));
            this.pxOrientationMatrix := math.Matrices.pxCreate_From_Quaternion(pxFromQuaternion => pxRotationQuaternion) * this.pxOrientationMatrix;
         end if;

         this.Set_Angular_Velocity_Vector(this.pxAngularVelocityVector + (this.pxAngularAccelerationVector * fTimeDuration));
         this.pxPositionVector := this.pxPositionVector + this.pxVelocityVector * fTimeDuration;
         this.pxVelocityVector := this.pxVelocityVector + this.pxAccelerationVector * fTimeDuration;

         this.pxAccelerationVector := null;
         this.pxAngularAccelerationVector := null;

      else
         raise UndefinedAccelerations;
      end if;

   end Integrate_Submarine_Variables;

   procedure Time_Step_Motor_Force_To_Integrate(this : in out CSubmarine ; txMotorForce : in TmotorForce) is

   begin
      this.Set_Motor_Force(txMotorForce);
      for i in 1..10 loop
         this.Calculate_Acceleration;
         this.Calculate_Angular_Acceleration;
         this.Integrate_Submarine_Variables(fTimeDuration => 0.01);
      end loop;

   end Time_Step_Motor_Force_To_Integrate;

   procedure Set_Gripper_Left_Status(this : in out CSubmarine ; bGripperLeft : boolean) is

   begin
      this.bGripperLeft := bGripperLeft;
   end Set_Gripper_Left_Status;

   procedure Set_Gripper_Right_Status(this : in out CSubmarine ; bGripperRight : boolean) is

   begin
      this.bGripperRight := bGripperRight;
   end Set_Gripper_Right_Status;

   procedure Set_Dropper_Left_Status(this : in out CSubmarine ; bDropperLeft : boolean) is

   begin
      this.bDropperLeft := bDropperLeft;
   end Set_Dropper_Left_Status;

   procedure Set_Dropper_Right_Status(this : in out CSubmarine ; bDropperRight : boolean) is

   begin
      this.bDropperRight := bDropperRight;
   end Set_Dropper_Right_Status;


   procedure Set_Depth(this : in out CSubmarine; fDepth : float) is

   begin
      this.fDepth := fDepth;
   end Set_Depth;


   function bGet_Gripper_Left_Status(this : in CSubmarine) return boolean is

   begin
      return this.bGripperLeft;
   end bGet_Gripper_Left_Status;

   function bGet_Gripper_Right_Status(this : in CSubmarine) return boolean is

   begin
      return this.bGripperRight;
   end bGet_Gripper_Right_Status;

   function bGet_Dropper_Left_Status(this : in CSubmarine) return boolean is

   begin
      return this.bDropperLeft;
   end bGet_Dropper_Left_Status;

   function bGet_Dropper_Right_Status(this : in CSubmarine) return boolean is

   begin
      return this.bDropperRight;
   end bGet_Dropper_Right_Status;

   function fGet_Depth(this : in Csubmarine) return float is

   begin
      return this.fDepth;
   end fGet_Depth;




end simulator.submarine;
