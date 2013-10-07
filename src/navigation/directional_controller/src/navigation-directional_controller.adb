package body Navigation.Directional_Controller is

   function pxCreate return pCDirectional_Controller is
      pxDirectionalController : pcDirectional_Controller;
      xPIDComponentScalings : Navigation.PID_Controller.TPIDComponentScalings := (0.0,0.0,0.0);
   begin

      pxDirectionalController := new CDirectional_Controller;

      pxDirectionalController.xYawMotionComponent := Navigation.Motion_Component.pxCreate(Navigation.Motion_Component.Yaw, xPIDComponentScalings);

      return pxDirectionalController;

   end pxCreate;


   function xGet_New_Directional_Control_Value (this : in out CDirectional_Controller; fDeltaTime : float) return Navigation.Motion_Component.TComponentControlValue is

   begin

      return this.xYawMotionComponent.xGet_New_Component_Control_Value(fDeltaTime);

   end xGet_New_Directional_Control_Value;


   procedure Update_Current_Direction(this : in out CDirectional_Controller; xNewCurrentDirection : Math.Rotators.TAngle) is
   begin
      this.xCurrentDirection := xNewCurrentDirection;
      this.xYawMotionComponent.Set_New_Current_Value(float(xNewCurrentDirection));
   end Update_Current_Direction;

   procedure Update_Wanted_Direction(this : in out CDirectional_Controller; xNewWantedDirection : Math.Rotators.TAngle) is
   begin
      this.xWantedDirection := xNewWantedDirection;
      this.xYawMotionComponent.Set_New_Wanted_Value(float(xNewWantedDirection));
   end Update_Wanted_Direction;

   procedure Set_New_PID_Component_Scalings(this : in out CDirectional_Controller; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      this.xYawMotionComponent.Set_New_PID_Component_Scalings(xNewPIDScaling);
   end Set_New_PID_Component_Scalings;


end Navigation.Directional_Controller;
