--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Motion_Component.CMotionComponent_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Navigation.PID_Controller;

package body Navigation.Motion_Component.CMotionComponent_Test_Data.CMotionComponent_Tests is


--  begin read only
   procedure Test_xGet_New_Component_Control_Value (Gnattest_T : in out Test_CMotionComponent);
   procedure Test_xGet_New_Component_Control_Value_a62587 (Gnattest_T : in out Test_CMotionComponent) renames Test_xGet_New_Component_Control_Value;
--  id:2.1/a625870aa54b49ea/xGet_New_Component_Control_Value/1/0/
   procedure Test_xGet_New_Component_Control_Value (Gnattest_T : in out Test_CMotionComponent) is
   --  navigation-motion_component.ads:41:4:xGet_New_Component_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;

      xCurrentComponentControlValue : Navigation.Motion_Component.TComponentControlValue;
   begin

      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);
      pxMotionComponent.Update_Current_Error(100.0);

      xCurrentComponentControlValue  := pxMotionComponent.xGet_New_Component_Control_Value(fDeltaTime => 1.0);

      AUnit.Assertions.Assert(Condition => xCurrentComponentControlValue.xMotionComponent = X,
                              Message => "Incorrect component value when getting new control value");

      AUnit.Assertions.Assert(Condition => xCurrentComponentControlValue.fValue /= 0.0,
                              Message => "abo");
      Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => pxMotionComponent);

      xPidScalings := Navigation.PID_Controller.TPIDComponentScalings'(0.0, 0.0, 0.0);
      xComponentIndex := RotationX;
      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);
      pxMotionComponent.Update_Current_Error(0.0);

      xCurrentComponentControlValue := pxMotionComponent.xGet_New_Component_Control_Value(fDeltaTime => 0.25);
      AUnit.Assertions.Assert(Condition => xCurrentComponentControlValue.fValue = 0.0,
                              Message => "abo");


--  begin read only
   end Test_xGet_New_Component_Control_Value;
--  end read only


--  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CMotionComponent);
   procedure Test_Set_New_PID_Component_Scalings_d22d44 (Gnattest_T : in out Test_CMotionComponent) renames Test_Set_New_PID_Component_Scalings;
--  id:2.1/d22d443ecbd12209/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CMotionComponent) is
   --  navigation-motion_component.ads:46:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;

      xNewPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (4.0, 5.0, 6.0);

   begin

      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);

      pxMotionComponent.Set_New_PID_Component_Scalings(xNewPidScalings);

      AUnit.Assertions.Assert(Condition => pxMotionComponent.pxComponentPIDController.fGetProportionalScale = 4.0,
                              Message => "Proportional scale in component pid controller not set correctly");

      AUnit.Assertions.Assert(Condition => pxMotionComponent.pxComponentPIDController.fGetIntergralScale = 5.0,
                              Message => "Integral scale in component pid controller not set correctly wanted: , actual: " & Float'Image(pxMotionComponent.pxComponentPIDController.fGetIntergralScale));

      AUnit.Assertions.Assert(Condition => pxMotionComponent.pxComponentPIDController.fGetDerivativeScale = 6.0,
                              Message => "Derivative scale in component pid controller not set correctly");

      Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => pxMotionComponent);

--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only


--  begin read only
   procedure Test_Update_Current_Error (Gnattest_T : in out Test_CMotionComponent);
   procedure Test_Update_Current_Error_8e51e5 (Gnattest_T : in out Test_CMotionComponent) renames Test_Update_Current_Error;
--  id:2.1/8e51e50b2ccd62ff/Update_Current_Error/1/0/
   procedure Test_Update_Current_Error (Gnattest_T : in out Test_CMotionComponent) is
   --  navigation-motion_component.ads:51:4:Update_Current_Error
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;

   begin

      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);

      pxMotionComponent.Update_Current_Error(-24.0);

      AUnit.Assertions.Assert(Condition => pxMotionComponent.fCurrentError = -24.0,
                              Message => "fCurrentError value is set incorrectly");
      Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => pxMotionComponent);
--  begin read only
   end Test_Update_Current_Error;
--  end read only


--  begin read only
   procedure Test_Reset_Component (Gnattest_T : in out Test_CMotionComponent);
   procedure Test_Reset_Component_a5a4fe (Gnattest_T : in out Test_CMotionComponent) renames Test_Reset_Component;
--  id:2.1/a5a4fe788e5978ba/Reset_Component/1/0/
   procedure Test_Reset_Component (Gnattest_T : in out Test_CMotionComponent) is
   --  navigation-motion_component.ads:56:4:Reset_Component
--  end read only

      pragma Unreferenced (Gnattest_T);


      pxMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;

   begin

      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);

      pxMotionComponent.Update_Current_Error(123.0);


      pxMotionComponent.Reset_Component;


      AUnit.Assertions.Assert(Condition => pxMotionComponent.fCurrentError = 0.0,
                              Message => "fCurrentError is not reset");

      Navigation.Motion_Component.Free(pxMotionComponentToDeallocate => pxMotionComponent);


--  begin read only
   end Test_Reset_Component;
--  end read only


--  begin read only
   procedure Test_Finalize (Gnattest_T : in out Test_CMotionComponent);
   procedure Test_Finalize_1d29f1 (Gnattest_T : in out Test_CMotionComponent) renames Test_Finalize;
--  id:2.1/1d29f15228a8f8f4/Finalize/1/0/
   procedure Test_Finalize (Gnattest_T : in out Test_CMotionComponent) is
   --  navigation-motion_component.ads:71:4:Finalize
--  end read only

      use Navigation.PID_Controller;

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;

   begin

      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);

      pxMotionComponent.Update_Current_Error(123.0);

      pxMotionComponent.Finalize;

      AUnit.Assertions.Assert(Condition => pxMotionComponent.pxComponentPIDController = null,
                              Message   => "PIDcontroller in motion component is not null after finalization");


--  begin read only
   end Test_Finalize;
--  end read only

end Navigation.Motion_Component.CMotionComponent_Test_Data.CMotionComponent_Tests;
