--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Exception_Handling.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Exception_Handling.Test_Data.Tests is


--  begin read only
   procedure Test_Unhandled_Exception (Gnattest_T : in out Test);
   procedure Test_Unhandled_Exception_91da38 (Gnattest_T : in out Test) renames Test_Unhandled_Exception;
--  id:2.1/91da383001e56d0e/Unhandled_Exception/1/0/
   procedure Test_Unhandled_Exception (Gnattest_T : in out Test) is
   --  exception_handling.ads:15:4:Unhandled_Exception
--  end read only

      pragma Unreferenced (Gnattest_T);

      procedure Handled(E : in Ada.Exceptions.Exception_Occurrence) is
      begin

         Unhandled_Exception(E => E);
      exception
         when UnhandledException =>
            null;
         when others =>
            AUnit.Assertions.Assert(Condition => False,
                                Message   => "Unhandled exception test failed.");

      end Handled;


   begin

      raise DivisionByZero;

   exception
      when E : others =>
         Handled(E => E);

--  begin read only
   end Test_Unhandled_Exception;
--  end read only

end Exception_Handling.Test_Data.Tests;
