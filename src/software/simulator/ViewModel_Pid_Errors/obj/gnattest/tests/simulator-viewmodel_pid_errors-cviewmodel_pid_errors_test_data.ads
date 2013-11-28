--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors_Test_Data is

   type CViewModel_Pid_Errors_Access is access all GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors'Class;

--  begin read only
   type Test_CViewModel_Pid_Errors is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CViewModel_Pid_Errors_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Tear_Down (Gnattest_T : in out Test_CViewModel_Pid_Errors);

end Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors_Test_Data;
