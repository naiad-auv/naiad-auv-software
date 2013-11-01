--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests.Test_COrientationalController);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_ec7316 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Current_Errors_a4d64d : aliased Runner_1.Test_Case;
   Case_3_1_Test_Set_New_PID_Component_Scalings_f2c0ab : aliased Runner_1.Test_Case;
   Case_4_1_Test_Update_Current_Planal_Error_64978d : aliased Runner_1.Test_Case;
   Case_5_1_Test_Update_Current_Directional_Error_eb91a0 : aliased Runner_1.Test_Case;
   Case_6_1_Test_xGet_Planal_Thruster_Control_Value_e4eedc : aliased Runner_1.Test_Case;
   Case_7_1_Test_xGet_Directional_Thruster_Control_Value_538346 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_ec7316,
         "navigation-orientational_controller.ads:29:4:",
         Test_xGet_Orientational_Thruster_Control_Values_ec7316'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Current_Errors_a4d64d,
         "navigation-orientational_controller.ads:35:4:",
         Test_Update_Current_Errors_a4d64d'Access);
      Runner_1.Create
        (Case_3_1_Test_Set_New_PID_Component_Scalings_f2c0ab,
         "navigation-orientational_controller.ads:39:4:",
         Test_Set_New_PID_Component_Scalings_f2c0ab'Access);
      Runner_1.Create
        (Case_4_1_Test_Update_Current_Planal_Error_64978d,
         "navigation-orientational_controller.ads:47:4:",
         Test_Update_Current_Planal_Error_64978d'Access);
      Runner_1.Create
        (Case_5_1_Test_Update_Current_Directional_Error_eb91a0,
         "navigation-orientational_controller.ads:48:4:",
         Test_Update_Current_Directional_Error_eb91a0'Access);
      Runner_1.Create
        (Case_6_1_Test_xGet_Planal_Thruster_Control_Value_e4eedc,
         "navigation-orientational_controller.ads:53:4:",
         Test_xGet_Planal_Thruster_Control_Value_e4eedc'Access);
      Runner_1.Create
        (Case_7_1_Test_xGet_Directional_Thruster_Control_Value_538346,
         "navigation-orientational_controller.ads:54:4:",
         Test_xGet_Directional_Thruster_Control_Value_538346'Access);
      Runner_1.Create
        (Case_8_1_Test_Finalize_1d29f1,
         "navigation-orientational_controller.ads:68:4:",
         Test_Finalize_1d29f1'Access);
      Runner_1.Create
        (Case_1i_1_Test_Finalize_1d29f1,
         "navigation-orientational_controller.ads:68:4: inherited at navigation-orientational_controller.ads:56:4:",
         Test_Finalize_1d29f1'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_ec7316'Access);
      Result.Add_Test (Case_2_1_Test_Update_Current_Errors_a4d64d'Access);
      Result.Add_Test (Case_3_1_Test_Set_New_PID_Component_Scalings_f2c0ab'Access);
      Result.Add_Test (Case_4_1_Test_Update_Current_Planal_Error_64978d'Access);
      Result.Add_Test (Case_5_1_Test_Update_Current_Directional_Error_eb91a0'Access);
      Result.Add_Test (Case_6_1_Test_xGet_Planal_Thruster_Control_Value_e4eedc'Access);
      Result.Add_Test (Case_7_1_Test_xGet_Directional_Thruster_Control_Value_538346'Access);
      Result.Add_Test (Case_8_1_Test_Finalize_1d29f1'Access);
      Result.Add_Test (Case_1i_1_Test_Finalize_1d29f1'Access);

      return Result'Access;

   end Suite;

end Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests.Suite;
--  end read only
