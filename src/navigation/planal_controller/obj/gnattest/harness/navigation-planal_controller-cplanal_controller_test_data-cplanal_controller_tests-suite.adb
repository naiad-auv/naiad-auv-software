--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Planal_Controller.CPlanal_Controller_Test_Data.CPlanal_Controller_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Planal_Controller.CPlanal_Controller_Test_Data.CPlanal_Controller_Tests.Test_CPlanal_Controller);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_Planal_Thruster_Control_Values_7c674b : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Wanted_Plane_92759b : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Current_Plane_cd137f : aliased Runner_1.Test_Case;
   Case_4_1_Test_Set_New_PID_Component_Scalings_bbdba1 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_Planal_Thruster_Control_Values_7c674b,
         "navigation-planal_controller.ads:18:4:",
         Test_xGet_Planal_Thruster_Control_Values_7c674b'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Wanted_Plane_92759b,
         "navigation-planal_controller.ads:20:4:",
         Test_Update_Wanted_Plane_92759b'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Current_Plane_cd137f,
         "navigation-planal_controller.ads:21:4:",
         Test_Update_Current_Plane_cd137f'Access);
      Runner_1.Create
        (Case_4_1_Test_Set_New_PID_Component_Scalings_bbdba1,
         "navigation-planal_controller.ads:23:4:",
         Test_Set_New_PID_Component_Scalings_bbdba1'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Planal_Thruster_Control_Values_7c674b'Access);
      Result.Add_Test (Case_2_1_Test_Update_Wanted_Plane_92759b'Access);
      Result.Add_Test (Case_3_1_Test_Update_Current_Plane_cd137f'Access);
      Result.Add_Test (Case_4_1_Test_Set_New_PID_Component_Scalings_bbdba1'Access);

      return Result'Access;

   end Suite;

end Navigation.Planal_Controller.CPlanal_Controller_Test_Data.CPlanal_Controller_Tests.Suite;
--  end read only
