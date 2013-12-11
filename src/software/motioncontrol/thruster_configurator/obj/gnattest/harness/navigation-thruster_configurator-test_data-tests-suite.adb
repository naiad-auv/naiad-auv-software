--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Thruster_Configurator.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Thruster_Configurator.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_bfc2d4 : aliased Runner_1.Test_Case;
   Case_2_1_Test_tfGet_Results_Vector_From_7b9cdd : aliased Runner_1.Test_Case;
   Case_3_1_Test_Remove_Component_In_Leading_Rows_54f89d : aliased Runner_1.Test_Case;
   Case_4_1_Test_Remove_Component_In_Following_Rows_aa8b1c : aliased Runner_1.Test_Case;
   Case_5_1_Test_Scale_Row_In_Extended_Matrix_fd23ee : aliased Runner_1.Test_Case;
   Case_6_1_Test_Swap_Values_In_Extended_Matrix_d790ab : aliased Runner_1.Test_Case;
   Case_7_1_Test_Swap_Rows_In_Extended_Matrix_a9e2bf : aliased Runner_1.Test_Case;
   Case_8_1_Test_bMatrix_Has_No_Inverse_8de23e : aliased Runner_1.Test_Case;
   Case_9_1_Test_Find_Row_With_Highest_Component_f24b48 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Insert_Component_Values_In_Extended_Matrix_4b91cc : aliased Runner_1.Test_Case;
   Case_11_1_Test_Perform_Gauss_Jordan_Elimination_On_b05c93 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_bfc2d4,
         "navigation-thruster_configurator.ads:20:4:",
         Test_pxCreate_bfc2d4'Access);
      Runner_1.Create
        (Case_2_1_Test_tfGet_Results_Vector_From_7b9cdd,
         "navigation-thruster_configurator.ads:29:4:",
         Test_tfGet_Results_Vector_From_7b9cdd'Access);
      Runner_1.Create
        (Case_3_1_Test_Remove_Component_In_Leading_Rows_54f89d,
         "navigation-thruster_configurator.ads:30:4:",
         Test_Remove_Component_In_Leading_Rows_54f89d'Access);
      Runner_1.Create
        (Case_4_1_Test_Remove_Component_In_Following_Rows_aa8b1c,
         "navigation-thruster_configurator.ads:31:4:",
         Test_Remove_Component_In_Following_Rows_aa8b1c'Access);
      Runner_1.Create
        (Case_5_1_Test_Scale_Row_In_Extended_Matrix_fd23ee,
         "navigation-thruster_configurator.ads:32:4:",
         Test_Scale_Row_In_Extended_Matrix_fd23ee'Access);
      Runner_1.Create
        (Case_6_1_Test_Swap_Values_In_Extended_Matrix_d790ab,
         "navigation-thruster_configurator.ads:33:4:",
         Test_Swap_Values_In_Extended_Matrix_d790ab'Access);
      Runner_1.Create
        (Case_7_1_Test_Swap_Rows_In_Extended_Matrix_a9e2bf,
         "navigation-thruster_configurator.ads:34:4:",
         Test_Swap_Rows_In_Extended_Matrix_a9e2bf'Access);
      Runner_1.Create
        (Case_8_1_Test_bMatrix_Has_No_Inverse_8de23e,
         "navigation-thruster_configurator.ads:35:4:",
         Test_bMatrix_Has_No_Inverse_8de23e'Access);
      Runner_1.Create
        (Case_9_1_Test_Find_Row_With_Highest_Component_f24b48,
         "navigation-thruster_configurator.ads:36:4:",
         Test_Find_Row_With_Highest_Component_f24b48'Access);
      Runner_1.Create
        (Case_10_1_Test_Insert_Component_Values_In_Extended_Matrix_4b91cc,
         "navigation-thruster_configurator.ads:38:4:",
         Test_Insert_Component_Values_In_Extended_Matrix_4b91cc'Access);
      Runner_1.Create
        (Case_11_1_Test_Perform_Gauss_Jordan_Elimination_On_b05c93,
         "navigation-thruster_configurator.ads:39:4:",
         Test_Perform_Gauss_Jordan_Elimination_On_b05c93'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_bfc2d4'Access);
      Result.Add_Test (Case_2_1_Test_tfGet_Results_Vector_From_7b9cdd'Access);
      Result.Add_Test (Case_3_1_Test_Remove_Component_In_Leading_Rows_54f89d'Access);
      Result.Add_Test (Case_4_1_Test_Remove_Component_In_Following_Rows_aa8b1c'Access);
      Result.Add_Test (Case_5_1_Test_Scale_Row_In_Extended_Matrix_fd23ee'Access);
      Result.Add_Test (Case_6_1_Test_Swap_Values_In_Extended_Matrix_d790ab'Access);
      Result.Add_Test (Case_7_1_Test_Swap_Rows_In_Extended_Matrix_a9e2bf'Access);
      Result.Add_Test (Case_8_1_Test_bMatrix_Has_No_Inverse_8de23e'Access);
      Result.Add_Test (Case_9_1_Test_Find_Row_With_Highest_Component_f24b48'Access);
      Result.Add_Test (Case_10_1_Test_Insert_Component_Values_In_Extended_Matrix_4b91cc'Access);
      Result.Add_Test (Case_11_1_Test_Perform_Gauss_Jordan_Elimination_On_b05c93'Access);

      return Result'Access;

   end Suite;

end Navigation.Thruster_Configurator.Test_Data.Tests.Suite;
--  end read only
