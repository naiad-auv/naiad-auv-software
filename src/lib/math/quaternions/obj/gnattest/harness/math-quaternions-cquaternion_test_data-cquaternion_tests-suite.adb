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
   Case_2_1_Test_Multiply_0f0e3b : aliased Runner_1.Test_Case;
   Case_3_1_Test_Multiply_4edd9e : aliased Runner_1.Test_Case;
   Case_4_1_Test_Multiply_0f691f : aliased Runner_1.Test_Case;
   Case_5_1_Test_Multiply_7c84cd : aliased Runner_1.Test_Case;
   Case_6_1_Test_Equal_cd4d95 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGet_Dot_Product_1d3b4a : aliased Runner_1.Test_Case;
   Case_8_1_Test_fGet_Dot_Product_9ae29a : aliased Runner_1.Test_Case;
   Case_9_1_Test_fGet_Dot_Product_2b1964 : aliased Runner_1.Test_Case;
   Case_10_1_Test_xGet_Normalized_790efc : aliased Runner_1.Test_Case;
   Case_11_1_Test_fGet_Length_a40d15 : aliased Runner_1.Test_Case;
   Case_12_1_Test_fGet_Length_Squared_4d190d : aliased Runner_1.Test_Case;
   Case_13_1_Test_fGet_X_42438b : aliased Runner_1.Test_Case;
   Case_14_1_Test_fGet_Y_c7b5f1 : aliased Runner_1.Test_Case;
   Case_15_1_Test_fGet_Z_dfd5d9 : aliased Runner_1.Test_Case;
   Case_16_1_Test_fGet_W_90387e : aliased Runner_1.Test_Case;
   Case_17_1_Test_xGet_Axis_Vector_08fc23 : aliased Runner_1.Test_Case;
   Case_18_1_Test_fGet_Angle_In_Degrees_ce63d3 : aliased Runner_1.Test_Case;
   Case_19_1_Test_Copy_From_85d051 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxGet_Copy_d4ad30,
         "math-quaternions.ads:23:4:",
         Test_pxGet_Copy_d4ad30'Access);
      Runner_1.Create
        (Case_2_1_Test_Multiply_0f0e3b,
         "math-quaternions.ads:28:4:",
         Test_Multiply_0f0e3b'Access);
      Runner_1.Create
        (Case_3_1_Test_Multiply_4edd9e,
         "math-quaternions.ads:29:4:",
         Test_Multiply_4edd9e'Access);
      Runner_1.Create
        (Case_4_1_Test_Multiply_0f691f,
         "math-quaternions.ads:30:4:",
         Test_Multiply_0f691f'Access);
      Runner_1.Create
        (Case_5_1_Test_Multiply_7c84cd,
         "math-quaternions.ads:31:4:",
         Test_Multiply_7c84cd'Access);
      Runner_1.Create
        (Case_6_1_Test_Equal_cd4d95,
         "math-quaternions.ads:36:4:",
         Test_Equal_cd4d95'Access);
      Runner_1.Create
        (Case_7_1_Test_fGet_Dot_Product_1d3b4a,
         "math-quaternions.ads:41:4:",
         Test_fGet_Dot_Product_1d3b4a'Access);
      Runner_1.Create
        (Case_8_1_Test_fGet_Dot_Product_9ae29a,
         "math-quaternions.ads:42:4:",
         Test_fGet_Dot_Product_9ae29a'Access);
      Runner_1.Create
        (Case_9_1_Test_fGet_Dot_Product_2b1964,
         "math-quaternions.ads:43:4:",
         Test_fGet_Dot_Product_2b1964'Access);
      Runner_1.Create
        (Case_10_1_Test_xGet_Normalized_790efc,
         "math-quaternions.ads:50:4:",
         Test_xGet_Normalized_790efc'Access);
      Runner_1.Create
        (Case_11_1_Test_fGet_Length_a40d15,
         "math-quaternions.ads:54:4:",
         Test_fGet_Length_a40d15'Access);
      Runner_1.Create
        (Case_12_1_Test_fGet_Length_Squared_4d190d,
         "math-quaternions.ads:58:4:",
         Test_fGet_Length_Squared_4d190d'Access);
      Runner_1.Create
        (Case_13_1_Test_fGet_X_42438b,
         "math-quaternions.ads:62:4:",
         Test_fGet_X_42438b'Access);
      Runner_1.Create
        (Case_14_1_Test_fGet_Y_c7b5f1,
         "math-quaternions.ads:66:4:",
         Test_fGet_Y_c7b5f1'Access);
      Runner_1.Create
        (Case_15_1_Test_fGet_Z_dfd5d9,
         "math-quaternions.ads:70:4:",
         Test_fGet_Z_dfd5d9'Access);
      Runner_1.Create
        (Case_16_1_Test_fGet_W_90387e,
         "math-quaternions.ads:74:4:",
         Test_fGet_W_90387e'Access);
      Runner_1.Create
        (Case_17_1_Test_xGet_Axis_Vector_08fc23,
         "math-quaternions.ads:79:4:",
         Test_xGet_Axis_Vector_08fc23'Access);
      Runner_1.Create
        (Case_18_1_Test_fGet_Angle_In_Degrees_ce63d3,
         "math-quaternions.ads:83:4:",
         Test_fGet_Angle_In_Degrees_ce63d3'Access);
      Runner_1.Create
        (Case_19_1_Test_Copy_From_85d051,
         "math-quaternions.ads:87:4:",
         Test_Copy_From_85d051'Access);

      Result.Add_Test (Case_1_1_Test_pxGet_Copy_d4ad30'Access);
      Result.Add_Test (Case_2_1_Test_Multiply_0f0e3b'Access);
      Result.Add_Test (Case_3_1_Test_Multiply_4edd9e'Access);
      Result.Add_Test (Case_4_1_Test_Multiply_0f691f'Access);
      Result.Add_Test (Case_5_1_Test_Multiply_7c84cd'Access);
      Result.Add_Test (Case_6_1_Test_Equal_cd4d95'Access);
      Result.Add_Test (Case_7_1_Test_fGet_Dot_Product_1d3b4a'Access);
      Result.Add_Test (Case_8_1_Test_fGet_Dot_Product_9ae29a'Access);
      Result.Add_Test (Case_9_1_Test_fGet_Dot_Product_2b1964'Access);
      Result.Add_Test (Case_10_1_Test_xGet_Normalized_790efc'Access);
      Result.Add_Test (Case_11_1_Test_fGet_Length_a40d15'Access);
      Result.Add_Test (Case_12_1_Test_fGet_Length_Squared_4d190d'Access);
      Result.Add_Test (Case_13_1_Test_fGet_X_42438b'Access);
      Result.Add_Test (Case_14_1_Test_fGet_Y_c7b5f1'Access);
      Result.Add_Test (Case_15_1_Test_fGet_Z_dfd5d9'Access);
      Result.Add_Test (Case_16_1_Test_fGet_W_90387e'Access);
      Result.Add_Test (Case_17_1_Test_xGet_Axis_Vector_08fc23'Access);
      Result.Add_Test (Case_18_1_Test_fGet_Angle_In_Degrees_ce63d3'Access);
      Result.Add_Test (Case_19_1_Test_Copy_From_85d051'Access);

      return Result'Access;

   end Suite;

end Math.Quaternions.CQuaternion_Test_Data.CQuaternion_Tests.Suite;
--  end read only
