--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.PID_Controller.CPID_Controller_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;

package body Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests is


   --  begin read only
   procedure Test_Set_New_Set_Point (Gnattest_T : in out Test_CPID_Controller);
   procedure Test_Set_New_Set_Point_f8f7bc (Gnattest_T : in out Test_CPID_Controller) renames Test_Set_New_Set_Point;
   --  id:2.1/f8f7bc0264746f6e/Set_New_Set_Point/1/0/
   procedure Test_Set_New_Set_Point (Gnattest_T : in out Test_CPID_Controller) is
      --  navigation-pid_controller.ads:12:4:Set_New_Set_Point
      --  end read only

      pragma Unreferenced (Gnattest_T);

      pxObject : pCPID_Controller;

   begin

      pxObject := PID_Controller.pxCreate;

      pxObject.Set_New_Set_Point(123.65);

      AUnit.Assertions.Assert(Condition => (abs(pxObject.fCurrentSetPoint - 123.65) < 0.0001), Message => ("Setpoint set incorrectly, expected: 123.65 actual: "
                                                                                                           & float'Image(pxObject.fCurrentSetPoint)));

      --  begin read only
   end Test_Set_New_Set_Point;
   --  end read only


   --  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CPID_Controller);
   procedure Test_Set_New_PID_Component_Scalings_640958 (Gnattest_T : in out Test_CPID_Controller) renames Test_Set_New_PID_Component_Scalings;
   --  id:2.1/64095822a78d7a01/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CPID_Controller) is
      --  navigation-pid_controller.ads:14:4:Set_New_PID_Component_Scalings
      --  end read only

      pragma Unreferenced (Gnattest_T);

      pxObject : pCPID_Controller;

   begin
      pxObject := PID_Controller.pxCreate;

      pxObject.Set_New_PID_Component_Scalings(1.0,-2.0,0.0);

      AUnit.Assertions.Assert(Condition => (abs(pxObject.fDerivativeScale - 1.0) < 0.0001), Message => ("Derivative part set incorrectly, expected: 1.0 actual: "
                                                                                                        & float'Image(pxObject.fDerivativeScale)));
      AUnit.Assertions.Assert(Condition => (abs(pxObject.fIntegralScale + 2.0) < 0.0001), Message => ("Integral part set incorrectly, expected: -2.0 actual: "
                                                                                                      & Float'Image(pxObject.fIntegralScale)));
      AUnit.Assertions.Assert(Condition => (abs(pxObject.fProportionalScale - 0.0) < 0.0001), Message => ("Proportional part set incorrectly expected 0.0, actual: "
                                                                                                          & Float'Image(pxObject.fProportionalScale)));

      --  begin read only
   end Test_Set_New_PID_Component_Scalings;
   --  end read only


   --  begin read only
   procedure Test_Reset_Controller (Gnattest_T : in out Test_CPID_Controller);
   procedure Test_Reset_Controller_033697 (Gnattest_T : in out Test_CPID_Controller) renames Test_Reset_Controller;
   --  id:2.1/0336972d1df31fa2/Reset_Controller/1/0/
   procedure Test_Reset_Controller (Gnattest_T : in out Test_CPID_Controller) is
      --  navigation-pid_controller.ads:16:4:Reset_Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      pxObject : pCPID_Controller;
      value : float;

   begin
      pxObject := PID_Controller.pxCreate;

      pxObject.Set_New_Set_Point(123.0);
      pxObject.Set_New_PID_Component_Scalings(1.0,2.0,3.0);
      value := pxObject.xGet_New_Control_Value(1.0);

      pxObject.Reset_Controller;

      AUnit.Assertions.Assert(Condition => pxObject.fCurrentValue = 0.0,
                              Message => "Current value did not reset");
      AUnit.Assertions.Assert(Condition => pxObject.fCurrentSetPoint = 0.0,
                              Message => "Current set point did not reset");
      AUnit.Assertions.Assert(Condition => pxObject.fCurrentProportionalPart = 0.0,
                              Message => "Current proportional part did not reset");
      AUnit.Assertions.Assert(Condition => pxObject.fCurrentIntegralPart = 0.0,
                              Message => "Current integral part did not reset");
      AUnit.Assertions.Assert(Condition => pxObject.fCurrentDerivativePart = 0.0,
                              Message => "Current derivative part did not reset");
      AUnit.Assertions.Assert(Condition => pxObject.fLastProportionalPart = 0.0,
                              Message => "Last propoertional part did not reset");
      AUnit.Assertions.Assert(Condition => pxObject.fDerivativeScale = 0.0,
                              Message => "Derivative scale did not reset");
      AUnit.Assertions.Assert(Condition => pxObject.fIntegralScale = 0.0,
                              Message => "Integral scale did not reset");
      AUnit.Assertions.Assert(Condition => pxObject.fProportionalScale = 0.0,
                              Message => "Proportional scale did not reset");

      --  begin read only
   end Test_Reset_Controller;
   --  end read only

   procedure Test_xGet_New_Control_Value_Increasing_Since_No_Decrease_In_Error(Gnattest_T : in out Test_CPID_Controller) is

      pragma Unreferenced (Gnattest_T);

      pCurrentController : pCPID_Controller;
      iIterations : integer := 50;
      value : float := 0.0;
      lastValue : float := 0.0;
      trace : boolean := false;
   begin
      pCurrentController := new CPID_Controller;

      pCurrentController.Set_New_Pid_Component_Scalings(0.0001,0.0001,0.0001);

      pCurrentController.Set_New_Set_Point(100.0);

      for i in 1 .. iIterations loop
         value := pCurrentController.xGet_New_Control_Value(1.0);
         if trace then
            Ada.Text_IO.Put_Line("Current value: " & Integer'Image(Integer(value)));
         end if;

         AUnit.Assertions.Assert(Condition => value >= lastValue,
                                 Message => "last value is bigger than the current value, this shouldnt happend");
         lastValue := value;
      end loop;

   end;

   procedure Test_xGet_New_Control_Value_Decreasing_Since_Overshoot(Gnattest_T : in out Test_CPID_Controller) is

      pragma Unreferenced (Gnattest_T);

      pCurrentController : pCPID_Controller;
      iIterations : integer := 50;
      value : float := 0.0;
      lastValue : float := 0.0;
      trace : boolean := false;
   begin
      pCurrentController := new CPID_Controller;

      pCurrentController.Set_New_Pid_Component_Scalings(0.0001,0.0001,0.0001);

      pCurrentController.Set_New_Set_Point(100.0);

      lastValue := 80.0;

      for i in 1 .. iIterations loop
         value := pCurrentController.xGet_New_Control_Value(1.0);
         pCurrentController.Update_Current_Value_From_External_Source(100.0 + 2.0 * float(i));
         if trace then
            Ada.Text_IO.Put_Line("Current value: " & Integer'Image(Integer(value)));
         end if;

         AUnit.Assertions.Assert(Condition => value <= lastValue,
                                 Message => "last value is bigger than the current value, this shouldnt happend");
         lastValue := value;
      end loop;

   end;


   --  begin read only
   procedure Test_2_xGet_New_Control_Value (Gnattest_T : in out Test_CPID_Controller);
   procedure Test_xGet_New_Control_Value_5adb99 (Gnattest_T : in out Test_CPID_Controller) renames Test_2_xGet_New_Control_Value;
   --  id:2.1/5adb99280d98182d/xGet_New_Control_Value/0/0/
   procedure Test_2_xGet_New_Control_Value (Gnattest_T : in out Test_CPID_Controller) is
      --  navigation-pid_controller.ads:20:4:xGet_New_Control_Value
      --  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      null;

      --  begin read only
   end Test_2_xGet_New_Control_Value;
   --  end read only

   procedure Test_Update_Current_Value_From_External_Source(Gnattest_T : in out Test_CPID_Controller) is

      pragma Unreferenced(Gnattest_T);

      pCurrentController : pCPID_Controller;

   begin
      pCurrentController := new CPID_Controller;

      pCurrentController.Update_Current_Value_From_External_Source(100.0);

      AUnit.Assertions.Assert(Condition => abs(pCurrentController.fCurrentValue - 100.0) < 0.0001,
                              Message => "Updating current value from external source doesnt set the value correctly");

   end Test_Update_Current_Value_From_External_Source;

end Navigation.PID_Controller.CPID_Controller_Test_Data.CPID_Controller_Tests;
