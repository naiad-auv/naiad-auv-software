--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Simulator.ViewModel_Actuators.CViewModel_Actuators_Test_Data is

   Local_CViewModel_Actuators : aliased GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel_Actuators.CViewModel_Actuators;
   procedure Set_Up (Gnattest_T : in out Test_CViewModel_Actuators) is
   begin
      Gnattest_T.Fixture := Local_CViewModel_Actuators'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CViewModel_Actuators) is
   begin
      null;
   end Tear_Down;

end Simulator.ViewModel_Actuators.CViewModel_Actuators_Test_Data;
