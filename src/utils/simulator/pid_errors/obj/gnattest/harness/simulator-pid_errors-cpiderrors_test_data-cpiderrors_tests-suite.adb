--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.Pid_Errors.CPidErrors_Test_Data.CPidErrors_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.Pid_Errors.CPidErrors_Test_Data.CPidErrors_Tests.Test_CPidErrors);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Update_Errors_002883 : aliased Runner_1.Test_Case;
   Case_2_1_Test_fGet_PID_Error_For_Component_f6cf1a : aliased Runner_1.Test_Case;
   Case_3_1_Test_Update_Current_Positional_Errors_9c5c71 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Update_Current_Z_Rotation_Error_a63e74 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Update_Current_Y_Rotation_Error_df3b16 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Update_Current_X_Rotation_Error_0097a2 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Update_Errors_002883,
         "simulator-pid_errors.ads:17:4:",
         Test_Update_Errors_002883'Access);
      Runner_1.Create
        (Case_2_1_Test_fGet_PID_Error_For_Component_f6cf1a,
         "simulator-pid_errors.ads:18:4:",
         Test_fGet_PID_Error_For_Component_f6cf1a'Access);
      Runner_1.Create
        (Case_3_1_Test_Update_Current_Positional_Errors_9c5c71,
         "simulator-pid_errors.ads:26:4:",
         Test_Update_Current_Positional_Errors_9c5c71'Access);
      Runner_1.Create
        (Case_4_1_Test_Update_Current_Z_Rotation_Error_a63e74,
         "simulator-pid_errors.ads:27:4:",
         Test_Update_Current_Z_Rotation_Error_a63e74'Access);
      Runner_1.Create
        (Case_5_1_Test_Update_Current_Y_Rotation_Error_df3b16,
         "simulator-pid_errors.ads:28:4:",
         Test_Update_Current_Y_Rotation_Error_df3b16'Access);
      Runner_1.Create
        (Case_6_1_Test_Update_Current_X_Rotation_Error_0097a2,
         "simulator-pid_errors.ads:29:4:",
         Test_Update_Current_X_Rotation_Error_0097a2'Access);

      Result.Add_Test (Case_1_1_Test_Update_Errors_002883'Access);
      Result.Add_Test (Case_2_1_Test_fGet_PID_Error_For_Component_f6cf1a'Access);
      Result.Add_Test (Case_3_1_Test_Update_Current_Positional_Errors_9c5c71'Access);
      Result.Add_Test (Case_4_1_Test_Update_Current_Z_Rotation_Error_a63e74'Access);
      Result.Add_Test (Case_5_1_Test_Update_Current_Y_Rotation_Error_df3b16'Access);
      Result.Add_Test (Case_6_1_Test_Update_Current_X_Rotation_Error_0097a2'Access);

      return Result'Access;

   end Suite;

end Simulator.Pid_Errors.CPidErrors_Test_Data.CPidErrors_Tests.Suite;
--  end read only
