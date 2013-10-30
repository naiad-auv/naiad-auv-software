--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with GNATtest_Generated;

package Navigation.PID_Controller.CPIDController_Test_Data.CPIDController_Tests is

   type Test_CPIDController is new
     GNATtest_Generated.GNATtest_Standard.Navigation.PID_Controller.CPIDController_Test_Data.Test_CPIDController with null record;

   procedure Test_Set_New_Set_Point_6fc576 (Gnattest_T : in out Test_CPIDController);
   --  navigation-pid_controller.ads:24:4:Set_New_Set_Point

   procedure Test_Set_New_PID_Component_Scalings_e0f1e7 (Gnattest_T : in out Test_CPIDController);
   --  navigation-pid_controller.ads:29:4:Set_New_PID_Component_Scalings

   procedure Test_Update_Current_Value_From_External_Source_c04e0d (Gnattest_T : in out Test_CPIDController);
   --  navigation-pid_controller.ads:34:4:Update_Current_Value_From_External_Source

   procedure Test_Reset_Controller_aaccb2 (Gnattest_T : in out Test_CPIDController);
   --  navigation-pid_controller.ads:39:4:Reset_Controller

   procedure Test_xGet_New_Control_Value_c13ef9 (Gnattest_T : in out Test_CPIDController);
   --  navigation-pid_controller.ads:43:4:xGet_New_Control_Value

   procedure Test_fGetIntergralScale_32b2f8 (Gnattest_T : in out Test_CPIDController);
   --  navigation-pid_controller.ads:48:4:fGetIntergralScale

   procedure Test_fGetDerivativeScale_b87122 (Gnattest_T : in out Test_CPIDController);
   --  navigation-pid_controller.ads:52:4:fGetDerivativeScale

   procedure Test_fGetProportionalScale_8382ac (Gnattest_T : in out Test_CPIDController);
   --  navigation-pid_controller.ads:56:4:fGetProportionalScale

end Navigation.PID_Controller.CPIDController_Test_Data.CPIDController_Tests;
--  end read only
