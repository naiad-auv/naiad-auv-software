--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.PID_Controller.CPIDController_Test_Data is

   Local_CPIDController : aliased GNATtest_Generated.GNATtest_Standard.Navigation.PID_Controller.CPIDController;
   procedure Set_Up (Gnattest_T : in out Test_CPIDController) is
   begin
      Gnattest_T.Fixture := Local_CPIDController'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CPIDController) is
   begin
      null;
   end Tear_Down;

end Navigation.PID_Controller.CPIDController_Test_Data;
