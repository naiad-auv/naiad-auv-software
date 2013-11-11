with Ada.Exceptions;

with math.Vectors;use Math.Vectors;
with Math.Matrices;use Math.Matrices;
with Simulator.Motor_Info; use Simulator.Motor_Info;
with Ada.Unchecked_Deallocation;
with Exception_Handling;
with Ada.Text_IO; use Ada.Text_IO;
package body simulator.submarine is

   --------------------
   -- pxCreate_Naiad --
   --------------------

   function pxCreate_Naiad return pCSubmarine is
      pxSubmarine : pCSubmarine;
      txMotorInfo : simulator.submarine.TMotors;
      tfRawMatrix : Math.Matrices.TMatrix;

      xPositionVectorMotorFrontLeftXYPlane : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.5,
                                                                                          fY => 0.8660254037844386467637231707529361834714026269051903,
                                                                                          fZ => 0.0);
      xForceVectorMotorFrontLeftXYPlane : math.Vectors.CVector := math.Vectors.xCreate(fX => -0.8660254037844386467637231707529361834714026269051903,
                                                                                       fY => 0.5,
                                                                                       fZ => 0.0);
      xPositionVectorMotorRearXYPlane : math.Vectors.CVector := math.Vectors.xCreate(fX => -1.0,
                                                                                     fY => 0.0,
                                                                                     fZ => 0.0);
      xForceVectorMotorRearXYPlane : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.0,
                                                                                  fY => -1.0,
                                                                                  fZ => 0.0);
      xPositionVectorMotorFrontRightXYPlane : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.5,
                                                                                           fY => -0.8660254037844386467637231707529361834714026269051903,
                                                                                           fZ => 0.0);
      xForceVectorMotorFrontRightXYPlane : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.8660254037844386467637231707529361834714026269051903,
                                                                                        fY => 0.5,
                                                                                        fZ => 0.0);
      xPositionVectorMotorFrontLeftZAxis : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.5,
                                                                                        fY => 0.8660254037844386467637231707529361834714026269051903,
                                                                                        fZ => 0.0);
      xForceVectorMotorFrontLeftZAxis : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.0,
                                                                                     fY => 0.0,
                                                                                     fZ => 1.0);
      xPositionVectorMotorRearZAxis : math.Vectors.CVector := math.Vectors.xCreate(fX => -1.0,
                                                                                   fY => 0.0,
                                                                                   fZ => 0.0);
      xForceVectorMotorRearZAxis : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.0,
                                                                                fY => 0.0,
                                                                                fZ => 1.0);
      xPositionVectorMotorFrontRightZAxis : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.5,
                                                                                         fY => -0.8660254037844386467637231707529361834714026269051903,
                                                                                         fZ => 0.0);
      xForceVectorMotorFrontRightZAxis : math.Vectors.CVector := math.Vectors.xCreate(fX => 0.0,
                                                                                      fY => 0.0,
                                                                                      fZ => 1.0);

   begin
      pxSubmarine := new CSubmarine;
      tfRawMatrix := ((0.36,0.001,0.037),
                      (0.001,0.9,0.0003),
                      (0.037,0.0003,1.094));

      pxSubmarine.pxInertiaMatrix := math.Matrices.pxGet_Allocated_Copy(Math.Matrices.xCreate(tfMatrix => tfRawMatrix));


      txMotorInfo(1) := simulator.Motor_Info.pxCreate(xPositionVectorMotorFrontLeftXYPlane,xForceVectorMotorFrontLeftXYPlane);
      txMotorInfo(2) := simulator.Motor_Info.pxCreate(xPositionVectorMotorRearXYPlane, xForceVectorMotorRearXYPlane);
      txMotorInfo(3) := simulator.Motor_Info.pxCreate(xPositionVectorMotorFrontRightXYPlane, xForceVectorMotorFrontRightXYPlane);
      txMotorInfo(4) := simulator.Motor_Info.pxCreate(xPositionVectorMotorFrontLeftZAxis,xForceVectorMotorFrontLeftZAxis);
      txMotorInfo(5) := simulator.Motor_Info.pxCreate(xPositionVectorMotorRearZAxis,xForceVectorMotorRearZAxis);
      txMotorInfo(6) := simulator.Motor_Info.pxCreate(xPositionVectorMotorFrontRightZAxis,xForceVectorMotorFrontRightZAxis);


      pxSubmarine.pxPositionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0 , 0.0 , 0.0));
      pxSubmarine.pxVelocityVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0 , 0.0 , 0.0));
      pxSubmarine.pxOrientationMatrix := math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_Identity);
      pxSubmarine.pxAngularVelocityVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0 , 0.0 , 0.0));
      pxSubmarine.txMotorInfo:=txMotorInfo;
      pxSubmarine.txMotorForce := (0.0,0.0,0.0,0.0,0.0,0.0);
      pxSubmarine.fWeight:=28.0;
      pxSubmarine.fBuoyancyForce:=30.0*9.82;
      pxSubmarine.pxBuoyancyForcePositionVector:= math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.1));
      pxSubmarine.pxRotationFrictionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.1 , 0.1 , 0.1));
      pxSubmarine.pxVelocityFrictionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.1 , 0.1 , 0.1));


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

   ----------
   -- Free --
   ----------

   procedure Free(pxSubmarine : in out pCSubmarine) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CSubmarine, pCSubmarine);
   begin
      math.Vectors.Free(pxVectorToDeallocate => pxSubmarine.pxPositionVector);
      math.Vectors.Free(pxVectorToDeallocate => pxSubmarine.pxVelocityVector);
      math.Matrices.Free(pxMatrixToDeallocate => pxSubmarine.pxOrientationMatrix);
      math.Vectors.Free(pxVectorToDeallocate => pxSubmarine.pxAngularVelocityVector);
      math.Matrices.Free(pxMatrixToDeallocate => pxSubmarine.pxInertiaMatrix);
      simulator.Motor_Info.Free(pxMotorInfoToDealocate => pxSubmarine.txMotorInfo(1));
      simulator.Motor_Info.Free(pxMotorInfoToDealocate => pxSubmarine.txMotorInfo(2));
      simulator.Motor_Info.Free(pxMotorInfoToDealocate => pxSubmarine.txMotorInfo(3));
      simulator.Motor_Info.Free(pxMotorInfoToDealocate => pxSubmarine.txMotorInfo(4));
      simulator.Motor_Info.Free(pxMotorInfoToDealocate => pxSubmarine.txMotorInfo(5));
      simulator.Motor_Info.Free(pxMotorInfoToDealocate => pxSubmarine.txMotorInfo(6));
      math.Vectors.Free(pxVectorToDeallocate => pxSubmarine.pxBuoyancyForcePositionVector);
      math.Vectors.Free(pxVectorToDeallocate => pxSubmarine.pxRotationFrictionVector);
      math.Vectors.Free(pxVectorToDeallocate => pxSubmarine.pxVelocityFrictionVector);
      math.Vectors.Free(pxVectorToDeallocate => pxSubmarine.pxAccelerationVector);
      math.Vectors.Free(pxVectorToDeallocate => pxSubmarine.pxAngularAccelerationVector);
      Dealloc(pxSubmarine);

   end Free;

   ---------------------------
   -- pxGet_Position_Vector --
   ---------------------------

   function xGet_Position_Vector(this : in CSubmarine) return math.Vectors.CVector is
   begin
      return this.pxPositionVector.all;
   end xGet_Position_Vector;

   ---------------------------
   -- pxGet_Velocity_Vector --
   ---------------------------

   function xGet_Velocity_Vector(this : in CSubmarine) return math.Vectors.CVector is

   begin
      return this.pxVelocityVector.all;
   end xGet_Velocity_Vector;

   ------------------------------
   -- pxGet_Orientation_Matrix --
   ------------------------------

   function xGet_Orientation_Matrix(this : in CSubmarine) return math.Matrices.CMatrix is

   begin
      return this.pxOrientationMatrix.all;
   end xGet_Orientation_Matrix;

   -----------------------------------
   -- pxGet_Angular_Velocity_Vector --
   -----------------------------------

   function xGet_Angular_Velocity_Vector(this : in CSubmarine) return math.Vectors.CVector is

   begin
      return this.pxAngularVelocityVector.all;

   end xGet_Angular_Velocity_Vector;

   ------------------------
   -- pxGet_Motor_Values --
   ------------------------

   function xGet_Motor_Values(this : in CSubmarine) return TMotorForce is
      txMotorForce : TMotorForce;
   begin
      for iIndex in txMotorForce'Range loop
         txMotorForce(iIndex) := this.txMotorForce(iIndex);
      end loop;
      return this.txMotorForce;
   end xGet_Motor_Values;


   -------------------------
   -- Set_Position_Vector --
   -------------------------

   procedure Set_Position_Vector(this : in out CSubmarine; xPositionVector : in math.Vectors.CVector) is
   begin
      if(this.pxPositionVector=null) then
         this.pxPositionVector:=xPositionVector.pxGet_Allocated_Copy;
      else
         this.pxPositionVector.Copy_From(xPositionVector);
      end if;

   end Set_Position_Vector;

   ----------------------------
   -- Set_Orientation_Matrix --
   ----------------------------

   procedure Set_Orientation_Matrix(this : in out CSubmarine ; xOrientationMatrix : in Math.Matrices.CMatrix)is
   begin
      if(this.pxOrientationMatrix=null) then
         this.pxOrientationMatrix := xOrientationMatrix.pxGet_Allocated_Copy;
      else
         this.pxOrientationMatrix.Copy_From(xOrientationMatrix);
      end if;

   end Set_Orientation_Matrix;

   -------------------------
   -- Set_Velocity_Vector --
   -------------------------

   procedure Set_Velocity_Vector(this : in out CSubmarine ; xVelocityVector : in Math.Vectors.CVector)is
   begin
      if(this.pxVelocityVector=null) then
         this.pxVelocityVector := xVelocityVector.pxGet_Allocated_Copy;
      else
         this.pxVelocityVector.Copy_From(xVelocityVector);
      end if;

   end Set_Velocity_Vector;

   ---------------------------------
   -- Set_Angular_Velocity_Vector --
   ---------------------------------

   procedure Set_Angular_Velocity_Vector(this : in out CSubmarine ; xAngularVelocityVector : in Math.Vectors.CVector)is
   begin
      if(this.pxAngularVelocityVector=null) then
         this.pxAngularVelocityVector := xAngularVelocityVector.pxGet_Allocated_Copy;
      else
         this.pxAngularVelocityVector.Copy_From(xAngularVelocityVector);
      end if;

   end Set_Angular_Velocity_Vector;

   --------------------
   -- Set_Motor_Info --
   --------------------

   procedure Set_Motor_Info (this : in out CSubmarine ; txMotorInfo : in TMotors)is
   begin
      for iLoopThroughMotors in txMotorInfo'Range loop
         if(this.txMotorInfo(iLoopThroughMotors)/=null) then
            simulator.Motor_Info.Free(this.txMotorInfo(iLoopThroughMotors));
         end if;
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

   procedure Set_Buoyancy_Force_Position_Vector(this : in out CSubmarine ; xBuoyancyForcePositionVector : in math.Vectors.CVector) is
   begin
      if(this.pxBuoyancyForcePositionVector = null) then
         this.pxBuoyancyForcePositionVector := xBuoyancyForcePositionVector.pxGet_Allocated_Copy;
      else
         this.pxBuoyancyForcePositionVector.Copy_From(xBuoyancyForcePositionVector);
      end if;
   end Set_Buoyancy_Force_Position_Vector;

   ----------------------------------
   -- Set_Rotation_Friction_Vector --
   ----------------------------------

   procedure Set_Rotation_Friction_Vector(this : in out CSubmarine ; xRotationFrictionVector : in math.Vectors.CVector) is
   begin
      if(this.pxRotationFrictionVector = null) then
         this.pxRotationFrictionVector := xRotationFrictionVector.pxGet_Allocated_Copy;
      else
         this.pxRotationFrictionVector.Copy_From(xRotationFrictionVector);
      end if;

   end Set_Rotation_Friction_Vector;

   -----------------------------------
   -- Set_Veclocity_Friction_Vector --
   -----------------------------------

   procedure Set_Veclocity_Friction_Vector(this : in out CSubmarine ; xVelocityFrictionVector : in math.Vectors.CVector) is
   begin
      if(this.pxVelocityFrictionVector = null) then
         this.pxVelocityFrictionVector := xVelocityFrictionVector.pxGet_Allocated_Copy;
      else
         this.pxVelocityFrictionVector.Copy_From(xVelocityFrictionVector);
      end if;

   end Set_Veclocity_Friction_Vector;


   ------------------------
   -- Set_Interia_Matrix --
   ------------------------

   procedure Set_Inertia_Matrix(this : in out CSubmarine; xInertiaMatrix : in math.Matrices.CMatrix) is

   begin
      if(this.pxInertiaMatrix = null) then
         this.pxInertiaMatrix := xInertiaMatrix.pxGet_Allocated_Copy;
      else
         this.pxInertiaMatrix.Copy_From(xInertiaMatrix);
      end if;

   end;




   ----------------------------
   -- Calculate_Acceleration --
   ----------------------------

   procedure Calculate_Acceleration (this : in out CSubmarine) is
      use Math.Vectors;
      use Math.Matrices;
      xRelativeForce : math.Vectors.CVector;
      xFixedCordForce : math.Vectors.CVector;
      xAbsoluteGravityForce : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,-this.fWeight*9.82);
      xAbsoluteBouyancyForce : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,this.fBuoyancyForce);
   begin


      xRelativeForce := -(this.pxOrientationMatrix.xGet_Inverse*this.pxVelocityVector)*this.pxVelocityFrictionVector;
      for iLoopThroughMotors in this.txMotorForce'Range loop
         xRelativeForce := xRelativeForce+(this.txMotorInfo(iLoopThroughMotors).xGet_Force_Vector*this.txMotorForce(iLoopThroughMotors));
      end loop;
      xFixedCordForce := this.pxOrientationMatrix*xRelativeForce;
      xFixedCordForce := xFixedCordForce+xAbsoluteGravityForce;
      xFixedCordForce := xFixedCordForce+xAbsoluteBouyancyForce;
      if(this.pxAccelerationVector=null) then
         this.pxAccelerationVector := math.Vectors.pxGet_Allocated_Copy(xFixedCordForce *(1.0/this.fWeight));
      else
         this.pxAccelerationVector.Copy_From(xFixedCordForce *(1.0/this.fWeight));
      end if;


   end Calculate_Acceleration;

   ------------------------------------
   -- Calculate_Angular_Acceleration --
   ------------------------------------

   procedure Calculate_Angular_Acceleration (this : in out CSubmarine) is
      use Math.Vectors;
      use Math.Matrices;
      xRelativeTorque : math.Vectors.CVector;
      xRelativeAngularVelocity : math.Vectors.CVector;
      xRelativeAngularAccelerationVector : math.Vectors.CVector;
      xBouyancyForce : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,this.fBuoyancyForce);
   begin


      xRelativeAngularVelocity := this.pxOrientationMatrix.xGet_Inverse * this.pxAngularVelocityVector;

      xRelativeTorque := math.Vectors.xCross_Product(this.pxBuoyancyForcePositionVector , this.pxOrientationMatrix.xGet_Inverse * xBouyancyForce) - xRelativeAngularVelocity*this.pxRotationFrictionVector;
      for iLoopThroughMotors in this.txMotorForce'Range loop
         xRelativeTorque := xRelativeTorque+(this.txMotorInfo(iLoopThroughMotors).xGet_Torque_Vector*this.txMotorForce(iLoopThroughMotors));
      end loop;
      xRelativeAngularAccelerationVector := this.pxInertiaMatrix.xGet_Inverse*(xRelativeTorque-math.Vectors.xCross_Product(xRelativeAngularVelocity, this.pxInertiaMatrix*xRelativeAngularVelocity));

      if(this.pxAngularAccelerationVector=null) then
         this.pxAngularAccelerationVector := math.Vectors.pxGet_Allocated_Copy(this.pxOrientationMatrix * xRelativeAngularAccelerationVector);
      else
         this.pxAngularAccelerationVector.Copy_From(this.pxOrientationMatrix * xRelativeAngularAccelerationVector);
      end if;
   end Calculate_Angular_Acceleration;

   -----------------------------------
   -- Integrate_Submarine_Variables --
   -----------------------------------

   procedure Integrate_Submarine_Variables (this : in out CSubmarine; fTimeDuration : in float) is
      use Ada.Exceptions;
      use Math.Vectors;
      use Math.Matrices;
      xDeltaRotationMovement : math.Vectors.CVector;
      UndefinedAccelerations : exception;
      xRotationQuaternion : math.Quaternions.CQuaternion;
   begin

      if this.pxAccelerationVector /= null and this.pxAngularAccelerationVector /= null then
         xDeltaRotationMovement := this.pxAngularVelocityVector*fTimeDuration;
       --  Put_Line("xDeltaMovement X: " & xDeltaRotationMovement.fGet_X'Img & " Y: " & xDeltaRotationMovement.fGet_Y'img & " Z: " & xDeltaRotationMovement.fGet_Z'img);

         if xDeltaRotationMovement.fLength_Squared /= 0.0 then

            xRotationQuaternion := math.Quaternions.xCreate(xAxisVector    => xDeltaRotationMovement,
                                                              fAngleInDegrees => math.Angles.fRadians_To_Degrees(fAngle => xDeltaRotationMovement.fLength));
            this.pxOrientationMatrix.Copy_From(math.Matrices.xCreate_From_Quaternion(xFromQuaternion => xRotationQuaternion) * this.pxOrientationMatrix);

         end if;

         this.pxAngularVelocityVector.Copy_From(this.pxAngularVelocityVector + (this.pxAngularAccelerationVector * fTimeDuration));
         this.pxPositionVector.Copy_From(this.pxPositionVector + this.pxVelocityVector * fTimeDuration);
         this.pxVelocityVector.Copy_From(this.pxVelocityVector + this.pxAccelerationVector * fTimeDuration);

         math.Vectors.Free(this.pxAccelerationVector);
         math.Vectors.Free(this.pxAngularAccelerationVector);

      else
         raise UndefinedAccelerations;
      end if;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Simulator.submarine.Integrate_Submarine_Variables (this : in out CSubmarine; fTimeDuration : in float)");
   end Integrate_Submarine_Variables;

   procedure Time_Step_Motor_Force_To_Integrate(this : in out CSubmarine ; txMotorForce : in TmotorForce; fDeltaTime : in float) is

   begin
      this.Set_Motor_Force(txMotorForce);
      this.Calculate_Acceleration;
      this.Calculate_Angular_Acceleration;
      this.Integrate_Submarine_Variables(fTimeDuration => fDeltaTime);
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
