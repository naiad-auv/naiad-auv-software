with Navigation.PID_Controller;
with Navigation.Motion_Component;
with Navigation.Thruster_Configurator;
with Math.Planes;
with Math.Vectors;
with Math.Angles;

package Navigation.Planal_Controller is

   type CPlanalController is tagged private;
   type pCPlanalController is access CPlanalController;

   function pxCreate return pCPlanalController;

   function xGet_Planal_Thruster_Control_Values(this : in out CPlanalController) return Navigation.Motion_Component.TComponentControlValue;

   procedure Update_Wanted_Plane(this : in out CPlanalController; xWantedPlaneComponents : Math.Planes.pCPlane);
   procedure Update_Current_Plane(this : in out CPlanalController; xCurrentPlaneComponents : Math.Planes.pCPlane);

   procedure Set_New_PID_Component_Scalings(this : in out CPlanalController; eComponentToUpdate : Navigation.Motion_Component.EMotionComponent; xNewPIDScaling : Navigation.PID_Controller.TPIDComponentScalings);


private
   type CPlanalController is tagged
      record

         pxCurrentPlane : Math.Planes.pCPlane;
         pxWantedPlane : Math.Planes.pCPlane;

         pxPlanalMotionComponent : Navigation.Motion_Component.pCMotion_Component;

      end record;
end Navigation.Planal_Controller;
