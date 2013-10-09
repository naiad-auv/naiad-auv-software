--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Math.Planes.CPlane_Test_Data.CPlane_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Math.Planes.CPlane_Test_Data.CPlane_Tests.Test_CPlane);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxGet_Normal_Vector_4c7399 : aliased Runner_1.Test_Case;
   Case_2_1_Test_fGet_Distance_From_Origin_1b1e67 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxGet_Normal_Vector_4c7399,
         "math-planes.ads:11:4:",
         Test_pxGet_Normal_Vector_4c7399'Access);
      Runner_1.Create
        (Case_2_1_Test_fGet_Distance_From_Origin_1b1e67,
         "math-planes.ads:12:4:",
         Test_fGet_Distance_From_Origin_1b1e67'Access);

      Result.Add_Test (Case_1_1_Test_pxGet_Normal_Vector_4c7399'Access);
      Result.Add_Test (Case_2_1_Test_fGet_Distance_From_Origin_1b1e67'Access);

      return Result'Access;

   end Suite;

end Math.Planes.CPlane_Test_Data.CPlane_Tests.Suite;
--  end read only
