--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data is

   type CViewmodel_Pid_Constants_Access is access all GNATtest_Generated.GNATtest_Standard.Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants'Class;

--  begin read only
   type Test_CViewmodel_Pid_Constants is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CViewmodel_Pid_Constants_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CViewmodel_Pid_Constants);
   procedure Tear_Down (Gnattest_T : in out Test_CViewmodel_Pid_Constants);

end Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data;
