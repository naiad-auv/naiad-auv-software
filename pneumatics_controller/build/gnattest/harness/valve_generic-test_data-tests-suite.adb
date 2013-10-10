--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Valve_Generic.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Valve_Generic.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Actuate_For_Duration_7ab317 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Actuate_0892f0 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Actuate_For_Duration_7ab317,
         "valve_generic.ads:9:4:",
         Test_Actuate_For_Duration_7ab317'Access);
      Runner_1.Create
        (Case_2_1_Test_Actuate_0892f0,
         "valve_generic.ads:10:4:",
         Test_Actuate_0892f0'Access);

      Result.Add_Test (Case_1_1_Test_Actuate_For_Duration_7ab317'Access);
      Result.Add_Test (Case_2_1_Test_Actuate_0892f0'Access);

      return Result'Access;

   end Suite;

end Valve_Generic.Test_Data.Tests.Suite;
--  end read only
