--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.PID_Controller.CPIDController_Test_Data.CPIDController_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.PID_Controller.CPIDController_Test_Data.CPIDController_Tests.Test_CPIDController);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Set_New_Set_Point_6fc576 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_New_PID_Component_Scalings_e0f1e7 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Current_Value_From_External_Source_c04e0d : aliased Runner_1.Test_Case;
   Case_4_1_Test_Reset_Controller_aaccb2 : aliased Runner_1.Test_Case;
   Case_5_1_Test_xGet_New_Control_Value_c13ef9 : aliased Runner_1.Test_Case;
   Case_6_1_Test_fGetIntergralScale_32b2f8 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGetDerivativeScale_b87122 : aliased Runner_1.Test_Case;
   Case_8_1_Test_fGetProportionalScale_8382ac : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Set_New_Set_Point_6fc576,
         "navigation-pid_controller.ads:24:4:",
         Test_Set_New_Set_Point_6fc576'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_PID_Component_Scalings_e0f1e7,
         "navigation-pid_controller.ads:29:4:",
         Test_Set_New_PID_Component_Scalings_e0f1e7'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Current_Value_From_External_Source_c04e0d,
         "navigation-pid_controller.ads:34:4:",
         Test_Update_Current_Value_From_External_Source_c04e0d'Access);
      Runner_1.Create
        (Case_4_1_Test_Reset_Controller_aaccb2,
         "navigation-pid_controller.ads:39:4:",
         Test_Reset_Controller_aaccb2'Access);
      Runner_1.Create
        (Case_5_1_Test_xGet_New_Control_Value_c13ef9,
         "navigation-pid_controller.ads:43:4:",
         Test_xGet_New_Control_Value_c13ef9'Access);
      Runner_1.Create
        (Case_6_1_Test_fGetIntergralScale_32b2f8,
         "navigation-pid_controller.ads:48:4:",
         Test_fGetIntergralScale_32b2f8'Access);
      Runner_1.Create
        (Case_7_1_Test_fGetDerivativeScale_b87122,
         "navigation-pid_controller.ads:52:4:",
         Test_fGetDerivativeScale_b87122'Access);
      Runner_1.Create
        (Case_8_1_Test_fGetProportionalScale_8382ac,
         "navigation-pid_controller.ads:56:4:",
         Test_fGetProportionalScale_8382ac'Access);

      Result.Add_Test (Case_1_1_Test_Set_New_Set_Point_6fc576'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_PID_Component_Scalings_e0f1e7'Access);
      Result.Add_Test (Case_3_1_Test_Update_Current_Value_From_External_Source_c04e0d'Access);
      Result.Add_Test (Case_4_1_Test_Reset_Controller_aaccb2'Access);
      Result.Add_Test (Case_5_1_Test_xGet_New_Control_Value_c13ef9'Access);
      Result.Add_Test (Case_6_1_Test_fGetIntergralScale_32b2f8'Access);
      Result.Add_Test (Case_7_1_Test_fGetDerivativeScale_b87122'Access);
      Result.Add_Test (Case_8_1_Test_fGetProportionalScale_8382ac'Access);

      return Result'Access;

   end Suite;

end Navigation.PID_Controller.CPIDController_Test_Data.CPIDController_Tests.Suite;
--  end read only
