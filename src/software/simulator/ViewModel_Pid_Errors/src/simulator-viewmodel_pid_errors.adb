with Exception_Handling; use Exception_Handling;
with ada.Unchecked_Deallocation;
with Navigation.Motion_Component;
with Navigation.Dispatcher;
with Ada.Text_IO;
with Ada.Exceptions;
with Ada.Numerics;

package body Simulator.ViewModel_Pid_Errors is


   ---------------------
   -- fGet_Pid_Errors --
   ---------------------

   function fGet_Pid_Errors(this : in CViewModel_Pid_Errors ; eErrorComponent : in EMotionComponent) return float is
      xMotionalErrors : Navigation.Dispatcher.TMotionalErrors;
   begin
      xMotionalErrors := this.pxModel.xGet_Current_Motional_Errors;

      case eErrorComponent is
      when X .. Z =>
         return xMotionalErrors(Navigation.Motion_Component.EMotionComponent(eErrorComponent));
         when others =>
            null;
      end case;

      return xMotionalErrors(Navigation.Motion_Component.EMotionComponent(eErrorComponent)) * 180.0 / Ada.Numerics.Pi;
   exception
      when E : others =>
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Message(E));
         Exception_Handling.Unhandled_Exception(E);
         return 0.0;

   end fGet_Pid_Errors;

   --------------
   -- pxCreate --
   --------------

    function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Pid_Errors is
      pxNewViewModel : Simulator.ViewModel_Pid_Errors.pCViewModel_Pid_Errors;

   begin
      pxNewViewModel := new Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors;
    --  pxNewViewModel.pxPidErrors := Simulator.Pid_Errors.pxCreate;
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
   --   simulator.Pid_Errors.Free(pxViewModel_Pid_Errors.pxPidErrors);
      Dealloc(pxViewModel_Pid_Errors);
   end;

end Simulator.ViewModel_Pid_Errors;
