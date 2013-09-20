--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Test_Data.Tests is


--  begin read only
   procedure Test_DummyTest (Gnattest_T : in out Test);
   procedure Test_DummyTest_01f4ef (Gnattest_T : in out Test) renames Test_DummyTest;
--  id:2.1/01f4effed93d477b/DummyTest/1/0/
   procedure Test_DummyTest (Gnattest_T : in out Test) is
   --  navigation.ads:2:4:DummyTest
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert(Condition => Navigation.DummyTest,
                              Message   => "");
--  begin read only
   end Test_DummyTest;
--  end read only

end Navigation.Test_Data.Tests;
