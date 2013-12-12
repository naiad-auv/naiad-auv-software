--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data is

   Local_CViewModel_Wanted_Pos : aliased GNATtest_Generated.GNATtest_Standard.simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos;
   procedure Set_Up (Gnattest_T : in out Test_CViewModel_Wanted_Pos) is
   begin
      Gnattest_T.Fixture := Local_CViewModel_Wanted_Pos'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CViewModel_Wanted_Pos) is
   begin
      null;
   end Tear_Down;

end simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data;
