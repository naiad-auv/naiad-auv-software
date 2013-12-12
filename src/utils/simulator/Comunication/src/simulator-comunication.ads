with simulator.Comunication_Prot_Obj;
with simulator.submarine;
with math.Vectors;
with math.Matrices;
with CAN_Utils;
with CAN_Defs;
with Ethernet_Socket;
with simulator.Motion_Control_Wrapper;

package Simulator.Comunication is
   type EMotionComponent is new simulator.Motion_Control_Wrapper.EMotionComponent;
   type TPIDComponentScalings is new simulator.Motion_Control_Wrapper.TPIDComponentScalings;
   type txPIDComponentScalingArray is array (EMotionComponent(PositionX)..EmotionComponent(AllPosition)) of TPIDComponentScalings;
   type EOperatingMode is new simulator.Comunication_Prot_Obj.EOperatingMode;
   procedure Intialize_And_Reset;

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
   procedure Set_Operating_Mode(eOperationMode : EoperatingMode);

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
   function eGet_Operating_Mode return EOperatingMode;

private
   procedure Get_Data_From_Message(xMessage : CAN_Defs.CAN_Message; iMessageLength : integer);
   task type TCommunicationTask;

   ComunicationTask : TCommunicationTask;
   xProtected_Info : simulator.Comunication_Prot_Obj.tCom_Prot_Obj;

   MSG_Kill_Switch : constant Can_Defs.CAN_Identifier := 5;


end Simulator.Comunication;
