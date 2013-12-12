with Simulator;
with Simulator.Model;
with Math.Matrices;
with Math.Vectors;
with Math.Planes;
with Math.Quaternions;
with Math.Angles;
with motioncontrol.Thrusters;
with Exception_Handling;

package Simulator.ViewModel_Representation is

   type iMotorIndex is new simulator.Model.iMotorIndex;
   type EOperatingMode is new simulator.Model.EOperatingMode;

   type CViewModel_Representation is tagged private;
   type pCViewModel_Representation is access CViewModel_Representation;


   type TVectorComponents is new motioncontrol.Thrusters.EThrusterEffectsComponents range motioncontrol.Thrusters.XRotation .. motioncontrol.Thrusters.ZRotation;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Representation;

   procedure Free(pxViewModel_Representation : in out pCViewModel_Representation);

   function xGet_Submarine_Current_Position(this : in CViewModel_Representation) return math.Vectors.CVector;
   function xGet_Submarine_Wanted_Position(this : in CViewModel_Representation) return math.Vectors.CVector;

   function xGet_Submarine_Current_Orientation(this : in CViewModel_Representation) return math.Matrices.CMatrix;
   function xGet_Submarine_Wanted_Orientation(this : in CViewModel_Representation) return math.Matrices.CMatrix;

   function fGet_Pid_Errors(this : in CViewModel_Representation ; eErrorComponent : in Simulator.Model.EMotionComponent) return float;
   function eGet_Operation_Mode(this : in CViewModel_Representation) return EOperatingMode;

   procedure Restart(this : in CViewModel_Representation);
   procedure Update(this : in CViewModel_Representation; fDeltaTime : in float);
   procedure Set_Operation_Mode(this : in CViewModel_Representation; EOperationMode : EOperatingMode);


private
   type CViewModel_Representation is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         pxModel : Simulator.Model.pCModel;
      end record;


end Simulator.ViewModel_Representation;
