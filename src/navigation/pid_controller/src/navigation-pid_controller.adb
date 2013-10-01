with Navigation;

package body Navigation.PID_Controller is

   procedure Update_Derivative_Part_Based_On_Tick(this : in out CPID_Controller; fDeltaTime : in float) is
   begin
      this.fCurrentDerivativePart := (this.fCurrentProportionalPart - this.fLastProportionalPart) / fDeltaTime;
   end Update_Derivative_Part_Based_On_Tick;

   procedure Update_Derivative_Part(this : in out CPID_Controller; fNewDerivativePart : in float) is
   begin
      this.fCurrentDerivativePart := fNewDerivativePart;
   end Update_Derivative_Part;

   function fNormalize_Float_Value(fValue : float) return float is
   begin
      return float'Min(float'Max(fvalue, -1.0), 1.0);
   end fNormalize_Float_Value;

   function pxCreate return pCPID_Controller is
   begin
      return new CPID_Controller;
   end pxCreate;

   function pxCreate(xPIDComponentScalings : TPIDComponentScalings) return pCPID_Controller is
      pCurrentController : pCPID_Controller;
      begin
         pCurrentController := PID_Controller.pxCreate;
         pCurrentController.Set_New_PID_Component_Scalings(xPIDComponentScalings.fDerivativeScale,xPIDComponentScalings.fIntegralScale,xPIDComponentScalings.fProportionalScale);
         return pCurrentController;
      end pxCreate;


      procedure Set_New_Set_Point(this : in out CPID_Controller; fNewSetPoint : in float) is
      begin
         this.fCurrentSetPoint := fNewSetPoint;
      end Set_New_Set_Point;


      procedure Set_New_PID_Component_Scalings(this : in out CPID_Controller; fDerivativeScale, fIntegralScale, fProportionalScale : float) is
      begin
         this.fDerivativeScale := fDerivativeScale;
         this.fIntegralScale := fIntegralScale;
         this.fProportionalScale := fProportionalScale;
      end Set_New_PID_Component_Scalings;


      procedure Update_Current_Value_From_External_Source(this : in out CPID_Controller; fValue : float) is
      begin
         this.fCurrentValue := fValue;
      end Update_Current_Value_From_External_Source;

      procedure Reset_Controller(this : in out CPID_Controller) is
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

      function xGet_New_Control_Value(this : in out CPID_Controller; fDeltaTime : float) return float is
         fLastError : float := this.fCurrentProportionalPart;
         output : float;
      begin
         this.fCurrentProportionalPart := this.fCurrentSetPoint - this.fCurrentValue;

         Update_Derivative_Part_Based_On_Tick(this, fDeltaTime);

         this.fCurrentIntegralPart := this.fCurrentIntegralPart + this.fCurrentProportionalPart;

         output := this.fCurrentIntegralPart * this.fIntegralScale + this.fCurrentDerivativePart * this.fDerivativeScale + this.fCurrentProportionalPart * this.fProportionalScale;

         return output;
      end xGet_New_Control_Value;


   end Navigation.PID_Controller;
