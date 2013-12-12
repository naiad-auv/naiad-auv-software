--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position_Test_Data is

   Local_CViewmodel_Set_Wanted_Position : aliased GNATtest_Generated.GNATtest_Standard.simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position;
   procedure Set_Up (Gnattest_T : in out Test_CViewmodel_Set_Wanted_Position) is
   begin
      Gnattest_T.Fixture := Local_CViewmodel_Set_Wanted_Position'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CViewmodel_Set_Wanted_Position) is
   begin
      null;
   end Tear_Down;

end simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position_Test_Data;
