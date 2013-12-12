--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Test_CDispatcher);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_tfGet_Thruster_Values_dcfce3 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_New_Component_PID_Scalings_893439 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Current_Absolute_Position_ee3e86 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Update_Wanted_Absolute_Position_93298b : aliased Runner_1.Test_Case;
   Case_5_1_Test_Update_Current_Absolute_Orientation_f15b9b : aliased Runner_1.Test_Case;
   Case_6_1_Test_Update_Wanted_Absolute_Orientation_3e0717 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Finalize_1d29f1 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_tfGet_Thruster_Values_dcfce3,
         "navigation-dispatcher.ads:26:4:",
         Test_tfGet_Thruster_Values_dcfce3'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_Component_PID_Scalings_893439,
         "navigation-dispatcher.ads:32:4:",
         Test_Set_New_Component_PID_Scalings_893439'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Current_Absolute_Position_ee3e86,
         "navigation-dispatcher.ads:38:4:",
         Test_Update_Current_Absolute_Position_ee3e86'Access);
      Runner_1.Create
        (Case_4_1_Test_Update_Wanted_Absolute_Position_93298b,
         "navigation-dispatcher.ads:44:4:",
         Test_Update_Wanted_Absolute_Position_93298b'Access);
      Runner_1.Create
        (Case_5_1_Test_Update_Current_Absolute_Orientation_f15b9b,
         "navigation-dispatcher.ads:49:4:",
         Test_Update_Current_Absolute_Orientation_f15b9b'Access);
      Runner_1.Create
        (Case_6_1_Test_Update_Wanted_Absolute_Orientation_3e0717,
         "navigation-dispatcher.ads:54:4:",
         Test_Update_Wanted_Absolute_Orientation_3e0717'Access);
      Runner_1.Create
        (Case_7_1_Test_Finalize_1d29f1,
         "navigation-dispatcher.ads:83:4:",
         Test_Finalize_1d29f1'Access);
      Runner_1.Create
        (Case_1i_1_Test_Finalize_1d29f1,
         "navigation-dispatcher.ads:83:4: inherited at navigation-dispatcher.ads:64:4:",
         Test_Finalize_1d29f1'Access);

      Result.Add_Test (Case_1_1_Test_tfGet_Thruster_Values_dcfce3'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_Component_PID_Scalings_893439'Access);
      Result.Add_Test (Case_3_1_Test_Update_Current_Absolute_Position_ee3e86'Access);
      Result.Add_Test (Case_4_1_Test_Update_Wanted_Absolute_Position_93298b'Access);
      Result.Add_Test (Case_5_1_Test_Update_Current_Absolute_Orientation_f15b9b'Access);
      Result.Add_Test (Case_6_1_Test_Update_Wanted_Absolute_Orientation_3e0717'Access);
      Result.Add_Test (Case_7_1_Test_Finalize_1d29f1'Access);
      Result.Add_Test (Case_1i_1_Test_Finalize_1d29f1'Access);

      return Result'Access;

   end Suite;

end Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Suite;
--  end read only
