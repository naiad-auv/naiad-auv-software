--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Str2Float.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Str2Float.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_fStr2Float_d61c41 : aliased Runner_1.Test_Case;
   Case_2_1_Test_fChar2Float_74e704 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_fStr2Float_d61c41,
         "str2float.ads:13:4:",
         Test_fStr2Float_d61c41'Access);
      Runner_1.Create
        (Case_2_1_Test_fChar2Float_74e704,
         "str2float.ads:16:4:",
         Test_fChar2Float_74e704'Access);

      Result.Add_Test (Case_1_1_Test_fStr2Float_d61c41'Access);
      Result.Add_Test (Case_2_1_Test_fChar2Float_74e704'Access);

      return Result'Access;

   end Suite;

end Str2Float.Test_Data.Tests.Suite;
--  end read only
