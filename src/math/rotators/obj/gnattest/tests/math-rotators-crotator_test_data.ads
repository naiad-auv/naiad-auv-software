--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Math.Rotators.CRotator_Test_Data is

   type CRotator_Access is access all GNATtest_Generated.GNATtest_Standard.Math.Rotators.CRotator'Class;

--  begin read only
   type Test_CRotator is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CRotator_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CRotator);
   procedure Tear_Down (Gnattest_T : in out Test_CRotator);

end Math.Rotators.CRotator_Test_Data;
