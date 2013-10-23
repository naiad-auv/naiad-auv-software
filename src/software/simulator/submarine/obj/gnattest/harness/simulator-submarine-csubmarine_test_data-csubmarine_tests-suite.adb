--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body simulator.submarine.CSubmarine_Test_Data.CSubmarine_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.simulator.submarine.CSubmarine_Test_Data.CSubmarine_Tests.Test_CSubmarine);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxGet_Position_Vector_1a4a9e : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxGet_Velocity_Vector_feac87 : aliased Runner_1.Test_Case;
   Case_3_1_Test_pxGet_Orientation_Matrix_a37cba : aliased Runner_1.Test_Case;
   Case_4_1_Test_pxGet_Angular_Velocity_Vector_1d26d6 : aliased Runner_1.Test_Case;
   Case_5_1_Test_pxGet_Motor_Values_45ed60 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Set_Position_Vector_decf7f : aliased Runner_1.Test_Case;
   Case_7_1_Test_Set_Orientation_Matrix_6a4bc0 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Set_Velocity_Vector_174b8c : aliased Runner_1.Test_Case;
   Case_9_1_Test_Set_Angular_Velocity_Vector_49aadb : aliased Runner_1.Test_Case;
   Case_10_1_Test_Set_Motor_Info_ae0f8d : aliased Runner_1.Test_Case;
   Case_11_1_Test_Set_Motor_Force_22e88d : aliased Runner_1.Test_Case;
   Case_12_1_Test_Set_Weight_df8cdc : aliased Runner_1.Test_Case;
   Case_13_1_Test_Set_Buoyancy_Force_c2f9a4 : aliased Runner_1.Test_Case;
   Case_14_1_Test_Set_Buoyancy_Force_Position_Vector_dee059 : aliased Runner_1.Test_Case;
   Case_15_1_Test_Set_Rotation_Friction_Vector_b6db04 : aliased Runner_1.Test_Case;
   Case_16_1_Test_Set_Veclocity_Friction_Vector_57733d : aliased Runner_1.Test_Case;
   Case_17_1_Test_Set_Inertia_Matrix_5d5d83 : aliased Runner_1.Test_Case;
   Case_18_1_Test_Calculate_Acceleration_559bc8 : aliased Runner_1.Test_Case;
   Case_19_1_Test_Calculate_Angular_Acceleration_daef8b : aliased Runner_1.Test_Case;
   Case_20_1_Test_Integrate_Submarine_Variables_8288c8 : aliased Runner_1.Test_Case;
   Case_21_1_Test_Time_Step_Motor_Force_To_Integrate_b83376 : aliased Runner_1.Test_Case;
   Case_22_1_Test_Set_Gripper_Left_Status_9066c9 : aliased Runner_1.Test_Case;
   Case_23_1_Test_Set_Gripper_Right_Status_82ca32 : aliased Runner_1.Test_Case;
   Case_24_1_Test_Set_Dropper_Left_Status_9382b7 : aliased Runner_1.Test_Case;
   Case_25_1_Test_Set_Dropper_Right_Status_c22d27 : aliased Runner_1.Test_Case;
   Case_26_1_Test_Set_Depth_3efef2 : aliased Runner_1.Test_Case;
   Case_27_1_Test_bGet_Gripper_Left_Status_878bba : aliased Runner_1.Test_Case;
   Case_28_1_Test_bGet_Gripper_Right_Status_d2fdd1 : aliased Runner_1.Test_Case;
   Case_29_1_Test_bGet_Dropper_Left_Status_e732c2 : aliased Runner_1.Test_Case;
   Case_30_1_Test_bGet_Dropper_Right_Status_be1f1c : aliased Runner_1.Test_Case;
   Case_31_1_Test_fGet_Depth_100ec6 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxGet_Position_Vector_1a4a9e,
         "simulator-submarine.ads:19:4:",
         Test_pxGet_Position_Vector_1a4a9e'Access);
      Runner_1.Create
        (Case_2_1_Test_pxGet_Velocity_Vector_feac87,
         "simulator-submarine.ads:20:4:",
         Test_pxGet_Velocity_Vector_feac87'Access);
      Runner_1.Create
        (Case_3_1_Test_pxGet_Orientation_Matrix_a37cba,
         "simulator-submarine.ads:21:4:",
         Test_pxGet_Orientation_Matrix_a37cba'Access);
      Runner_1.Create
        (Case_4_1_Test_pxGet_Angular_Velocity_Vector_1d26d6,
         "simulator-submarine.ads:22:4:",
         Test_pxGet_Angular_Velocity_Vector_1d26d6'Access);
      Runner_1.Create
        (Case_5_1_Test_pxGet_Motor_Values_45ed60,
         "simulator-submarine.ads:23:4:",
         Test_pxGet_Motor_Values_45ed60'Access);
      Runner_1.Create
        (Case_6_1_Test_Set_Position_Vector_decf7f,
         "simulator-submarine.ads:25:4:",
         Test_Set_Position_Vector_decf7f'Access);
      Runner_1.Create
        (Case_7_1_Test_Set_Orientation_Matrix_6a4bc0,
         "simulator-submarine.ads:26:4:",
         Test_Set_Orientation_Matrix_6a4bc0'Access);
      Runner_1.Create
        (Case_8_1_Test_Set_Velocity_Vector_174b8c,
         "simulator-submarine.ads:27:4:",
         Test_Set_Velocity_Vector_174b8c'Access);
      Runner_1.Create
        (Case_9_1_Test_Set_Angular_Velocity_Vector_49aadb,
         "simulator-submarine.ads:28:4:",
         Test_Set_Angular_Velocity_Vector_49aadb'Access);
      Runner_1.Create
        (Case_10_1_Test_Set_Motor_Info_ae0f8d,
         "simulator-submarine.ads:30:4:",
         Test_Set_Motor_Info_ae0f8d'Access);
      Runner_1.Create
        (Case_11_1_Test_Set_Motor_Force_22e88d,
         "simulator-submarine.ads:31:4:",
         Test_Set_Motor_Force_22e88d'Access);
      Runner_1.Create
        (Case_12_1_Test_Set_Weight_df8cdc,
         "simulator-submarine.ads:33:4:",
         Test_Set_Weight_df8cdc'Access);
      Runner_1.Create
        (Case_13_1_Test_Set_Buoyancy_Force_c2f9a4,
         "simulator-submarine.ads:34:4:",
         Test_Set_Buoyancy_Force_c2f9a4'Access);
      Runner_1.Create
        (Case_14_1_Test_Set_Buoyancy_Force_Position_Vector_dee059,
         "simulator-submarine.ads:35:4:",
         Test_Set_Buoyancy_Force_Position_Vector_dee059'Access);
      Runner_1.Create
        (Case_15_1_Test_Set_Rotation_Friction_Vector_b6db04,
         "simulator-submarine.ads:36:4:",
         Test_Set_Rotation_Friction_Vector_b6db04'Access);
      Runner_1.Create
        (Case_16_1_Test_Set_Veclocity_Friction_Vector_57733d,
         "simulator-submarine.ads:37:4:",
         Test_Set_Veclocity_Friction_Vector_57733d'Access);
      Runner_1.Create
        (Case_17_1_Test_Set_Inertia_Matrix_5d5d83,
         "simulator-submarine.ads:39:4:",
         Test_Set_Inertia_Matrix_5d5d83'Access);
      Runner_1.Create
        (Case_18_1_Test_Calculate_Acceleration_559bc8,
         "simulator-submarine.ads:41:4:",
         Test_Calculate_Acceleration_559bc8'Access);
      Runner_1.Create
        (Case_19_1_Test_Calculate_Angular_Acceleration_daef8b,
         "simulator-submarine.ads:42:4:",
         Test_Calculate_Angular_Acceleration_daef8b'Access);
      Runner_1.Create
        (Case_20_1_Test_Integrate_Submarine_Variables_8288c8,
         "simulator-submarine.ads:43:4:",
         Test_Integrate_Submarine_Variables_8288c8'Access);
      Runner_1.Create
        (Case_21_1_Test_Time_Step_Motor_Force_To_Integrate_b83376,
         "simulator-submarine.ads:45:4:",
         Test_Time_Step_Motor_Force_To_Integrate_b83376'Access);
      Runner_1.Create
        (Case_22_1_Test_Set_Gripper_Left_Status_9066c9,
         "simulator-submarine.ads:47:4:",
         Test_Set_Gripper_Left_Status_9066c9'Access);
      Runner_1.Create
        (Case_23_1_Test_Set_Gripper_Right_Status_82ca32,
         "simulator-submarine.ads:48:4:",
         Test_Set_Gripper_Right_Status_82ca32'Access);
      Runner_1.Create
        (Case_24_1_Test_Set_Dropper_Left_Status_9382b7,
         "simulator-submarine.ads:49:4:",
         Test_Set_Dropper_Left_Status_9382b7'Access);
      Runner_1.Create
        (Case_25_1_Test_Set_Dropper_Right_Status_c22d27,
         "simulator-submarine.ads:50:4:",
         Test_Set_Dropper_Right_Status_c22d27'Access);
      Runner_1.Create
        (Case_26_1_Test_Set_Depth_3efef2,
         "simulator-submarine.ads:51:4:",
         Test_Set_Depth_3efef2'Access);
      Runner_1.Create
        (Case_27_1_Test_bGet_Gripper_Left_Status_878bba,
         "simulator-submarine.ads:53:4:",
         Test_bGet_Gripper_Left_Status_878bba'Access);
      Runner_1.Create
        (Case_28_1_Test_bGet_Gripper_Right_Status_d2fdd1,
         "simulator-submarine.ads:54:4:",
         Test_bGet_Gripper_Right_Status_d2fdd1'Access);
      Runner_1.Create
        (Case_29_1_Test_bGet_Dropper_Left_Status_e732c2,
         "simulator-submarine.ads:55:4:",
         Test_bGet_Dropper_Left_Status_e732c2'Access);
      Runner_1.Create
        (Case_30_1_Test_bGet_Dropper_Right_Status_be1f1c,
         "simulator-submarine.ads:56:4:",
         Test_bGet_Dropper_Right_Status_be1f1c'Access);
      Runner_1.Create
        (Case_31_1_Test_fGet_Depth_100ec6,
         "simulator-submarine.ads:57:4:",
         Test_fGet_Depth_100ec6'Access);

      Result.Add_Test (Case_1_1_Test_pxGet_Position_Vector_1a4a9e'Access);
      Result.Add_Test (Case_2_1_Test_pxGet_Velocity_Vector_feac87'Access);
      Result.Add_Test (Case_3_1_Test_pxGet_Orientation_Matrix_a37cba'Access);
      Result.Add_Test (Case_4_1_Test_pxGet_Angular_Velocity_Vector_1d26d6'Access);
      Result.Add_Test (Case_5_1_Test_pxGet_Motor_Values_45ed60'Access);
      Result.Add_Test (Case_6_1_Test_Set_Position_Vector_decf7f'Access);
      Result.Add_Test (Case_7_1_Test_Set_Orientation_Matrix_6a4bc0'Access);
      Result.Add_Test (Case_8_1_Test_Set_Velocity_Vector_174b8c'Access);
      Result.Add_Test (Case_9_1_Test_Set_Angular_Velocity_Vector_49aadb'Access);
      Result.Add_Test (Case_10_1_Test_Set_Motor_Info_ae0f8d'Access);
      Result.Add_Test (Case_11_1_Test_Set_Motor_Force_22e88d'Access);
      Result.Add_Test (Case_12_1_Test_Set_Weight_df8cdc'Access);
      Result.Add_Test (Case_13_1_Test_Set_Buoyancy_Force_c2f9a4'Access);
      Result.Add_Test (Case_14_1_Test_Set_Buoyancy_Force_Position_Vector_dee059'Access);
      Result.Add_Test (Case_15_1_Test_Set_Rotation_Friction_Vector_b6db04'Access);
      Result.Add_Test (Case_16_1_Test_Set_Veclocity_Friction_Vector_57733d'Access);
      Result.Add_Test (Case_17_1_Test_Set_Inertia_Matrix_5d5d83'Access);
      Result.Add_Test (Case_18_1_Test_Calculate_Acceleration_559bc8'Access);
      Result.Add_Test (Case_19_1_Test_Calculate_Angular_Acceleration_daef8b'Access);
      Result.Add_Test (Case_20_1_Test_Integrate_Submarine_Variables_8288c8'Access);
      Result.Add_Test (Case_21_1_Test_Time_Step_Motor_Force_To_Integrate_b83376'Access);
      Result.Add_Test (Case_22_1_Test_Set_Gripper_Left_Status_9066c9'Access);
      Result.Add_Test (Case_23_1_Test_Set_Gripper_Right_Status_82ca32'Access);
      Result.Add_Test (Case_24_1_Test_Set_Dropper_Left_Status_9382b7'Access);
      Result.Add_Test (Case_25_1_Test_Set_Dropper_Right_Status_c22d27'Access);
      Result.Add_Test (Case_26_1_Test_Set_Depth_3efef2'Access);
      Result.Add_Test (Case_27_1_Test_bGet_Gripper_Left_Status_878bba'Access);
      Result.Add_Test (Case_28_1_Test_bGet_Gripper_Right_Status_d2fdd1'Access);
      Result.Add_Test (Case_29_1_Test_bGet_Dropper_Left_Status_e732c2'Access);
      Result.Add_Test (Case_30_1_Test_bGet_Dropper_Right_Status_be1f1c'Access);
      Result.Add_Test (Case_31_1_Test_fGet_Depth_100ec6'Access);

      return Result'Access;

   end Suite;

end simulator.submarine.CSubmarine_Test_Data.CSubmarine_Tests.Suite;
--  end read only
