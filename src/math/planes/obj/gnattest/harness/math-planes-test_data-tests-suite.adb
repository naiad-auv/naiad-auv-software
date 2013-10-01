--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Planes.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Planes.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_ef4fa7 : aliased Runner_1.Test_Case;
   Case_2_1_Test_fAngle_Between_077501 : aliased Runner_1.Test_Case;
   Case_3_1_Test_pxGet_Intersection_Vector_Between_ae083a : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_ef4fa7,
         "math-planes.ads:9:4:",
         Test_pxCreate_ef4fa7'Access);
      Runner_1.Create
        (Case_2_1_Test_fAngle_Between_077501,
         "math-planes.ads:16:4:",
         Test_fAngle_Between_077501'Access);
      Runner_1.Create
        (Case_3_1_Test_pxGet_Intersection_Vector_Between_ae083a,
         "math-planes.ads:19:4:",
         Test_pxGet_Intersection_Vector_Between_ae083a'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_ef4fa7'Access);
      Result.Add_Test (Case_2_1_Test_fAngle_Between_077501'Access);
      Result.Add_Test (Case_3_1_Test_pxGet_Intersection_Vector_Between_ae083a'Access);

      return Result'Access;

   end Suite;

end Math.Planes.Test_Data.Tests.Suite;
--  end read only
