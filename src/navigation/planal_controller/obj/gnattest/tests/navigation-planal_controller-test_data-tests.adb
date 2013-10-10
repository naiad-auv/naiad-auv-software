--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Planal_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Planes; use Math.Planes;
with Navigation.Motion_Component; use Navigation.Motion_Component;

package body Navigation.Planal_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_157d3c (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/157d3c97b19b8f64/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-planal_controller.ads:16:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxPlanalController : Navigation.Planal_Controller.pCPlanal_Controller;

   begin

      pxPlanalController := Navigation.Planal_Controller.pxCreate;

      AUnit.Assertions.Assert(Condition => pxPlanalController /= null,
                              Message   => "PlanalController is null after construction");

      AUnit.Assertions.Assert(Condition => pxPlanalController.pxCurrentPlane /= null,
                              Message   => "CurrentPlane is null after construction");

      AUnit.Assertions.Assert(Condition => pxPlanalController.pxWantedPlane /= null,
                              Message   => "WantedPlane is null after construction");

      AUnit.Assertions.Assert(Condition => pxPlanalController.pxPitchMotionComponent /= null,
                              Message   => "PitchMotionComponent is null after construction");

      AUnit.Assertions.Assert(Condition => pxPlanalController.pxRollMotionComponent /= null,
                              Message   => "RollMotionComponent is null after construction");


--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.Planal_Controller.Test_Data.Tests;
