with Simulator.Motion_Control_Wrapper;
with Simulator.submarine;
with Math.Vectors;
with math.Matrices;
with math.Planes;
with motioncontrol.Dispatcher;
with simulator.Comunication;

package Simulator.Model is

--   type pTProcedure is access procedure;

   type CModel is tagged private; --new Simulator.Update_Interface.CWithUpdate with private;
   type pCModel is access CModel;
   type EOperatingMode is new simulator.Comunication.EOperatingMode;
   type TMotorForce is new simulator.submarine.TMotorForce;
   subtype iMotorIndex is Integer range 1..6;
   type TPIDComponentScalings is new simulator.Motion_Control_Wrapper.TPIDComponentScalings;
   type EMotionComponent is new simulator.Motion_Control_Wrapper.EMotionComponent;
   function pxCreate(iMotorUpdateFrequency : Integer) return pcModel;

   procedure Update_Model(this : in out CModel; fDeltaTime : float);

   function xGet_Current_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.CVector;
   function xGet_Current_Submarine_Orientation_Matrix(this : in CModel) return math.Matrices.CMatrix;
   function xGet_Wanted_Submarine_Positional_Vector(this : in CModel) return Math.Vectors.CVector;
   function xGet_Wanted_Submarine_Orientation_Matrix(this : in CModel) return Math.Matrices.CMatrix;
   function xGet_Current_Submarine_Velocity_Vector(this : in CModel) return Math.Vectors.CVector;
   function fGet_Motor_Force(this : in CModel; iIndexMotor  : iMotorIndex) return float;

   function bGet_Left_Gripper_Status(this : in CModel) return boolean;
   function bGet_Right_Gripper_Status(this : in CModel) return boolean;
   function bGet_Left_Torpedo_Satus(this : in CModel) return boolean;
   function bGet_Right_Torpedo_Status(this : in CModel) return boolean;
   function bGet_Left_Dropper_Satus(this : in CModel) return boolean;
   function bGet_Right_Dropper_Status(this : in CModel) return boolean;


   function eGet_Operation_Mode(this : in CModel) return EOperatingMode;
   procedure Set_Operation_Mode(this : in out CModel; eOperationMode : EOperatingMode);

   procedure Set_Wanted_Position_And_Orientation(this : in CModel; xWantedPosition : math.Vectors.CVector; xWantedOrientation : math.Matrices.CMatrix);

   procedure Set_Pid_Scaling(this : CModel ; xComponentScaling:TPIDComponentScalings;eComponentToScale : EMotionComponent);
   procedure Restart(this : in out CModel);


--     overriding
--     procedure Update(this : in CModel);

private

   procedure Update_Offline_Mode(this : in out CModel; fDeltaTime : float);
   procedure Update_Ethernet_Simulation_Mode(this : in out CModel; fDeltaTime : float);
   procedure Update_Observe_Mode(this : in out CModel; fDeltaTime : float);
   procedure Transfer_Sensor_Data_To_Submarine(this : in out CModel);
   --procedure On_Update;
   type CModel is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         eOperationMode : EOperatingMode;
         fTimeSinceLastMotorUpdate : float := 0.0;
         fTimeBetweenMotorUpdates : float;
         tWantedMotorForces : TMotorForce := (others => 0.0);
         iMotorUpdateFrequencyInHertz : Integer := 0;
         pxSubmarine : Simulator.submarine.pCSubmarine;
         pxMotionControlWrapper : Simulator.Motion_Control_Wrapper.pCWrapDispatcher;
      end record;
end Simulator.Model;
