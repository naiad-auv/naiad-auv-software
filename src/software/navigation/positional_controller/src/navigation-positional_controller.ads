with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Math.Vectors;

package Navigation.Positional_Controller is

   type CPositional_Controller is tagged private;
   type pCPositional_Controller is access CPositional_Controller;

   function pxCreate return pCPositional_Controller;

   function xGet_Positional_Thruster_Control_Values(this : in out CPositional_Controller; fDeltaTime : float) return Navigation.Motion_Component.TPositionalControlValues;

   procedure Update_Wanted_Position(this : in out CPositional_Controller; pxNewWantedPosition : Math.Vectors.pCVector);

   procedure Set_New_PID_Component_Scalings(this : in out CPositional_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);

private
   type CPositional_Controller is tagged
      record

         pxWantedPosition : Math.Vectors.pCVector;

         pxXMotionComponent : Navigation.Motion_Component.pCMotion_Component;
         pxYMotionComponent : Navigation.Motion_Component.pCMotion_Component;
         pxZMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      end record;

end Navigation.Positional_Controller;
