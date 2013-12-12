--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data is

   type CViewModel_Wanted_Pos_Access is access all GNATtest_Generated.GNATtest_Standard.simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos'Class;

--  begin read only
   type Test_CViewModel_Wanted_Pos is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CViewModel_Wanted_Pos_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CViewModel_Wanted_Pos);
   procedure Tear_Down (Gnattest_T : in out Test_CViewModel_Wanted_Pos);

end simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data;
