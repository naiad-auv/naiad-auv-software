--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data is

   Local_CViewmodel_Pid_Constants : aliased GNATtest_Generated.GNATtest_Standard.Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants;
   procedure Set_Up (Gnattest_T : in out Test_CViewmodel_Pid_Constants) is
   begin
      Gnattest_T.Fixture := Local_CViewmodel_Pid_Constants'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CViewmodel_Pid_Constants) is
   begin
      null;
   end Tear_Down;

end Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data;
