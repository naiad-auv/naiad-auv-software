--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Math.Planes.CPlane_Test_Data is

   Local_CPlane : aliased GNATtest_Generated.GNATtest_Standard.Math.Planes.CPlane;
   procedure Set_Up (Gnattest_T : in out Test_CPlane) is
   begin
      Gnattest_T.Fixture := Local_CPlane'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CPlane) is
   begin
      null;
   end Tear_Down;

end Math.Planes.CPlane_Test_Data;
