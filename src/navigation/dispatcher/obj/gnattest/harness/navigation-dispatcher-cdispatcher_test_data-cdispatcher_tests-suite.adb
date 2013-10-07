--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Test_CDispatcher);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxGet_New_Thruster_Control_Values_a7395a : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_New_Component_PID_Scalings_444661 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Current_Position_86c018 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Update_Wanted_Position_eaf0c9 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Update_Current_Orientation_89e55b : aliased Runner_1.Test_Case;
   Case_6_1_Test_Update_Wanted_Orientation_924aa7 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxGet_New_Thruster_Control_Values_a7395a,
         "navigation-dispatcher.ads:16:4:",
         Test_pxGet_New_Thruster_Control_Values_a7395a'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_Component_PID_Scalings_444661,
         "navigation-dispatcher.ads:18:4:",
         Test_Set_New_Component_PID_Scalings_444661'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Current_Position_86c018,
         "navigation-dispatcher.ads:20:4:",
         Test_Update_Current_Position_86c018'Access);
      Runner_1.Create
        (Case_4_1_Test_Update_Wanted_Position_eaf0c9,
         "navigation-dispatcher.ads:21:4:",
         Test_Update_Wanted_Position_eaf0c9'Access);
      Runner_1.Create
        (Case_5_1_Test_Update_Current_Orientation_89e55b,
         "navigation-dispatcher.ads:23:4:",
         Test_Update_Current_Orientation_89e55b'Access);
      Runner_1.Create
        (Case_6_1_Test_Update_Wanted_Orientation_924aa7,
         "navigation-dispatcher.ads:24:4:",
         Test_Update_Wanted_Orientation_924aa7'Access);

      Result.Add_Test (Case_1_1_Test_pxGet_New_Thruster_Control_Values_a7395a'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_Component_PID_Scalings_444661'Access);
      Result.Add_Test (Case_3_1_Test_Update_Current_Position_86c018'Access);
      Result.Add_Test (Case_4_1_Test_Update_Wanted_Position_eaf0c9'Access);
      Result.Add_Test (Case_5_1_Test_Update_Current_Orientation_89e55b'Access);
      Result.Add_Test (Case_6_1_Test_Update_Wanted_Orientation_924aa7'Access);

      return Result'Access;

   end Suite;

end Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Suite;
--  end read only
