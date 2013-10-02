package body Navigation.Planal_Controller is

   function pxCreate(pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThruster_Configurator) return pCPlanal_Controller is
   begin
      return null;
   end pxCreate;

   function xGet_Planal_Thruster_Control_Values(this : in out CPlanal_Controller) return TPlanalControlValues is
      ABO : TPlanalControlValues;
   begin
      return ABO;
   end xGet_Planal_Thruster_Control_Values;


   procedure Update_Wanted_Plane(this : in out CPlanal_Controller; xWantedPlaneComponents : TPlanalComponents) is
   begin
      null;
   end Update_Wanted_Plane;

   procedure Update_Current_Plane(this : in out CPlanal_Controller; xCurrentPlaneComponents : TPlanalComponents) is
   begin
      null;
   end Update_Current_Plane;

   procedure Set_New_PID_Component_Scalings (this : in out CPlanal_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      null;
   end Set_New_PID_Component_Scalings;



end Navigation.Planal_Controller;
