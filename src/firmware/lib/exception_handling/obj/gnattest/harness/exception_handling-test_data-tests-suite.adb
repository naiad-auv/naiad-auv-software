--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Exception_Handling.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Exception_Handling.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Unhandled_Exception_91da38 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Unhandled_Exception_91da38,
         "exception_handling.ads:15:4:",
         Test_Unhandled_Exception_91da38'Access);

      Result.Add_Test (Case_1_1_Test_Unhandled_Exception_91da38'Access);

      return Result'Access;

   end Suite;

end Exception_Handling.Test_Data.Tests.Suite;
--  end read only
