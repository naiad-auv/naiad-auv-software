with Navigation.Motion_Component;
with Math.Matrices;
with Math.Vectors;
with Navigation.Thrusters;

package Navigation.Thruster_Configurator is

   type CThrusterConfigurator is tagged private;
   type pCThrusterConfigurator is access CThrusterConfigurator;

   function pxCreate return pCThrusterConfigurator;

   function xGet_Final_Thruster_Power_Configuration(this : in CThrusterConfigurator) return float;
   function iGet_Number_Of_Thrusters (this : in CThrusterConfigurator) return integer;

private


   type CThrusterConfigurator is tagged
      record
         pxThrusterList : Navigation.Thrusters.pCThruster;

      end record;


end Navigation.Thruster_Configurator;
