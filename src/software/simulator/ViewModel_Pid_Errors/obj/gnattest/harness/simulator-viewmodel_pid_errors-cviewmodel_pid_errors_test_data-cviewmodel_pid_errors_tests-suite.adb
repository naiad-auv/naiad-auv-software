--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors_Test_Data.CViewModel_Pid_Errors_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors_Test_Data.CViewModel_Pid_Errors_Tests.Test_CViewModel_Pid_Errors);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_fGet_Pid_Errors_6a722c : aliased Runner_1.Test_Case;
   Case_2_1_Test_fGet_Maximum_Error_32e500 : aliased Runner_1.Test_Case;
   Case_3_1_Test_fGet_Minimum_Error_7e5a06 : aliased Runner_1.Test_Case;
   Case_4_1_Test_fGet_Min_Max_Error_Diff_5f43c8 : aliased Runner_1.Test_Case;
   Case_5_1_Test_fGet_OscilationTime_cceda5 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Update_Min_Max_Error_Buffers_7ae9d9 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Update_Delta_Time_e463ab : aliased Runner_1.Test_Case;
   Case_8_1_Test_Reset_Min_Max_Error_Buffers_367ec6 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_fGet_Pid_Errors_6a722c,
         "simulator-viewmodel_pid_errors.ads:14:4:",
         Test_fGet_Pid_Errors_6a722c'Access);
      Runner_1.Create
        (Case_2_1_Test_fGet_Maximum_Error_32e500,
         "simulator-viewmodel_pid_errors.ads:16:4:",
         Test_fGet_Maximum_Error_32e500'Access);
      Runner_1.Create
        (Case_3_1_Test_fGet_Minimum_Error_7e5a06,
         "simulator-viewmodel_pid_errors.ads:18:4:",
         Test_fGet_Minimum_Error_7e5a06'Access);
      Runner_1.Create
        (Case_4_1_Test_fGet_Min_Max_Error_Diff_5f43c8,
         "simulator-viewmodel_pid_errors.ads:20:4:",
         Test_fGet_Min_Max_Error_Diff_5f43c8'Access);
      Runner_1.Create
        (Case_5_1_Test_fGet_OscilationTime_cceda5,
         "simulator-viewmodel_pid_errors.ads:22:4:",
         Test_fGet_OscilationTime_cceda5'Access);
      Runner_1.Create
        (Case_6_1_Test_Update_Min_Max_Error_Buffers_7ae9d9,
         "simulator-viewmodel_pid_errors.ads:26:4:",
         Test_Update_Min_Max_Error_Buffers_7ae9d9'Access);
      Runner_1.Create
        (Case_7_1_Test_Update_Delta_Time_e463ab,
         "simulator-viewmodel_pid_errors.ads:28:4:",
         Test_Update_Delta_Time_e463ab'Access);
      Runner_1.Create
        (Case_8_1_Test_Reset_Min_Max_Error_Buffers_367ec6,
         "simulator-viewmodel_pid_errors.ads:30:4:",
         Test_Reset_Min_Max_Error_Buffers_367ec6'Access);

      Result.Add_Test (Case_1_1_Test_fGet_Pid_Errors_6a722c'Access);
      Result.Add_Test (Case_2_1_Test_fGet_Maximum_Error_32e500'Access);
      Result.Add_Test (Case_3_1_Test_fGet_Minimum_Error_7e5a06'Access);
      Result.Add_Test (Case_4_1_Test_fGet_Min_Max_Error_Diff_5f43c8'Access);
      Result.Add_Test (Case_5_1_Test_fGet_OscilationTime_cceda5'Access);
      Result.Add_Test (Case_6_1_Test_Update_Min_Max_Error_Buffers_7ae9d9'Access);
      Result.Add_Test (Case_7_1_Test_Update_Delta_Time_e463ab'Access);
      Result.Add_Test (Case_8_1_Test_Reset_Min_Max_Error_Buffers_367ec6'Access);

      return Result'Access;

   end Suite;

end Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors_Test_Data.CViewModel_Pid_Errors_Tests.Suite;
--  end read only
