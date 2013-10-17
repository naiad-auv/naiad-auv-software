--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Matrices.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Matrices.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_From_Quaternion_7a9b71 : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_Rotation_Around_X_Axis_dc136b : aliased Runner_1.Test_Case;
   Case_3_1_Test_pxCreate_Rotation_Around_Y_Axis_1fc26a : aliased Runner_1.Test_Case;
   Case_4_1_Test_pxCreate_Rotation_Around_Z_Axis_0d121c : aliased Runner_1.Test_Case;
   Case_5_1_Test_pxCreate_Identity_4ca1dd : aliased Runner_1.Test_Case;
   Case_6_1_Test_pxCreate_23e020 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Multiply_519195 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Multiply_89b399 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Multiply_a96879 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Equal_1c1727 : aliased Runner_1.Test_Case;
   Case_11_1_Test_Swap_Values_In_Extended_Matrix_d790ab : aliased Runner_1.Test_Case;
   Case_12_1_Test_Swap_Rows_In_Extended_Matrix_e8fd17 : aliased Runner_1.Test_Case;
   Case_13_1_Test_Scale_Row_In_Extended_Matrix_51dfbc : aliased Runner_1.Test_Case;
   Case_14_1_Test_Remove_Component_In_Following_Rows_6495d3 : aliased Runner_1.Test_Case;
   Case_15_1_Test_Remove_Component_In_Leading_Rows_4f91f1 : aliased Runner_1.Test_Case;
   Case_16_1_Test_Find_Row_With_Highest_Component_203fad : aliased Runner_1.Test_Case;
   Case_17_1_Test_Perform_Gauss_Jordan_Elimination_On_00378a : aliased Runner_1.Test_Case;
   Case_18_1_Test_tfCreate_Extended_Matrix_From_d7fdf5 : aliased Runner_1.Test_Case;
   Case_19_1_Test_tfGet_Inverse_Part_From_e434a4 : aliased Runner_1.Test_Case;
   Case_20_1_Test_bMatrix_Has_No_Inverse_8de23e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_From_Quaternion_7a9b71,
         "math-matrices.ads:16:4:",
         Test_pxCreate_From_Quaternion_7a9b71'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_Rotation_Around_X_Axis_dc136b,
         "math-matrices.ads:17:4:",
         Test_pxCreate_Rotation_Around_X_Axis_dc136b'Access);
      Runner_1.Create
        (Case_3_1_Test_pxCreate_Rotation_Around_Y_Axis_1fc26a,
         "math-matrices.ads:18:4:",
         Test_pxCreate_Rotation_Around_Y_Axis_1fc26a'Access);
      Runner_1.Create
        (Case_4_1_Test_pxCreate_Rotation_Around_Z_Axis_0d121c,
         "math-matrices.ads:19:4:",
         Test_pxCreate_Rotation_Around_Z_Axis_0d121c'Access);
      Runner_1.Create
        (Case_5_1_Test_pxCreate_Identity_4ca1dd,
         "math-matrices.ads:20:4:",
         Test_pxCreate_Identity_4ca1dd'Access);
      Runner_1.Create
        (Case_6_1_Test_pxCreate_23e020,
         "math-matrices.ads:21:4:",
         Test_pxCreate_23e020'Access);
      Runner_1.Create
        (Case_7_1_Test_Multiply_519195,
         "math-matrices.ads:23:4:",
         Test_Multiply_519195'Access);
      Runner_1.Create
        (Case_8_1_Test_Multiply_89b399,
         "math-matrices.ads:24:4:",
         Test_Multiply_89b399'Access);
      Runner_1.Create
        (Case_9_1_Test_Multiply_a96879,
         "math-matrices.ads:25:4:",
         Test_Multiply_a96879'Access);
      Runner_1.Create
        (Case_10_1_Test_Equal_1c1727,
         "math-matrices.ads:26:4:",
         Test_Equal_1c1727'Access);
      Runner_1.Create
        (Case_11_1_Test_Swap_Values_In_Extended_Matrix_d790ab,
         "math-matrices.ads:47:4:",
         Test_Swap_Values_In_Extended_Matrix_d790ab'Access);
      Runner_1.Create
        (Case_12_1_Test_Swap_Rows_In_Extended_Matrix_e8fd17,
         "math-matrices.ads:48:4:",
         Test_Swap_Rows_In_Extended_Matrix_e8fd17'Access);
      Runner_1.Create
        (Case_13_1_Test_Scale_Row_In_Extended_Matrix_51dfbc,
         "math-matrices.ads:49:4:",
         Test_Scale_Row_In_Extended_Matrix_51dfbc'Access);
      Runner_1.Create
        (Case_14_1_Test_Remove_Component_In_Following_Rows_6495d3,
         "math-matrices.ads:50:4:",
         Test_Remove_Component_In_Following_Rows_6495d3'Access);
      Runner_1.Create
        (Case_15_1_Test_Remove_Component_In_Leading_Rows_4f91f1,
         "math-matrices.ads:51:4:",
         Test_Remove_Component_In_Leading_Rows_4f91f1'Access);
      Runner_1.Create
        (Case_16_1_Test_Find_Row_With_Highest_Component_203fad,
         "math-matrices.ads:52:4:",
         Test_Find_Row_With_Highest_Component_203fad'Access);
      Runner_1.Create
        (Case_17_1_Test_Perform_Gauss_Jordan_Elimination_On_00378a,
         "math-matrices.ads:53:4:",
         Test_Perform_Gauss_Jordan_Elimination_On_00378a'Access);
      Runner_1.Create
        (Case_18_1_Test_tfCreate_Extended_Matrix_From_d7fdf5,
         "math-matrices.ads:54:4:",
         Test_tfCreate_Extended_Matrix_From_d7fdf5'Access);
      Runner_1.Create
        (Case_19_1_Test_tfGet_Inverse_Part_From_e434a4,
         "math-matrices.ads:55:4:",
         Test_tfGet_Inverse_Part_From_e434a4'Access);
      Runner_1.Create
        (Case_20_1_Test_bMatrix_Has_No_Inverse_8de23e,
         "math-matrices.ads:56:4:",
         Test_bMatrix_Has_No_Inverse_8de23e'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_From_Quaternion_7a9b71'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_Rotation_Around_X_Axis_dc136b'Access);
      Result.Add_Test (Case_3_1_Test_pxCreate_Rotation_Around_Y_Axis_1fc26a'Access);
      Result.Add_Test (Case_4_1_Test_pxCreate_Rotation_Around_Z_Axis_0d121c'Access);
      Result.Add_Test (Case_5_1_Test_pxCreate_Identity_4ca1dd'Access);
      Result.Add_Test (Case_6_1_Test_pxCreate_23e020'Access);
      Result.Add_Test (Case_7_1_Test_Multiply_519195'Access);
      Result.Add_Test (Case_8_1_Test_Multiply_89b399'Access);
      Result.Add_Test (Case_9_1_Test_Multiply_a96879'Access);
      Result.Add_Test (Case_10_1_Test_Equal_1c1727'Access);
      Result.Add_Test (Case_11_1_Test_Swap_Values_In_Extended_Matrix_d790ab'Access);
      Result.Add_Test (Case_12_1_Test_Swap_Rows_In_Extended_Matrix_e8fd17'Access);
      Result.Add_Test (Case_13_1_Test_Scale_Row_In_Extended_Matrix_51dfbc'Access);
      Result.Add_Test (Case_14_1_Test_Remove_Component_In_Following_Rows_6495d3'Access);
      Result.Add_Test (Case_15_1_Test_Remove_Component_In_Leading_Rows_4f91f1'Access);
      Result.Add_Test (Case_16_1_Test_Find_Row_With_Highest_Component_203fad'Access);
      Result.Add_Test (Case_17_1_Test_Perform_Gauss_Jordan_Elimination_On_00378a'Access);
      Result.Add_Test (Case_18_1_Test_tfCreate_Extended_Matrix_From_d7fdf5'Access);
      Result.Add_Test (Case_19_1_Test_tfGet_Inverse_Part_From_e434a4'Access);
      Result.Add_Test (Case_20_1_Test_bMatrix_Has_No_Inverse_8de23e'Access);

      return Result'Access;

   end Suite;

end Math.Matrices.Test_Data.Tests.Suite;
--  end read only
