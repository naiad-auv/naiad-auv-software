--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Simulator.Pid_Errors.CPidErrors_Test_Data is

   Local_CPidErrors : aliased GNATtest_Generated.GNATtest_Standard.Simulator.Pid_Errors.CPidErrors;
   procedure Set_Up (Gnattest_T : in out Test_CPidErrors) is
   begin
      Gnattest_T.Fixture := Local_CPidErrors'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CPidErrors) is
   begin
      null;
   end Tear_Down;

end Simulator.Pid_Errors.CPidErrors_Test_Data;
