package body Navigation.Orientational_Controller is

   function pxCreate(pxCurrentOrientation, pxWantedOrientation : in Math.Rotators.pCRotator) return pCOrientational_Controller is
   begin
      return null;
   end pxCreate;

   function xGet_Orientational_Thruster_Control_Values(this : in out COrientational_Controller) return Navigation.Motion_Component.TUnflitered_Thruster_Control_Values is
      abo : Navigation.Motion_Component.TUnflitered_Thruster_Control_Values;
   begin
      return abo;
   end xGet_Orientational_Thruster_Control_Values;


   procedure Update_Current_Orientation(this : in out COrientational_Controller) is
   begin
      null;
   end Update_Current_Orientation;

   procedure Update_Wanted_Orientation(this : in out COrientational_Controller) is
   begin
      null;
   end Update_Wanted_Orientation;


   procedure Set_New_PID_Component_Scalings(this : in out COrientational_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      null;
   end Set_New_PID_Component_Scalings;


   function fGet_Current_Directional_Component(this : in COrientational_Controller) return float is
   begin
      return 0.0;
   end fGet_Current_Directional_Component;

   function fGet_Wanted_Directional_Component(this : in COrientational_Controller) return float is
   begin
      return 0.0;
   end fGet_Wanted_Directional_Component;

   function xGet_Current_Planal_Components(this : in COrientational_Controller) return Navigation.Planal_Controller.TPlanalComponents is
      val : Navigation.Planal_Controller.TPlanalComponents;
   begin
      return val;
   end xGet_Current_Planal_Components;

   function xGet_Wanted_Planal_Components(this : in COrientational_Controller) return Navigation.Planal_Controller.TPlanalComponents is
      val : Navigation.Planal_Controller.TPlanalComponents;
   begin
      return val;
   end xGet_Wanted_Planal_Components;



end Navigation.Orientational_Controller;
