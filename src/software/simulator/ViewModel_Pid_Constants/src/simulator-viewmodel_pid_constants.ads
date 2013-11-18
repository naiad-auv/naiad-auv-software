with simulator.Model;
package Simulator.Viewmodel_Pid_Constants is

   type CViewmodel_Pid_Constants is tagged private; --new Simulator.Update_Interface.CWithUpdate with private;
   type pCViewmodel_Pid_Constants is access CViewmodel_Pid_Constants;

   type TPIDComponentScalings is new simulator.Model.TPIDComponentScalings;
   type EMotionComponent is new Simulator.Model.EMotionComponent;

   type txPIDComponentScalingArray is array (EMotionComponent(PositionX)..EmotionComponent(AllPosition)) of TPIDComponentScalings;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewmodel_Pid_Constants;
   procedure Free(pxViewmodel_Pid_Constants : in out pCViewmodel_Pid_Constants);

   function fGet_Selected_Pid_Scaling_Proprotional_Part(this : in CViewmodel_Pid_Constants) return float;
   function fGet_Selected_Pid_Scaling_Integrating_Part(this : in CViewmodel_Pid_Constants) return float;
   function fGet_Selected_Pid_Scaling_Derivative_Part(this : in CViewmodel_Pid_Constants) return float;

   procedure Set_Selected_Pid(this : in out CViewmodel_Pid_Constants; eSelectedPid : EMotionComponent);
   procedure Set_Value_Of_Selected_Pid(this : in out CViewmodel_Pid_Constants; fProporitonalPart : float; fIntegratingPart : float; fDerivativePart:float);


private

   type CViewmodel_Pid_Constants is tagged --new Simulator.Update_Interface.CWithUpdate with
      record
         txPidScalings : txPIDComponentScalingArray;
         eSelectedPid : EMotionComponent;
         pxModel : Simulator.Model.pCModel;
      end record;

end Simulator.Viewmodel_Pid_Constants;
