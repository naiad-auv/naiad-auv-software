with Navigation.Motion_Component;
with Math.Matrices;
with Math.Vectors;

package Navigation.Thruster_Configurator is

   type CThruster_Configurator is tagged private;
   type pCThruster_Configurator is access CThruster_Configurator;


   type TiThrusterIndex is new integer range 1 .. 6;

   type TThrusterEffects is array (Navigation.Motion_Component.EMotionComponent'First .. Navigation.Motion_Component.EMotionComponent'Last) of float;
   type TThrusterConfiguration is array (TiThrusterIndex'First .. TiThrusterIndex'Last) of TThrusterEffects;

   type TMovementVector is array (Navigation.Motion_Component.EMotionComponent'First .. Navigation.Motion_Component.EMotionComponent'Last) of float;

   function pxCreate return pCThruster_Configurator;


   procedure Configure_Thruster_Effects(this : in out CThruster_Configurator; xThrusterToConfigure : TiThrusterIndex; xThrusterConfiguration : TThrusterConfiguration);

   function xGet_Final_Thruster_Power_Configuration(this : in CThruster_Configurator) return float;

private

   type CThruster_Configurator is tagged
      record



         xThrusterConfiguration : TThrusterConfiguration;

      end record;


end Navigation.Thruster_Configurator;
