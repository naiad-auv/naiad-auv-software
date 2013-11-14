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
      when PositionX .. PositionZ =>
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

   procedure Update_Delta_Time(this : in out CViewModel_Pid_Errors) is
   begin
      for i in this.fCurrentOscTimeCounter'Range loop
         this.fCurrentOscTimeCounter(i) := this.fCurrentOscTimeCounter(i) + 0.01;
      end loop;

   end Update_Delta_Time;


   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Pid_Errors is
      pxNewViewModel : Simulator.ViewModel_Pid_Errors.pCViewModel_Pid_Errors;
   begin
      pxNewViewModel := new Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors;
      pxNewViewModel.pxModel := pxModel;

      pxNewViewModel.tMaximumPIDErrors := (others => 0.0);
      pxNewViewModel.tMinimumPIDErrors := (others => 0.0);
      pxNewViewModel.tPreviousPIDErrors := (others => 0.0);
      pxNewViewModel.tPreviousPIDErrorDirection := (others => 0.0);
      pxNewViewModel.fOscTimes := (others => 0.0);

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


   procedure Update_Min_Max_Error_Buffers(this : in out CViewModel_Pid_Errors) is
      xCurrentErrors : Navigation.Dispatcher.TMotionalErrors;
      xCurrentErrorDirections : Navigation.Dispatcher.TMotionalErrors;
      fTemp : float;
   begin
      xCurrentErrors := this.pxModel.xGet_Current_Motional_Errors;

      for i in xCurrentErrors'Range loop

         fTemp := xCurrentErrors(i) - this.tPreviousPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i));
         if abs(fTemp) = 0.0 then
            --            xCurrentErrorDirections(i) := 0.0;
            xCurrentErrorDirections(i) := this.tPreviousPIDErrorDirection(ViewModel_Pid_Errors.EMotionComponent(i));
         else
            xCurrentErrorDirections(i) := fTemp / abs(fTemp);
         end if;

         if xCurrentErrorDirections(i) > this.tPreviousPIDErrorDirection(ViewModel_Pid_Errors.EMotionComponent(i)) then
            this.tLastLowPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i)) := this.tPreviousPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i));
         end if;
         if xCurrentErrorDirections(i) < this.tPreviousPIDErrorDirection(ViewModel_Pid_Errors.EMotionComponent(i)) then
            this.fOscTimes(ViewModel_Pid_Errors.EMotionComponent(i)) := this.fCurrentOscTimeCounter(ViewModel_Pid_Errors.EMotionComponent(i));
            this.fCurrentOscTimeCounter(ViewModel_Pid_Errors.EMotionComponent(i)) := 0.0;
            this.tLastHighPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i)) := this.tPreviousPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i));
         end if;

         this.tPreviousPIDErrorDirection(ViewModel_Pid_Errors.EMotionComponent(i)) := xCurrentErrorDirections(i);


         if xCurrentErrors(i) > this.tMaximumPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i)) then
            this.tMaximumPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i)) := xCurrentErrors(i);
         end if;

         if xCurrentErrors(i) < this.tMinimumPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i)) then
            this.tMinimumPIDErrors(ViewModel_Pid_Errors.EMotionComponent(i)) := xCurrentErrors(i);
         end if;

         this.tPreviousPIDErrors((ViewModel_Pid_Errors.EMotionComponent(i))) := xCurrentErrors(i);
      end loop;


   end Update_Min_Max_Error_Buffers;

   function fGet_Maximum_Error(this : in CViewModel_PID_Errors; eErrorComponent : in EMotionComponent) return float is
   begin
      return this.tMaximumPIDErrors(eErrorComponent);
   end fGet_Maximum_Error;

   function fGet_Minimum_Error(this : in CViewModel_PID_Errors; eErrorComponent : in EMotionComponent) return float is
   begin
      return this.tMinimumPIDErrors(eErrorComponent);
   end fGet_Minimum_Error;

   function fGet_Min_Max_Error_Diff(this : in CViewModel_PID_Errors; eErrorComponent : in EMotionComponent) return float is
   begin
      return this.tLastHighPIDErrors(eErrorComponent) - this.tLastLowPIDErrors(eErrorComponent);
   end fGet_Min_Max_Error_Diff;

   function fGet_OscilationTime(this : in CViewModel_PID_Errors; eErrorComponent : in EMotionComponent) return float is
   begin
   	return this.fOscTimes(eErrorComponent);
   end fGet_OscilationTime;


   procedure Reset_Min_Max_Error_Buffers(this : in out CViewModel_PID_Errors) is
   begin
      this.tMaximumPIDErrors := (others => 0.0);
      this.tMinimumPIDErrors := (others => 0.0);
   end Reset_Min_Max_Error_Buffers;

end Simulator.ViewModel_Pid_Errors;
