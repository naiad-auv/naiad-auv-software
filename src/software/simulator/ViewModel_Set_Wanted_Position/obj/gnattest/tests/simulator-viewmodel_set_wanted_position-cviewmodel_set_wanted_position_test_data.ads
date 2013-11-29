--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position_Test_Data is

   type CViewmodel_Set_Wanted_Position_Access is access all GNATtest_Generated.GNATtest_Standard.simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position'Class;

--  begin read only
   type Test_CViewmodel_Set_Wanted_Position is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CViewmodel_Set_Wanted_Position_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CViewmodel_Set_Wanted_Position);
   procedure Tear_Down (Gnattest_T : in out Test_CViewmodel_Set_Wanted_Position);

end simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position_Test_Data;
