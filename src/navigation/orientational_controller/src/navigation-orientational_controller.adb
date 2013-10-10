package body Navigation.Orientational_Controller is

   function pxCreate(pxCurrentOrientation, pxWantedOrientation : in Math.Rotators.pCRotator) return pCOrientational_Controller is

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientational_Controller;

   begin

      pxOrientationalController := new Navigation.Orientational_Controller.COrientational_Controller;

      pxOrientationalController.pxCurrentOrientation := pxCurrentOrientation;
      pxOrientationalController.pxWantedOrientation := pxWantedOrientation;

      pxOrientationalController.pxPlanalController := Navigation.Planal_Controller.pxCreate;

      pxOrientationalController.pxDirectionalController := Navigation.Directional_Controller.pxCreate;

      return pxOrientationalController;

   end pxCreate;

   function pxCreate return pCOrientational_Controller is
      pxOrientationalController : Navigation.Orientational_Controller.pCOrientational_Controller;

   begin

      pxOrientationalController := new Navigation.Orientational_Controller.COrientational_Controller;

      pxOrientationalController.pxCurrentOrientation := Math.Rotators.pxCreate(0.0,0.0,0.0);

      pxOrientationalController.pxWantedOrientation := Math.Rotators.pxCreate(0.0,0.0,0.0);

      pxOrientationalController.pxPlanalController := Navigation.Planal_Controller.pxCreate;

      pxOrientationalController.pxDirectionalController := Navigation.Directional_Controller.pxCreate;

      return pxOrientationalController;
   end pxCreate;

   function xGet_Orientational_Thruster_Control_Values (this : in out COrientational_Controller) return Navigation.Motion_Component.TOrientational_Control_Values is
      abo : Navigation.Motion_Component.TOrientational_Control_Values;
   begin
      return abo;
   end xGet_Orientational_Thruster_Control_Values;


   procedure Update_Current_Orientation (this : in out COrientational_Controller; pxNewCurrentOrientation : Math.Rotators.pCRotator) is
   begin
      this.pxCurrentOrientation := pxNewCurrentOrientation;

      this.pxPlanalController.Update_Current_Plane(this.xGet_Current_Planal_Components);
      this.pxDirectionalController.Update_Current_Direction(this.xGet_Current_Directional_Component);
   end Update_Current_Orientation;

   procedure Update_Wanted_Orientation (this : in out COrientational_Controller; pxNewWantedOrientation : Math.Rotators.pCRotator) is
   begin
      this.pxWantedOrientation := pxNewWantedOrientation;

      this.pxPlanalController.Update_Wanted_Plane(this.xGet_Wanted_Planal_Components);
      this.pxDirectionalController.Update_Wanted_Direction(this.xGet_Wanted_Directional_Component);
   end Update_Wanted_Orientation;


   procedure Set_New_PID_Component_Scalings(this : in out COrientational_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      null;
   end Set_New_PID_Component_Scalings;


   function xGet_Current_Directional_Component(this : in COrientational_Controller) return Math.Rotators.TAngle is
   begin
      return this.pxCurrentOrientation.tfGet_Yaw;
   end xGet_Current_Directional_Component;

   function xGet_Wanted_Directional_Component(this : in COrientational_Controller) return Math.Rotators.TAngle is
   begin
      return this.pxWantedOrientation.tfGet_Yaw;
   end xGet_Wanted_Directional_Component;

   function xGet_Current_Planal_Components(this : in COrientational_Controller) return Navigation.Planal_Controller.TPlanalComponents is
   begin
      return Navigation.Planal_Controller.TPlanalComponents'(this.pxCurrentOrientation.tfGet_Pitch,this.pxCurrentOrientation.tfGet_Roll);
   end xGet_Current_Planal_Components;

   function xGet_Wanted_Planal_Components(this : in COrientational_Controller) return Navigation.Planal_Controller.TPlanalComponents is
   begin
      return Navigation.Planal_Controller.TPlanalComponents'(this.pxWantedOrientation.tfGet_Pitch,this.pxWantedOrientation.tfGet_Roll);
   end xGet_Wanted_Planal_Components;



end Navigation.Orientational_Controller;
