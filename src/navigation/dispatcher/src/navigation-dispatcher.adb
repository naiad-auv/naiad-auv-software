package body Navigation.Dispatcher is

   function pxCreate return pCDispatcher is
   begin
      return null;
   end pxCreate;

   function pxGet_New_Thruster_Control_Values(this : in out CDispatcher) return Navigation.Motion_Component.TThruster_Control_Values is
   	values : Navigation.Motion_Component.TThruster_Control_Values;
   begin
      return values;
   end pxGet_New_Thruster_Control_Values;

   procedure Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponetToChange : Navigation.Motion_Component.EMotionComponent;xNewPIDSCalings : in Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      null;
   end Set_New_Component_PID_Scalings;

end Navigation.Dispatcher;
