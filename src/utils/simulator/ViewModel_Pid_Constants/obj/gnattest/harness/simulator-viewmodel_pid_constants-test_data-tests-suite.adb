--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.Viewmodel_Pid_Constants.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.Viewmodel_Pid_Constants.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_8f5b20 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Free_cd6506 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_8f5b20,
         "simulator-viewmodel_pid_constants.ads:12:4:",
         Test_pxCreate_8f5b20'Access);
      Runner_1.Create
        (Case_2_1_Test_Free_cd6506,
         "simulator-viewmodel_pid_constants.ads:13:4:",
         Test_Free_cd6506'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_8f5b20'Access);
      Result.Add_Test (Case_2_1_Test_Free_cd6506'Access);

      return Result'Access;

   end Suite;

end Simulator.Viewmodel_Pid_Constants.Test_Data.Tests.Suite;
--  end read only
