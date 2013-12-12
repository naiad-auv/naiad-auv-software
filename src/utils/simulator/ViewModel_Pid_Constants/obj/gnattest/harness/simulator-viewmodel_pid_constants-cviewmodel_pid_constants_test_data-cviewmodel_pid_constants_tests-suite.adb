--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data.CViewmodel_Pid_Constants_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data.CViewmodel_Pid_Constants_Tests.Test_CViewmodel_Pid_Constants);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_fGet_Selected_Pid_Scaling_Proprotional_Part_6795e3 : aliased Runner_1.Test_Case;
   Case_2_1_Test_fGet_Selected_Pid_Scaling_Integrating_Part_f46e16 : aliased Runner_1.Test_Case;
   Case_3_1_Test_fGet_Selected_Pid_Scaling_Derivative_Part_41c024 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Set_Selected_Pid_809486 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Set_Value_Of_Selected_Pid_53edea : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_fGet_Selected_Pid_Scaling_Proprotional_Part_6795e3,
         "simulator-viewmodel_pid_constants.ads:15:4:",
         Test_fGet_Selected_Pid_Scaling_Proprotional_Part_6795e3'Access);
      Runner_1.Create
        (Case_2_1_Test_fGet_Selected_Pid_Scaling_Integrating_Part_f46e16,
         "simulator-viewmodel_pid_constants.ads:16:4:",
         Test_fGet_Selected_Pid_Scaling_Integrating_Part_f46e16'Access);
      Runner_1.Create
        (Case_3_1_Test_fGet_Selected_Pid_Scaling_Derivative_Part_41c024,
         "simulator-viewmodel_pid_constants.ads:17:4:",
         Test_fGet_Selected_Pid_Scaling_Derivative_Part_41c024'Access);
      Runner_1.Create
        (Case_4_1_Test_Set_Selected_Pid_809486,
         "simulator-viewmodel_pid_constants.ads:19:4:",
         Test_Set_Selected_Pid_809486'Access);
      Runner_1.Create
        (Case_5_1_Test_Set_Value_Of_Selected_Pid_53edea,
         "simulator-viewmodel_pid_constants.ads:20:4:",
         Test_Set_Value_Of_Selected_Pid_53edea'Access);

      Result.Add_Test (Case_1_1_Test_fGet_Selected_Pid_Scaling_Proprotional_Part_6795e3'Access);
      Result.Add_Test (Case_2_1_Test_fGet_Selected_Pid_Scaling_Integrating_Part_f46e16'Access);
      Result.Add_Test (Case_3_1_Test_fGet_Selected_Pid_Scaling_Derivative_Part_41c024'Access);
      Result.Add_Test (Case_4_1_Test_Set_Selected_Pid_809486'Access);
      Result.Add_Test (Case_5_1_Test_Set_Value_Of_Selected_Pid_53edea'Access);

      return Result'Access;

   end Suite;

end Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data.CViewmodel_Pid_Constants_Tests.Suite;
--  end read only
