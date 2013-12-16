--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Matrices.CMatrix_Test_Data.CMatrix_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Matrices.CMatrix_Test_Data.CMatrix_Tests.Test_CMatrix);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xCreate_From_Quaternion_f86e2f : aliased Runner_1.Test_Case;
   Case_2_1_Test_xCreate_From_Quaternion_86afc5 : aliased Runner_1.Test_Case;
   Case_3_1_Test_xCreate_Rotation_Around_X_Axis_7041a2 : aliased Runner_1.Test_Case;
   Case_4_1_Test_xCreate_Rotation_Around_Y_Axis_1798e3 : aliased Runner_1.Test_Case;
   Case_5_1_Test_xCreate_Rotation_Around_Z_Axis_733338 : aliased Runner_1.Test_Case;
   Case_6_1_Test_xCreate_Identity_06e45e : aliased Runner_1.Test_Case;
   Case_7_1_Test_xCreate_eccce0 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Multiply_de58ed : aliased Runner_1.Test_Case;
   Case_9_1_Test_Multiply_cd8faa : aliased Runner_1.Test_Case;
   Case_10_1_Test_Multiply_a7f632 : aliased Runner_1.Test_Case;
   Case_11_1_Test_Multiply_ef8be2 : aliased Runner_1.Test_Case;
   Case_12_1_Test_Multiply_00cd6c : aliased Runner_1.Test_Case;
   Case_13_1_Test_Multiply_516784 : aliased Runner_1.Test_Case;
   Case_14_1_Test_Multiply_9d5466 : aliased Runner_1.Test_Case;
   Case_15_1_Test_Multiply_e3eb8a : aliased Runner_1.Test_Case;
   Case_16_1_Test_Equal_696cd5 : aliased Runner_1.Test_Case;
   Case_17_1_Test_xGet_Inverse_f43d19 : aliased Runner_1.Test_Case;
   Case_18_1_Test_pxGet_Allocated_Copy_14197c : aliased Runner_1.Test_Case;
   Case_19_1_Test_xGet_Transpose_9e263e : aliased Runner_1.Test_Case;
   Case_20_1_Test_tfGet_Raw_Matrix_d46bc2 : aliased Runner_1.Test_Case;
   Case_21_1_Test_fGet_Determinant_6a3440 : aliased Runner_1.Test_Case;
   Case_22_1_Test_xGet_X_Vector_3797d4 : aliased Runner_1.Test_Case;
   Case_23_1_Test_xGet_Y_Vector_d433bc : aliased Runner_1.Test_Case;
   Case_24_1_Test_xGet_Z_Vector_af4bea : aliased Runner_1.Test_Case;
   Case_25_1_Test_Copy_From_64b66f : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xCreate_From_Quaternion_f86e2f,
         "math-matrices.ads:30:4:",
         Test_xCreate_From_Quaternion_f86e2f'Access);
      Runner_1.Create
        (Case_2_1_Test_xCreate_From_Quaternion_86afc5,
         "math-matrices.ads:31:4:",
         Test_xCreate_From_Quaternion_86afc5'Access);
      Runner_1.Create
        (Case_3_1_Test_xCreate_Rotation_Around_X_Axis_7041a2,
         "math-matrices.ads:36:4:",
         Test_xCreate_Rotation_Around_X_Axis_7041a2'Access);
      Runner_1.Create
        (Case_4_1_Test_xCreate_Rotation_Around_Y_Axis_1798e3,
         "math-matrices.ads:41:4:",
         Test_xCreate_Rotation_Around_Y_Axis_1798e3'Access);
      Runner_1.Create
        (Case_5_1_Test_xCreate_Rotation_Around_Z_Axis_733338,
         "math-matrices.ads:46:4:",
         Test_xCreate_Rotation_Around_Z_Axis_733338'Access);
      Runner_1.Create
        (Case_6_1_Test_xCreate_Identity_06e45e,
         "math-matrices.ads:51:4:",
         Test_xCreate_Identity_06e45e'Access);
      Runner_1.Create
        (Case_7_1_Test_xCreate_eccce0,
         "math-matrices.ads:54:4:",
         Test_xCreate_eccce0'Access);
      Runner_1.Create
        (Case_8_1_Test_Multiply_de58ed,
         "math-matrices.ads:58:4:",
         Test_Multiply_de58ed'Access);
      Runner_1.Create
        (Case_9_1_Test_Multiply_cd8faa,
         "math-matrices.ads:59:4:",
         Test_Multiply_cd8faa'Access);
      Runner_1.Create
        (Case_10_1_Test_Multiply_a7f632,
         "math-matrices.ads:60:4:",
         Test_Multiply_a7f632'Access);
      Runner_1.Create
        (Case_11_1_Test_Multiply_ef8be2,
         "math-matrices.ads:61:4:",
         Test_Multiply_ef8be2'Access);
      Runner_1.Create
        (Case_12_1_Test_Multiply_00cd6c,
         "math-matrices.ads:67:4:",
         Test_Multiply_00cd6c'Access);
      Runner_1.Create
        (Case_13_1_Test_Multiply_516784,
         "math-matrices.ads:69:4:",
         Test_Multiply_516784'Access);
      Runner_1.Create
        (Case_14_1_Test_Multiply_9d5466,
         "math-matrices.ads:75:4:",
         Test_Multiply_9d5466'Access);
      Runner_1.Create
        (Case_15_1_Test_Multiply_e3eb8a,
         "math-matrices.ads:77:4:",
         Test_Multiply_e3eb8a'Access);
      Runner_1.Create
        (Case_16_1_Test_Equal_696cd5,
         "math-matrices.ads:82:4:",
         Test_Equal_696cd5'Access);
      Runner_1.Create
        (Case_17_1_Test_xGet_Inverse_f43d19,
         "math-matrices.ads:87:4:",
         Test_xGet_Inverse_f43d19'Access);
      Runner_1.Create
        (Case_18_1_Test_pxGet_Allocated_Copy_14197c,
         "math-matrices.ads:92:4:",
         Test_pxGet_Allocated_Copy_14197c'Access);
      Runner_1.Create
        (Case_19_1_Test_xGet_Transpose_9e263e,
         "math-matrices.ads:96:4:",
         Test_xGet_Transpose_9e263e'Access);
      Runner_1.Create
        (Case_20_1_Test_tfGet_Raw_Matrix_d46bc2,
         "math-matrices.ads:100:4:",
         Test_tfGet_Raw_Matrix_d46bc2'Access);
      Runner_1.Create
        (Case_21_1_Test_fGet_Determinant_6a3440,
         "math-matrices.ads:104:4:",
         Test_fGet_Determinant_6a3440'Access);
      Runner_1.Create
        (Case_22_1_Test_xGet_X_Vector_3797d4,
         "math-matrices.ads:107:4:",
         Test_xGet_X_Vector_3797d4'Access);
      Runner_1.Create
        (Case_23_1_Test_xGet_Y_Vector_d433bc,
         "math-matrices.ads:110:4:",
         Test_xGet_Y_Vector_d433bc'Access);
      Runner_1.Create
        (Case_24_1_Test_xGet_Z_Vector_af4bea,
         "math-matrices.ads:113:4:",
         Test_xGet_Z_Vector_af4bea'Access);
      Runner_1.Create
        (Case_25_1_Test_Copy_From_64b66f,
         "math-matrices.ads:116:4:",
         Test_Copy_From_64b66f'Access);

      Result.Add_Test (Case_1_1_Test_xCreate_From_Quaternion_f86e2f'Access);
      Result.Add_Test (Case_2_1_Test_xCreate_From_Quaternion_86afc5'Access);
      Result.Add_Test (Case_3_1_Test_xCreate_Rotation_Around_X_Axis_7041a2'Access);
      Result.Add_Test (Case_4_1_Test_xCreate_Rotation_Around_Y_Axis_1798e3'Access);
      Result.Add_Test (Case_5_1_Test_xCreate_Rotation_Around_Z_Axis_733338'Access);
      Result.Add_Test (Case_6_1_Test_xCreate_Identity_06e45e'Access);
      Result.Add_Test (Case_7_1_Test_xCreate_eccce0'Access);
      Result.Add_Test (Case_8_1_Test_Multiply_de58ed'Access);
      Result.Add_Test (Case_9_1_Test_Multiply_cd8faa'Access);
      Result.Add_Test (Case_10_1_Test_Multiply_a7f632'Access);
      Result.Add_Test (Case_11_1_Test_Multiply_ef8be2'Access);
      Result.Add_Test (Case_12_1_Test_Multiply_00cd6c'Access);
      Result.Add_Test (Case_13_1_Test_Multiply_516784'Access);
      Result.Add_Test (Case_14_1_Test_Multiply_9d5466'Access);
      Result.Add_Test (Case_15_1_Test_Multiply_e3eb8a'Access);
      Result.Add_Test (Case_16_1_Test_Equal_696cd5'Access);
      Result.Add_Test (Case_17_1_Test_xGet_Inverse_f43d19'Access);
      Result.Add_Test (Case_18_1_Test_pxGet_Allocated_Copy_14197c'Access);
      Result.Add_Test (Case_19_1_Test_xGet_Transpose_9e263e'Access);
      Result.Add_Test (Case_20_1_Test_tfGet_Raw_Matrix_d46bc2'Access);
      Result.Add_Test (Case_21_1_Test_fGet_Determinant_6a3440'Access);
      Result.Add_Test (Case_22_1_Test_xGet_X_Vector_3797d4'Access);
      Result.Add_Test (Case_23_1_Test_xGet_Y_Vector_d433bc'Access);
      Result.Add_Test (Case_24_1_Test_xGet_Z_Vector_af4bea'Access);
      Result.Add_Test (Case_25_1_Test_Copy_From_64b66f'Access);

      return Result'Access;

   end Suite;

end Math.Matrices.CMatrix_Test_Data.CMatrix_Tests.Suite;
--  end read only
