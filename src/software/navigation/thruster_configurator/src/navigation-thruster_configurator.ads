with Navigation.Motion_Component;
with Math.Matrices;
with Math.Vectors;
with Navigation.Thrusters;

package Navigation.Thruster_Configurator is

   type CThrusterConfigurator is tagged private;
   type pCThrusterConfigurator is access CThrusterConfigurator;

   type TExtendedMatrix is array(POSITIVE range <>, POSITIVE range <>) of float;


   function pxCreate return pCThrusterConfigurator;

   function iGet_Number_Of_Thrusters (this : in CThrusterConfigurator) return integer;
   function xGet_Final_Thruster_Power_Configuration(this : in CThrusterConfigurator) return float;
   function tfGet_Thruster_Effects_Matrix (this : in CThrusterConfigurator) return Navigation.Thrusters.TThrusterEffectsMatrix;

   function tfGet_Thruster_Values(this : in CThrusterConfigurator; tfComponentValues : in Navigation.Thrusters.TThrusterEffects) return Navigation.Thrusters.TThrusterValuesArray;

private


   type CThrusterConfigurator is tagged
      record
         pxThrusterList : Navigation.Thrusters.pCThruster;

      end record;


end Navigation.Thruster_Configurator;
