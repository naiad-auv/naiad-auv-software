--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Math.Rotators.CRotator_Test_Data is

   Local_CRotator : aliased GNATtest_Generated.GNATtest_Standard.Math.Rotators.CRotator;
   procedure Set_Up (Gnattest_T : in out Test_CRotator) is
   begin
      Gnattest_T.Fixture := Local_CRotator'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CRotator) is
   begin
      null;
   end Tear_Down;

end Math.Rotators.CRotator_Test_Data;
