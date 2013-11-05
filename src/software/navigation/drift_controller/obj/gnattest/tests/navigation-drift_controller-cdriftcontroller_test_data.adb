--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.Drift_Controller.CDriftController_Test_Data is

   Local_CDriftController : aliased GNATtest_Generated.GNATtest_Standard.Navigation.Drift_Controller.CDriftController;
   procedure Set_Up (Gnattest_T : in out Test_CDriftController) is
   begin
      Gnattest_T.Fixture := Local_CDriftController'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CDriftController) is
   begin
      null;
   end Tear_Down;

end Navigation.Drift_Controller.CDriftController_Test_Data;
