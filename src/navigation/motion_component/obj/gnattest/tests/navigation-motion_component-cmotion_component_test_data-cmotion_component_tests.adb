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
   --  navigation-motion_component.ads:24:4:xGet_New_Component_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;
      
      xCurrentComponentControlValue : Navigation.Motion_Component.TComponentControlValue;
   begin
      
      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);
      pxMotionComponent.Set_New_Wanted_Value(100.0);
      pxMotionComponent.Set_New_Current_Value(1.0);
      
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
   --  navigation-motion_component.ads:26:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxMotionComponent : Navigation.Motion_Component.pCMotion_Component;
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
   procedure Test_Set_New_Wanted_Value (Gnattest_T : in out Test_CMotion_Component);
   procedure Test_Set_New_Wanted_Value_9964e8 (Gnattest_T : in out Test_CMotion_Component) renames Test_Set_New_Wanted_Value;
--  id:2.1/9964e89b6aa9237a/Set_New_Wanted_Value/1/0/
   procedure Test_Set_New_Wanted_Value (Gnattest_T : in out Test_CMotion_Component) is
   --  navigation-motion_component.ads:28:4:Set_New_Wanted_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

   	pxMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;
      
   begin
      
      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);

      pxMotionComponent.Set_New_Wanted_Value(45.0);
      
      AUnit.Assertions.Assert(Condition => pxMotionComponent.fWantedValue = 45.0,
                              Message => "fWantedValue is set incorrectly");
      
--  begin read only
   end Test_Set_New_Wanted_Value;
--  end read only


--  begin read only
   procedure Test_Set_New_Current_Value (Gnattest_T : in out Test_CMotion_Component);
   procedure Test_Set_New_Current_Value_395f16 (Gnattest_T : in out Test_CMotion_Component) renames Test_Set_New_Current_Value;
--  id:2.1/395f168f48b18fe0/Set_New_Current_Value/1/0/
   procedure Test_Set_New_Current_Value (Gnattest_T : in out Test_CMotion_Component) is
   --  navigation-motion_component.ads:30:4:Set_New_Current_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;
      
   begin
      
      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);
      
      pxMotionComponent.Set_New_Current_Value(-24.0);
      
      AUnit.Assertions.Assert(Condition => pxMotionComponent.fCurrentValue = -24.0,
                              Message => "fCurrent value is set incorrectly");
--  begin read only
   end Test_Set_New_Current_Value;
--  end read only


--  begin read only
   procedure Test_Reset_Component (Gnattest_T : in out Test_CMotion_Component);
   procedure Test_Reset_Component_0de833 (Gnattest_T : in out Test_CMotion_Component) renames Test_Reset_Component;
--  id:2.1/0de83371634f9870/Reset_Component/1/0/
   procedure Test_Reset_Component (Gnattest_T : in out Test_CMotion_Component) is
   --  navigation-motion_component.ads:32:4:Reset_Component
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMotionComponent : Navigation.Motion_Component.pCMotion_Component;
      xPidScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);
      xComponentIndex : Navigation.Motion_Component.EMotionComponent := X;
      
   begin
      
      pxMotionComponent := Navigation.Motion_Component.pxCreate(xComponentIndex, xPidScalings);
      
      pxMotionComponent.Set_New_Wanted_Value(123.0);
      pxMotionComponent.Set_New_Current_Value(345.0);
      
      pxMotionComponent.Reset_Component;
      
      
      AUnit.Assertions.Assert(Condition => pxMotionComponent.fCurrentValue = 0.0,
                              Message => "fCurrentValue is not reset");
      
      AUnit.Assertions.Assert(Condition => pxMotionComponent.fWantedValue = 0.0,
                              Message => "fWantedValue is not reset");
--  begin read only
   end Test_Reset_Component;
--  end read only


--  begin read only
   --  procedure Test_xGet_New_Control_Values (Gnattest_T : in out Test);
   --  procedure Test_xGet_New_Control_Values_d0e4e8 (Gnattest_T : in out Test) renames Test_xGet_New_Control_Values;
--  id:2.1/d0e4e8e10e9eb65e/xGet_New_Control_Values/0/1/
   --  procedure Test_xGet_New_Control_Values (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--     begin
--  
--        AUnit.Assertions.Assert
--          (Gnattest_Generated.Default_Assert_Value,
--           "Test not implemented.");
--  
--  begin read only
   --  end Test_xGet_New_Control_Values;
--  end read only

end Navigation.Motion_Component.CMotion_Component_Test_Data.CMotion_Component_Tests;
