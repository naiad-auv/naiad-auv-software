--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Positional_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Positional_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_ccac1a (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/ccac1afaeb600e2c/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-positional_controller.ads:10:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Math.Vectors;
      use Navigation.Motion_Component;

      pxPositionalController : Navigation.Positional_Controller.pCPositional_Controller;

   begin

      pxPositionalController := Navigation.Positional_Controller.pxCreate;

      AUnit.Assertions.Assert(Condition => pxPositionalController /= null,
                              Message => "pxPositionalController is not pointing towards on object");


      AUnit.Assertions.Assert(Condition => pxPositionalController.pxWantedPosition /= null,
                              Message => "pxWantedPosition is null after construction");

      AUnit.Assertions.Assert(Condition => pxPositionalController.pxXMotionComponent /= null,
                              Message => "pxXMotionComponent is null after construction");


      AUnit.Assertions.Assert(Condition => pxPositionalController.pxYMotionComponent /= null,
                              Message => "pxYMotionComponent is null after construction");


      AUnit.Assertions.Assert(Condition => pxPositionalController.pxZMotionComponent /= null,
                              Message => "pxZMotionComponent is null after construction");

--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.Positional_Controller.Test_Data.Tests;
