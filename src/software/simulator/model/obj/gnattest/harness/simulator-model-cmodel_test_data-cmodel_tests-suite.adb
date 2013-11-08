--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.Model.CModel_Test_Data.CModel_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.Model.CModel_Test_Data.CModel_Tests.Test_CModel);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Update_Model_3461c1 : aliased Runner_1.Test_Case;
   Case_2_1_Test_xGet_Current_Submarine_Positional_Vector_288392 : aliased Runner_1.Test_Case;
   Case_3_1_Test_xGet_Current_Submarine_Orientation_Matrix_926383 : aliased Runner_1.Test_Case;
   Case_4_1_Test_xGet_Wanted_Submarine_Positional_Vector_58e8e7 : aliased Runner_1.Test_Case;
   Case_5_1_Test_xGet_Wanted_Submarine_Orientation_Matrix_490d57 : aliased Runner_1.Test_Case;
   Case_6_1_Test_xGet_Current_Submarine_Velocity_Vector_a272c0 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGet_Motor_Force_6e127f : aliased Runner_1.Test_Case;
   Case_8_1_Test_Set_Wanted_Position_And_Orientation_d82248 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Set_Pid_Scaling_ecf840 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Restart_3f83e6 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Update_Model_3461c1,
         "simulator-model.ads:22:4:",
         Test_Update_Model_3461c1'Access);
      Runner_1.Create
        (Case_2_1_Test_xGet_Current_Submarine_Positional_Vector_288392,
         "simulator-model.ads:24:4:",
         Test_xGet_Current_Submarine_Positional_Vector_288392'Access);
      Runner_1.Create
        (Case_3_1_Test_xGet_Current_Submarine_Orientation_Matrix_926383,
         "simulator-model.ads:25:4:",
         Test_xGet_Current_Submarine_Orientation_Matrix_926383'Access);
      Runner_1.Create
        (Case_4_1_Test_xGet_Wanted_Submarine_Positional_Vector_58e8e7,
         "simulator-model.ads:26:4:",
         Test_xGet_Wanted_Submarine_Positional_Vector_58e8e7'Access);
      Runner_1.Create
        (Case_5_1_Test_xGet_Wanted_Submarine_Orientation_Matrix_490d57,
         "simulator-model.ads:27:4:",
         Test_xGet_Wanted_Submarine_Orientation_Matrix_490d57'Access);
      Runner_1.Create
        (Case_6_1_Test_xGet_Current_Submarine_Velocity_Vector_a272c0,
         "simulator-model.ads:28:4:",
         Test_xGet_Current_Submarine_Velocity_Vector_a272c0'Access);
      Runner_1.Create
        (Case_7_1_Test_fGet_Motor_Force_6e127f,
         "simulator-model.ads:29:4:",
         Test_fGet_Motor_Force_6e127f'Access);
      Runner_1.Create
        (Case_8_1_Test_Set_Wanted_Position_And_Orientation_d82248,
         "simulator-model.ads:31:4:",
         Test_Set_Wanted_Position_And_Orientation_d82248'Access);
      Runner_1.Create
        (Case_9_1_Test_Set_Pid_Scaling_ecf840,
         "simulator-model.ads:33:4:",
         Test_Set_Pid_Scaling_ecf840'Access);
      Runner_1.Create
        (Case_10_1_Test_Restart_3f83e6,
         "simulator-model.ads:34:4:",
         Test_Restart_3f83e6'Access);

      Result.Add_Test (Case_1_1_Test_Update_Model_3461c1'Access);
      Result.Add_Test (Case_2_1_Test_xGet_Current_Submarine_Positional_Vector_288392'Access);
      Result.Add_Test (Case_3_1_Test_xGet_Current_Submarine_Orientation_Matrix_926383'Access);
      Result.Add_Test (Case_4_1_Test_xGet_Wanted_Submarine_Positional_Vector_58e8e7'Access);
      Result.Add_Test (Case_5_1_Test_xGet_Wanted_Submarine_Orientation_Matrix_490d57'Access);
      Result.Add_Test (Case_6_1_Test_xGet_Current_Submarine_Velocity_Vector_a272c0'Access);
      Result.Add_Test (Case_7_1_Test_fGet_Motor_Force_6e127f'Access);
      Result.Add_Test (Case_8_1_Test_Set_Wanted_Position_And_Orientation_d82248'Access);
      Result.Add_Test (Case_9_1_Test_Set_Pid_Scaling_ecf840'Access);
      Result.Add_Test (Case_10_1_Test_Restart_3f83e6'Access);

      return Result'Access;

   end Suite;

end Simulator.Model.CModel_Test_Data.CModel_Tests.Suite;
--  end read only
