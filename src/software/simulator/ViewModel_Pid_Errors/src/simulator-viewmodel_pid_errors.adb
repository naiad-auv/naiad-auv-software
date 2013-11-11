with Exception_Handling; use Exception_Handling;
with ada.Unchecked_Deallocation;
package body Simulator.ViewModel_Pid_Errors is


   ---------------------
   -- fGet_Pid_Errors --
   ---------------------

   function fGet_Pid_Errors(this : in CViewModel_Pid_Errors ; eErrorComponent : in EMotionComponent) return float is
   begin
      return this.pxPidErrors.fGet_PID_Error_For_Component(simulator.Pid_Errors.EMotionComponent(eErrorComponent));
               exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return this.pxPidErrors.fGet_PID_Error_For_Component(simulator.Pid_Errors.EMotionComponent(eErrorComponent));

   end fGet_Pid_Errors;

   --------------
   -- pxCreate --
   --------------

    function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Pid_Errors is
      pxNewViewModel : Simulator.ViewModel_Pid_Errors.pCViewModel_Pid_Errors;

   begin
      pxNewViewModel := new Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors;
      pxNewViewModel.pxPidErrors := Simulator.Pid_Errors.pxCreate;
      pxNewViewModel.pxModel := pxModel;

      return pxNewViewModel;
         exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return null;
   end pxCreate;


   ----------
   -- Free --
   ----------

   procedure Free(pxViewModel_Pid_Errors : in out pCViewModel_Pid_Errors) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CViewModel_Pid_Errors, pCViewModel_Pid_Errors);
   begin
      simulator.Pid_Errors.Free(pxViewModel_Pid_Errors.pxPidErrors);
      Dealloc(pxViewModel_Pid_Errors);
   end;

   ----------------------------------
   -- Update_View_Model_Pid_Errors --
   ----------------------------------

   procedure Update_View_Model_Pid_Errors(this : in CViewModel_Pid_Errors; fDeltaTime : in float) is
   begin
      this.pxPidErrors.Update_Errors(xCurrentAbsolutePosition    => this.pxModel.xGet_Current_Submarine_Positional_Vector,
                                     xWantedAbsolutePosition     => this.pxModel.xGet_Wanted_Submarine_Positional_Vector,
                                     xVelocityVector             => this.pxModel.xGet_Current_Submarine_Velocity_Vector,
                                     xCurrentAbsoluteOrientation => this.pxModel.xGet_Current_Submarine_Orientation_Matrix,
                                     xWantedAbsoluteOrientation  => this.pxModel.xGet_Wanted_Submarine_Orientation_Matrix);
      this.pxModel.Update_Model(fDeltaTime => fDeltaTime);
            exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
   end Update_View_Model_Pid_Errors;

end Simulator.ViewModel_Pid_Errors;
