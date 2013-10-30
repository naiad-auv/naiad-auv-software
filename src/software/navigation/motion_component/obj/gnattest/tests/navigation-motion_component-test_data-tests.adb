--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Motion_Component.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Motion_Component.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_e9f3c1 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/e9f3c13257984f21/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  navigation-motion_component.ads:11:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_1ce4e5 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/1ce4e581e8a13e3c/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-motion_component.ads:36:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Navigation.PID_Controller;
      pxMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;

   begin

      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);

      AUnit.Assertions.Assert(Condition => pxMotionComponent /= null,
                              Message => "Motion component is null after constructor");

      AUnit.Assertions.Assert(Condition => pxMotionComponent.eComponentIndex = Navigation.Motion_Component.EMotionComponent'(X),
                              Message => "Component INDEX is set incorrectly");

      AUnit.Assertions.Assert(Condition => pxMotionComponent.fCurrentError = 0.0,
                              Message => "Current value of motion component not set to zero during construction");

      AUnit.Assertions.Assert(Condition => pxMotionComponent.pxComponentPIDController /= null,
                              Message => "PID controller of motion component is null after construction");

      Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => pxMotionComponent);
--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.Motion_Component.Test_Data.Tests;
