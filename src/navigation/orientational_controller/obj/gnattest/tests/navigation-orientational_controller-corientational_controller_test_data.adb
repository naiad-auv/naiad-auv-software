--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.Orientational_Controller.COrientational_Controller_Test_Data is

   Local_COrientational_Controller : aliased GNATtest_Generated.GNATtest_Standard.Navigation.Orientational_Controller.COrientational_Controller;
   procedure Set_Up (Gnattest_T : in out Test_COrientational_Controller) is
   begin
      Gnattest_T.Fixture := Local_COrientational_Controller'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_COrientational_Controller) is
   begin
      null;
   end Tear_Down;

end Navigation.Orientational_Controller.COrientational_Controller_Test_Data;
