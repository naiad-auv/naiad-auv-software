package body Simulator.Model is

   --------------
   -- pxCreate --
   --------------

   function pxCreate(iMotorUpdateFrequency : Integer) return pcModel is
      pxModel : Simulator.Model.pCModel;

   begin
      pxModel := new Simulator.Model.CModel;
      pxModel.fTimeBetweenMotorUpdates:=1.0/float(iMotorUpdateFrequency);
      pxModel.pxSubmarine := Simulator.submarine.pxCreate_Naiad;
      pxModel.pxMotionControlWrapper := Simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      --pxModel.pOwnerUpdateProcedure := pOwnerUpdateProcedure;

      return pxModel;
   end pxCreate;

   -----------------
   -- UpdateModel --
   -----------------

   procedure Update_Model (this : in out CModel; fDeltaTime : float) is
      tfMotorValuesSubmarine : simulator.submarine.TMotorForce;
   begin
      this.pxMotionControlWrapper.Update_Values(xNewCurrentAbsolutePosition => this.pxSubmarine.xGet_Position_Vector,
                                                xNewCurrentOrientation      => this.pxSubmarine.xGet_Orientation_Matrix,
                                                tfMotorValuesSubmarine       => tfMotorValuesSubmarine, --out
                                                fDeltaTime                   => fDeltaTime);

      this.pxSubmarine.Time_Step_Motor_Force_To_Integrate(txMotorForce => tfMotorValuesSubmarine,
                                                          fDeltaTime   => fDeltaTime);
   end Update_Model;

   -------------------------------------------
   -- pxGetCurrentSubmarinePositionalVector --
   -------------------------------------------

   function xGet_Current_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.CVector is
   begin
      return this.pxSubmarine.xGet_Position_Vector;
   end xGet_Current_Submarine_Positional_Vector;

   ---------------------------------------------
   -- xGet_Wanted_Submarine_Positional_Vector --
   ---------------------------------------------

   function xGet_Wanted_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.CVector is

   begin
      return this.pxMotionControlWrapper.xGet_Wanted_Position;
   end xGet_Wanted_Submarine_Positional_Vector;

   ----------------------------------------------
   -- xGet_Wanted_Submarine_Orientation_Matrix --
   ----------------------------------------------

   function xGet_Wanted_Submarine_Orientation_Matrix(this : in CModel) return Math.Matrices.CMatrix is
   begin
      return this.pxMotionControlWrapper.xGet_Wanted_Orientation;
   end xGet_Wanted_Submarine_Orientation_Matrix;

   -----------------------------------------------
   -- xGet_Current_Submarine_Orientation_Matrix --
   -----------------------------------------------

   function xGet_Current_Submarine_Orientation_Matrix(this : in CModel) return math.Matrices.CMatrix is

   begin
      return this.pxSubmarine.xGet_Orientation_Matrix;
   end xGet_Current_Submarine_Orientation_Matrix;

   --------------------------------------------
   -- xGet_Current_Submarine_Velocity_Vector --
   --------------------------------------------

   function xGet_Current_Submarine_Velocity_Vector(this : in CModel) return Math.Vectors.CVector is
   begin
      return this.pxSubmarine.xGet_Velocity_Vector;
   end xGet_Current_Submarine_Velocity_Vector;

   ----------------------
   -- fGet_Motor_Force --
   ----------------------

   function fGet_Motor_Force(this : in CModel; iIndexMotor  : iMotorIndex) return float is
   begin
      return this.pxSubmarine.xGet_Motor_Values(iIndexMotor);
   end fGet_Motor_Force;

   ---------------------
   -- Set_Pid_Scaling --
   ---------------------

   procedure Set_Pid_Scaling(this : CModel ; xComponentScaling:TPIDComponentScalings;eComponentToScale : EMotionComponent) is

   begin
      this.pxMotionControlWrapper.Update_Pid_Scaling(xComponentScaling => simulator.Motion_Control_Wrapper.TPIDComponentScalings(xComponentScaling),
                                                     eComponentToScale => simulator.Motion_Control_Wrapper.EMotionComponent(eComponentToScale));
   end Set_Pid_Scaling;

   -------------
   -- Restart --
   -------------

   procedure Restart(this : in out CModel) is
      pxNewSubmarine : simulator.submarine.pCSubmarine;
   begin
      this.pxMotionControlWrapper.Restart;
      pxNewSubmarine := simulator.submarine.pxCreate_Naiad;
      simulator.submarine.Free(this.pxSubmarine);
      this.pxSubmarine := pxNewSubmarine;
   end;

   -----------------------------------------
   -- Set_Wanted_Position_And_Orientation --
   -----------------------------------------

   procedure Set_Wanted_Position_And_Orientation(this : in CModel; xWantedPosition : math.Vectors.CVector; xWantedOrientation : math.Matrices.CMatrix) is
   begin
      this.pxMotionControlWrapper.Update_Wanted_Position(xWantedPosition    => xWantedPosition,
                                                         xWantedOrientation => xWantedOrientation);
   end Set_Wanted_Position_And_Orientation;



   function xGet_Current_Motional_Errors(this : in CModel) return Navigation.Dispatcher.TMotionalErrors is
   begin
      return this.pxMotionControlWrapper.xGet_Motional_Errors;
   end xGet_Current_Motional_Errors;

end Simulator.Model;
