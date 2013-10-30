--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.PID_Controller.CPIDController_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.PID_Controller.CPIDController_Test_Data.CPIDController_Tests is


--  begin read only
   procedure Test_Set_New_Set_Point (Gnattest_T : in out Test_CPIDController);
   procedure Test_Set_New_Set_Point_6fc576 (Gnattest_T : in out Test_CPIDController) renames Test_Set_New_Set_Point;
--  id:2.1/6fc5765ad3208c80/Set_New_Set_Point/1/0/
   procedure Test_Set_New_Set_Point (Gnattest_T : in out Test_CPIDController) is
   --  navigation-pid_controller.ads:24:4:Set_New_Set_Point
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxObject : pCPIDController;

      xPIDScalints : Navigation.PID_Controller.TPIDComponentScalings := (1.0,1.0,1.0);

   begin

      pxObject := PID_Controller.pxCreate(xPIDScalints);

      pxObject.Set_New_Set_Point(123.65);

      AUnit.Assertions.Assert(Condition => (abs(pxObject.fCurrentSetPoint - 123.65) < 0.0001), Message => ("Setpoint set incorrectly, expected: 123.65 actual: "
                                                                                                           & float'Image(pxObject.fCurrentSetPoint)));

      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);

--  begin read only
   end Test_Set_New_Set_Point;
--  end read only


--  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CPIDController);
   procedure Test_Set_New_PID_Component_Scalings_e0f1e7 (Gnattest_T : in out Test_CPIDController) renames Test_Set_New_PID_Component_Scalings;
