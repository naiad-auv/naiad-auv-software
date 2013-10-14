--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Navigation.Thruster_Configurator.CThruster_Configurator_Test_Data is

   type CThruster_Configurator_Access is access all GNATtest_Generated.GNATtest_Standard.Navigation.Thruster_Configurator.CThruster_Configurator'Class;

--  begin read only
   type Test_CThruster_Configurator is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CThruster_Configurator_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CThruster_Configurator);
   procedure Tear_Down (Gnattest_T : in out Test_CThruster_Configurator);

end Navigation.Thruster_Configurator.CThruster_Configurator_Test_Data;
