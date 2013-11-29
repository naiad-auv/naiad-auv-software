--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.ViewModel_Actuators.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel_Actuators.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_bb45cc : aliased Runner_1.Test_Case;
   Case_2_1_Test_Free_5525d2 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_bb45cc,
         "simulator-viewmodel_actuators.ads:10:4:",
         Test_pxCreate_bb45cc'Access);
      Runner_1.Create
        (Case_2_1_Test_Free_5525d2,
         "simulator-viewmodel_actuators.ads:11:4:",
         Test_Free_5525d2'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_bb45cc'Access);
      Result.Add_Test (Case_2_1_Test_Free_5525d2'Access);

      return Result'Access;

   end Suite;

end Simulator.ViewModel_Actuators.Test_Data.Tests.Suite;
--  end read only
