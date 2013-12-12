--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with Pneumatics.Test_Data.Tests.Suite;

package body Gnattest_Main_Suite is

   Result : aliased AUnit.Test_Suites.Test_Suite;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Result.Add_Test (Pneumatics.Test_Data.Tests.Suite.Suite);

      return Result'Access;

   end Suite;

end Gnattest_Main_Suite;
--  end read only
