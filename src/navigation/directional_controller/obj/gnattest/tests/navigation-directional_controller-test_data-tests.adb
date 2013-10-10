--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Directional_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Angles; use Math.Angles;
with Navigation.Motion_Component; use Navigation.Motion_Component;

package body Navigation.Directional_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_de3a39 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/de3a39ddd274ebc0/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-directional_controller.ads:11:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDirectionalController : Navigation.Directional_Controller.pCDirectional_Controller;

   begin

      pxDirectionalController := Navigation.Directional_Controller.pxCreate;

      AUnit.Assertions.Assert(Condition => pxDirectionalController /= null,
                              Message => "DirectionalController is null after construction");

      AUnit.Assertions.Assert(Condition => pxDirectionalController.xCurrentDirection = 0.0,
                              Message   => "CurrentDirection is not 0.0 after construction");

      AUnit.Assertions.Assert(Condition => pxDirectionalController.xWantedDirection = 0.0,
                              Message   => "WantedDirection is not 0.0 after construction");

      AUnit.Assertions.Assert(Condition => pxDirectionalController.xYawMotionComponent /= null,
                              Message   => "YawMotionComponent is null after construction");

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_xGet_New_Directional_Control_Value (Gnattest_T : in out Test);
   procedure Test_xGet_New_Directional_Control_Value_cd7ed2 (Gnattest_T : in out Test) renames Test_xGet_New_Directional_Control_Value;
--  id:2.1/cd7ed233328b76d9/xGet_New_Directional_Control_Value/1/0/
   procedure Test_xGet_New_Directional_Control_Value (Gnattest_T : in out Test) is
   --  navigation-directional_controller.ads:13:4:xGet_New_Directional_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDirectionalController : Navigation.Directional_Controller.pCDirectional_Controller;
      xComponentScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0,1.0, 1.0);


      xDirectionalControlValue : Navigation.Motion_Component.TComponentControlValue;
   begin

      pxDirectionalController := Navigation.Directional_Controller.pxCreate;

      pxDirectionalController.Set_New_PID_Component_Scalings(xComponentScalings);

      pxDirectionalController.Update_Wanted_Direction(120.0);

      xDirectionalControlValue := pxDirectionalController.xGet_New_Directional_Control_Value(1.0);

      AUnit.Assertions.Assert(Condition => xDirectionalControlValue.xMotionComponent = Navigation.Motion_Component.Yaw,
                              Message   => "xDirectionalConrolValue component is not yaw");

      AUnit.Assertions.Assert(Condition => abs(xDirectionalControlValue.fValue) > 0.00001,
                              Message   => "xDirectionalConrolValue fValue is 0.0");


--  begin read only
   end Test_xGet_New_Directional_Control_Value;
--  end read only

end Navigation.Directional_Controller.Test_Data.Tests;
