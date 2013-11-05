--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Positional_Controller.CPositionalController_Test_Data.CPositionalController_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Positional_Controller.CPositionalController_Test_Data.CPositionalController_Tests.Test_CPositionalController);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_Positional_Thruster_Control_Values_1d7d6d : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Current_Errors_db8191 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Set_New_PID_Component_Scalings_90f3b2 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_Positional_Thruster_Control_Values_1d7d6d,
         "navigation-positional_controller.ads:14:4:",
         Test_xGet_Positional_Thruster_Control_Values_b5ee7d'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Current_Errors_db8191,
         "navigation-positional_controller.ads:16:4:",
         Test_Update_Current_Errors_db8191'Access);
      Runner_1.Create
        (Case_3_1_Test_Set_New_PID_Component_Scalings_90f3b2,
         "navigation-positional_controller.ads:19:4:",
         Test_Set_New_PID_Component_Scalings_90f3b2'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Positional_Thruster_Control_Values_1d7d6d'Access);
      Result.Add_Test (Case_2_1_Test_Update_Current_Errors_db8191'Access);
      Result.Add_Test (Case_3_1_Test_Set_New_PID_Component_Scalings_90f3b2'Access);

      return Result'Access;

   end Suite;

end Navigation.Positional_Controller.CPositionalController_Test_Data.CPositionalController_Tests.Suite;
--  end read only
