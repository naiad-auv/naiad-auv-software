--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Motion_Component.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Navigation.PID_Controller; use Navigation.PID_Controller;


package body Navigation.Motion_Component.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_d9cc2b (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/d9cc2b3cc5569fe8/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-motion_component.ads:22:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;

   begin

      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);

      AUnit.Assertions.Assert(Condition => pxMotionComponent /= null,
                              Message => "Motion component is null after constructor");

      AUnit.Assertions.Assert(Condition => pxMotionComponent.eComponentIndex = Navigation.Motion_Component.EMotionComponent'(X),
                              Message => "Component INDEX is set incorrectly");

      AUnit.Assertions.Assert(Condition => pxMotionComponent.fCurrentValue = 0.0,
                              Message => "Current value of motion component not set to zero during construction");

      AUnit.Assertions.Assert(Condition => pxMotionComponent.fWantedValue = 0.0,
                              Message => "Current value of motion component not set to zero during construction");

      AUnit.Assertions.Assert(Condition => pxMotionComponent.xComponentPIDController /= null,
                              Message => "PID controller of motion component is null after construction");

--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.Motion_Component.Test_Data.Tests;
