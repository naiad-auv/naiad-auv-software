--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Planes.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Planes.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Free_b3f07a : aliased Runner_1.Test_Case;
   Case_2_1_Test_fAngle_Between_In_Degrees_4fe9d1 : aliased Runner_1.Test_Case;
   Case_3_1_Test_xGet_Intersection_Vector_Between_288e7f : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Free_b3f07a,
         "math-planes.ads:16:4:",
         Test_Free_b3f07a'Access);
      Runner_1.Create
        (Case_2_1_Test_fAngle_Between_In_Degrees_4fe9d1,
         "math-planes.ads:40:4:",
         Test_fAngle_Between_In_Degrees_4fe9d1'Access);
      Runner_1.Create
        (Case_3_1_Test_xGet_Intersection_Vector_Between_288e7f,
         "math-planes.ads:48:4:",
         Test_xGet_Intersection_Vector_Between_288e7f'Access);

      Result.Add_Test (Case_1_1_Test_Free_b3f07a'Access);
      Result.Add_Test (Case_2_1_Test_fAngle_Between_In_Degrees_4fe9d1'Access);
      Result.Add_Test (Case_3_1_Test_xGet_Intersection_Vector_Between_288e7f'Access);

      return Result'Access;

   end Suite;

end Math.Planes.Test_Data.Tests.Suite;
--  end read only
