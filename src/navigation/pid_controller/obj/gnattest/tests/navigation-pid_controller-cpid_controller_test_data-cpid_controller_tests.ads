--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with GNATtest_Generated;

package Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests is

   type Test_CPID_Controller is new
     GNATtest_Generated.GNATtest_Standard.Navigation.PID_Controller.CPID_Controller_Test_Data.Test_CPID_Controller with null record;

   procedure Test_Set_New_Set_Point_f8f7bc (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:20:4:Set_New_Set_Point

   procedure Test_Set_New_PID_Component_Scalings_c67cc5 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:22:4:Set_New_PID_Component_Scalings

   procedure Test_Update_Current_Value_From_External_Source_32a416 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:24:4:Update_Current_Value_From_External_Source

   procedure Test_Reset_Controller_033697 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:26:4:Reset_Controller

   procedure Test_xGet_New_Control_Value_4592b3 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:28:4:xGet_New_Control_Value

   procedure Test_fGetIntergralScale_953a97 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:30:4:fGetIntergralScale

   procedure Test_fGetDerivativeScale_53214f (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:32:4:fGetDerivativeScale

   procedure Test_fGetProportionalScale_b0d874 (Gnattest_T : in out Test_CPID_Controller);
   --  navigation-pid_controller.ads:34:4:fGetProportionalScale

   procedure Test_xGet_New_Control_Value_Increasing_Since_No_Decrease_In_Error(Gnattest_T : in out Test_CPID_Controller);

   procedure Test_xGet_New_Control_Value_Decreasing_Since_Overshoot(Gnattest_T : in out Test_CPID_Controller);

end Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests;
--  end read only
