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
   Case_4_1_Test_xGet_New_Control_Value_20a1e7 : aliased Runner_1.Test_Case;
   Case_5_1_Test_xGet_New_Control_Value_5adb99 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Set_New_Set_Point_f8f7bc,
         "navigation-pid_controller.ads:12:4:",
         Test_Set_New_Set_Point_f8f7bc'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_PID_Component_Scalings_640958,
         "navigation-pid_controller.ads:14:4:",
         Test_Set_New_PID_Component_Scalings_640958'Access);
      Runner_1.Create
        (Case_3_1_Test_Reset_Controller_033697,
         "navigation-pid_controller.ads:16:4:",
         Test_Reset_Controller_033697'Access);
      Runner_1.Create
        (Case_4_1_Test_xGet_New_Control_Value_20a1e7,
         "navigation-pid_controller.ads:18:4:",
         Test_xGet_New_Control_Value_20a1e7'Access);
      Runner_1.Create
        (Case_5_1_Test_xGet_New_Control_Value_5adb99,
         "navigation-pid_controller.ads:20:4:",
         Test_xGet_New_Control_Value_5adb99'Access);

      Result.Add_Test (Case_1_1_Test_Set_New_Set_Point_f8f7bc'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_PID_Component_Scalings_640958'Access);
      Result.Add_Test (Case_3_1_Test_Reset_Controller_033697'Access);
      Result.Add_Test (Case_4_1_Test_xGet_New_Control_Value_20a1e7'Access);
      Result.Add_Test (Case_5_1_Test_xGet_New_Control_Value_5adb99'Access);

      return Result'Access;

   end Suite;

end Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests.Suite;
--  end read only
