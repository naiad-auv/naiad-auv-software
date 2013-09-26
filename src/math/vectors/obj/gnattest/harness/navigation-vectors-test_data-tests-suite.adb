--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Vectors.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Vectors.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_0ae964 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Plus_0cf714 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Minus_d2af0b : aliased Runner_1.Test_Case;
   Case_4_1_Test_Unary_Minus_838d50 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Multiply_906224 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Multiply_0b54f9 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Multiply_5e8bae : aliased Runner_1.Test_Case;
   Case_8_1_Test_Devide_b09bc3 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Equal_92745f : aliased Runner_1.Test_Case;
   Case_10_1_Test_fDot_Product_2d1e6d : aliased Runner_1.Test_Case;
   Case_11_1_Test_pxCross_Product_ae978c : aliased Runner_1.Test_Case;
   Case_12_1_Test_fAngle_Between_625e97 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_0ae964,
         "navigation-vectors.ads:9:4:",
         Test_pxCreate_0ae964'Access);
      Runner_1.Create
        (Case_2_1_Test_Plus_0cf714,
         "navigation-vectors.ads:16:4:",
         Test_Plus_0cf714'Access);
      Runner_1.Create
        (Case_3_1_Test_Minus_d2af0b,
         "navigation-vectors.ads:17:4:",
         Test_Minus_d2af0b'Access);
      Runner_1.Create
        (Case_4_1_Test_Unary_Minus_838d50,
         "navigation-vectors.ads:18:4:",
         Test_Unary_Minus_838d50'Access);
      Runner_1.Create
        (Case_5_1_Test_Multiply_906224,
         "navigation-vectors.ads:19:4:",
         Test_Multiply_906224'Access);
      Runner_1.Create
        (Case_6_1_Test_Multiply_0b54f9,
         "navigation-vectors.ads:20:4:",
         Test_Multiply_0b54f9'Access);
      Runner_1.Create
        (Case_7_1_Test_Multiply_5e8bae,
         "navigation-vectors.ads:21:4:",
         Test_Multiply_5e8bae'Access);
      Runner_1.Create
        (Case_8_1_Test_Devide_b09bc3,
         "navigation-vectors.ads:22:4:",
         Test_Devide_b09bc3'Access);
      Runner_1.Create
        (Case_9_1_Test_Equal_92745f,
         "navigation-vectors.ads:23:4:",
         Test_Equal_92745f'Access);
      Runner_1.Create
        (Case_10_1_Test_fDot_Product_2d1e6d,
         "navigation-vectors.ads:26:4:",
         Test_fDot_Product_2d1e6d'Access);
      Runner_1.Create
        (Case_11_1_Test_pxCross_Product_ae978c,
         "navigation-vectors.ads:27:4:",
         Test_pxCross_Product_ae978c'Access);
      Runner_1.Create
        (Case_12_1_Test_fAngle_Between_625e97,
         "navigation-vectors.ads:28:4:",
         Test_fAngle_Between_625e97'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_0ae964'Access);
      Result.Add_Test (Case_2_1_Test_Plus_0cf714'Access);
      Result.Add_Test (Case_3_1_Test_Minus_d2af0b'Access);
      Result.Add_Test (Case_4_1_Test_Unary_Minus_838d50'Access);
      Result.Add_Test (Case_5_1_Test_Multiply_906224'Access);
      Result.Add_Test (Case_6_1_Test_Multiply_0b54f9'Access);
      Result.Add_Test (Case_7_1_Test_Multiply_5e8bae'Access);
      Result.Add_Test (Case_8_1_Test_Devide_b09bc3'Access);
      Result.Add_Test (Case_9_1_Test_Equal_92745f'Access);
      Result.Add_Test (Case_10_1_Test_fDot_Product_2d1e6d'Access);
      Result.Add_Test (Case_11_1_Test_pxCross_Product_ae978c'Access);
      Result.Add_Test (Case_12_1_Test_fAngle_Between_625e97'Access);

      return Result'Access;

   end Suite;

end Navigation.Vectors.Test_Data.Tests.Suite;
--  end read only
