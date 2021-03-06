--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Motion_Component.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Motion_Component.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Free_e9f3c1 : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_1ce4e5 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Free_e9f3c1,
         "navigation-motion_component.ads:11:4:",
         Test_Free_e9f3c1'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_1ce4e5,
         "navigation-motion_component.ads:36:4:",
         Test_pxCreate_1ce4e5'Access);

      Result.Add_Test (Case_1_1_Test_Free_e9f3c1'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_1ce4e5'Access);

      return Result'Access;

   end Suite;

end Navigation.Motion_Component.Test_Data.Tests.Suite;
--  end read only
