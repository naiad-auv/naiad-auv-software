--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Rotators.CRotator_Test_Data.CRotator_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Rotators.CRotator_Test_Data.CRotator_Tests.Test_CRotator);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_tfGet_Yaw_1e984d : aliased Runner_1.Test_Case;
   Case_2_1_Test_tfGet_Pitch_2ff57f : aliased Runner_1.Test_Case;
   Case_3_1_Test_tfGet_Roll_05255f : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_tfGet_Yaw_1e984d,
         "math-rotators.ads:14:4:",
         Test_tfGet_Yaw_1e984d'Access);
      Runner_1.Create
        (Case_2_1_Test_tfGet_Pitch_2ff57f,
         "math-rotators.ads:15:4:",
         Test_tfGet_Pitch_2ff57f'Access);
      Runner_1.Create
        (Case_3_1_Test_tfGet_Roll_05255f,
         "math-rotators.ads:16:4:",
         Test_tfGet_Roll_05255f'Access);

      Result.Add_Test (Case_1_1_Test_tfGet_Yaw_1e984d'Access);
      Result.Add_Test (Case_2_1_Test_tfGet_Pitch_2ff57f'Access);
      Result.Add_Test (Case_3_1_Test_tfGet_Roll_05255f'Access);

      return Result'Access;

   end Suite;

end Math.Rotators.CRotator_Test_Data.CRotator_Tests.Suite;
--  end read only
