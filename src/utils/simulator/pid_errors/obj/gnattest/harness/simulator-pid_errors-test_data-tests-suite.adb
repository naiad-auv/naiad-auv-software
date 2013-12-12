--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.Pid_Errors.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.Pid_Errors.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_fCalculate_Error_Component_e1f218 : aliased Runner_1.Test_Case;
   Case_2_1_Test_fCalculate_Current_Positional_Errors_f9283a : aliased Runner_1.Test_Case;
   Case_3_1_Test_fCalculate_Current_Z_Rotation_Error_d71094 : aliased Runner_1.Test_Case;
   Case_4_1_Test_fCalculate_Current_Y_Rotation_Error_a52222 : aliased Runner_1.Test_Case;
   Case_5_1_Test_fCalculate_Current_X_Rotation_Error_347530 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_fCalculate_Error_Component_e1f218,
         "simulator-pid_errors.ads:17:4:",
         Test_fCalculate_Error_Component_e1f218'Access);
      Runner_1.Create
        (Case_2_1_Test_fCalculate_Current_Positional_Errors_f9283a,
         "simulator-pid_errors.ads:27:4:",
         Test_fCalculate_Current_Positional_Errors_f9283a'Access);
      Runner_1.Create
        (Case_3_1_Test_fCalculate_Current_Z_Rotation_Error_d71094,
         "simulator-pid_errors.ads:28:4:",
         Test_fCalculate_Current_Z_Rotation_Error_d71094'Access);
      Runner_1.Create
        (Case_4_1_Test_fCalculate_Current_Y_Rotation_Error_a52222,
         "simulator-pid_errors.ads:29:4:",
         Test_fCalculate_Current_Y_Rotation_Error_a52222'Access);
      Runner_1.Create
        (Case_5_1_Test_fCalculate_Current_X_Rotation_Error_347530,
         "simulator-pid_errors.ads:30:4:",
         Test_fCalculate_Current_X_Rotation_Error_347530'Access);

      Result.Add_Test (Case_1_1_Test_fCalculate_Error_Component_e1f218'Access);
      Result.Add_Test (Case_2_1_Test_fCalculate_Current_Positional_Errors_f9283a'Access);
      Result.Add_Test (Case_3_1_Test_fCalculate_Current_Z_Rotation_Error_d71094'Access);
      Result.Add_Test (Case_4_1_Test_fCalculate_Current_Y_Rotation_Error_a52222'Access);
      Result.Add_Test (Case_5_1_Test_fCalculate_Current_X_Rotation_Error_347530'Access);

      return Result'Access;

   end Suite;

end Simulator.Pid_Errors.Test_Data.Tests.Suite;
--  end read only
