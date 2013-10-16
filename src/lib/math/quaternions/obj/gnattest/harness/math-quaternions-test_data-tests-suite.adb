--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Quaternions.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Quaternions.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_fbac4b : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_937a51 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Plus_bd5b1d : aliased Runner_1.Test_Case;
   Case_4_1_Test_Minus_2f7442 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Multiply_cbc666 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Equal_079d85 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGet_Dot_Product_be0506 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_fbac4b,
         "math-quaternions.ads:10:4:",
         Test_pxCreate_fbac4b'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_937a51,
         "math-quaternions.ads:11:4:",
         Test_pxCreate_937a51'Access);
      Runner_1.Create
        (Case_3_1_Test_Plus_bd5b1d,
         "math-quaternions.ads:14:4:",
         Test_Plus_bd5b1d'Access);
      Runner_1.Create
        (Case_4_1_Test_Minus_2f7442,
         "math-quaternions.ads:15:4:",
         Test_Minus_2f7442'Access);
      Runner_1.Create
        (Case_5_1_Test_Multiply_cbc666,
         "math-quaternions.ads:16:4:",
         Test_Multiply_cbc666'Access);
      Runner_1.Create
        (Case_6_1_Test_Equal_079d85,
         "math-quaternions.ads:17:4:",
         Test_Equal_079d85'Access);
      Runner_1.Create
        (Case_7_1_Test_fGet_Dot_Product_be0506,
         "math-quaternions.ads:18:4:",
         Test_fGet_Dot_Product_be0506'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_fbac4b'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_937a51'Access);
      Result.Add_Test (Case_3_1_Test_Plus_bd5b1d'Access);
      Result.Add_Test (Case_4_1_Test_Minus_2f7442'Access);
      Result.Add_Test (Case_5_1_Test_Multiply_cbc666'Access);
      Result.Add_Test (Case_6_1_Test_Equal_079d85'Access);
      Result.Add_Test (Case_7_1_Test_fGet_Dot_Product_be0506'Access);

      return Result'Access;

   end Suite;

end Math.Quaternions.Test_Data.Tests.Suite;
--  end read only
