--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Rotators.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Rotators.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_fa08a4 : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_From_Matrix_587490 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Plus_74cb72 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Minus_e742e1 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Multiply_0bc568 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_fa08a4,
         "math-rotators.ads:11:4:",
         Test_pxCreate_fa08a4'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_From_Matrix_587490,
         "math-rotators.ads:12:4:",
         Test_pxCreate_From_Matrix_587490'Access);
      Runner_1.Create
        (Case_3_1_Test_Plus_74cb72,
         "math-rotators.ads:15:4:",
         Test_Plus_74cb72'Access);
      Runner_1.Create
        (Case_4_1_Test_Minus_e742e1,
         "math-rotators.ads:16:4:",
         Test_Minus_e742e1'Access);
      Runner_1.Create
        (Case_5_1_Test_Multiply_0bc568,
         "math-rotators.ads:17:4:",
         Test_Multiply_0bc568'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_fa08a4'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_From_Matrix_587490'Access);
      Result.Add_Test (Case_3_1_Test_Plus_74cb72'Access);
      Result.Add_Test (Case_4_1_Test_Minus_e742e1'Access);
      Result.Add_Test (Case_5_1_Test_Multiply_0bc568'Access);

      return Result'Access;

   end Suite;

end Math.Rotators.Test_Data.Tests.Suite;
--  end read only
