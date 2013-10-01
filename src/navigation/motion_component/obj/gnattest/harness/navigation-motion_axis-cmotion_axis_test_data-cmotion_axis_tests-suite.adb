--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Motion_Axis.CMotion_Axis_Test_Data.CMotion_Axis_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Motion_Axis.CMotion_Axis_Test_Data.CMotion_Axis_Tests.Test_CMotion_Axis);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_New_Control_Values_c4e801 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_New_PID_Component_Scalings_1f9637 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Reset_Axis_f7edff : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_New_Control_Values_c4e801,
         "navigation-motion_axis.ads:37:4:",
         Test_xGet_New_Control_Values_c4e801'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_PID_Component_Scalings_1f9637,
         "navigation-motion_axis.ads:39:4:",
         Test_Set_New_PID_Component_Scalings_1f9637'Access);
      Runner_1.Create
        (Case_3_1_Test_Reset_Axis_f7edff,
         "navigation-motion_axis.ads:41:4:",
         Test_Reset_Axis_f7edff'Access);

      Result.Add_Test (Case_1_1_Test_xGet_New_Control_Values_c4e801'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_PID_Component_Scalings_1f9637'Access);
      Result.Add_Test (Case_3_1_Test_Reset_Axis_f7edff'Access);

      return Result'Access;

   end Suite;

end Navigation.Motion_Axis.CMotion_Axis_Test_Data.CMotion_Axis_Tests.Suite;
--  end read only
