--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body simulator.Motion_Control_Wrapper.CWrapDispatcher_Test_Data.CWrapDispatcher_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.simulator.Motion_Control_Wrapper.CWrapDispatcher_Test_Data.CWrapDispatcher_Tests.Test_CWrapDispatcher);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Update_Pid_Scaling_b06b9e : aliased Runner_1.Test_Case;
   Case_2_1_Test_Update_Values_909a4a : aliased Runner_1.Test_Case;
   Case_3_1_Test_Restart_f94679 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Update_Wanted_Position_4e7de4 : aliased Runner_1.Test_Case;
   Case_5_1_Test_xGet_Wanted_Position_f355f1 : aliased Runner_1.Test_Case;
   Case_6_1_Test_xGet_Wanted_Orientation_a3ab5f : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Update_Pid_Scaling_b06b9e,
         "simulator-motion_control_wrapper.ads:23:4:",
         Test_Update_Pid_Scaling_b06b9e'Access);
      Runner_1.Create
        (Case_2_1_Test_Update_Values_909a4a,
         "simulator-motion_control_wrapper.ads:25:4:",
         Test_Update_Values_909a4a'Access);
      Runner_1.Create
        (Case_3_1_Test_Restart_f94679,
         "simulator-motion_control_wrapper.ads:32:4:",
         Test_Restart_f94679'Access);
      Runner_1.Create
        (Case_4_1_Test_Update_Wanted_Position_4e7de4,
         "simulator-motion_control_wrapper.ads:33:4:",
         Test_Update_Wanted_Position_4e7de4'Access);
      Runner_1.Create
        (Case_5_1_Test_xGet_Wanted_Position_f355f1,
         "simulator-motion_control_wrapper.ads:36:4:",
         Test_xGet_Wanted_Position_f355f1'Access);
      Runner_1.Create
        (Case_6_1_Test_xGet_Wanted_Orientation_a3ab5f,
         "simulator-motion_control_wrapper.ads:37:4:",
         Test_xGet_Wanted_Orientation_a3ab5f'Access);

      Result.Add_Test (Case_1_1_Test_Update_Pid_Scaling_b06b9e'Access);
      Result.Add_Test (Case_2_1_Test_Update_Values_909a4a'Access);
      Result.Add_Test (Case_3_1_Test_Restart_f94679'Access);
      Result.Add_Test (Case_4_1_Test_Update_Wanted_Position_4e7de4'Access);
      Result.Add_Test (Case_5_1_Test_xGet_Wanted_Position_f355f1'Access);
      Result.Add_Test (Case_6_1_Test_xGet_Wanted_Orientation_a3ab5f'Access);

      return Result'Access;

   end Suite;

end simulator.Motion_Control_Wrapper.CWrapDispatcher_Test_Data.CWrapDispatcher_Tests.Suite;
--  end read only
