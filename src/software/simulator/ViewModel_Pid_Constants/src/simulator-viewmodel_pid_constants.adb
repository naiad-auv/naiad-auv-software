with Exception_Handling;
with ada.Unchecked_Deallocation;
package body Simulator.Viewmodel_Pid_Constants is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewmodel_Pid_Constants
   is
      pxNewViewModel : Simulator.Viewmodel_Pid_Constants.pCViewmodel_Pid_Constants;

   begin
      pxNewViewModel := new CViewmodel_Pid_Constants;
      pxNewViewModel.pxModel := pxModel;

      pxNewViewModel.txPidScalings := txPIDComponentScalingArray'(others => (0.0, 0.0, 0.0));

      return pxNewViewModel;
   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return null;
   end pxCreate;
   ----------
   -- Free --
   ----------

   procedure Free(pxViewmodel_Pid_Constants : in out pCViewmodel_Pid_Constants)is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CViewmodel_Pid_Constants, pCViewmodel_Pid_Constants);
   begin
      Dealloc(pxViewmodel_Pid_Constants);
   end;
   ----------------------
   -- Set_Selected_Pid --
   ----------------------

   procedure Set_Selected_Pid
     (this : in out CViewmodel_Pid_Constants;
      eSelectedPid : EMotionComponent)
   is
   begin
      this.eSelectedPid := eSelectedPid;
            exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
   end Set_Selected_Pid;

   -------------------------------
   -- Set_Value_Of_Selected_Pid --
   -------------------------------

   procedure Set_Value_Of_Selected_Pid
     (this : in out CViewmodel_Pid_Constants;
      fProporitonalPart : float;
      fIntegratingPart : float;
      fDerivativePart:float)
   is
   begin
      this.txPidScalings(this.eSelectedPid).fProportionalScale := fProporitonalPart;
      this.txPidScalings(this.eSelectedPid).fIntegralScale := fIntegratingPart;
      this.txPidScalings(this.eSelectedPid).fDerivativeScale := fDerivativePart;

      this.pxModel.Set_Pid_Scaling(xComponentScaling => simulator.Model.TPIDComponentScalings(this.txPidScalings(this.eSelectedPid)),
                                   eComponentToScale => simulator.Model.EMotionComponent(this.eSelectedPid));
            exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
   end Set_Value_Of_Selected_Pid;


   -------------------------------------------------
   -- fGet_Selected_Pid_Scaling_Proprotional_Part --
   -------------------------------------------------

   function fGet_Selected_Pid_Scaling_Proprotional_Part(this : in CViewmodel_Pid_Constants) return float is
   begin
      return this.txPidScalings(this.eSelectedPid).fProportionalScale;

   exception
      when E : others =>
         return 0.0;
   end fGet_Selected_Pid_Scaling_Proprotional_Part;

   ------------------------------------------------
   -- fGet_Selected_Pid_Scaling_Integrating_Part --
   ------------------------------------------------

   function fGet_Selected_Pid_Scaling_Integrating_Part(this : in CViewmodel_Pid_Constants) return float is
   begin
      return this.txPidScalings(this.eSelectedPid).fIntegralScale;
      exception
      when E : others =>
         return 0.0;
   end fGet_Selected_Pid_Scaling_Integrating_Part;

   ------------------------------------------------
   -- fGet_Selected_Pid_Scaling_Derivative_Part --
   ------------------------------------------------

   function fGet_Selected_Pid_Scaling_Derivative_Part(this : in CViewmodel_Pid_Constants) return float is
   begin
      return this.txPidScalings(this.eSelectedPid).fDerivativeScale;
            exception
      when E : others =>
         return 0.0;
   end fGet_Selected_Pid_Scaling_Derivative_Part;


end Simulator.Viewmodel_Pid_Constants;
