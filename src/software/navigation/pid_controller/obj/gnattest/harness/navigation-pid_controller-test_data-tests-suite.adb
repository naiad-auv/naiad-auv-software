--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.PID_Controller.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.PID_Controller.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Free_75413d : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_23984a : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Free_75413d,
         "navigation-pid_controller.ads:10:4:",
         Test_Free_75413d'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_23984a,
         "navigation-pid_controller.ads:20:4:",
         Test_pxCreate_23984a'Access);

      Result.Add_Test (Case_1_1_Test_Free_75413d'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_23984a'Access);

      return Result'Access;

   end Suite;

end Navigation.PID_Controller.Test_Data.Tests.Suite;
--  end read only
