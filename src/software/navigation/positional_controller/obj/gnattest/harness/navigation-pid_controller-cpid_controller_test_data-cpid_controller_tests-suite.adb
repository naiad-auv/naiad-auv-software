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
   Case_2_1_Test_Set_New_PID_Component_Scalings_c67cc5 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Current_Value_From_External_Source_32a416 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Reset_Controller_033697 : aliased Runner_1.Test_Case;
   Case_5_1_Test_xGet_New_Control_Value_4592b3 : aliased Runner_1.Test_Case;
   Case_6_1_Test_fGetIntergralScale_953a97 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGetDerivativeScale_53214f : aliased Runner_1.Test_Case;
   Case_8_1_Test_fGetProportionalScale_b0d874 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Set_New_Set_Point_f8f7bc,
         "navigation-pid_controller.ads:20:4:",
         Test_Set_New_Set_Point_f8f7bc'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_PID_Component_Scalings_c67cc5,
         "navigation-pid_controller.ads:22:4:",
         Test_Set_New_PID_Component_Scalings_c67cc5'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Current_Value_From_External_Source_32a416,
         "navigation-pid_controller.ads:24:4:",
         Test_Update_Current_Value_From_External_Source_32a416'Access);
      Runner_1.Create
        (Case_4_1_Test_Reset_Controller_033697,
         "navigation-pid_controller.ads:26:4:",
         Test_Reset_Controller_033697'Access);
      Runner_1.Create
        (Case_5_1_Test_xGet_New_Control_Value_4592b3,
         "navigation-pid_controller.ads:28:4:",
         Test_xGet_New_Control_Value_4592b3'Access);
      Runner_1.Create
        (Case_6_1_Test_fGetIntergralScale_953a97,
         "navigation-pid_controller.ads:30:4:",
         Test_fGetIntergralScale_953a97'Access);
      Runner_1.Create
        (Case_7_1_Test_fGetDerivativeScale_53214f,
         "navigation-pid_controller.ads:32:4:",
         Test_fGetDerivativeScale_53214f'Access);
      Runner_1.Create
        (Case_8_1_Test_fGetProportionalScale_b0d874,
         "navigation-pid_controller.ads:34:4:",
         Test_fGetProportionalScale_b0d874'Access);

      Result.Add_Test (Case_1_1_Test_Set_New_Set_Point_f8f7bc'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_PID_Component_Scalings_c67cc5'Access);
      Result.Add_Test (Case_3_1_Test_Update_Current_Value_From_External_Source_32a416'Access);
      Result.Add_Test (Case_4_1_Test_Reset_Controller_033697'Access);
      Result.Add_Test (Case_5_1_Test_xGet_New_Control_Value_4592b3'Access);
      Result.Add_Test (Case_6_1_Test_fGetIntergralScale_953a97'Access);
      Result.Add_Test (Case_7_1_Test_fGetDerivativeScale_53214f'Access);
      Result.Add_Test (Case_8_1_Test_fGetProportionalScale_b0d874'Access);

      return Result'Access;

   end Suite;

end Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests.Suite;
--  end read only
