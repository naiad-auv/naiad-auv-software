with Navigation;
with Navigation.PID_Controller;
with Navigation.Thruster_Configurator;

package Navigation.Motion_Component is

   type CMotion_Component is tagged private;
   type pCMotion_Component is access CMotion_Component;

   type EMotionComponent is (Unkown, X, Y, Z, Yaw, Pitch, Roll);

   type TUnflitered_Thruster_Control_Values is array (1 .. 10) of float;

   type TThrusterForceDistribution is array (1..10) of float range -1.0 .. 1.0;

   function pxCreate(eAxisIndex : EMotionComponent; xPID_Scalings : Navigation.PID_Controller.TPIDComponentScalings; pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThruster_Configurator) return pCMotion_Component;

   function xGet_New_Thruster_Control_Values(this : in out CMotion_Component) return TUnflitered_Thruster_Control_Values;

   procedure Set_New_PID_Component_Scalings(this : in out CMotion_Component; xPID_Component_Scalings : Navigation.PID_Controller.TPIDComponentScalings);

   procedure Set_New_Wanted_Value(this : in out CMotion_Component; fNewValue : float);

   procedure Set_New_Current_Value(this : in out CMotion_Component; fNewValue : float);

   procedure Reset_Component(this : in out CMotion_Component);

private

   type CMotion_Component is tagged
      record
         eComponentIndex : EMotionComponent;

         fCurrentValue : float;
         fWantedValue : float;

         xComponentPIDController : Navigation.PID_Controller.pCPID_Controller;

         pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThruster_Configurator;

         xThrusterForceDistribution : TThrusterForceDistribution;
      end record;

end Navigation.Motion_Component;
