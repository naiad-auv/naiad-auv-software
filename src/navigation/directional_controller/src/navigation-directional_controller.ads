with Navigation.Motion_Component;
with Navigation.Thruster_Configurator;
with Navigation.PID_Controller;
with Math.Rotators;

package Navigation.Directional_Controller is

   type CDirectional_Controller is tagged private;
   type pCDirectional_Controller is access CDirectional_Controller;

   function pxCreate return pCDirectional_Controller;

   function xGet_New_Directional_Control_Value(this : in out pCDirectional_Controller) return Navigation.Motion_Component.TComponentControlValue;

   procedure Update_Current_Direction(this : in out CDirectional_Controller; xNewCurrentDirection : Math.Rotators.TAngle);
   procedure Update_Wanted_Direction(this : in out CDirectional_Controller; xNewWantedDirection : Math.Rotators.TAngle);

   procedure Set_New_PID_Component_Scalings(this : in out CDirectional_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);

private
   type CDirectional_Controller is tagged
      record

         fCurrentDirection : Math.Rotators.TAngle;
         fWantedAngle : Math.Rotators.TAngle;

         xYawMotionComponent : Navigation.Motion_Component.pCMotion_Component;

      end record;

end Navigation.Directional_Controller;
