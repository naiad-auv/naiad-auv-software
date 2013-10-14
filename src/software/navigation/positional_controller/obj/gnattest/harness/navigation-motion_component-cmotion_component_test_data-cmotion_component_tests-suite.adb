--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Motion_Component.CMotion_Component_Test_Data.CMotion_Component_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Motion_Component.CMotion_Component_Test_Data.CMotion_Component_Tests.Test_CMotion_Component);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_New_Component_Control_Value_39694a : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_New_PID_Component_Scalings_bc1ba6 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Set_New_Wanted_Value_9964e8 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Set_New_Current_Value_395f16 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Reset_Component_0de833 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_New_Component_Control_Value_39694a,
         "navigation-motion_component.ads:24:4:",
         Test_xGet_New_Component_Control_Value_39694a'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_PID_Component_Scalings_bc1ba6,
         "navigation-motion_component.ads:26:4:",
         Test_Set_New_PID_Component_Scalings_bc1ba6'Access);
      Runner_1.Create
        (Case_3_1_Test_Set_New_Wanted_Value_9964e8,
         "navigation-motion_component.ads:28:4:",
         Test_Set_New_Wanted_Value_9964e8'Access);
      Runner_1.Create
        (Case_4_1_Test_Set_New_Current_Value_395f16,
         "navigation-motion_component.ads:30:4:",
         Test_Set_New_Current_Value_395f16'Access);
      Runner_1.Create
        (Case_5_1_Test_Reset_Component_0de833,
         "navigation-motion_component.ads:32:4:",
         Test_Reset_Component_0de833'Access);

      Result.Add_Test (Case_1_1_Test_xGet_New_Component_Control_Value_39694a'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_PID_Component_Scalings_bc1ba6'Access);
      Result.Add_Test (Case_3_1_Test_Set_New_Wanted_Value_9964e8'Access);
      Result.Add_Test (Case_4_1_Test_Set_New_Current_Value_395f16'Access);
      Result.Add_Test (Case_5_1_Test_Reset_Component_0de833'Access);

      return Result'Access;

   end Suite;

end Navigation.Motion_Component.CMotion_Component_Test_Data.CMotion_Component_Tests.Suite;
--  end read only
