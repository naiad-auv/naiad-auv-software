--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Quaternions.CQuaternion_Test_Data.CQuaternion_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Quaternions.CQuaternion_Test_Data.CQuaternion_Tests.Test_CQuaternion);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxGet_Copy_d4ad30 : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxGet_Normalized_be75a2 : aliased Runner_1.Test_Case;
   Case_3_1_Test_fGet_Length_a40d15 : aliased Runner_1.Test_Case;
   Case_4_1_Test_fGet_Length_Squared_4d190d : aliased Runner_1.Test_Case;
   Case_5_1_Test_fGet_X_42438b : aliased Runner_1.Test_Case;
   Case_6_1_Test_fGet_Y_c7b5f1 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGet_Z_dfd5d9 : aliased Runner_1.Test_Case;
   Case_8_1_Test_fGet_W_90387e : aliased Runner_1.Test_Case;
   Case_9_1_Test_fGet_Axis_Vector_cd62fd : aliased Runner_1.Test_Case;
   Case_10_1_Test_fGet_Angle_In_Degrees_ce63d3 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxGet_Copy_d4ad30,
         "math-quaternions.ads:12:4:",
         Test_pxGet_Copy_d4ad30'Access);
      Runner_1.Create
        (Case_2_1_Test_pxGet_Normalized_be75a2,
         "math-quaternions.ads:21:4:",
         Test_pxGet_Normalized_be75a2'Access);
      Runner_1.Create
        (Case_3_1_Test_fGet_Length_a40d15,
         "math-quaternions.ads:23:4:",
         Test_fGet_Length_a40d15'Access);
      Runner_1.Create
        (Case_4_1_Test_fGet_Length_Squared_4d190d,
         "math-quaternions.ads:24:4:",
         Test_fGet_Length_Squared_4d190d'Access);
      Runner_1.Create
        (Case_5_1_Test_fGet_X_42438b,
         "math-quaternions.ads:25:4:",
         Test_fGet_X_42438b'Access);
      Runner_1.Create
        (Case_6_1_Test_fGet_Y_c7b5f1,
         "math-quaternions.ads:26:4:",
         Test_fGet_Y_c7b5f1'Access);
      Runner_1.Create
        (Case_7_1_Test_fGet_Z_dfd5d9,
         "math-quaternions.ads:27:4:",
         Test_fGet_Z_dfd5d9'Access);
      Runner_1.Create
        (Case_8_1_Test_fGet_W_90387e,
         "math-quaternions.ads:28:4:",
         Test_fGet_W_90387e'Access);
      Runner_1.Create
        (Case_9_1_Test_fGet_Axis_Vector_cd62fd,
         "math-quaternions.ads:29:4:",
         Test_fGet_Axis_Vector_cd62fd'Access);
      Runner_1.Create
        (Case_10_1_Test_fGet_Angle_In_Degrees_ce63d3,
         "math-quaternions.ads:30:4:",
         Test_fGet_Angle_In_Degrees_ce63d3'Access);

      Result.Add_Test (Case_1_1_Test_pxGet_Copy_d4ad30'Access);
      Result.Add_Test (Case_2_1_Test_pxGet_Normalized_be75a2'Access);
      Result.Add_Test (Case_3_1_Test_fGet_Length_a40d15'Access);
      Result.Add_Test (Case_4_1_Test_fGet_Length_Squared_4d190d'Access);
      Result.Add_Test (Case_5_1_Test_fGet_X_42438b'Access);
      Result.Add_Test (Case_6_1_Test_fGet_Y_c7b5f1'Access);
      Result.Add_Test (Case_7_1_Test_fGet_Z_dfd5d9'Access);
      Result.Add_Test (Case_8_1_Test_fGet_W_90387e'Access);
      Result.Add_Test (Case_9_1_Test_fGet_Axis_Vector_cd62fd'Access);
      Result.Add_Test (Case_10_1_Test_fGet_Angle_In_Degrees_ce63d3'Access);

      return Result'Access;

   end Suite;

end Math.Quaternions.CQuaternion_Test_Data.CQuaternion_Tests.Suite;
--  end read only
