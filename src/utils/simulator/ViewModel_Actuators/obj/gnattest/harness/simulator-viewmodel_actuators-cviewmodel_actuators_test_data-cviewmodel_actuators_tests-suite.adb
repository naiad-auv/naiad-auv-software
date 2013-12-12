--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.ViewModel_Actuators.CViewModel_Actuators_Test_Data.CViewModel_Actuators_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel_Actuators.CViewModel_Actuators_Test_Data.CViewModel_Actuators_Tests.Test_CViewModel_Actuators);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_fGet_Motor_Force_3b66dc : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_fGet_Motor_Force_3b66dc,
         "simulator-viewmodel_actuators.ads:13:4:",
         Test_fGet_Motor_Force_3b66dc'Access);

      Result.Add_Test (Case_1_1_Test_fGet_Motor_Force_3b66dc'Access);

      return Result'Access;

   end Suite;

end Simulator.ViewModel_Actuators.CViewModel_Actuators_Test_Data.CViewModel_Actuators_Tests.Suite;
--  end read only
