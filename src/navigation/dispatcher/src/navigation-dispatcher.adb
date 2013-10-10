package body Navigation.Dispatcher is

   function pxCreate return pCDispatcher is
   begin
      return null;
   end pxCreate;

   function pxGet_New_Thruster_Control_Values(this : in out CDispatcher) return Navigation.Thruster_Configurator.TMovementVector is
   	values : Navigation.Thruster_Configurator.TMovementVector;
   begin
      return values;
   end pxGet_New_Thruster_Control_Values;

   procedure Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponetToChange : Navigation.Motion_Component.EMotionComponent;xNewPIDSCalings : in Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      null;
   end Set_New_Component_PID_Scalings;


   procedure Update_Current_Position(this : in out CDispatcher; xNewCurrentPosition : Math.Vectors.CVector) is
   begin
      null;
   end Update_Current_Position;

   procedure Update_Wanted_Position(this : in out CDispatcher; xNewWantedPosition : Math.Vectors.CVector) is
   begin
      null;
   end Update_Wanted_Position;

   procedure Update_Current_Orientation(this : in out CDispatcher; xNewCurrentOrientation : Math.Rotators.CRotator) is
   begin
      null;
   end Update_Current_Orientation;

   procedure Update_Wanted_Orientation(this : in out CDispatcher; xNewWantedOrientation : Math.Rotators.CRotator) is
   begin
      null;
   end Update_Wanted_Orientation;

end Navigation.Dispatcher;
