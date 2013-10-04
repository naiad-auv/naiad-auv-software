--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.Thruster_Configurator.CThruster_Configurator_Test_Data is

   Local_CThruster_Configurator : aliased GNATtest_Generated.GNATtest_Standard.Navigation.Thruster_Configurator.CThruster_Configurator;
   procedure Set_Up (Gnattest_T : in out Test_CThruster_Configurator) is
   begin
      Gnattest_T.Fixture := Local_CThruster_Configurator'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CThruster_Configurator) is
   begin
      null;
   end Tear_Down;

end Navigation.Thruster_Configurator.CThruster_Configurator_Test_Data;
