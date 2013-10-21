--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Motion_Component.CMotion_Component_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Motion_Component.CMotion_Component_Test_Data.CMotion_Component_Tests is


--  begin read only
   procedure Test_xGet_New_Component_Control_Value (Gnattest_T : in out Test_CMotion_Component);
   procedure Test_xGet_New_Component_Control_Value_39694a (Gnattest_T : in out Test_CMotion_Component) renames Test_xGet_New_Component_Control_Value;
--  id:2.1/39694a23609948fc/xGet_New_Component_Control_Value/1/0/
   procedure Test_xGet_New_Component_Control_Value (Gnattest_T : in out Test_CMotion_Component) is
   --  navigation-motion_component.ads:23:4:xGet_New_Component_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;
      
      xCurrentComponentControlValue : Navigation.Motion_Component.TComponentControlValue;
   begin
      
      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);
      pxMotionComponent.Update_Current_Error(100.0);
      
      xCurrentComponentControlValue := pxMotionComponent.xGet_New_Component_Control_Value(1.0);
      
      AUnit.Assertions.Assert(Condition => xCurrentComponentControlValue.xMotionComponent = X,
                              Message => "Incorrect component value when getting new control value");
      
      AUnit.Assertions.Assert(Condition => xCurrentComponentControlValue.fValue /= 0.0,
                              Message => "abo");
     
--  begin read only
   end Test_xGet_New_Component_Control_Value;
--  end read only


--  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CMotion_Component);
   procedure Test_Set_New_PID_Component_Scalings_bc1ba6 (Gnattest_T : in out Test_CMotion_Component) renames Test_Set_New_PID_Component_Scalings;
--  id:2.1/bc1ba6fba96fad4b/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CMotion_Component) is
   --  navigation-motion_component.ads:25:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxMotionComponent : Navigation.Motion_Component.pCMotionComponent;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;
      
      xNewPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (4.0, 5.0, 6.0);
      
   begin
      
      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);
      
      pxMotionComponent.Set_New_PID_Component_Scalings(xNewPidScalings);
      
      AUnit.Assertions.Assert(Condition => pxMotionComponent.xComponentPIDController.fGetProportionalScale = 4.0,
                              Message => "Proportional scale in component pid controller not set correctly");
      
      AUnit.Assertions.Assert(Condition => pxMotionComponent.xComponentPIDController.fGetIntergralScale = 5.0,
                              Message => "Integral scale in component pid controller not set correctly wanted: , actual: " & Float'Image(pxMotionComponent.xComponentPIDController.fGetIntergralScale));
      
      AUnit.Assertions.Assert(Condition => pxMotionComponent.xComponentPIDController.fGetDerivativeScale = 6.0,
                              Message => "Derivative scale in component pid controller not set correctly");
      
      
--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only


--  begin read only
   procedure Test_Update_Current_Error (Gnattest_T : in out Test_CMotion_Component);
   procedure Test_Update_Current_Error_a25242 (Gnattest_T : in out Test_CMotion_Component) renames Test_Update_Current_Error;
--  id:2.1/a25242109538e127/Update_Current_Error/1/0/
   procedure Test_Update_Current_Error (Gnattest_T : in out Test_CMotion_Component) is
   --  navigation-motion_component.ads:27:4:Update_Current_Error
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
--  begin read only
   end Test_Update_Current_Error;
--  end read only


--  begin read only
   procedure Test_Reset_Component (Gnattest_T : in out Test_CMotion_Component);
   procedure Test_Reset_Component_0de833 (Gnattest_T : in out Test_CMotion_Component) renames Test_Reset_Component;
--  id:2.1/0de83371634f9870/Reset_Component/1/0/
   procedure Test_Reset_Component (Gnattest_T : in out Test_CMotion_Component) is
   --  navigation-motion_component.ads:29:4:Reset_Component
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
      

--  begin read only
   end Test_Reset_Component;
--  end read only



end Navigation.Motion_Component.CMotion_Component_Test_Data.CMotion_Component_Tests;
