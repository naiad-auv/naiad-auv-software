--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Vectors.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Vectors.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_a64900 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Plus_9b1a3c : aliased Runner_1.Test_Case;
   Case_3_1_Test_Minus_dba7dd : aliased Runner_1.Test_Case;
   Case_4_1_Test_Unary_Minus_f38580 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Multiply_7d0b9c : aliased Runner_1.Test_Case;
   Case_6_1_Test_Multiply_a251df : aliased Runner_1.Test_Case;
   Case_7_1_Test_Multiply_0ee37b : aliased Runner_1.Test_Case;
   Case_8_1_Test_Devide_a9a506 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Equal_bc9ae7 : aliased Runner_1.Test_Case;
   Case_10_1_Test_fDot_Product_c7f274 : aliased Runner_1.Test_Case;
   Case_11_1_Test_pxCross_Product_66fc3c : aliased Runner_1.Test_Case;
   Case_12_1_Test_fAngle_Between_4e296f : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_a64900,
         "math-vectors.ads:12:4:",
         Test_pxCreate_a64900'Access);
      Runner_1.Create
        (Case_2_1_Test_Plus_9b1a3c,
         "math-vectors.ads:19:4:",
         Test_Plus_9b1a3c'Access);
      Runner_1.Create
        (Case_3_1_Test_Minus_dba7dd,
         "math-vectors.ads:20:4:",
         Test_Minus_dba7dd'Access);
      Runner_1.Create
        (Case_4_1_Test_Unary_Minus_f38580,
         "math-vectors.ads:21:4:",
         Test_Unary_Minus_f38580'Access);
      Runner_1.Create
        (Case_5_1_Test_Multiply_7d0b9c,
         "math-vectors.ads:22:4:",
         Test_Multiply_7d0b9c'Access);
      Runner_1.Create
        (Case_6_1_Test_Multiply_a251df,
         "math-vectors.ads:23:4:",
         Test_Multiply_a251df'Access);
      Runner_1.Create
        (Case_7_1_Test_Multiply_0ee37b,
         "math-vectors.ads:24:4:",
         Test_Multiply_0ee37b'Access);
      Runner_1.Create
        (Case_8_1_Test_Devide_a9a506,
         "math-vectors.ads:25:4:",
         Test_Devide_a9a506'Access);
      Runner_1.Create
        (Case_9_1_Test_Equal_bc9ae7,
         "math-vectors.ads:26:4:",
         Test_Equal_bc9ae7'Access);
      Runner_1.Create
        (Case_10_1_Test_fDot_Product_c7f274,
         "math-vectors.ads:29:4:",
         Test_fDot_Product_c7f274'Access);
      Runner_1.Create
        (Case_11_1_Test_pxCross_Product_66fc3c,
         "math-vectors.ads:30:4:",
         Test_pxCross_Product_66fc3c'Access);
      Runner_1.Create
        (Case_12_1_Test_fAngle_Between_4e296f,
         "math-vectors.ads:31:4:",
         Test_fAngle_Between_4e296f'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_a64900'Access);
      Result.Add_Test (Case_2_1_Test_Plus_9b1a3c'Access);
      Result.Add_Test (Case_3_1_Test_Minus_dba7dd'Access);
      Result.Add_Test (Case_4_1_Test_Unary_Minus_f38580'Access);
      Result.Add_Test (Case_5_1_Test_Multiply_7d0b9c'Access);
      Result.Add_Test (Case_6_1_Test_Multiply_a251df'Access);
      Result.Add_Test (Case_7_1_Test_Multiply_0ee37b'Access);
      Result.Add_Test (Case_8_1_Test_Devide_a9a506'Access);
      Result.Add_Test (Case_9_1_Test_Equal_bc9ae7'Access);
      Result.Add_Test (Case_10_1_Test_fDot_Product_c7f274'Access);
      Result.Add_Test (Case_11_1_Test_pxCross_Product_66fc3c'Access);
      Result.Add_Test (Case_12_1_Test_fAngle_Between_4e296f'Access);

      return Result'Access;

   end Suite;

end Math.Vectors.Test_Data.Tests.Suite;
--  end read only
