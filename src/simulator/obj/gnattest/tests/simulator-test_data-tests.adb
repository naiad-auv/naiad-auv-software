--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Simulator.Test_Data.Tests is


--  begin read only
   procedure Test_bDummy_Test (Gnattest_T : in out Test);
   procedure Test_bDummy_Test_6015d0 (Gnattest_T : in out Test) renames Test_bDummy_Test;
--  id:2.1/6015d057eb2d1323/bDummy_Test/1/0/
   procedure Test_bDummy_Test (Gnattest_T : in out Test) is
   --  simulator.ads:3:4:bDummy_Test
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert(Condition => bDummy_Test,
                              Message   => "Dummy test failed");

--  begin read only
   end Test_bDummy_Test;
--  end read only

end Simulator.Test_Data.Tests;
