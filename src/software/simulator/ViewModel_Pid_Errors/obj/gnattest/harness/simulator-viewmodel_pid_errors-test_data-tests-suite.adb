--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.ViewModel_Pid_Errors.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel_Pid_Errors.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_e4c99a : aliased Runner_1.Test_Case;
   Case_2_1_Test_Free_2cce0a : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_e4c99a,
         "simulator-viewmodel_pid_errors.ads:24:4:",
         Test_pxCreate_e4c99a'Access);
      Runner_1.Create
        (Case_2_1_Test_Free_2cce0a,
         "simulator-viewmodel_pid_errors.ads:32:4:",
         Test_Free_2cce0a'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_e4c99a'Access);
      Result.Add_Test (Case_2_1_Test_Free_2cce0a'Access);

      return Result'Access;

   end Suite;

end Simulator.ViewModel_Pid_Errors.Test_Data.Tests.Suite;
--  end read only
