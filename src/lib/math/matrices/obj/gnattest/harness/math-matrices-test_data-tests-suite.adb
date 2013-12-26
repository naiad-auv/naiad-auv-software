--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Matrices.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Matrices.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Free_318ef1 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Multiply_46e300 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Multiply_816af5 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Multiply_4c80e1 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Multiply_bc380c : aliased Runner_1.Test_Case;
   Case_6_1_Test_Swap_Values_In_Extended_Matrix_d790ab : aliased Runner_1.Test_Case;
   Case_7_1_Test_Swap_Rows_In_Extended_Matrix_e8fd17 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Scale_Row_In_Extended_Matrix_51dfbc : aliased Runner_1.Test_Case;
   Case_9_1_Test_Remove_Component_In_Following_Rows_6495d3 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Remove_Component_In_Leading_Rows_4f91f1 : aliased Runner_1.Test_Case;
   Case_11_1_Test_Find_Row_With_Highest_Component_203fad : aliased Runner_1.Test_Case;
   Case_12_1_Test_Perform_Gauss_Jordan_Elimination_On_00378a : aliased Runner_1.Test_Case;
   Case_13_1_Test_tfCreate_Extended_Matrix_From_d7fdf5 : aliased Runner_1.Test_Case;
   Case_14_1_Test_tfGet_Inverse_Part_From_e434a4 : aliased Runner_1.Test_Case;
   Case_15_1_Test_bMatrix_Has_No_Inverse_8de23e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Free_318ef1,
         "math-matrices.ads:25:4:",
         Test_Free_318ef1'Access);
      Runner_1.Create
        (Case_2_1_Test_Multiply_46e300,
         "math-matrices.ads:66:4:",
         Test_Multiply_46e300'Access);
      Runner_1.Create
        (Case_3_1_Test_Multiply_816af5,
         "math-matrices.ads:68:4:",
         Test_Multiply_816af5'Access);
      Runner_1.Create
        (Case_4_1_Test_Multiply_4c80e1,
         "math-matrices.ads:74:4:",
         Test_Multiply_4c80e1'Access);
      Runner_1.Create
        (Case_5_1_Test_Multiply_bc380c,
         "math-matrices.ads:76:4:",
         Test_Multiply_bc380c'Access);
      Runner_1.Create
        (Case_6_1_Test_Swap_Values_In_Extended_Matrix_d790ab,
         "math-matrices.ads:130:4:",
         Test_Swap_Values_In_Extended_Matrix_d790ab'Access);
      Runner_1.Create
        (Case_7_1_Test_Swap_Rows_In_Extended_Matrix_e8fd17,
         "math-matrices.ads:131:4:",
         Test_Swap_Rows_In_Extended_Matrix_e8fd17'Access);
      Runner_1.Create
        (Case_8_1_Test_Scale_Row_In_Extended_Matrix_51dfbc,
         "math-matrices.ads:132:4:",
         Test_Scale_Row_In_Extended_Matrix_51dfbc'Access);
      Runner_1.Create
        (Case_9_1_Test_Remove_Component_In_Following_Rows_6495d3,
         "math-matrices.ads:133:4:",
         Test_Remove_Component_In_Following_Rows_6495d3'Access);
      Runner_1.Create
        (Case_10_1_Test_Remove_Component_In_Leading_Rows_4f91f1,
         "math-matrices.ads:134:4:",
         Test_Remove_Component_In_Leading_Rows_4f91f1'Access);
      Runner_1.Create
        (Case_11_1_Test_Find_Row_With_Highest_Component_203fad,
         "math-matrices.ads:135:4:",
         Test_Find_Row_With_Highest_Component_203fad'Access);
      Runner_1.Create
        (Case_12_1_Test_Perform_Gauss_Jordan_Elimination_On_00378a,
         "math-matrices.ads:136:4:",
         Test_Perform_Gauss_Jordan_Elimination_On_00378a'Access);
      Runner_1.Create
        (Case_13_1_Test_tfCreate_Extended_Matrix_From_d7fdf5,
         "math-matrices.ads:137:4:",
         Test_tfCreate_Extended_Matrix_From_d7fdf5'Access);
      Runner_1.Create
        (Case_14_1_Test_tfGet_Inverse_Part_From_e434a4,
         "math-matrices.ads:138:4:",
         Test_tfGet_Inverse_Part_From_e434a4'Access);
      Runner_1.Create
        (Case_15_1_Test_bMatrix_Has_No_Inverse_8de23e,
         "math-matrices.ads:139:4:",
         Test_bMatrix_Has_No_Inverse_8de23e'Access);

      Result.Add_Test (Case_1_1_Test_Free_318ef1'Access);
      Result.Add_Test (Case_2_1_Test_Multiply_46e300'Access);
      Result.Add_Test (Case_3_1_Test_Multiply_816af5'Access);
      Result.Add_Test (Case_4_1_Test_Multiply_4c80e1'Access);
      Result.Add_Test (Case_5_1_Test_Multiply_bc380c'Access);
      Result.Add_Test (Case_6_1_Test_Swap_Values_In_Extended_Matrix_d790ab'Access);
      Result.Add_Test (Case_7_1_Test_Swap_Rows_In_Extended_Matrix_e8fd17'Access);
      Result.Add_Test (Case_8_1_Test_Scale_Row_In_Extended_Matrix_51dfbc'Access);
      Result.Add_Test (Case_9_1_Test_Remove_Component_In_Following_Rows_6495d3'Access);
      Result.Add_Test (Case_10_1_Test_Remove_Component_In_Leading_Rows_4f91f1'Access);
      Result.Add_Test (Case_11_1_Test_Find_Row_With_Highest_Component_203fad'Access);
      Result.Add_Test (Case_12_1_Test_Perform_Gauss_Jordan_Elimination_On_00378a'Access);
      Result.Add_Test (Case_13_1_Test_tfCreate_Extended_Matrix_From_d7fdf5'Access);
      Result.Add_Test (Case_14_1_Test_tfGet_Inverse_Part_From_e434a4'Access);
      Result.Add_Test (Case_15_1_Test_bMatrix_Has_No_Inverse_8de23e'Access);

      return Result'Access;

   end Suite;

end Math.Matrices.Test_Data.Tests.Suite;
--  end read only
