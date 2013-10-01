--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Navigation.Motion_Axis.CMotion_Axis_Test_Data is

   type CMotion_Axis_Access is access all GNATtest_Generated.GNATtest_Standard.Navigation.Motion_Axis.CMotion_Axis'Class;

--  begin read only
   type Test_CMotion_Axis is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CMotion_Axis_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CMotion_Axis);
   procedure Tear_Down (Gnattest_T : in out Test_CMotion_Axis);

end Navigation.Motion_Axis.CMotion_Axis_Test_Data;
