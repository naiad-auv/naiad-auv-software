--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Planes.CPlane_Test_Data.CPlane_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Planes.CPlane_Test_Data.CPlane_Tests.Test_CPlane);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xCreate_4dc581 : aliased Runner_1.Test_Case;
   Case_2_1_Test_xCreate_d3d096 : aliased Runner_1.Test_Case;
   Case_3_1_Test_pxGet_Allocated_Copy_123053 : aliased Runner_1.Test_Case;
   Case_4_1_Test_xGet_Normal_Vector_a98d33 : aliased Runner_1.Test_Case;
   Case_5_1_Test_fGet_Distance_From_Origin_1b1e67 : aliased Runner_1.Test_Case;
   Case_6_1_Test_fAngle_Between_In_Degrees_c567f3 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fAngle_Between_In_Degrees_3326a2 : aliased Runner_1.Test_Case;
   Case_8_1_Test_fAngle_Between_In_Degrees_39c39e : aliased Runner_1.Test_Case;
   Case_9_1_Test_xGet_Intersection_Vector_Between_fcb85d : aliased Runner_1.Test_Case;
   Case_10_1_Test_xGet_Intersection_Vector_Between_a801a4 : aliased Runner_1.Test_Case;
   Case_11_1_Test_xGet_Intersection_Vector_Between_1e6db6 : aliased Runner_1.Test_Case;
   Case_12_1_Test_Copy_From_aaf146 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xCreate_4dc581,
         "math-planes.ads:18:4:",
         Test_xCreate_4dc581'Access);
      Runner_1.Create
        (Case_2_1_Test_xCreate_d3d096,
         "math-planes.ads:19:4:",
         Test_xCreate_d3d096'Access);
      Runner_1.Create
        (Case_3_1_Test_pxGet_Allocated_Copy_123053,
         "math-planes.ads:25:4:",
         Test_pxGet_Allocated_Copy_123053'Access);
      Runner_1.Create
        (Case_4_1_Test_xGet_Normal_Vector_a98d33,
         "math-planes.ads:29:4:",
         Test_xGet_Normal_Vector_a98d33'Access);
      Runner_1.Create
        (Case_5_1_Test_fGet_Distance_From_Origin_1b1e67,
         "math-planes.ads:33:4:",
         Test_fGet_Distance_From_Origin_1b1e67'Access);
      Runner_1.Create
        (Case_6_1_Test_fAngle_Between_In_Degrees_c567f3,
         "math-planes.ads:38:4:",
         Test_fAngle_Between_In_Degrees_c567f3'Access);
      Runner_1.Create
        (Case_7_1_Test_fAngle_Between_In_Degrees_3326a2,
         "math-planes.ads:39:4:",
         Test_fAngle_Between_In_Degrees_3326a2'Access);
      Runner_1.Create
        (Case_8_1_Test_fAngle_Between_In_Degrees_39c39e,
         "math-planes.ads:41:4:",
         Test_fAngle_Between_In_Degrees_39c39e'Access);
      Runner_1.Create
        (Case_9_1_Test_xGet_Intersection_Vector_Between_fcb85d,
         "math-planes.ads:46:4:",
         Test_xGet_Intersection_Vector_Between_fcb85d'Access);
      Runner_1.Create
        (Case_10_1_Test_xGet_Intersection_Vector_Between_a801a4,
         "math-planes.ads:47:4:",
         Test_xGet_Intersection_Vector_Between_a801a4'Access);
      Runner_1.Create
        (Case_11_1_Test_xGet_Intersection_Vector_Between_1e6db6,
         "math-planes.ads:49:4:",
         Test_xGet_Intersection_Vector_Between_1e6db6'Access);
      Runner_1.Create
        (Case_12_1_Test_Copy_From_aaf146,
         "math-planes.ads:56:4:",
         Test_Copy_From_aaf146'Access);

      Result.Add_Test (Case_1_1_Test_xCreate_4dc581'Access);
      Result.Add_Test (Case_2_1_Test_xCreate_d3d096'Access);
      Result.Add_Test (Case_3_1_Test_pxGet_Allocated_Copy_123053'Access);
      Result.Add_Test (Case_4_1_Test_xGet_Normal_Vector_a98d33'Access);
      Result.Add_Test (Case_5_1_Test_fGet_Distance_From_Origin_1b1e67'Access);
      Result.Add_Test (Case_6_1_Test_fAngle_Between_In_Degrees_c567f3'Access);
      Result.Add_Test (Case_7_1_Test_fAngle_Between_In_Degrees_3326a2'Access);
      Result.Add_Test (Case_8_1_Test_fAngle_Between_In_Degrees_39c39e'Access);
      Result.Add_Test (Case_9_1_Test_xGet_Intersection_Vector_Between_fcb85d'Access);
      Result.Add_Test (Case_10_1_Test_xGet_Intersection_Vector_Between_a801a4'Access);
      Result.Add_Test (Case_11_1_Test_xGet_Intersection_Vector_Between_1e6db6'Access);
      Result.Add_Test (Case_12_1_Test_Copy_From_aaf146'Access);

      return Result'Access;

   end Suite;

end Math.Planes.CPlane_Test_Data.CPlane_Tests.Suite;
--  end read only
