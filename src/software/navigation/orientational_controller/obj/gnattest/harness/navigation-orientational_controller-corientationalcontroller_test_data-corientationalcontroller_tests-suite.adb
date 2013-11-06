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
   Case_4_1_Test_Update_Current_X_Rotation_Error_80be14 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Update_Current_Y_Rotation_Error_02960d : aliased Runner_1.Test_Case;
   Case_6_1_Test_Update_Current_Z_Rotation_Error_6e9d1b : aliased Runner_1.Test_Case;
   Case_7_1_Test_xGet_X_Rotation_Thruster_Control_Value_425dce : aliased Runner_1.Test_Case;
   Case_8_1_Test_xGet_Y_Rotation_Thruster_Control_Value_beea5c : aliased Runner_1.Test_Case;
   Case_9_1_Test_xGet_Z_Rotation_Thruster_Control_Value_bdcbef : aliased Runner_1.Test_Case;
   Case_10_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;
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
        (Case_4_1_Test_Update_Current_X_Rotation_Error_80be14,
         "navigation-orientational_controller.ads:47:4:",
         Test_Update_Current_X_Rotation_Error_80be14'Access);
      Runner_1.Create
        (Case_5_1_Test_Update_Current_Y_Rotation_Error_02960d,
         "navigation-orientational_controller.ads:48:4:",
         Test_Update_Current_Y_Rotation_Error_02960d'Access);
      Runner_1.Create
        (Case_6_1_Test_Update_Current_Z_Rotation_Error_6e9d1b,
         "navigation-orientational_controller.ads:49:4:",
         Test_Update_Current_Z_Rotation_Error_6e9d1b'Access);
      Runner_1.Create
        (Case_7_1_Test_xGet_X_Rotation_Thruster_Control_Value_425dce,
         "navigation-orientational_controller.ads:51:4:",
         Test_xGet_X_Rotation_Thruster_Control_Value_425dce'Access);
      Runner_1.Create
        (Case_8_1_Test_xGet_Y_Rotation_Thruster_Control_Value_beea5c,
         "navigation-orientational_controller.ads:52:4:",
         Test_xGet_Y_Rotation_Thruster_Control_Value_beea5c'Access);
      Runner_1.Create
        (Case_9_1_Test_xGet_Z_Rotation_Thruster_Control_Value_bdcbef,
         "navigation-orientational_controller.ads:53:4:",
         Test_xGet_Z_Rotation_Thruster_Control_Value_bdcbef'Access);
      Runner_1.Create
        (Case_10_1_Test_Finalize_1d29f1,
         "navigation-orientational_controller.ads:66:4:",
         Test_Finalize_1d29f1'Access);
      Runner_1.Create
        (Case_1i_1_Test_Finalize_1d29f1,
         "navigation-orientational_controller.ads:66:4: inherited at navigation-orientational_controller.ads:55:4:",
         Test_Finalize_1d29f1'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_ec7316'Access);
      Result.Add_Test (Case_2_1_Test_Update_Current_Errors_a4d64d'Access);
      Result.Add_Test (Case_3_1_Test_Set_New_PID_Component_Scalings_f2c0ab'Access);
      Result.Add_Test (Case_4_1_Test_Update_Current_X_Rotation_Error_80be14'Access);
      Result.Add_Test (Case_5_1_Test_Update_Current_Y_Rotation_Error_02960d'Access);
      Result.Add_Test (Case_6_1_Test_Update_Current_Z_Rotation_Error_6e9d1b'Access);
      Result.Add_Test (Case_7_1_Test_xGet_X_Rotation_Thruster_Control_Value_425dce'Access);
      Result.Add_Test (Case_8_1_Test_xGet_Y_Rotation_Thruster_Control_Value_beea5c'Access);
      Result.Add_Test (Case_9_1_Test_xGet_Z_Rotation_Thruster_Control_Value_bdcbef'Access);
      Result.Add_Test (Case_10_1_Test_Finalize_1d29f1'Access);
      Result.Add_Test (Case_1i_1_Test_Finalize_1d29f1'Access);

      return Result'Access;

   end Suite;

end Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests.Suite;
--  end read only
