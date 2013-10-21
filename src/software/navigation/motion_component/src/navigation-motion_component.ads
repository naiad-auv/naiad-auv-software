with Navigation;
with Navigation.PID_Controller;

package Navigation.Motion_Component is

   type CMotionComponent is tagged private;
   type pCMotionComponent is access CMotionComponent;

   type EMotionComponent is (Unknown, X, Y, Z, Direction, Plane, AllComponents);
   --  <summary>EMotionComponent is an enum with the range [Unknown, X, Y, Z, Direction, Plane, AllComponents].</summary>

   type TComponentControlValue is
      record
         fValue : float;
         xMotionComponent : EMotionComponent;
      end record;
   --  <summary>A PID Control value from the specified component.</summary>
   --  <parameter name="fValue">The controle value.</parameter>
   --  <parameter name="xMotionComponent">The component origin of the control value.</parameter>


   type TOrientationalControlValues is array (Direction .. Plane) of Navigation.Motion_Component.TComponentControlValue;
   --  <summary>TOrientationalControlValues of type TComponentControlValue in range [Direction, Plane].</summary>

   type TPositionalControlValues is array (X .. Z) of Navigation.Motion_Component.TComponentControlValue;
   --  <summary>TPositionalControlValues of type TComponentControlValue in range [X, Z].</summary>

   type TControlValues is array (X .. Plane) of Navigation.Motion_Component.TComponentControlValue;
   --  <summary>TControlValues of type TComponentControlValue in range [X, Plane].</summary>

   function pxCreate (eAxisIndex : EMotionComponent; xPIDScalings : Navigation.PID_Controller.TPIDComponentScalings) return pCMotionComponent;
   --  <summary>Creates an object of type CMotionComponent and sets the scaling components for the object in question</summary>
   --  <parameter name="xPIDScalings">The TPIDComponetScalings object to use as scaling components for the motion component.</parameter>
--  <parameter name="eAxisIndex">The index of the axis.</parameter>

   function xGet_New_Component_Control_Value(this : in out CMotionComponent; fDeltaTime : float) return TComponentControlValue;
   --  <summary>Calculates a new control value for a CMotionComponent</summary>
   --  <parameter name="this">The CMotionComponent to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>

   procedure Set_New_PID_Component_Scalings(this : in out CMotionComponent; xNewScalings : Navigation.PID_Controller.TPIDComponentScalings);
    --  <summary>Sets new component scalings on the CPIDcontroller in question</summary>
   --  <parameter name="this">The CMotionComponent object to set new scaling components upon.</parameter>
   --  <parameter name="xNewScalings">The TPIDComponetScalings object to set for the object.</parameter>

   procedure Update_Current_Error(this : in out CMotionComponent; fNewErrorValue : float);
   --  <summary>Updates the current error for the CMotionComponent in question.</summary>
   --  <parameter name="this">The CMotionComponent to update.</parameter>
   --  <parameter name="fNewErrorValue">The new error to set.</parameter>

   procedure Reset_Component(this : in out CMotionComponent);
   --  <summary>Resets a CMotionComponent to its initial values</summary>
   --  <parameter name="this">The CMotionComponent to reset.</parameter>

private

   type CMotionComponent is tagged
      record
         eComponentIndex : EMotionComponent;

         fCurrentError : float;

         xComponentPIDController : Navigation.PID_Controller.pCPIDController;
      end record;

end Navigation.Motion_Component;
