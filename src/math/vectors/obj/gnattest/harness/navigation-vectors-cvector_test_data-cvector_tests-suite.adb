--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Vectors.CVector_Test_Data.CVector_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Vectors.CVector_Test_Data.CVector_Tests.Test_CVector);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxGet_Copy_903b17 : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxGet_Normalized_ee3c35 : aliased Runner_1.Test_Case;
   Case_3_1_Test_fLength_Squared_3272b8 : aliased Runner_1.Test_Case;
   Case_4_1_Test_fLength_c558df : aliased Runner_1.Test_Case;
   Case_5_1_Test_fGet_X_6400b5 : aliased Runner_1.Test_Case;
   Case_6_1_Test_fGet_Y_0af71a : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGet_Z_050233 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Devide_f99f33 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxGet_Copy_903b17,
         "navigation-vectors.ads:10:4:",
         Test_pxGet_Copy_903b17'Access);
      Runner_1.Create
        (Case_2_1_Test_pxGet_Normalized_ee3c35,
         "navigation-vectors.ads:11:4:",
         Test_pxGet_Normalized_ee3c35'Access);
      Runner_1.Create
        (Case_3_1_Test_fLength_Squared_3272b8,
         "navigation-vectors.ads:13:4:",
         Test_fLength_Squared_3272b8'Access);
      Runner_1.Create
        (Case_4_1_Test_fLength_c558df,
         "navigation-vectors.ads:14:4:",
         Test_fLength_c558df'Access);
      Runner_1.Create
        (Case_5_1_Test_fGet_X_6400b5,
         "navigation-vectors.ads:30:4:",
         Test_fGet_X_6400b5'Access);
      Runner_1.Create
        (Case_6_1_Test_fGet_Y_0af71a,
         "navigation-vectors.ads:31:4:",
         Test_fGet_Y_0af71a'Access);
      Runner_1.Create
        (Case_7_1_Test_fGet_Z_050233,
         "navigation-vectors.ads:32:4:",
         Test_fGet_Z_050233'Access);
      Runner_1.Create
        (Case_8_1_Test_Devide_f99f33,
         "navigation-vectors.ads:43:4:",
         Test_Devide_f99f33'Access);

      Result.Add_Test (Case_1_1_Test_pxGet_Copy_903b17'Access);
      Result.Add_Test (Case_2_1_Test_pxGet_Normalized_ee3c35'Access);
      Result.Add_Test (Case_3_1_Test_fLength_Squared_3272b8'Access);
      Result.Add_Test (Case_4_1_Test_fLength_c558df'Access);
      Result.Add_Test (Case_5_1_Test_fGet_X_6400b5'Access);
      Result.Add_Test (Case_6_1_Test_fGet_Y_0af71a'Access);
      Result.Add_Test (Case_7_1_Test_fGet_Z_050233'Access);
      Result.Add_Test (Case_8_1_Test_Devide_f99f33'Access);

      return Result'Access;

   end Suite;

end Navigation.Vectors.CVector_Test_Data.CVector_Tests.Suite;
--  end read only
