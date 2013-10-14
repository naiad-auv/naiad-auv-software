--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Math.Matrices.CMatrix_Test_Data is

   Local_CMatrix : aliased GNATtest_Generated.GNATtest_Standard.Math.Matrices.CMatrix;
   procedure Set_Up (Gnattest_T : in out Test_CMatrix) is
   begin
      Gnattest_T.Fixture := Local_CMatrix'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CMatrix) is
   begin
      null;
   end Tear_Down;

end Math.Matrices.CMatrix_Test_Data;
