--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Rotators.CRotator_Test_Data.CRotator_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Rotators.CRotator_Test_Data.CRotator_Tests.Test_CRotator);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_tfGet_Yaw_28b483 : aliased Runner_1.Test_Case;
   Case_2_1_Test_tfGet_Pitch_fa021d : aliased Runner_1.Test_Case;
   Case_3_1_Test_tfGet_Roll_56e29e : aliased Runner_1.Test_Case;
   Case_4_1_Test_Set_Rotator_Angle_fa1114 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Set_Rotator_Angles_From_Matrix_cf2dd9 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_tfGet_Yaw_28b483,
         "math-rotators.ads:20:4:",
         Test_tfGet_Yaw_28b483'Access);
      Runner_1.Create
        (Case_2_1_Test_tfGet_Pitch_fa021d,
         "math-rotators.ads:21:4:",
         Test_tfGet_Pitch_fa021d'Access);
      Runner_1.Create
        (Case_3_1_Test_tfGet_Roll_56e29e,
         "math-rotators.ads:22:4:",
         Test_tfGet_Roll_56e29e'Access);
      Runner_1.Create
        (Case_4_1_Test_Set_Rotator_Angle_fa1114,
         "math-rotators.ads:28:4:",
         Test_Set_Rotator_Angle_fa1114'Access);
      Runner_1.Create
        (Case_5_1_Test_Set_Rotator_Angles_From_Matrix_cf2dd9,
         "math-rotators.ads:29:4:",
         Test_Set_Rotator_Angles_From_Matrix_cf2dd9'Access);

      Result.Add_Test (Case_1_1_Test_tfGet_Yaw_28b483'Access);
      Result.Add_Test (Case_2_1_Test_tfGet_Pitch_fa021d'Access);
      Result.Add_Test (Case_3_1_Test_tfGet_Roll_56e29e'Access);
      Result.Add_Test (Case_4_1_Test_Set_Rotator_Angle_fa1114'Access);
      Result.Add_Test (Case_5_1_Test_Set_Rotator_Angles_From_Matrix_cf2dd9'Access);

      return Result'Access;

   end Suite;

end Math.Rotators.CRotator_Test_Data.CRotator_Tests.Suite;
--  end read only
