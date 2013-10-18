--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body simulator.submarine.CSubmarine_Test_Data is

   Local_CSubmarine : aliased GNATtest_Generated.GNATtest_Standard.simulator.submarine.CSubmarine;
   procedure Set_Up (Gnattest_T : in out Test_CSubmarine) is
   begin
      Gnattest_T.Fixture := Local_CSubmarine'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CSubmarine) is
   begin
      null;
   end Tear_Down;

end simulator.submarine.CSubmarine_Test_Data;
