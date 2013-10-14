--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Orientational_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Rotators; use Math.Rotators;
with Navigation.Planal_Controller; use Navigation.Planal_Controller;
with Navigation.Directional_Controller; use Navigation.Directional_Controller;

package body Navigation.Orientational_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_eb52e6 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/eb52e662b3518196/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-orientational_controller.ads:13:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientational_Controller;

   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate;

      AUnit.Assertions.Assert(Condition => pxOrientationalController /= null,
                              Message   => "OrientationalController is null after construction");

      AUnit.Assertions.Assert(Condition => pxOrientationalController.pxCurrentOrientation /= null,
                              Message   => "Current orientation is null after construction");

      AUnit.Assertions.Assert(Condition => pxOrientationalController.pxWantedOrientation /= null,
                              Message   => "Wanted orientation is null after construction");

      AUnit.Assertions.Assert(Condition => pxOrientationalController.pxPlanalController /= null,
                              Message   => "PlanalController is null after construction");

      AUnit.Assertions.Assert(Condition => pxOrientationalController.pxDirectionalController /= null,
                              Message   => "DirectionalController is null after construction");

--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.Orientational_Controller.Test_Data.Tests;
