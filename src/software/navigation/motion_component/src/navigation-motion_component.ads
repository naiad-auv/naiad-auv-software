with Navigation;
with Navigation.PID_Controller;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;

package Navigation.Motion_Component is

   type CMotionComponent is new Ada.Finalization.Controlled with private;
   type pCMotionComponent is access CMotionComponent;

   procedure Free(pxMotionComponentToDeallocate : in out pCMotionComponent);


   type EMotionComponent is (PositionX, PositionY, PositionZ, RotationX, RotationY, RotationZ, AllComponents, AllRotation, AllPosition);
   --  <summary>EMotionComponent is an enum with the range [Unknown, X, Y, Z, Direction, Plane, AllComponents].</summary>

   function pxCreate (eAxisIndex : EMotionComponent; xPIDScalings : Navigation.PID_Controller.TPIDComponentScalings) return pCMotionComponent;
   --  <summary>Creates an object of type CMotionComponent and sets the scaling components for the object in question</summary>
   --  <parameter name="xPIDScalings">The TPIDComponetScalings object to use as scaling components for the motion component.</parameter>
--  <parameter name="eAxisIndex">The index of the axis.</parameter>

   function fGet_New_Component_Control_Value (this : in CMotionComponent; fDeltaTime : float) return float;
   --  <summary>Calculates a new control value for a CMotionComponent</summary>
   --  <parameter name="this">The CMotionComponent to do the calculations upon.</parameter>
   --  <parameter name="fDeltaTime">The time difference since the last calculation.</parameter>

   procedure Set_New_PID_Component_Scalings(this : in CMotionComponent; xNewScalings : Navigation.PID_Controller.TPIDComponentScalings);
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

   function fGetCurrentError(this : in CMotionComponent) return float;

private

   type CMotionComponent is new Ada.Finalization.Controlled with
      record
         eComponentIndex : EMotionComponent;

         fCurrentError : float;

         pxComponentPIDController : Navigation.PID_Controller.pCPIDController;
      end record;

   procedure Finalize(this : in out CMotionComponent);

end Navigation.Motion_Component;
