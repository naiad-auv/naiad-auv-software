--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Math.Matrices.CMatrix_Test_Data is

   type CMatrix_Access is access all GNATtest_Generated.GNATtest_Standard.Math.Matrices.CMatrix'Class;

--  begin read only
   type Test_CMatrix is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CMatrix_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CMatrix);
   procedure Tear_Down (Gnattest_T : in out Test_CMatrix);

end Math.Matrices.CMatrix_Test_Data;
