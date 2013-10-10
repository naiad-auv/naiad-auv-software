with Navigation.Orientational_Controller;
with Navigation.Positional_Controller;
with Navigation.Thruster_Configurator;
with Navigation.Motion_Component;
with Math.Vectors;
with Navigation.PID_Controller;

package Navigation.Dispatcher is

   type CDispatcher is tagged private;
   type pCDispatcher is access CDispatcher;

   function pxCreate return pCDispatcher;

   function pxGet_New_Thruster_Control_Values(this : in out CDispatcher) return Navigation.Thruster_Configurator.TMovementVector;

   procedure Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponetToChange : Navigation.Motion_Component.EMotionComponent;xNewPIDSCalings : in Navigation.PID_Controller.TPIDComponentScalings);

   procedure Update_Current_Position(this : in out CDispatcher; xNewCurrentPosition : Math.Vectors.CVector);
   procedure Update_Wanted_Position(this : in out CDispatcher; xNewWantedPosition : Math.Vectors.CVector);

   procedure Update_Current_Orientation(this : in out CDispatcher; xNewCurrentOrientation : Math.Rotators.CRotator);
   procedure Update_Wanted_Orientation(this : in out CDispatcher; xNewWantedOrientation : Math.Rotators.CRotator);

   --borde hålla motorkonfigurationen

private

   type CDispatcher is tagged
      record

         pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThruster_Configurator;

         pxOrientationalController : Navigation.Orientational_Controller.pCOrientational_Controller;

         pxPositionalController : Navigation.Positional_Controller.pCPositional_Controller;

         pxCurrentPosition : Math.Vectors.pCVector;
         pxWantedPosition : Math.Vectors.pCVector;

         pxCurrentOrientation : Math.Rotators.pCRotator;
         pxWantedOrientation : Math.Rotators.pCRotator;
      end record;

end Navigation.Dispatcher;
