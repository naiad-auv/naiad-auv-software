--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests.Test_COrientationalController);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_623a50 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Current_Absolute_Orientation_d358b4 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Wanted_Absolute_Orientation_3f7b4c : aliased Runner_1.Test_Case;
   Case_4_1_Test_Update_Current_Errors_8bd63a : aliased Runner_1.Test_Case;
   Case_5_1_Test_Set_New_PID_Component_Scalings_29d7cb : aliased Runner_1.Test_Case;
   Case_6_1_Test_Update_Current_Planal_Error_cf72af : aliased Runner_1.Test_Case;
   Case_7_1_Test_Update_Current_Directional_Error_2d1e01 : aliased Runner_1.Test_Case;
   Case_8_1_Test_xGet_Planal_Thruster_Control_Value_b4f4c1 : aliased Runner_1.Test_Case;
   Case_9_1_Test_xGet_Directional_Thruster_Control_Value_128ef2 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_623a50,
         "navigation-orientational_controller.ads:16:4:",
         Test_xGet_Orientational_Thruster_Control_Values_623a50'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Current_Absolute_Orientation_d358b4,
         "navigation-orientational_controller.ads:18:4:",
         Test_Update_Current_Absolute_Orientation_d358b4'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Wanted_Absolute_Orientation_3f7b4c,
         "navigation-orientational_controller.ads:19:4:",
         Test_Update_Wanted_Absolute_Orientation_3f7b4c'Access);
      Runner_1.Create
        (Case_4_1_Test_Update_Current_Errors_8bd63a,
         "navigation-orientational_controller.ads:20:4:",
         Test_Update_Current_Errors_8bd63a'Access);
      Runner_1.Create
        (Case_5_1_Test_Set_New_PID_Component_Scalings_29d7cb,
         "navigation-orientational_controller.ads:22:4:",
         Test_Set_New_PID_Component_Scalings_29d7cb'Access);
      Runner_1.Create
        (Case_6_1_Test_Update_Current_Planal_Error_cf72af,
         "navigation-orientational_controller.ads:26:4:",
         Test_Update_Current_Planal_Error_cf72af'Access);
      Runner_1.Create
        (Case_7_1_Test_Update_Current_Directional_Error_2d1e01,
         "navigation-orientational_controller.ads:27:4:",
         Test_Update_Current_Directional_Error_2d1e01'Access);
      Runner_1.Create
        (Case_8_1_Test_xGet_Planal_Thruster_Control_Value_b4f4c1,
         "navigation-orientational_controller.ads:32:4:",
         Test_xGet_Planal_Thruster_Control_Value_b4f4c1'Access);
      Runner_1.Create
        (Case_9_1_Test_xGet_Directional_Thruster_Control_Value_128ef2,
         "navigation-orientational_controller.ads:33:4:",
         Test_xGet_Directional_Thruster_Control_Value_128ef2'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_623a50'Access);
      Result.Add_Test (Case_2_1_Test_Update_Current_Absolute_Orientation_d358b4'Access);
      Result.Add_Test (Case_3_1_Test_Update_Wanted_Absolute_Orientation_3f7b4c'Access);
      Result.Add_Test (Case_4_1_Test_Update_Current_Errors_8bd63a'Access);
      Result.Add_Test (Case_5_1_Test_Set_New_PID_Component_Scalings_29d7cb'Access);
      Result.Add_Test (Case_6_1_Test_Update_Current_Planal_Error_cf72af'Access);
      Result.Add_Test (Case_7_1_Test_Update_Current_Directional_Error_2d1e01'Access);
      Result.Add_Test (Case_8_1_Test_xGet_Planal_Thruster_Control_Value_b4f4c1'Access);
      Result.Add_Test (Case_9_1_Test_xGet_Directional_Thruster_Control_Value_128ef2'Access);

      return Result'Access;

   end Suite;

end Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests.Suite;
--  end read only
