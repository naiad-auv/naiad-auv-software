--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Angles.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Angles.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_fGet_Angle_Degrees_In_Range_1c8f14 : aliased Runner_1.Test_Case;
   Case_2_1_Test_fGet_Angle_Radians_In_Range_73a42b : aliased Runner_1.Test_Case;
   Case_3_1_Test_fRadians_To_Degrees_020d52 : aliased Runner_1.Test_Case;
   Case_4_1_Test_fDegrees_To_Radians_82d864 : aliased Runner_1.Test_Case;
   Case_5_1_Test_fTAngle_To_FAngle_d09c7f : aliased Runner_1.Test_Case;
   Case_6_1_Test_tfFAngle_To_TAngle_52086e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_fGet_Angle_Degrees_In_Range_1c8f14,
         "math-angles.ads:8:4:",
         Test_fGet_Angle_Degrees_In_Range_1c8f14'Access);
      Runner_1.Create
        (Case_2_1_Test_fGet_Angle_Radians_In_Range_73a42b,
         "math-angles.ads:9:4:",
         Test_fGet_Angle_Radians_In_Range_73a42b'Access);
      Runner_1.Create
        (Case_3_1_Test_fRadians_To_Degrees_020d52,
         "math-angles.ads:10:4:",
         Test_fRadians_To_Degrees_020d52'Access);
      Runner_1.Create
        (Case_4_1_Test_fDegrees_To_Radians_82d864,
         "math-angles.ads:11:4:",
         Test_fDegrees_To_Radians_82d864'Access);
      Runner_1.Create
        (Case_5_1_Test_fTAngle_To_FAngle_d09c7f,
         "math-angles.ads:12:4:",
         Test_fTAngle_To_FAngle_d09c7f'Access);
      Runner_1.Create
        (Case_6_1_Test_tfFAngle_To_TAngle_52086e,
         "math-angles.ads:13:4:",
         Test_tfFAngle_To_TAngle_52086e'Access);

      Result.Add_Test (Case_1_1_Test_fGet_Angle_Degrees_In_Range_1c8f14'Access);
      Result.Add_Test (Case_2_1_Test_fGet_Angle_Radians_In_Range_73a42b'Access);
      Result.Add_Test (Case_3_1_Test_fRadians_To_Degrees_020d52'Access);
      Result.Add_Test (Case_4_1_Test_fDegrees_To_Radians_82d864'Access);
      Result.Add_Test (Case_5_1_Test_fTAngle_To_FAngle_d09c7f'Access);
      Result.Add_Test (Case_6_1_Test_tfFAngle_To_TAngle_52086e'Access);

      return Result'Access;

   end Suite;

end Math.Angles.Test_Data.Tests.Suite;
--  end read only
