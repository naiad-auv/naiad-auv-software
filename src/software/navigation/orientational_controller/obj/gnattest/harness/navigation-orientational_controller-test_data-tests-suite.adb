--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Orientational_Controller.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Orientational_Controller.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_0e37c3 : aliased Runner_1.Test_Case;
   Case_2_1_Test_fGet_Directional_Error_d17b29 : aliased Runner_1.Test_Case;
   Case_3_1_Test_fGet_Planal_Error_56275c : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_0e37c3,
         "navigation-orientational_controller.ads:15:4:",
         Test_pxCreate_0e37c3'Access);
      Runner_1.Create
        (Case_2_1_Test_fGet_Directional_Error_d17b29,
         "navigation-orientational_controller.ads:41:4:",
         Test_fGet_Directional_Error_d17b29'Access);
      Runner_1.Create
        (Case_3_1_Test_fGet_Planal_Error_56275c,
         "navigation-orientational_controller.ads:42:4:",
         Test_fGet_Planal_Error_56275c'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_0e37c3'Access);
      Result.Add_Test (Case_2_1_Test_fGet_Directional_Error_d17b29'Access);
      Result.Add_Test (Case_3_1_Test_fGet_Planal_Error_56275c'Access);

      return Result'Access;

   end Suite;

end Navigation.Orientational_Controller.Test_Data.Tests.Suite;
--  end read only
