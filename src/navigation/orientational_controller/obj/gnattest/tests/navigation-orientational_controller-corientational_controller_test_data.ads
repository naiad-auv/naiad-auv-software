--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Navigation.Orientational_Controller.COrientational_Controller_Test_Data is

   type COrientational_Controller_Access is access all GNATtest_Generated.GNATtest_Standard.Navigation.Orientational_Controller.COrientational_Controller'Class;

--  begin read only
   type Test_COrientational_Controller is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : COrientational_Controller_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_COrientational_Controller);
   procedure Tear_Down (Gnattest_T : in out Test_COrientational_Controller);

end Navigation.Orientational_Controller.COrientational_Controller_Test_Data;
