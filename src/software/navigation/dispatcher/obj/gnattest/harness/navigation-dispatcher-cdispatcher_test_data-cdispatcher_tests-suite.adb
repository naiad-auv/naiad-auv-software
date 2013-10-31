--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Test_CDispatcher);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_tfGet_Thruster_Values_503b8a : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_New_Component_PID_Scalings_444661 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Current_Absolute_Position_32eb63 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Update_Wanted_Absolute_Position_9393d4 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Update_Current_Absolute_Orientation_80028a : aliased Runner_1.Test_Case;
   Case_6_1_Test_Update_Wanted_Absolute_Orientation_69507e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_tfGet_Thruster_Values_503b8a,
         "navigation-dispatcher.ads:18:4:",
         Test_tfGet_Thruster_Values_503b8a'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_New_Component_PID_Scalings_444661,
         "navigation-dispatcher.ads:21:4:",
         Test_Set_New_Component_PID_Scalings_444661'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Current_Absolute_Position_32eb63,
         "navigation-dispatcher.ads:23:4:",
         Test_Update_Current_Absolute_Position_32eb63'Access);
      Runner_1.Create
        (Case_4_1_Test_Update_Wanted_Absolute_Position_9393d4,
         "navigation-dispatcher.ads:24:4:",
         Test_Update_Wanted_Absolute_Position_9393d4'Access);
      Runner_1.Create
        (Case_5_1_Test_Update_Current_Absolute_Orientation_80028a,
         "navigation-dispatcher.ads:26:4:",
         Test_Update_Current_Absolute_Orientation_80028a'Access);
      Runner_1.Create
        (Case_6_1_Test_Update_Wanted_Absolute_Orientation_69507e,
         "navigation-dispatcher.ads:27:4:",
         Test_Update_Wanted_Absolute_Orientation_69507e'Access);

      Result.Add_Test (Case_1_1_Test_tfGet_Thruster_Values_503b8a'Access);
      Result.Add_Test (Case_2_1_Test_Set_New_Component_PID_Scalings_444661'Access);
      Result.Add_Test (Case_3_1_Test_Update_Current_Absolute_Position_32eb63'Access);
      Result.Add_Test (Case_4_1_Test_Update_Wanted_Absolute_Position_9393d4'Access);
      Result.Add_Test (Case_5_1_Test_Update_Current_Absolute_Orientation_80028a'Access);
      Result.Add_Test (Case_6_1_Test_Update_Wanted_Absolute_Orientation_69507e'Access);

      return Result'Access;

   end Suite;

end Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests.Suite;
--  end read only
