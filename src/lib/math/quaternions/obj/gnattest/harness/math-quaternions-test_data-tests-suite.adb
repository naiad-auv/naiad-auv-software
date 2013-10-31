--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Quaternions.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Quaternions.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Free_01a444 : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_a90dd2 : aliased Runner_1.Test_Case;
   Case_3_1_Test_pxCreate_937a51 : aliased Runner_1.Test_Case;
   Case_4_1_Test_fGet_Dot_Product_be0506 : aliased Runner_1.Test_Case;
   Case_5_1_Test_pxCreate_944041 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Free_01a444,
         "math-quaternions.ads:15:4:",
         Test_Free_01a444'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_a90dd2,
         "math-quaternions.ads:17:4:",
         Test_pxCreate_a90dd2'Access);
      Runner_1.Create
        (Case_3_1_Test_pxCreate_937a51,
         "math-quaternions.ads:18:4:",
         Test_pxCreate_937a51'Access);
      Runner_1.Create
        (Case_4_1_Test_fGet_Dot_Product_be0506,
         "math-quaternions.ads:44:4:",
         Test_fGet_Dot_Product_be0506'Access);
      Runner_1.Create
        (Case_5_1_Test_pxCreate_944041,
         "math-quaternions.ads:91:4:",
         Test_pxCreate_944041'Access);

      Result.Add_Test (Case_1_1_Test_Free_01a444'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_a90dd2'Access);
      Result.Add_Test (Case_3_1_Test_pxCreate_937a51'Access);
      Result.Add_Test (Case_4_1_Test_fGet_Dot_Product_be0506'Access);
      Result.Add_Test (Case_5_1_Test_pxCreate_944041'Access);

      return Result'Access;

   end Suite;

end Math.Quaternions.Test_Data.Tests.Suite;
--  end read only
