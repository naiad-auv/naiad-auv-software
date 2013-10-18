--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body simulator.submarine.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.simulator.submarine.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_Naiad_b9ce65 : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_1cb11e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_Naiad_b9ce65,
         "simulator-submarine.ads:15:4:",
         Test_pxCreate_Naiad_b9ce65'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_1cb11e,
         "simulator-submarine.ads:16:4:",
         Test_pxCreate_1cb11e'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_Naiad_b9ce65'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_1cb11e'Access);

      return Result'Access;

   end Suite;

end simulator.submarine.Test_Data.Tests.Suite;
--  end read only
