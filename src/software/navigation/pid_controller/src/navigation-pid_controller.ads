with Navigation;
with Ada.Unchecked_Deallocation;


package Navigation.PID_Controller is

   type CPIDController is tagged private;
   type pCPIDController is access CPIDController;

   procedure Free(pxPIDControllerToDeallocate : in out pCPIDController);

   type TPIDComponentScalings is
	record
         fProportionalScale : float;
         fIntegralScale : float;
	 fDerivativeScale : float;
	end record;


   function pxCreate(xPIDComponentScalings : TPIDComponentScalings) return pCPIDController;
   --  <summary>Creates an object of type CPIDController and sets the scaling components for the object in question</summary>
   --  <parameter name="xPIDComponentScalings">The TPIDComponetScalings object to use as scaling components for the object.</parameter>

   procedure Set_New_Set_Point(this : in out CPIDController; fNewSetPoint : in float);
   --  <summary>Changes the value the PID controller should stabilize around</summary>
   --  <parameter name="this">The CPIDController object to set the value upon.</parameter>
   --  <parameter name="fNewSetPoint">The value to set.</parameter>

   procedure Set_New_PID_Component_Scalings(this : in out CPIDController; xNewScalings : TPIDComponentScalings);
   --  <summary>Sets new component scalings on the CPIDcontroller in question</summary>
   --  <parameter name="this">The CPIDController object to set new scaling components upon.</parameter>
   --  <parameter name="xNewScalings">The TPIDComponetScalings object to set for the object.</parameter>

   procedure Update_Current_Value_From_External_Source(this : in out CPIDController; fValue : float);
   --  <summary>Updates the current value on the CPIDController</summary>
   --  <parameter name="this">The CPIDController to update.</parameter>
   --  <parameter name="fValue">The new current value to set upon the CPIDController</parameter>

   procedure Reset_Controller(this : in out CPIDController);
   --  <summary>Resets a CPIDController to its initial values</summary>
   --  <parameter name="this">The CPIDController to reset.</parameter>

   function xGet_New_Control_Value(this : in out CPIDController; fDeltaTime : float) return float;
   --  <summary>Calculates a new control value for a CPIDController</summary>
   --  <parameter name="this">The CPIDController to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>

   function fGetIntergralScale(this : in out CPIDController) return float;
   --  <summary>Gets the scaling componet for the integral part.</summary>
   --  <parameter name=" : ">The CPIDController to retrive the scaling from.</parameter>

   function fGetDerivativeScale(this : in out CPIDController) return float;
   --  <summary>Gets the scaling componet for the derivative part.</summary>
   --  <parameter name=" : ">The CPIDController to retrive the scaling from.</parameter>

   function fGetProportionalScale(this : in out CPIDController) return float;
   --  <summary>Gets the scaling componet for the proportional part.</summary>
   --  <parameter name=" : ">The CPIDController to retrive the scaling from.</parameter>

private
   type CPIDController is tagged
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
