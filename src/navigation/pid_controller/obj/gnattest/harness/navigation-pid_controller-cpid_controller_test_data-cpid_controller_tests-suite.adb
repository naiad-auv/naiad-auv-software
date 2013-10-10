--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests.Test_CPID_Controller);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Set_New_Set_Point_f8f7bc : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_New_PID_Component_Scalings_640958 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Reset_Controller_033697 : aliased Runner_1.Test_Case;
   Case_5_1_Test_xGet_New_Control_Value_5adb99 : aliased Runner_1.Test_Case;
   Case_6_1_Test_xGet_New_Control_Value_Increasing_Since_No_Decrease_In_Error : aliased Runner_1.Test_Case;
   Case_7_1_Test_xGet_New_Control_Value_Decreasing_Since_Overshoot : aliased Runner_1.Test_Case;
   Case_8_1_Test_Update_Current_Value_From_External_Source : aliased Runner_1.Test_Case;
   Case_9_1_Test_fGetProportionalScale : aliased Runner_1.Test_Case;
   Case_10_1_Test_fGetIntegralScale : aliased Runner_1.Test_Case;
   Case_11_1_Test_fGetDerivativeScale : aliased Runner_1.Test_Case;


   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Set_New_Set_Point_f8f7bc,
         "navigation-pid_controller.ads:12:4:",
         Test_Set_New_Set_Point_f8f7bc'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_PID_Component_Scalings_640958,
         "navigation-pid_controller.ads:14:4:",
         Test_Set_New_PID_Component_Scalings_c67cc5'Access);
      Runner_1.Create
        (Case_3_1_Test_Reset_Controller_033697,
         "navigation-pid_controller.ads:16:4:",
         Test_Reset_Controller_033697'Access);
      Runner_1.Create
        (Case_5_1_Test_xGet_New_Control_Value_5adb99,
         "navigation-pid_controller.ads:20:4:",
         Test_xGet_New_Control_Value_4592b3'Access);
      Runner_1.Create
        (Case_6_1_Test_xGet_New_Control_Value_Increasing_Since_No_Decrease_In_Error,
         "navigation-pid_controller.ads:20:4: the proportional error not decreasing test",
         Test_xGet_New_Control_Value_Increasing_Since_No_Decrease_In_Error'Access);
      Runner_1.Create
        (Case_7_1_Test_xGet_New_Control_Value_Decreasing_Since_Overshoot,
         "navigation-pid_controller.ads:20:4: overshoot test",
         Test_xGet_New_Control_Value_Decreasing_Since_Overshoot'Access);
      Runner_1.Create
        (Case_8_1_Test_Update_Current_Value_From_External_Source,
         "Update current value test",
         Test_Update_Current_Value_From_External_Source_32a416'Access);
      Runner_1.Create(Case_9_1_Test_fGetProportionalScale,
                      "fGetProportionalScaleTest",
                      Test_fGetProportionalScale_b0d874'Access);
      Runner_1.Create(Case_10_1_Test_fGetIntegralScale,
                      "fGetDerivative",
                      Test_fGetIntergralScale_953a97'Access);
      Runner_1.Create(Case_11_1_Test_fGetDerivativeScale,
                      "fGetIntegral",
                      Test_fGetDerivativeScale_53214f'Access);



      Result.Add_Test (Case_1_1_Test_Set_New_Set_Point_f8f7bc'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_PID_Component_Scalings_640958'Access);
      Result.Add_Test (Case_3_1_Test_Reset_Controller_033697'Access);
      Result.Add_Test (Case_5_1_Test_xGet_New_Control_Value_5adb99'Access);
      Result.Add_Test (Case_6_1_Test_xGet_New_Control_Value_Increasing_Since_No_Decrease_In_Error'Access);
      Result.Add_Test (Case_7_1_Test_xGet_New_Control_Value_Decreasing_Since_Overshoot'Access);
      Result.Add_Test (Case_8_1_Test_Update_Current_Value_From_External_Source'Access);
      Result.Add_Test (Case_9_1_Test_fGetProportionalScale'Access);
      Result.Add_Test (Case_10_1_Test_fGetIntegralScale'Access);
      Result.Add_Test (Case_11_1_Test_fGetDerivativeScale'Access);

      return Result'Access;

   end Suite;

end Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests.Suite;
--  end read only
