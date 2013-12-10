with math.Vectors;
with math.Matrices;
with Simulator.submarine;
with simulator.Motion_Control_Wrapper;

package Simulator.Comunication_Prot_Obj is
   type EMotionComponent is new simulator.Motion_Control_Wrapper.EMotionComponent;
   type TPIDComponentScalings is new simulator.Motion_Control_Wrapper.TPIDComponentScalings;
   type txPIDComponentScalingArray is array (EMotionComponent(PositionX)..EmotionComponent(AllPosition)) of TPIDComponentScalings;
   type EOperatingMode is (OfflineMode, EthernetSimulationMode, ObserveMode);
   protected type tCom_Prot_Obj is

      procedure Set_Current_Position(xCurrent_Position : math.Vectors.CVector);
      procedure Set_Current_Orientation(xCurrent_Orientation : math.Matrices.CMatrix);
      procedure Set_Wanted_Position(xWanted_Position : math.Vectors.CVector);
      procedure Set_Wanted_Orientation(xWanted_Orientation : math.Matrices.CMatrix);
      procedure Set_Motor_Power(xMotor_Power : simulator.submarine.TMotorForce);
      procedure Set_Gripper_Left(bGripper_Left : boolean);
      procedure Set_Gripper_Right(bGripper_Right : boolean);
      procedure Set_Torpedo_Left(bTorpedo_Left : boolean);
      procedure Set_Torpedo_Right(bTorpedo_Right : boolean);
      procedure Set_Dropper_Left(bDropper_Left : boolean);
      procedure Set_Dropper_Right(bDropper_Right : boolean);
      procedure Set_Pressure(fPressure : float);
      procedure Set_Temperature(fTemperature : float);
      procedure Set_Pid_Scaling(eComponent : EMotionComponent; PidScaling : TPIDComponentScalings);
      procedure Set_OperatingMode(eOperationMode: EOperatingMode);

      function xGet_Current_Position return math.Vectors.CVector;
      function xGet_Current_Orientation return math.Matrices.CMatrix;
      function xGet_Wanted_Position return math.Vectors.CVector;
      function xGet_Wanted_Orientation return math.Matrices.CMatrix;
      function xGet_Motor_Power return simulator.submarine.TMotorForce;
      function bGet_Gripper_Left return boolean;
      function bGet_Gripper_Right return boolean;
      function bGet_Torpedo_Left return boolean;
      function bGet_Torpedo_Right return boolean;
      function bGet_Dropper_Left return boolean;
      function bGet_Dropper_Right return boolean;
      function fGet_Pressure return float;
      function fGet_Temperature return float;
      function xGet_Pid_Scaling( eComponent : EMotionComponent ) return TPIDComponentScalings;
      function eGet_OperatingMode return EOperatingMode;

   private
      txPidScalings : txPIDComponentScalingArray := (others => (0.0,0.0,0.0));
      xCurrent_Position : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,0.0);
      xCurrent_Orientation : math.Matrices.CMatrix := math.Matrices.xCreate_Identity;
      xWanted_Position : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,0.0);
      xWanted_Orientation : math.Matrices.CMatrix := math.Matrices.xCreate_Identity;
      xMotor_Power : simulator.submarine.TMotorForce := (others => 0.0);
      eOperationMode : EOperatingMode := offlineMode;
      bGripper_Left : boolean := false;
      bGripper_Right : boolean := false;
      bTorpedo_Left : boolean := false;
      bTorpedo_Right : boolean := false;
      bDropper_Left : boolean := false;
      bDropper_Right : boolean := false;
      fPressure : float := 0.0;
      fTemperature : float := 0.0;

   end tCom_Prot_Obj;

end Simulator.Comunication_Prot_Obj;
