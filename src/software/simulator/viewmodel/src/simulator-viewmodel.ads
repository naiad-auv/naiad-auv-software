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

   type TPIDComponentScalings is new simulator.Model.TPIDComponentScalings;





   type pTProcedure is new simulator.Model.pTProcedure;

   type CViewModel is tagged private;
   type pCViewModel is access CViewModel;

   type EMotionComponent is new Simulator.Pid_Errors.EMotionComponent;

   type txPIDComponentScalingArray is array (X .. DriftZ) of TPIDComponentScalings;

   type TVectorComponents is new Navigation.Thrusters.EThrusterEffectsComponents range Navigation.Thrusters.XRotation .. Navigation.Thrusters.ZRotation;

   function pxCreate (pOwnerUpdateProcedure : pTProcedure) return pCViewModel;
   function pxCreate (pxModel : Simulator.Model.pCModel ; pOwnerUpdateProcedure : pTProcedure) return pcViewModel;

   procedure Free(pxViewModel : in out pCViewModel);

   function xGet_Submarine_Current_Position(this : in CViewModel) return math.Vectors.CVector;
   function xGet_Submarine_Wanted_Position(this : in CViewModel) return math.Vectors.CVector;

   function xGet_Submarine_Current_Orientation(this : in CViewModel) return math.Matrices.CMatrix;
   function xGet_Submarine_Wanted_Orientation(this : in CViewModel) return math.Matrices.CMatrix;

   function fGet_Selected_Pid_Scaling_Proprotional_Part(this : in CViewModel) return float;
   function fGet_Selected_Pid_Scaling_Integrating_Part(this : in CViewModel) return float;
   function fGet_Selected_Pid_Scaling_Derivative_Part(this : in CViewModel) return float;

   function fGet_Pid_Errors(this : in CViewModel ; eErrorComponent : in EMotionComponent) return float;

   procedure Set_Selected_Pid(this : in out CviewModel; eSelectedPid : EMotionComponent);
   procedure Set_Value_Of_Selected_Pid(this : in out CViewModel; fProporitonalPart : float; fIntegratingPart : float; fDerivativePart:float);
   procedure Restart(this : in CViewModel);


   procedure Update_View_Model(this : in CViewModel);

private
   type CViewModel is tagged
      record
         txPidScalings : txPIDComponentScalingArray;
         eSelectedPid : EMotionComponent;
         pOwnerUpdateProcedure : pTProcedure;
         pxPidErrors : simulator.Pid_Errors.pCPidErrors;
         pxModel : Simulator.Model.pCModel;
      end record;

end Simulator.ViewModel;
