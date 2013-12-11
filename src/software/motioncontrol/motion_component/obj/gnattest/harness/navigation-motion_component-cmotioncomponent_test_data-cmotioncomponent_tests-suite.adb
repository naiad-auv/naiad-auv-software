--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Motion_Component.CMotionComponent_Test_Data.CMotionComponent_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Motion_Component.CMotionComponent_Test_Data.CMotionComponent_Tests.Test_CMotionComponent);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_New_Component_Control_Value_a62587 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_New_PID_Component_Scalings_d22d44 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Current_Error_8e51e5 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Reset_Component_a5a4fe : aliased Runner_1.Test_Case;
   Case_5_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_New_Component_Control_Value_a62587,
         "navigation-motion_component.ads:41:4:",
         Test_xGet_New_Component_Control_Value_a62587'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_PID_Component_Scalings_d22d44,
         "navigation-motion_component.ads:46:4:",
         Test_Set_New_PID_Component_Scalings_d22d44'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Current_Error_8e51e5,
         "navigation-motion_component.ads:51:4:",
         Test_Update_Current_Error_8e51e5'Access);
      Runner_1.Create
        (Case_4_1_Test_Reset_Component_a5a4fe,
         "navigation-motion_component.ads:56:4:",
         Test_Reset_Component_a5a4fe'Access);
      Runner_1.Create
        (Case_5_1_Test_Finalize_1d29f1,
         "navigation-motion_component.ads:71:4:",
         Test_Finalize_1d29f1'Access);
      Runner_1.Create
        (Case_1i_1_Test_Finalize_1d29f1,
         "navigation-motion_component.ads:71:4: inherited at navigation-motion_component.ads:62:4:",
         Test_Finalize_1d29f1'Access);

      Result.Add_Test (Case_1_1_Test_xGet_New_Component_Control_Value_a62587'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_PID_Component_Scalings_d22d44'Access);
      Result.Add_Test (Case_3_1_Test_Update_Current_Error_8e51e5'Access);
      Result.Add_Test (Case_4_1_Test_Reset_Component_a5a4fe'Access);
      Result.Add_Test (Case_5_1_Test_Finalize_1d29f1'Access);
      Result.Add_Test (Case_1i_1_Test_Finalize_1d29f1'Access);

      return Result'Access;

   end Suite;

end Navigation.Motion_Component.CMotionComponent_Test_Data.CMotionComponent_Tests.Suite;
--  end read only
