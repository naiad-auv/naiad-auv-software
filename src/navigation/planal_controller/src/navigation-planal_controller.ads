with Navigation.PID_Controller;
with Navigation.Motion_Component;
with Navigation.Thruster_Configurator;
with Math.Planes;
with Math.Rotators;

package Navigation.Planal_Controller is

   type CPlanal_Controller is tagged private;
   type pCPlanal_Controller is access CPlanal_Controller;

   type TPlanalComponents is array (1..2) of Math.Rotators.TAngle;

   type TPlanalControlValues is array (1..2) of Navigation.Motion_Component.TUnflitered_Thruster_Control_Values;

   function pxCreate(pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThruster_Configurator) return pCPlanal_Controller;

   function xGet_Planal_Thruster_Control_Values(this : in out CPlanal_Controller) return TPlanalControlValues;

   procedure Update_Wanted_Plane(this : in out CPlanal_Controller; xWantedPlaneComponents : TPlanalComponents);
   procedure Update_Current_Plane(this : in out CPlanal_Controller; xCurrentPlaneComponents : TPlanalComponents);

   procedure Set_New_PID_Component_Scalings(this : in out CPlanal_Controller; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);


private
   type CPlanal_Controller is tagged
      record

         pxCurrentPlane : Math.Planes.pCPlane;
         pxWantedPlane : Math.Planes.pCPlane;

         pxPitchMotionComponent : Navigation.Motion_Component.pCMotion_Component;
         pxRollMotionComponent : Navigation.Motion_Component.pCMotion_Component;

      end record;

end Navigation.Planal_Controller;
