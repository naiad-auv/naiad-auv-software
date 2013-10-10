with Navigation;
with Navigation.PID_Controller;

package Navigation.Motion_Component is

   type CMotion_Component is tagged private;
   type pCMotion_Component is access CMotion_Component;

   type EMotionComponent is (Unkown, X, Y, Z, Yaw, Pitch, Roll, Plane, AllComponents);

   type TComponentControlValue is
      record
         fValue : float;
         xMotionComponent : EMotionComponent;
      end record;

   type TOrientationalControlValues is array (1 .. 2) of Navigation.Motion_Component.TComponentControlValue;
   type TPositionalControlValues is array (1 .. 3) of Navigation.Motion_Component.TComponentControlValue;


   function pxCreate(eAxisIndex : EMotionComponent; xPID_Scalings : Navigation.PID_Controller.TPIDComponentScalings) return pCMotion_Component;

   function xGet_New_Component_Control_Value(this : in out CMotion_Component; fDeltaTime : float) return TComponentControlValue;

   procedure Set_New_PID_Component_Scalings(this : in out CMotion_Component; xPID_Component_Scalings : Navigation.PID_Controller.TPIDComponentScalings);

   procedure Update_Current_Error(this : in out CMotion_Component; fNewErrorValue : float);

   procedure Reset_Component(this : in out CMotion_Component);

private

   type CMotion_Component is tagged
      record
         eComponentIndex : EMotionComponent;

         fCurrentError : float;

         xComponentPIDController : Navigation.PID_Controller.pCPID_Controller;
      end record;

end Navigation.Motion_Component;
