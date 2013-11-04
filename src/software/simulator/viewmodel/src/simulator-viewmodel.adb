with Ada.Text_IO;
with ada.Unchecked_Deallocation;

package body Simulator.ViewModel is

   ----------
   -- Free --
   ----------

   procedure Free(pxViewModel : in out pCViewModel) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CViewModel, pCViewModel);
   begin
      simulator.Pid_Errors.Free(pxViewModel.pxPidErrors);
      Dealloc(pxViewModel);
   end;


   --------------
   -- pxCreate --
   --------------

   function pxCreate (pOwnerUpdateProcedure : pTProcedure) return pCViewModel is
      pxNewViewModel : Simulator.ViewModel.pCViewModel;

   begin
      pxNewViewModel := new Simulator.ViewModel.CViewModel;
      pxNewViewModel.pxPidErrors := Simulator.Pid_Errors.pxCreate;
  --    pxNewViewModel.pxModel := Simulator.Model.pxCreate(pOwnerUpdateProcedure => pxNewViewModel.Update_View_Model'Access);
      pxNewViewModel.pOwnerUpdateProcedure := pOwnerUpdateProcedure;

      return pxNewViewModel;
   end pxCreate;


   --------------
   -- pxCreate --
   --------------

    function pxCreate (pxModel : Simulator.Model.pCModel ; pOwnerUpdateProcedure : pTProcedure) return pcViewModel is
      pxNewViewModel : Simulator.ViewModel.pCViewModel;

   begin
      pxNewViewModel := new Simulator.ViewModel.CViewModel;
      pxNewViewModel.pxPidErrors := Simulator.Pid_Errors.pxCreate;
      pxNewViewModel.pxModel := pxModel;

      return pxNewViewModel;
   end pxCreate;

   -----------------------------------
   -- xGetSubmarineCurrentXPosition --
   -----------------------------------

   function xGet_Submarine_Current_Position(this : in CViewModel) return math.Vectors.CVector is
      xPositionVector : math.Vectors.CVector;
   begin
      xPositionVector := this.pxModel.xGet_Current_Submarine_Positional_Vector;
      return xPositionVector;
   end xGet_Submarine_Current_Position;


   ----------------------------------
   -- xGetSubmarineWantedXPosition --
   ----------------------------------

   function xGet_Submarine_Wanted_Position(this : in CViewModel) return math.Vectors.CVector is
      xWantedPositionVector : math.Vectors.CVector;
   begin
      xWantedPositionVector := this.pxModel.xGet_Wanted_Submarine_Positional_Vector;
      return xWantedPositionVector;
   end xGet_Submarine_Wanted_Position;


   --------------------------------------
   -- xGetSubmarineCurrentYOrientation --
   --------------------------------------

   function xGet_Submarine_Current_Orientation(this : in CViewModel) return math.Matrices.CMatrix is
      xCurrentOrientationMatrix : math.Matrices.CMatrix;
   begin
      xCurrentOrientationMatrix := this.pxModel.xGet_Current_Submarine_Orientation_Matrix;
      return xCurrentOrientationMatrix;
   end xGet_Submarine_Current_Orientation;

   -------------------------------------
   -- xGetSubmarineWantedXOrientation --
   -------------------------------------
   function xGet_Submarine_Wanted_Orientation(this : in CViewModel) return math.Matrices.CMatrix is
      xCurrentWantedMatrix : math.Matrices.CMatrix;
   begin
      xCurrentWantedMatrix := this.pxModel.xGet_Wanted_Submarine_Orientation_Matrix;
      return xCurrentWantedMatrix;
   end xGet_Submarine_Wanted_Orientation;

   ---------------------
   -- fGet_Pid_Errors --
   ---------------------

   function fGet_Pid_Errors(this : in CViewModel ; eErrorComponent : in EMotionComponent) return float is
   begin
      return this.pxPidErrors.fGet_PID_Error_For_Component(simulator.Pid_Errors.EMotionComponent(eErrorComponent));
   end fGet_Pid_Errors;

   -------------------------------------------------
   -- fGet_Selected_Pid_Scaling_Proprotional_Part --
   -------------------------------------------------

   function fGet_Selected_Pid_Scaling_Proprotional_Part(this : in CViewModel) return float is
   begin
      return this.txPidScalings(this.eSelectedPid).fProportionalScale;
   end fGet_Selected_Pid_Scaling_Proprotional_Part;

   ------------------------------------------------
   -- fGet_Selected_Pid_Scaling_Integrating_Part --
   ------------------------------------------------

   function fGet_Selected_Pid_Scaling_Integrating_Part(this : in CViewModel) return float is
   begin
      return this.txPidScalings(this.eSelectedPid).fIntegralScale;
   end fGet_Selected_Pid_Scaling_Integrating_Part;

   ------------------------------------------------
   -- fGet_Selected_Pid_Scaling_Derivative_Part --
   ------------------------------------------------

   function fGet_Selected_Pid_Scaling_Derivative_Part(this : in CViewModel) return float is
   begin
      return this.txPidScalings(this.eSelectedPid).fDerivativeScale;
   end fGet_Selected_Pid_Scaling_Derivative_Part;


   ----------------------
   -- Set_Selected_Pid --
   ----------------------

   procedure Set_Selected_Pid(this : in out CviewModel; eSelectedPid : EMotionComponent) is
   begin
      this.eSelectedPid := eSelectedPid;
   end Set_Selected_Pid;


   -------------------------------
   -- Set_Value_Of_Selected_Pid --
   -------------------------------

   procedure Set_Value_Of_Selected_Pid(this : in out CViewModel; fProporitonalPart : float; fIntegratingPart : float; fDerivativePart:float) is

   begin
      this.txPidScalings(this.eSelectedPid).fProportionalScale := fProporitonalPart;
      this.txPidScalings(this.eSelectedPid).fIntegralScale := fIntegratingPart;
      this.txPidScalings(this.eSelectedPid).fDerivativeScale := fDerivativePart;

      this.pxModel.Set_Pid_Scaling(xComponentScaling => simulator.Model.TPIDComponentScalings(this.txPidScalings(this.eSelectedPid)),
                                   eComponentToScale => simulator.Model.EMotionComponent(this.eSelectedPid));
   end Set_Value_Of_Selected_Pid;



   -----------------------
   -- Update_View_Model --
   -----------------------

   procedure Update_View_Model(this : in CViewModel) is
   begin
      this.pxPidErrors.Update_Errors(xCurrentAbsolutePosition    => this.pxModel.xGet_Current_Submarine_Positional_Vector,
                                     xWantedAbsolutePosition     => this.pxModel.xGet_Wanted_Submarine_Positional_Vector,
                                     xVelocityVector             => this.pxModel.xGet_Current_Submarine_Velocity_Vector,
                                     xCurrentAbsoluteOrientation => this.pxModel.xGet_Current_Submarine_Orientation_Matrix,
                                     xWantedAbsoluteOrientation  => this.pxModel.xGet_Wanted_Submarine_Orientation_Matrix);

      --this.pOwnerUpdateProcedure;
   end Update_View_Model;

   procedure Restart(this : in CViewModel) is

   begin
      this.pxModel.Restart;
      for i in this.txPidScalings'Range loop
         this.pxModel.Set_Pid_Scaling(xComponentScaling => simulator.Model.TPIDComponentScalings(this.txPidScalings(i)),
                                      eComponentToScale => simulator.Model.EMotionComponent(i));
      end loop;


   end Restart;



end Simulator.ViewModel;
