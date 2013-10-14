--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Vectors.CVector_Test_Data.CVector_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Vectors.CVector_Test_Data.CVector_Tests.Test_CVector);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxGet_Copy_4fdcfb : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxGet_Normalized_a00a60 : aliased Runner_1.Test_Case;
   Case_3_1_Test_fLength_Squared_cce6ee : aliased Runner_1.Test_Case;
   Case_4_1_Test_fLength_7b67f3 : aliased Runner_1.Test_Case;
   Case_5_1_Test_fGet_X_2bcacb : aliased Runner_1.Test_Case;
   Case_6_1_Test_fGet_Y_5c8b74 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGet_Z_6025cf : aliased Runner_1.Test_Case;
   Case_8_1_Test_Devide_7a37a3 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxGet_Copy_4fdcfb,
         "math-vectors.ads:13:4:",
         Test_pxGet_Copy_4fdcfb'Access);
      Runner_1.Create
        (Case_2_1_Test_pxGet_Normalized_a00a60,
         "math-vectors.ads:14:4:",
         Test_pxGet_Normalized_a00a60'Access);
      Runner_1.Create
        (Case_3_1_Test_fLength_Squared_cce6ee,
         "math-vectors.ads:16:4:",
         Test_fLength_Squared_cce6ee'Access);
      Runner_1.Create
        (Case_4_1_Test_fLength_7b67f3,
         "math-vectors.ads:17:4:",
         Test_fLength_7b67f3'Access);
      Runner_1.Create
        (Case_5_1_Test_fGet_X_2bcacb,
         "math-vectors.ads:33:4:",
         Test_fGet_X_2bcacb'Access);
      Runner_1.Create
        (Case_6_1_Test_fGet_Y_5c8b74,
         "math-vectors.ads:34:4:",
         Test_fGet_Y_5c8b74'Access);
      Runner_1.Create
        (Case_7_1_Test_fGet_Z_6025cf,
         "math-vectors.ads:35:4:",
         Test_fGet_Z_6025cf'Access);
      Runner_1.Create
        (Case_8_1_Test_Devide_7a37a3,
         "math-vectors.ads:46:4:",
         Test_Devide_7a37a3'Access);

      Result.Add_Test (Case_1_1_Test_pxGet_Copy_4fdcfb'Access);
      Result.Add_Test (Case_2_1_Test_pxGet_Normalized_a00a60'Access);
      Result.Add_Test (Case_3_1_Test_fLength_Squared_cce6ee'Access);
      Result.Add_Test (Case_4_1_Test_fLength_7b67f3'Access);
      Result.Add_Test (Case_5_1_Test_fGet_X_2bcacb'Access);
      Result.Add_Test (Case_6_1_Test_fGet_Y_5c8b74'Access);
      Result.Add_Test (Case_7_1_Test_fGet_Z_6025cf'Access);
      Result.Add_Test (Case_8_1_Test_Devide_7a37a3'Access);

      return Result'Access;

   end Suite;

end Math.Vectors.CVector_Test_Data.CVector_Tests.Suite;
--  end read only
