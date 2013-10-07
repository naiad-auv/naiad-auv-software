--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Positional_Controller.CPositional_Controller_Test_Data.CPositional_Controller_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Positional_Controller.CPositional_Controller_Test_Data.CPositional_Controller_Tests.Test_CPositional_Controller);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_Positional_Thruster_Control_Values_c13bf2 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Current_Position_c1f77b : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Wanted_Position_1139f7 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Set_New_PID_Component_Scalings_fb8920 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_Positional_Thruster_Control_Values_c13bf2,
         "navigation-positional_controller.ads:12:4:",
         Test_xGet_Positional_Thruster_Control_Values_c13bf2'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Current_Position_c1f77b,
         "navigation-positional_controller.ads:14:4:",
         Test_Update_Current_Position_c1f77b'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Wanted_Position_1139f7,
         "navigation-positional_controller.ads:15:4:",
         Test_Update_Wanted_Position_1139f7'Access);
      Runner_1.Create
        (Case_4_1_Test_Set_New_PID_Component_Scalings_fb8920,
         "navigation-positional_controller.ads:17:4:",
         Test_Set_New_PID_Component_Scalings_fb8920'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Positional_Thruster_Control_Values_c13bf2'Access);
      Result.Add_Test (Case_2_1_Test_Update_Current_Position_c1f77b'Access);
      Result.Add_Test (Case_3_1_Test_Update_Wanted_Position_1139f7'Access);
      Result.Add_Test (Case_4_1_Test_Set_New_PID_Component_Scalings_fb8920'Access);

      return Result'Access;

   end Suite;

end Navigation.Positional_Controller.CPositional_Controller_Test_Data.CPositional_Controller_Tests.Suite;
--  end read only
