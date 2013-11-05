with Ada.Text_IO;
with Navigation;

package body Navigation.PID_Controller is

   procedure Update_Derivative_Part_Based_On_Tick(this : in out CPIDController; fDeltaTime : in float) is
   begin
      this.fCurrentDerivativePart := (this.fCurrentProportionalPart - this.fLastProportionalPart) / fDeltaTime;
   end Update_Derivative_Part_Based_On_Tick;

   procedure Update_Derivative_Part(this : in out CPIDController; fNewDerivativePart : in float) is
   begin
      this.fCurrentDerivativePart := fNewDerivativePart;
   end Update_Derivative_Part;

   function fNormalize_Float_Value(fValue : float) return float is
   begin
      return float'Min(float'Max(fvalue, -1.0), 1.0);
   end fNormalize_Float_Value;


   function pxCreate(xPIDComponentScalings : TPIDComponentScalings) return pCPIDController is
      pCurrentController : pCPIDController;
   begin
      pCurrentController := new CPIDController;
      pCurrentController.Reset_Controller;
      pCurrentController.Set_New_PID_Component_Scalings(xPIDComponentScalings);
      return pCurrentController;
   end pxCreate;


   procedure Set_New_Set_Point(this : in out CPIDController; fNewSetPoint : in float) is
   begin
      this.fCurrentSetPoint := fNewSetPoint;
   end Set_New_Set_Point;

   procedure Set_New_PID_Component_Scalings(this : in out CPIDController; xNewScalings : TPIDComponentScalings) is
   begin
      this.fProportionalScale := xNewScalings.fProportionalScale;
      this.fIntegralScale := xNewScalings.fIntegralScale;
      this.fDerivativeScale := xNewScalings.fDerivativeScale;
   end Set_New_PID_Component_Scalings;



   procedure Update_Current_Value_From_External_Source(this : in out CPIDController; fValue : float) is
   begin
      this.fCurrentValue := fValue;
   end Update_Current_Value_From_External_Source;

   procedure Reset_Controller(this : in out CPIDController) is
   begin
      this.fCurrentValue := 0.0;
      this.fCurrentSetPoint := 0.0;

      this.fCurrentProportionalPart := 0.0;
      this.fCurrentIntegralPart := 0.0;
      this.fCurrentDerivativePart := 0.0;

      this.fLastProportionalPart := 0.0;

      this.fDerivativeScale := 0.0;
      this.fIntegralScale := 0.0;
      this.fProportionalScale := 0.0;
   end Reset_Controller;

   function xGet_New_Control_Value (this : in out CPIDController; fDeltaTime : float) return float is
      fLastError : float := this.fCurrentProportionalPart;
      output : float;
   begin


      this.fCurrentProportionalPart := this.fCurrentSetPoint - this.fCurrentValue;


      Update_Derivative_Part_Based_On_Tick(this, fDeltaTime);

      this.fCurrentIntegralPart := this.fCurrentIntegralPart + this.fCurrentProportionalPart;


      output := this.fCurrentIntegralPart * this.fIntegralScale + this.fCurrentDerivativePart * this.fDerivativeScale + this.fCurrentProportionalPart * this.fProportionalScale;

      this.fLastProportionalPart := this.fCurrentProportionalPart;

      return output;
   end xGet_New_Control_Value;


   function fGetIntergralScale (this : in CPIDController) return float is
   begin
      return this.fIntegralScale;
   end fGetIntergralScale;

   function fGetDerivativeScale (this : in CPIDController) return float is
   begin
      return this.fDerivativeScale;
   end fGetDerivativeScale;

   function fGetProportionalScale (this : in CPIDController) return float is
   begin
      return this.fProportionalScale;
   end fGetProportionalScale;

   procedure Free(pxPIDControllerToDeallocate : in out pCPIDController) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CPIDController, pCPIDController);
   begin
      Dealloc(pxPIDControllerToDeallocate);
   end Free;

end Navigation.PID_Controller;
