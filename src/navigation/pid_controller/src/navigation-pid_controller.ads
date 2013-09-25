with Navigation;

package Navigation.PID_Controller is

   type CPID_Controller is tagged private;
   type pCPID_Controller is access CPID_Controller;

   type TThrusterPowerPercentage is range -100 .. 100;

   function pxCreate return pCPID_Controller;

   procedure Set_New_Set_Point(this : in out CPID_Controller; fNewSetPoint : in float);

   procedure Set_New_PID_Component_Scalings(this : in out CPID_Controller; fDerivativeScale, fIntegralScale, fProportionalScale : float);

   procedure Update_Current_Value_From_External_Source(this : in out CPID_Controller; fValue : float);

   procedure Reset_Controller(this : in out CPID_Controller);

   function xGet_New_Control_Value(this : in out CPID_Controller) return TThrusterPowerPercentage;

   function xGet_New_Control_Value(this : in out CPID_Controller; fDeltaTime : float) return TThrusterPowerPercentage;


private
   type CPID_Controller is tagged
      record
         fCurrentValue : float;
         fCurrentSetPoint: float;

         fCurrentProportionalPart : float;
         fCurrentIntegralPart : float;
         fCurrentDerivativePart : float;

         fLastProportionalPart : float;

         fDerivativeScale : float;
         fIntegralScale : float;
         fProportionalScale : float;
      end record;

end Navigation.PID_Controller;
