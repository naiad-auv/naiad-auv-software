with Simulator;
with Simulator.Model;
with Math.Matrices;
with Math.Vectors;
with Math.Planes;
with Math.Quaternions;
with Math.Angles;
with Navigation.Thrusters;
with Exception_Handling;

package Simulator.ViewModel_Representation is

   type iMotorIndex is new simulator.Model.iMotorIndex;

   type CViewModel_Representation is tagged private;
   type pCViewModel_Representation is access CViewModel_Representation;


   type TVectorComponents is new Navigation.Thrusters.EThrusterEffectsComponents range Navigation.Thrusters.XRotation .. Navigation.Thrusters.ZRotation;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Representation;

   procedure Free(pxViewModel_Representation : in out pCViewModel_Representation);

   function xGet_Submarine_Current_Position(this : in CViewModel_Representation) return math.Vectors.CVector;
   function xGet_Submarine_Wanted_Position(this : in CViewModel_Representation) return math.Vectors.CVector;

   function xGet_Submarine_Current_Orientation(this : in CViewModel_Representation) return math.Matrices.CMatrix;
   function xGet_Submarine_Wanted_Orientation(this : in CViewModel_Representation) return math.Matrices.CMatrix;

   function fGet_Pid_Errors(this : in CViewModel_Representation ; eErrorComponent : in Simulator.Model.EMotionComponent) return float;

   procedure Restart(this : in CViewModel_Representation);
   procedure Update(this : in CViewModel_Representation; fDeltaTime : in float);


private
   type CViewModel_Representation is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         pxModel : Simulator.Model.pCModel;
      end record;


end Simulator.ViewModel_Representation;
