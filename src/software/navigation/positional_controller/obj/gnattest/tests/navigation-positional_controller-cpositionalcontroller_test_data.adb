--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.Positional_Controller.CPositionalController_Test_Data is

   Local_CPositionalController : aliased GNATtest_Generated.GNATtest_Standard.Navigation.Positional_Controller.CPositionalController;
   procedure Set_Up (Gnattest_T : in out Test_CPositionalController) is
   begin
      Gnattest_T.Fixture := Local_CPositionalController'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CPositionalController) is
   begin
      null;
   end Tear_Down;

end Navigation.Positional_Controller.CPositionalController_Test_Data;
