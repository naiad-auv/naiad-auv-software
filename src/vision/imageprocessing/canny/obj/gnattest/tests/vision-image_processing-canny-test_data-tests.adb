--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Vision.Image_Processing.Canny.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Vision.Image_Processing.Canny.Test_Data.Tests is


--  begin read only
   procedure Test_DummyTest (Gnattest_T : in out Test);
   procedure Test_DummyTest_01f4ef (Gnattest_T : in out Test) renames Test_DummyTest;
--  id:2.1/01f4effed93d477b/DummyTest/1/0/
   procedure Test_DummyTest (Gnattest_T : in out Test) is
   --  vision-image_processing-canny.ads:3:4:DummyTest
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert(Condition => DummyTest,
                              Message   => "DummyTest test failed!");

--  begin read only
   end Test_DummyTest;
--  end read only


--  begin read only
   procedure Test_Canny (Gnattest_T : in out Test);
   procedure Test_Canny_c6b85e (Gnattest_T : in out Test) renames Test_Canny;
--  id:2.1/c6b85e4839458f82/Canny/1/0/
   procedure Test_Canny (Gnattest_T : in out Test) is
   --  vision-image_processing-canny.ads:4:4:Canny
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert(Condition => Canny,
                              Message   => "Canny test failed!");

--  begin read only
   end Test_Canny;
--  end read only

end Vision.Image_Processing.Canny.Test_Data.Tests;
