with Simulator;
with Simulator.Model;
with Math.Matrices;
with Math.Vectors;
with Math.Planes;
with Math.Quaternions;
with Math.Angles;
with Navigation.Thrusters;
with simulator.Pid_Errors;




package Simulator.ViewModel is

   type pTProcedure is new simulator.Model.pTProcedure;

   type CViewModel is tagged private;
   type pCViewModel is access CViewModel;

   type EMotionComponent is new Simulator.Pid_Errors.EMotionComponent;

   type TVectorComponents is new Navigation.Thrusters.EThrusterEffectsComponents range Navigation.Thrusters.XRotation .. Navigation.Thrusters.ZRotation;

   function pxCreate (pOwnerUpdateProcedure : pTProcedure) return pCViewModel;
   function pxCreate (pxModel : Simulator.Model.pCModel ; pOwnerUpdateProcedure : pTProcedure) return pcViewModel;

   procedure Free(pxViewModel : in out pCViewModel);

   function xGet_Submarine_Current_Position(this : in CViewModel) return math.Vectors.CVector;
   function xGet_Submarine_Wanted_Position(this : in CViewModel) return math.Vectors.CVector;

   function xGet_Submarine_Current_Orientation(this : in CViewModel) return math.Matrices.CMatrix;
   function xGet_Submarine_Wanted_Orientation(this : in CViewModel) return math.Matrices.CMatrix;

   procedure Update_View_Model(this : in CViewModel);


   function fGet_Pid_Errors(this : in CViewModel ; eErrorComponent : in EMotionComponent) return float;

private
   type CViewModel is tagged
      record
         pOwnerUpdateProcedure : pTProcedure;
         pxPidErrors : simulator.Pid_Errors.pCPidErrors;
         pxModel : Simulator.Model.pCModel;
      end record;

end Simulator.ViewModel;
