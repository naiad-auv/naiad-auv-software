--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with GNATtest_Generated;

package Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests is

   type Test_CPID_Controller is new
     GNATtest_Generated.GNATtest_Standard.Navigation.PID_Controller.CPID_Controller_Test_Data.Test_CPID_Controller with null record;

   procedure Test_Set_New_Set_Point_f8f7bc (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:12:4:Set_New_Set_Point

   procedure Test_Set_New_PID_Component_Scalings_640958 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:14:4:Set_New_PID_Component_Scalings

   procedure Test_Reset_Controller_033697 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:16:4:Reset_Controller

   procedure Test_xGet_New_Control_Value_20a1e7 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:18:4:xGet_New_Control_Value

   procedure Test_xGet_New_Control_Value_5adb99 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:20:4:xGet_New_Control_Value

   procedure Test_xGet_New_Control_Value_Increasing_Since_No_Decrease_In_Error(Gnattest_T : in out Test_CPID_Controller);

   procedure Test_xGet_New_Control_Value_Decreasing_Since_Overshoot(Gnattest_T : in out Test_CPID_Controller);

end Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests;
--  end read only
