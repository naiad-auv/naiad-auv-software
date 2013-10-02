package body Navigation.Positional_Controller is

   function pxCreate(pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThruster_Configurator) return pCPositional_Controller is
   begin
      return null;
   end pxCreate;


   function xGet_Positional_Thruster_Control_Values(this : in out CPositional_Controller) return TPositionalControlValues is
      val : TPositionalControlValues;
   begin
      return val;
   end xGet_Positional_Thruster_Control_Values;


   procedure Update_Current_Position(this : in out CPositional_Controller) is
   begin
      null;
   end Update_Current_Position;


   procedure Update_Wanted_Position(this : in out CPositional_Controller) is
   begin
      null;
   end Update_Wanted_Position;

   procedure Set_New_PID_Component_Scalings(this : in out CPositional_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      null;
   end Set_New_PID_Component_Scalings;

end Navigation.Positional_Controller;
