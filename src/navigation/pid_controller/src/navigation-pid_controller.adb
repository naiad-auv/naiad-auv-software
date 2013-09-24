with Navigation;

package body Navigation.PID_Controller is

   function pxCreate return pCPID_Controller is
   begin
      return new CPID_Controller;
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


function xGet_New_Control_Value(this : in out CPID_Controller) return TThrusterPowerPercentage is
begin
   return 1;
end xGet_New_Control_Value;


function xGet_New_Control_Value(this : in out CPID_Controller; fDeltaTime : float) return TThrusterPowerPercentage is
begin
   return 1;
end xGet_New_Control_Value;

end Navigation.PID_Controller;
