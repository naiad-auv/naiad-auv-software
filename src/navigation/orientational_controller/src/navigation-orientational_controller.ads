with Navigation.Planal_Controller;
with Navigation.Directional_Controller;
with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Math.Rotators;


package Navigation.Orientational_Controller is

   type COrientational_Controller is tagged private;
   type pCOrientational_Controller is access COrientational_Controller;

   function pxCreate return pCOrientational_Controller;
   function pxCreate(pxCurrentOrientation, pxWantedOrientation : in Math.Rotators.pCRotator) return pCOrientational_Controller;

   function xGet_Orientational_Thruster_Control_Values(this : in out COrientational_Controller) return Navigation.Motion_Component.TOrientational_Control_Values;

   procedure Update_Current_Orientation(this : in out COrientational_Controller; pxNewCurrentOrientation : Math.Rotators.pCRotator);
   procedure Update_Wanted_Orientation(this : in out COrientational_Controller; pxNewWantedOrientation : Math.Rotators.pCRotator);

   procedure Set_New_PID_Component_Scalings(this : in out COrientational_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);

private

   function xGet_Current_Directional_Component(this : in COrientational_Controller) return Math.Rotators.TAngle;
   function xGet_Wanted_Directional_Component(this : in COrientational_Controller) return Math.Rotators.TAngle;
   function xGet_Current_Planal_Components(this : in COrientational_Controller) return Navigation.Planal_Controller.TPlanalComponents;
   function xGet_Wanted_Planal_Components(this : in COrientational_Controller) return Navigation.Planal_Controller.TPlanalComponents;

   type COrientational_Controller is tagged
      record
         pxCurrentOrientation : Math.Rotators.pCRotator;
         pxWantedOrientation : Math.Rotators.pCRotator;

         pxPlanalController : Navigation.Planal_Controller.pCPlanal_Controller;
         pxDirectionalController : Navigation.Directional_Controller.pCDirectional_Controller;
      end record;
end Navigation.Orientational_Controller;
