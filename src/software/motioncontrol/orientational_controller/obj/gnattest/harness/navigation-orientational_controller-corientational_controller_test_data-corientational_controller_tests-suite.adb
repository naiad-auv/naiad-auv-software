--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Orientational_Controller.COrientational_Controller_Test_Data.COrientational_Controller_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Orientational_Controller.COrientational_Controller_Test_Data.COrientational_Controller_Tests.Test_COrientational_Controller);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_df6b88 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Current_Orientation_19b3d5 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Wanted_Orientation_35e49e : aliased Runner_1.Test_Case;
   Case_4_1_Test_Set_New_PID_Component_Scalings_e6b122 : aliased Runner_1.Test_Case;
   Case_5_1_Test_fGet_Current_Directional_Component_a84dcd : aliased Runner_1.Test_Case;
   Case_6_1_Test_fGet_Wanted_Directional_Component_83b6e7 : aliased Runner_1.Test_Case;
   Case_7_1_Test_xGet_Current_Planal_Components_3d74ed : aliased Runner_1.Test_Case;
   Case_8_1_Test_xGet_Wanted_Planal_Components_a86e0d : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_df6b88,
         "navigation-orientational_controller.ads:15:4:",
         Test_xGet_Orientational_Thruster_Control_Values_df6b88'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Current_Orientation_19b3d5,
         "navigation-orientational_controller.ads:17:4:",
         Test_Update_Current_Orientation_19b3d5'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Wanted_Orientation_35e49e,
         "navigation-orientational_controller.ads:18:4:",
         Test_Update_Wanted_Orientation_35e49e'Access);
      Runner_1.Create
        (Case_4_1_Test_Set_New_PID_Component_Scalings_e6b122,
         "navigation-orientational_controller.ads:20:4:",
         Test_Set_New_PID_Component_Scalings_e6b122'Access);
      Runner_1.Create
        (Case_5_1_Test_fGet_Current_Directional_Component_a84dcd,
         "navigation-orientational_controller.ads:24:4:",
         Test_fGet_Current_Directional_Component_a84dcd'Access);
      Runner_1.Create
        (Case_6_1_Test_fGet_Wanted_Directional_Component_83b6e7,
         "navigation-orientational_controller.ads:25:4:",
         Test_fGet_Wanted_Directional_Component_83b6e7'Access);
      Runner_1.Create
        (Case_7_1_Test_xGet_Current_Planal_Components_3d74ed,
         "navigation-orientational_controller.ads:26:4:",
         Test_xGet_Current_Planal_Components_3d74ed'Access);
      Runner_1.Create
        (Case_8_1_Test_xGet_Wanted_Planal_Components_a86e0d,
         "navigation-orientational_controller.ads:27:4:",
         Test_xGet_Wanted_Planal_Components_a86e0d'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Orientational_Thruster_Control_Values_df6b88'Access);
      Result.Add_Test (Case_2_1_Test_Update_Current_Orientation_19b3d5'Access);
      Result.Add_Test (Case_3_1_Test_Update_Wanted_Orientation_35e49e'Access);
      Result.Add_Test (Case_4_1_Test_Set_New_PID_Component_Scalings_e6b122'Access);
      Result.Add_Test (Case_5_1_Test_fGet_Current_Directional_Component_a84dcd'Access);
      Result.Add_Test (Case_6_1_Test_fGet_Wanted_Directional_Component_83b6e7'Access);
      Result.Add_Test (Case_7_1_Test_xGet_Current_Planal_Components_3d74ed'Access);
      Result.Add_Test (Case_8_1_Test_xGet_Wanted_Planal_Components_a86e0d'Access);

      return Result'Access;

   end Suite;

end Navigation.Orientational_Controller.COrientational_Controller_Test_Data.COrientational_Controller_Tests.Suite;
--  end read only
