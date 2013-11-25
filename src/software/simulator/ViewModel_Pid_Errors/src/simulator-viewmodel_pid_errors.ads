with simulator;
with simulator.Model;
with simulator.Pid_Errors;
with Navigation.Motion_Component;

package Simulator.ViewModel_Pid_Errors is

   type CViewModel_Pid_Errors is tagged private;
   type pCViewModel_Pid_Errors is access CViewModel_Pid_Errors;
   type EMotionComponent is new Simulator.Model.EMotionComponent;

   type TErrorsArray is array (PositionX .. RotationZ) of float;

   function fGet_Pid_Errors(this : in CViewModel_Pid_Errors ; eErrorComponent : in EMotionComponent) return float;

   function fGet_Maximum_Error(this : in CViewModel_PID_Errors; eErrorComponent : in EMotionComponent) return float;

   function fGet_Minimum_Error(this : in CViewModel_PID_Errors; eErrorComponent : in EMotionComponent) return float;

   function fGet_Min_Max_Error_Diff(this : in CViewModel_PID_Errors; eErrorComponent : in EMotionComponent) return float;

   function fGet_OscilationTime(this : in CViewModel_PID_Errors; eErrorComponent : in EMotionComponent) return float;

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Pid_Errors;

   procedure Update_Min_Max_Error_Buffers(this : in out CViewModel_Pid_Errors);

   procedure Update_Delta_Time(this : in out CViewModel_Pid_Errors);

   procedure Reset_Min_Max_Error_Buffers(this : in out CViewModel_Pid_Errors);

   procedure Free(pxViewModel_Pid_Errors : in out pCViewModel_Pid_Errors);

private
    type CViewModel_Pid_Errors is tagged
      record
         pxModel : Simulator.Model.pCModel;

         tMaximumPIDErrors : TErrorsArray;
         tMinimumPIDErrors : TErrorsArray;
         tPreviousPIDErrors : TErrorsArray;
         tPreviousPIDErrorDirection : TErrorsArray;
         tLastHighPIDErrors : TErrorsArray;
         tLastLowPIDErrors : TErrorsArray;

         fCurrentOscTimeCounter : TErrorsArray;
         fOscTimes : TErrorsArray;
      end record;
end Simulator.ViewModel_Pid_Errors;
