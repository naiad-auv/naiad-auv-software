with Navigation.Thruster_Configurator;
with Navigation.Motion_Component;
with Navigation.PID_Controller;
with Math.Vectors;

package Navigation.Positional_Controller is

   type CPositional_Controller is tagged private;
   type pCPositional_Controller is access CPositional_Controller;

   type TPositionalControlValues is array (1..3) of Navigation.Motion_Component.TUnflitered_Thruster_Control_Values;

   function pxCreate(pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThruster_Configurator) return pCPositional_Controller;

   function xGet_Positional_Thruster_Control_Values(this : in out CPositional_Controller) return TPositionalControlValues;

   procedure Update_Current_Position(this : in out CPositional_Controller);
   procedure Update_Wanted_Position(this : in out CPositional_Controller);

   procedure Set_New_PID_Component_Scalings(this : in out CPositional_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);

private
   type CPositional_Controller is tagged
      record

         pxCurrentPosition : Math.Vectors.pCVector;
         pxWantedPosition : Math.Vectors.pCVector;

         pxXMotionComponent : Navigation.Motion_Component.pCMotion_Component;
         pxYMotionComponent : Navigation.Motion_Component.pCMotion_Component;
         pxZMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      end record;


end Navigation.Positional_Controller;
