with simulator;
with simulator.Model;
with simulator.Pid_Errors;
with Navigation.Motion_Component;

package Simulator.ViewModel_Pid_Errors is

   type CViewModel_Pid_Errors is tagged private;
   type pCViewModel_Pid_Errors is access CViewModel_Pid_Errors;
   type EMotionComponent is new Simulator.Model.EMotionComponent;

   function fGet_Pid_Errors(this : in CViewModel_Pid_Errors ; eErrorComponent : in EMotionComponent) return float;
   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Pid_Errors;

   procedure Free(pxViewModel_Pid_Errors : in out pCViewModel_Pid_Errors);

private
    type CViewModel_Pid_Errors is tagged
      record
--           pxPidErrors : simulator.Pid_Errors.pCPidErrors;
         pxModel : Simulator.Model.pCModel;
      end record;
end Simulator.ViewModel_Pid_Errors;
