--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.Thruster_Configurator.CThrusterConfigurator_Test_Data is

   Local_CThrusterConfigurator : aliased GNATtest_Generated.GNATtest_Standard.Navigation.Thruster_Configurator.CThrusterConfigurator;
   procedure Set_Up (Gnattest_T : in out Test_CThrusterConfigurator) is
   begin
      Gnattest_T.Fixture := Local_CThrusterConfigurator'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CThrusterConfigurator) is
   begin
      null;
   end Tear_Down;

end Navigation.Thruster_Configurator.CThrusterConfigurator_Test_Data;
