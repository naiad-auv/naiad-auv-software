--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Positional_Controller.CPositionalController_Test_Data.CPositionalController_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Positional_Controller.CPositionalController_Test_Data.CPositionalController_Tests.Test_CPositionalController);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_Positional_Thruster_Control_Values_0afcd7 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Current_Errors_a4d64d : aliased Runner_1.Test_Case;
   Case_3_1_Test_Set_New_PID_Component_Scalings_f2c0ab : aliased Runner_1.Test_Case;
   Case_4_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_Positional_Thruster_Control_Values_0afcd7,
         "navigation-positional_controller.ads:25:4:",
         Test_xGet_Positional_Thruster_Control_Values_0afcd7'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Current_Errors_a4d64d,
         "navigation-positional_controller.ads:30:4:",
         Test_Update_Current_Errors_a4d64d'Access);
      Runner_1.Create
        (Case_3_1_Test_Set_New_PID_Component_Scalings_f2c0ab,
         "navigation-positional_controller.ads:34:4:",
         Test_Set_New_PID_Component_Scalings_f2c0ab'Access);
      Runner_1.Create
        (Case_4_1_Test_Finalize_1d29f1,
         "navigation-positional_controller.ads:55:4:",
         Test_Finalize_1d29f1'Access);
      Runner_1.Create
        (Case_1i_1_Test_Finalize_1d29f1,
         "navigation-positional_controller.ads:55:4: inherited at navigation-positional_controller.ads:41:4:",
         Test_Finalize_1d29f1'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Positional_Thruster_Control_Values_0afcd7'Access);
      Result.Add_Test (Case_2_1_Test_Update_Current_Errors_a4d64d'Access);
      Result.Add_Test (Case_3_1_Test_Set_New_PID_Component_Scalings_f2c0ab'Access);
      Result.Add_Test (Case_4_1_Test_Finalize_1d29f1'Access);
      Result.Add_Test (Case_1i_1_Test_Finalize_1d29f1'Access);

      return Result'Access;

   end Suite;

end Navigation.Positional_Controller.CPositionalController_Test_Data.CPositionalController_Tests.Suite;
--  end read only