--  id:2.1/e0f1e7d90084c088/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CPIDController) is
   --  navigation-pid_controller.ads:29:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxObject : pCPIDController;
      xPIDScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, -2.0, 0.0);

   begin
      pxObject := PID_Controller.pxCreate(xPIDScalings);

      AUnit.Assertions.Assert(Condition => (abs(pxObject.fProportionalScale - 1.0) < 0.0001), Message => ("Proportional part set incorrectly expected 0.0, actual: "
                                                                                                          & Float'Image(pxObject.fProportionalScale)));
      AUnit.Assertions.Assert(Condition => (abs(pxObject.fIntegralScale + 2.0) < 0.0001), Message => ("Integral part set incorrectly, expected: -2.0 actual: "
                                                                                                      & Float'Image(pxObject.fIntegralScale)));
      AUnit.Assertions.Assert(Condition => (abs(pxObject.fDerivativeScale - 0.0) < 0.0001), Message => ("Derivative part set incorrectly, expected: 1.0 actual: "
                                                                                                        & float'Image(pxObject.fDerivativeScale)));
      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);

--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only


--  begin read only
   procedure Test_Update_Current_Value_From_External_Source (Gnattest_T : in out Test_CPIDController);
   procedure Test_Update_Current_Value_From_External_Source_c04e0d (Gnattest_T : in out Test_CPIDController) renames Test_Update_Current_Value_From_External_Source;
--  id:2.1/c04e0db630f6e157/Update_Current_Value_From_External_Source/1/0/
   procedure Test_Update_Current_Value_From_External_Source (Gnattest_T : in out Test_CPIDController) is
   --  navigation-pid_controller.ads:34:4:Update_Current_Value_From_External_Source
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxObject : pCPIDController;
      xPIDScalints : Navigation.PID_Controller.TPIDComponentScalings := (1.0,1.0,1.0);

   begin
      pxObject := PID_Controller.pxCreate(xPIDScalints);

      pxObject.Update_Current_Value_From_External_Source(100.0);

      AUnit.Assertions.Assert(Condition => pxObject.fCurrentValue = 100.0,
                              Message   => "fCurrentValue is not updated as it should");
      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);
--  begin read only
   end Test_Update_Current_Value_From_External_Source;
--  end read only


--  begin read only
   procedure Test_Reset_Controller (Gnattest_T : in out Test_CPIDController);
   procedure Test_Reset_Controller_aaccb2 (Gnattest_T : in out Test_CPIDController) renames Test_Reset_Controller;
--  id:2.1/aaccb2a0cd467786/Reset_Controller/1/0/
   procedure Test_Reset_Controller (Gnattest_T : in out Test_CPIDController) is
   --  navigation-pid_controller.ads:39:4:Reset_Controller
--  end read only

      pragma Unreferenced (Gnattest_T);


      pxObject : pCPIDController;
      value : float;
      xScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0, 2.0, 3.0);

   begin
      pxObject := PID_Controller.pxCreate(xScalings);

      pxObject.Set_New_Set_Point(123.0);
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
      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);

--  begin read only
   end Test_Reset_Controller;
--  end read only


--  begin read only
   procedure Test_xGet_New_Control_Value (Gnattest_T : in out Test_CPIDController);
   procedure Test_xGet_New_Control_Value_c13ef9 (Gnattest_T : in out Test_CPIDController) renames Test_xGet_New_Control_Value;
--  id:2.1/c13ef9ae9b93b390/xGet_New_Control_Value/1/0/
   procedure Test_xGet_New_Control_Value (Gnattest_T : in out Test_CPIDController) is
   --  navigation-pid_controller.ads:43:4:xGet_New_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

 pxObject : pCPIDController;
      value : float;
      xScalings : Navigation.PID_Controller.TPIDComponentScalings := (0.001, 0.001, 0.001);

   begin
      pxObject := PID_Controller.pxCreate(xScalings);

      pxObject.Set_New_Set_Point(100.0);
      pxObject.Update_Current_Value_From_External_Source(0.0);

      for i in 1 .. 100 loop
         value := pxObject.xGet_New_Control_Value(1.0);
         AUnit.Assertions.Assert(Condition => Value /= 0.0,
                                 Message   => "Zero returned as a control value");
      end loop;
      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);

--  begin read only
   end Test_xGet_New_Control_Value;
--  end read only


--  begin read only
   procedure Test_fGetIntergralScale (Gnattest_T : in out Test_CPIDController);
   procedure Test_fGetIntergralScale_32b2f8 (Gnattest_T : in out Test_CPIDController) renames Test_fGetIntergralScale;
--  id:2.1/32b2f8b7cf59f9c4/fGetIntergralScale/1/0/
   procedure Test_fGetIntergralScale (Gnattest_T : in out Test_CPIDController) is
   --  navigation-pid_controller.ads:48:4:fGetIntergralScale
--  end read only

      pragma Unreferenced (Gnattest_T);

  pxObject : pCPIDController := null;

   begin

      pxObject := PID_Controller.pxCreate(xPIDComponentScalings => Navigation.PID_Controller.TPIDComponentScalings'(1.0,2.0,3.0));

      AUnit.Assertions.Assert(Condition => pxObject.fGetIntergralScale = 2.0,
                              Message   => "fGetIntegralScale does not return 2.0");
      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);

--  begin read only
   end Test_fGetIntergralScale;
--  end read only


--  begin read only
   procedure Test_fGetDerivativeScale (Gnattest_T : in out Test_CPIDController);
   procedure Test_fGetDerivativeScale_b87122 (Gnattest_T : in out Test_CPIDController) renames Test_fGetDerivativeScale;
--  id:2.1/b87122a1491fcf4d/fGetDerivativeScale/1/0/
   procedure Test_fGetDerivativeScale (Gnattest_T : in out Test_CPIDController) is
   --  navigation-pid_controller.ads:52:4:fGetDerivativeScale
--  end read only

      pragma Unreferenced (Gnattest_T);
  pxObject : pCPIDController := null;

   begin

      pxObject := PID_Controller.pxCreate(xPIDComponentScalings => Navigation.PID_Controller.TPIDComponentScalings'(1.0,2.0,3.0));

      AUnit.Assertions.Assert(Condition => pxObject.fGetDerivativeScale = 3.0,
                              Message   => "fGetDerivativeScale does not return 3.0");
      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);

--  begin read only
   end Test_fGetDerivativeScale;
--  end read only


--  begin read only
   procedure Test_fGetProportionalScale (Gnattest_T : in out Test_CPIDController);
   procedure Test_fGetProportionalScale_8382ac (Gnattest_T : in out Test_CPIDController) renames Test_fGetProportionalScale;
--  id:2.1/8382ac53241c880e/fGetProportionalScale/1/0/
   procedure Test_fGetProportionalScale (Gnattest_T : in out Test_CPIDController) is
   --  navigation-pid_controller.ads:56:4:fGetProportionalScale
--  end read only

      pragma Unreferenced (Gnattest_T);
pxObject : pCPIDController := null;

   begin

      pxObject := PID_Controller.pxCreate(xPIDComponentScalings => Navigation.PID_Controller.TPIDComponentScalings'(1.0,2.0,3.0));

      Aunit.Assertions.Assert(Condition => pxObject.fGetProportionalScale = 1.0,
                              Message   => "fGetProportionalScale did not return 1.0");
      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);
--  begin read only
   end Test_fGetProportionalScale;
--  end read only

end Navigation.PID_Controller.CPIDController_Test_Data.CPIDController_Tests;
