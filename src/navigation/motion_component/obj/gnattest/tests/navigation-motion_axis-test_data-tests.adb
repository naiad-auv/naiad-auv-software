--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Motion_Axis.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Navigation.PID_Controller; use Navigation.PID_Controller;

package body Navigation.Motion_Axis.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_f216da (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/f216da984f27657c/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-motion_axis.ads:35:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxCurrentAxis : pCMotion_Axis := null;
      xThrusterIndexes : TAxisThrusters := (ThrusterFront, ThrusterBack, ThrusterLeft, ThrusterRight);
      eAxisIndex : EMotionAxis := AxisZ;
      xRotationalScalings, xPositionalScalings : Navigation.PID_Controller.TPIDComponentScalings;

   begin

      xRotationalScalings := Navigation.PID_Controller.TPIDComponentScalings'(1.0,2.0,3.0);
      xPositionalScalings := Navigation.PID_Controller.TPIDComponentScalings'(4.0,5.0,6.0);

      pxCurrentAxis := Motion_Axis.pxCreate(eAxisIndex,xThrusterIndexes,xRotationalScalings, xPositionalScalings);

      AUnit.Assertions.Assert(Condition => pxCurrentAxis /= null,
                              Message => "Returned axis is null");

      AUnit.Assertions.Assert(Condition => pxCurrentAxis.eAxisIndex = AxisZ,
                              Message => "Axis set incorrectly");

      AUnit.Assertions.Assert(Condition => pxCurrentAxis.fCurrentAngle = 0.0,
                              Message => "Current angle of Axis is not set to 0.0 from the begginging");

      AUnit.Assertions.Assert(Condition => pxCurrentAxis.fWantedAngle = 0.0,
                              Message => "Wanted angle of Axis is not set to 0.0 from the begginging");

      AUnit.Assertions.Assert(Condition => pxCurrentAxis.fCurrentPosition = 0.0,
                              Message => "Current position of Axis is not set to 0.0 from the beggining");

      AUnit.Assertions.Assert(Condition => pxCurrentAxis.fWantedPosition = 0.0,
                              Message => "Wanted position of Axis is not set to 0.0 from the beggining");

      AUnit.Assertions.Assert(Condition => pxCurrentAxis.xRotationalPIDController /= null,
                              Message => "Rotational PID controller is null after constructor");

      AUnit.Assertions.Assert(Condition => pxCurrentAxis.xPositionalPIDController /= null,
                              Message => "Positional PID controller is null after constructor");

      AUnit.Assertions.Assert(Condition => pxCurrentAxis.xThrustersAffectedByAxis = xThrusterIndexes,
                              Message => "Thrusters affected by axis is set incorrectly in constructor");

--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.Motion_Axis.Test_Data.Tests;
