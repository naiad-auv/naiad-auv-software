with simulator.Comunication;
package body Simulator.Model is

   --------------
   -- pxCreate --
   --------------

   function pxCreate(iMotorUpdateFrequency : Integer) return pcModel is
      pxModel : Simulator.Model.pCModel;

   begin
      pxModel := new Simulator.Model.CModel;
      pxModel.eOperationMode := OfflineMode;
      pxModel.fTimeBetweenMotorUpdates:=1.0/float(iMotorUpdateFrequency);
      pxModel.pxSubmarine := Simulator.submarine.pxCreate_Naiad;
      pxModel.pxMotionControlWrapper := Simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;

      return pxModel;
   end pxCreate;

   -----------------
   -- UpdateModel --
   -----------------

   procedure Update_Model (this : in out CModel; fDeltaTime : float) is
   begin
      case this.eOperationMode is
         when OfflineMode =>
            Update_Offline_Mode(this,fDeltaTime);
         when EthernetSimulationMode =>
            Update_Ethernet_Simulation_Mode(this,fDeltaTime);
         when ObserveMode =>
            Update_Observe_Mode(this,fDeltaTime);
      end case;
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
      return this.pxSubmarine.xGet_Wanted_Position;
   end xGet_Wanted_Submarine_Positional_Vector;

   ----------------------------------------------
   -- xGet_Wanted_Submarine_Orientation_Matrix --
   ----------------------------------------------

   function xGet_Wanted_Submarine_Orientation_Matrix(this : in CModel) return Math.Matrices.CMatrix is
   begin
      return this.pxSubmarine.xGet_Wanted_Orientation;
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

   ------------------------------
   -- bGet_Left_Gripper_Status --
   ------------------------------

   function bGet_Left_Gripper_Status(this : in CModel) return boolean is
   begin
      return this.pxSubmarine.bGet_Gripper_Left_Status;
   end bGet_Left_Gripper_Status;

   -------------------------------
   -- bGet_Right_Gripper_Status --
   -------------------------------

   function bGet_Right_Gripper_Status(this : in CModel) return boolean is
   begin
      return this.pxSubmarine.bGet_Gripper_Right_Status;
   end bGet_Right_Gripper_Status;

   -----------------------------
   -- bGet_Left_Torpedo_Satus --
   -----------------------------

   function bGet_Left_Torpedo_Satus(this : in CModel) return boolean is
   begin
      return this.pxSubmarine.bGet_Torpedo_Left_Status;
   end bGet_Left_Torpedo_Satus;

   -------------------------------
   -- bGet_Right_Torpedo_Status --
   -------------------------------

   function bGet_Right_Torpedo_Status(this : in CModel) return boolean is
   begin
      return this.pxSubmarine.bGet_Torpedo_Right_Status;
   end bGet_Right_Torpedo_Status;

   -----------------------------
   -- bGet_Left_Dropper_Satus --
   -----------------------------

   function bGet_Left_Dropper_Satus(this : in CModel) return boolean is
   begin
      return this.pxSubmarine.bGet_Dropper_Left_Status;
   end bGet_Left_Dropper_Satus;

   -------------------------------
   -- bGet_Right_Dropper_Status --
   -------------------------------

   function bGet_Right_Dropper_Status(this : in CModel) return boolean is
   begin
      return this.pxSubmarine.bGet_Dropper_Right_Status;
   end bGet_Right_Dropper_Status;



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
      case this.eOperationMode is
         when OfflineMode =>
            this.pxMotionControlWrapper.Update_Pid_Scaling(xComponentScaling => simulator.Motion_Control_Wrapper.TPIDComponentScalings(xComponentScaling),
                                                           eComponentToScale => simulator.Motion_Control_Wrapper.EMotionComponent(eComponentToScale));
         when others =>
            simulator.Comunication.Set_Pid_Scaling(eComponent => simulator.Comunication.EMotionComponent(eComponentToScale),
                                                   PidScaling => simulator.Comunication.TPIDComponentScalings(xComponentScaling));
      end case;
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
      this.pxSubmarine.Set_Wanted_Position(xWantedPosition => xWantedPosition);
      this.pxSubmarine.Set_Wanted_Orientation(xWantedOrientation => xWantedOrientation);
      case this.eOperationMode is
         when OfflineMode =>
            this.pxMotionControlWrapper.Update_Wanted_Position(xWantedPosition    => xWantedPosition,
                                                               xWantedOrientation => xWantedOrientation);
         when others =>
            simulator.Comunication.Set_Wanted_Position(xWanted_Position => xWantedPosition);
            simulator.Comunication.Set_Wanted_Orientation(xWanted_Orientation => xWantedOrientation);
      end case;


   end Set_Wanted_Position_And_Orientation;

   -------------------------
   -- eGet_Operation_Mode --
   -------------------------

   function eGet_Operation_Mode(this : in CModel) return EOperatingMode is

   begin
      return this.eOperationMode;
   end eGet_Operation_Mode;

   ------------------------
   -- Set_Operation_Mode --
   ------------------------

   procedure Set_Operation_Mode(this : in out CModel; eOperationMode : EOperatingMode) is
   begin
      simulator.Comunication.Set_Operating_Mode(simulator.Comunication.EOperatingMode(eOperationMode));
      this.eOperationMode := eOperationMode;
   end Set_Operation_Mode;

   -------------------------
   -- Update_Offline_Mode --
   -------------------------

   procedure Update_Offline_Mode(this : in out CModel; fDeltaTime : float) is
      fMaximumMotorForce : float := 66.776;
      fMotorForceChangePerSecond : float := fMaximumMotorForce/0.0001;--1.5;
      tfMotorValuesSubmarine : simulator.Model.TMotorForce;
      tfChangeInMotorValues : simulator.Model.TMotorForce;
   begin
      if this.fTimeSinceLastMotorUpdate>this.fTimeBetweenMotorUpdates then
         this.pxMotionControlWrapper.Update_Wanted_Position(xWantedPosition    => this.pxSubmarine.xGet_Wanted_Position,
                                                            xWantedOrientation => this.pxSubmarine.xGet_Wanted_Orientation);
         this.fTimeSinceLastMotorUpdate := this.fTimeSinceLastMotorUpdate - this.fTimeBetweenMotorUpdates;
         this.pxMotionControlWrapper.Update_Values(xNewCurrentAbsolutePosition => this.pxSubmarine.xGet_Position_Vector,
                                                   xNewCurrentOrientation      => this.pxSubmarine.xGet_Orientation_Matrix,
                                                   tfMotorValuesSubmarine      => simulator.submarine.TMotorForce(this.tWantedMotorForces), --out
                                                   fDeltaTime                  => this.fTimeBetweenMotorUpdates);

      end if;
      this.fTimeSinceLastMotorUpdate := this.fTimeSinceLastMotorUpdate+fDeltaTime;

      tfMotorValuesSubmarine := simulator.Model.TMotorForce(this.pxSubmarine.xGet_Motor_Values);
      for iMotorIndex in tfMotorValuesSubmarine'Range loop
         tfChangeInMotorValues(iMotorIndex) := this.tWantedMotorForces(iMotorIndex)-tfMotorValuesSubmarine(iMotorIndex);
         if tfChangeInMotorValues(iMotorIndex)>fMotorForceChangePerSecond*fDeltaTime then
            tfChangeInMotorValues(iMotorIndex) := fMotorForceChangePerSecond*fDeltaTime;
         end if;
         if tfChangeInMotorValues(iMotorIndex)<-fMotorForceChangePerSecond*fDeltaTime then
            tfChangeInMotorValues(iMotorIndex) := -fMotorForceChangePerSecond*fDeltaTime;
         end if;
         tfMotorValuesSubmarine(iMotorIndex) := tfMotorValuesSubmarine(iMotorIndex) + tfChangeInMotorValues(iMotorIndex);
      end loop;

      this.pxSubmarine.Time_Step_Motor_Force_To_Integrate(txMotorForce => Simulator.submarine.TMotorForce(tfMotorValuesSubmarine),
                                                          fDeltaTime   => fDeltaTime);
   end Update_Offline_Mode;

   -------------------------------------
   -- Update_Ethernet_Simulation_Mode --
   -------------------------------------

   procedure Update_Ethernet_Simulation_Mode(this : in out CModel; fDeltaTime : float) is
   begin
      this.pxSubmarine.Set_Motor_Force(simulator.Comunication.xGet_Motor_Power);
      this.pxSubmarine.Integrate_Submarine_Variables(fDeltaTime);
      simulator.Comunication.Set_Current_Position(xCurrent_Position => this.pxSubmarine.xGet_Position_Vector);
      simulator.Comunication.Set_Current_Orientation(xCurrent_Orientation => this.pxSubmarine.xGet_Orientation_Matrix);

      Transfer_Sensor_Data_To_Submarine(this);
   end Update_Ethernet_Simulation_Mode;

   -------------------------
   -- Update_Observe_Mode --
   -------------------------

   procedure Update_Observe_Mode(this : in out CModel; fDeltaTime : float) is
   begin
      this.pxSubmarine.Set_Position_Vector(simulator.Comunication.xGet_Current_Position);
      this.pxSubmarine.Set_Orientation_Matrix(simulator.Comunication.xGet_Current_Orientation);
      Transfer_Sensor_Data_To_Submarine(this);


   end Update_Observe_Mode;

   ---------------------------------------
   -- Transfer_Sensor_Data_To_Submarine --
   ---------------------------------------

   procedure Transfer_Sensor_Data_To_Submarine(this : in out CModel) is
   begin
      this.pxSubmarine.Set_Gripper_Left_Status(bGripperLeft => simulator.Comunication.bGet_Gripper_Left);
      this.pxSubmarine.Set_Gripper_Right_Status(bGripperRight => simulator.Comunication.bGet_Gripper_Right);
      this.pxSubmarine.Set_Torpedo_Left_Status(bTorpedoLeft => simulator.Comunication.bGet_Torpedo_Left);
      this.pxSubmarine.Set_Torpedo_Right_Status(bTorpedoRight => simulator.Comunication.bGet_Torpedo_Right);
      this.pxSubmarine.Set_Dropper_Left_Status(bDropperLeft => simulator.Comunication.bGet_Dropper_Left);
      this.pxSubmarine.Set_Dropper_Right_Status(bDropperRight => simulator.Comunication.bGet_Dropper_Right);

      this.pxSubmarine.Set_Pressure(fPressure => simulator.Comunication.fGet_Pressure);
      this.pxSubmarine.Set_Temperature(fTemperature => simulator.Comunication.fGet_Temperature);
   end Transfer_Sensor_Data_To_Submarine;


end Simulator.Model;
