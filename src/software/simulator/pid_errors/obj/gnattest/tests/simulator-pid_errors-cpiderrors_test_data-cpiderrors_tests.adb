--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Pid_Errors.CPidErrors_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;
with math.Angles;
use Math.Angles;

package body Simulator.Pid_Errors.CPidErrors_Test_Data.CPidErrors_Tests is


--  begin read only
   procedure Test_Update_Errors (Gnattest_T : in out Test_CPidErrors);
   procedure Test_Update_Errors_002883 (Gnattest_T : in out Test_CPidErrors) renames Test_Update_Errors;
--  id:2.1/0028832abf5aedcc/Update_Errors/1/0/
   procedure Test_Update_Errors (Gnattest_T : in out Test_CPidErrors) is
   --  simulator-pid_errors.ads:17:4:Update_Errors
--  end read only

      use math.Matrices;
      pragma Unreferenced (Gnattest_T);
      pxPidError : simulator.Pid_Errors.pCPidErrors;
   begin
      pxPidError := Simulator.Pid_Errors.pxCreate;
      pxPidError.tfPIDErrors := (others => 0.0);
      pxPidError.Update_Errors(xCurrentAbsolutePosition    => math.Vectors.xCreate(0.0,0.0,0.0),
                               xWantedAbsolutePosition     => math.Vectors.xCreate(15.1,7.3,1.2),
                               xCurrentAbsoluteOrientation => math.Matrices.xCreate_Identity,
                               xWantedAbsoluteOrientation  => math.Matrices.xCreate_Rotation_Around_X_Axis(31.2)*math.Matrices.xCreate_Rotation_Around_Y_Axis(21.9)*math.Matrices.xCreate_Rotation_Around_Z_Axis(29.2));
      Aunit.Assertions.Assert(Condition => pxPidError.tfPIDErrors(PositionX)/=0.0,
                              Message   => "Simulator.Pid_Errors.Update_Errors failed, X position error not set");
      Aunit.Assertions.Assert(Condition => pxPidError.tfPIDErrors(PositionY)/=0.0,
                              Message   => "Simulator.Pid_Errors.Update_Errors failed, Y position error not set");
      Aunit.Assertions.Assert(Condition => pxPidError.tfPIDErrors(PositionZ)/=0.0,
                              Message   => "Simulator.Pid_Errors.Update_Errors failed, Z position error not set");
      Aunit.Assertions.Assert(Condition => pxPidError.tfPIDErrors(RotationX)/=0.0,
                              Message   => "Simulator.Pid_Errors.Update_Errors failed, X Rotation error not set");
      Aunit.Assertions.Assert(Condition => pxPidError.tfPIDErrors(RotationY)/=0.0,
                              Message   => "Simulator.Pid_Errors.Update_Errors failed, Y Rotation error not set");
      Aunit.Assertions.Assert(Condition => pxPidError.tfPIDErrors(RotationZ)/=0.0,
                              Message   => "Simulator.Pid_Errors.Update_Errors failed, Z Rotation error not set");

--  begin read only
   end Test_Update_Errors;
--  end read only


--  begin read only
   procedure Test_fGet_PID_Error_For_Component (Gnattest_T : in out Test_CPidErrors);
   procedure Test_fGet_PID_Error_For_Component_f6cf1a (Gnattest_T : in out Test_CPidErrors) renames Test_fGet_PID_Error_For_Component;
--  id:2.1/f6cf1a2a1be2a07a/fGet_PID_Error_For_Component/1/0/
   procedure Test_fGet_PID_Error_For_Component (Gnattest_T : in out Test_CPidErrors) is
   --  simulator-pid_errors.ads:18:4:fGet_PID_Error_For_Component
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxPidError : simulator.Pid_Errors.pCPidErrors;
   begin
      pxPidError := simulator.Pid_Errors.pxCreate;
      pxPidError.tfPIDErrors := (1.5,3.5,1.3,6.1,2.1,1.4);
      Aunit.Assertions.Assert(Condition => 1.5=pxPidError.tGet_PID_Errors(PositionX),
                              Message   => "Simulator.Pid_Errors.fGeet_PID_Error_For_Component failed, faulty value gotten X");
      Aunit.Assertions.Assert(Condition => 3.5=pxPidError.tGet_PID_Errors(PositionY),
                              Message   => "Simulator.Pid_Errors.fGeet_PID_Error_For_Component failed, faulty value gotten Y");
      Aunit.Assertions.Assert(Condition => 1.3=pxPidError.tGet_PID_Errors(PositionZ),
                              Message   => "Simulator.Pid_Errors.fGeet_PID_Error_For_Component failed, faulty value gotten Z");
      Aunit.Assertions.Assert(Condition => 6.1=pxPidError.tGet_PID_Errors(RotationX),
                              Message   => "Simulator.Pid_Errors.fGeet_PID_Error_For_Component failed, faulty value gotten Rotation X");
      Aunit.Assertions.Assert(Condition => 2.1=pxPidError.tGet_PID_Errors(RotationY),
                              Message   => "Simulator.Pid_Errors.fGeet_PID_Error_For_Component failed, faulty value gotten Rotation Y");
      Aunit.Assertions.Assert(Condition => 1.4=pxPidError.tGet_PID_Errors(RotationZ),
                              Message   => "Simulator.Pid_Errors.fGeet_PID_Error_For_Component failed, faulty value gotten Rotation Z");

--  begin read only
   end Test_fGet_PID_Error_For_Component;
--  end read only


--  begin read only
   procedure Test_Update_Current_Positional_Errors (Gnattest_T : in out Test_CPidErrors);
   procedure Test_Update_Current_Positional_Errors_9c5c71 (Gnattest_T : in out Test_CPidErrors) renames Test_Update_Current_Positional_Errors;
--  id:2.1/9c5c71384364114a/Update_Current_Positional_Errors/1/0/
   procedure Test_Update_Current_Positional_Errors (Gnattest_T : in out Test_CPidErrors) is
   --  simulator-pid_errors.ads:26:4:Update_Current_Positional_Errors
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxPidErrors : simulator.Pid_Errors.pCPidErrors;
   begin
      pxPidErrors := simulator.Pid_Errors.pxCreate;
      pxPidErrors.Update_Current_Positional_Errors(xWantedAbsolutePosition            => math.Vectors.xCreate(fX => 135.1,
                                                                                                              fY => 7.9,
                                                                                                              fZ => -6.3),
                                                   xCurrentAbsolutePosition           => math.Vectors.xCreate(fX => 0.0,
                                                                                                              fY => 0.0,
                                                                                                              fZ => 0.0),
                                                   xCurrentAbsoluteOrientationInverse => math.Matrices.xCreate_Rotation_Around_Z_Axis(0.0));
      ada.Text_IO.Put_Line("pxPidErrors position X is: " & pxPidErrors.tfPIDErrors(PositionX)'img);
      AUnit.Assertions.Assert(Condition => pxPidErrors.tfPIDErrors(PositionX)=135.1,
                              Message   => "Simulator.Pid_Errors.Update_Current_Positional_Errors failed, faulty x value");
      ada.Text_IO.Put_Line("pxPidErrors position Y is: " & pxPidErrors.tfPIDErrors(PositionY)'img);
      AUnit.Assertions.Assert(Condition => pxPidErrors.tfPIDErrors(PositionY)=7.9,
                              Message   => "Simulator.Pid_Errors.Update_Current_Positional_Errors failed, faulty y value");
      ada.Text_IO.Put_Line("pxPidErrors position Z is: " & pxPidErrors.tfPIDErrors(PositionZ)'img);
      AUnit.Assertions.Assert(Condition => pxPidErrors.tfPIDErrors(PositionZ)=-6.3,
                              Message   => "Simulator.Pid_Errors.Update_Current_Positional_Errors failed, faulty z value");
   end Test_Update_Current_Positional_Errors;
--  end read only


--  begin read only
   procedure Test_Update_Current_Z_Rotation_Error (Gnattest_T : in out Test_CPidErrors);
   procedure Test_Update_Current_Z_Rotation_Error_a63e74 (Gnattest_T : in out Test_CPidErrors) renames Test_Update_Current_Z_Rotation_Error;
--  id:2.1/a63e74c73fc91f46/Update_Current_Z_Rotation_Error/1/0/
   procedure Test_Update_Current_Z_Rotation_Error (Gnattest_T : in out Test_CPidErrors) is
   --  simulator-pid_errors.ads:27:4:Update_Current_Z_Rotation_Error
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxPidErrors : simulator.Pid_Errors.pCPidErrors;

   begin
      pxPidErrors := simulator.Pid_Errors.pxCreate;
      pxPidErrors.Update_Current_Z_Rotation_Error(xWantedAbsoluteOrientation         => math.Matrices.xCreate_Rotation_Around_Z_Axis(tfAngleInDegrees => 120.0),
                                                  xCurrentAbsoluteOrientationInverse => math.Matrices.xCreate_Rotation_Around_X_Axis(tfAngleInDegrees => 00.0));
      ada.Text_IO.Put_Line("Rotation Around Z: " & math.Angles.fRadians_To_Degrees(pxPidErrors.tfPIDErrors(RotationZ))'img);
      AUnit.Assertions.Assert(Condition => abs(math.Angles.fRadians_To_Degrees(pxPidErrors.tfPIDErrors(RotationZ))-(-120.0))<0.0001,
                              Message   => "Simulator.Pid_Errors.Update_Current_Z_Rotation_Error failed,");

--  begin read only
   end Test_Update_Current_Z_Rotation_Error;
--  end read only


--  begin read only
   procedure Test_Update_Current_Y_Rotation_Error (Gnattest_T : in out Test_CPidErrors);
   procedure Test_Update_Current_Y_Rotation_Error_df3b16 (Gnattest_T : in out Test_CPidErrors) renames Test_Update_Current_Y_Rotation_Error;
--  id:2.1/df3b167191792aba/Update_Current_Y_Rotation_Error/1/0/
   procedure Test_Update_Current_Y_Rotation_Error (Gnattest_T : in out Test_CPidErrors) is
   --  simulator-pid_errors.ads:28:4:Update_Current_Y_Rotation_Error
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxPidErrors : simulator.Pid_Errors.pCPidErrors;

   begin
      pxPidErrors := simulator.Pid_Errors.pxCreate;
      pxPidErrors.Update_Current_Y_Rotation_Error(xWantedAbsoluteOrientation         => math.Matrices.xCreate_Rotation_Around_Y_Axis(tfAngleInDegrees => 120.0),
                                                  xCurrentAbsoluteOrientationInverse => math.Matrices.xCreate_Rotation_Around_Z_Axis(tfAngleInDegrees => 00.0));
      ada.Text_IO.Put_Line("Rotation Around Y: " & math.Angles.fRadians_To_Degrees(pxPidErrors.tfPIDErrors(RotationY))'img);
      AUnit.Assertions.Assert(Condition => abs(math.Angles.fRadians_To_Degrees(pxPidErrors.tfPIDErrors(RotationY))-(-120.0))<0.0001,
                              Message   => "Simulator.Pid_Errors.Update_Current_Y_Rotation_Error failed,");
--  begin read only
   end Test_Update_Current_Y_Rotation_Error;
--  end read only


--  begin read only
   procedure Test_Update_Current_X_Rotation_Error (Gnattest_T : in out Test_CPidErrors);
   procedure Test_Update_Current_X_Rotation_Error_0097a2 (Gnattest_T : in out Test_CPidErrors) renames Test_Update_Current_X_Rotation_Error;
--  id:2.1/0097a2292e43255c/Update_Current_X_Rotation_Error/1/0/
   procedure Test_Update_Current_X_Rotation_Error (Gnattest_T : in out Test_CPidErrors) is
   --  simulator-pid_errors.ads:29:4:Update_Current_X_Rotation_Error
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxPidErrors : simulator.Pid_Errors.pCPidErrors;

   begin
      pxPidErrors := simulator.Pid_Errors.pxCreate;
      pxPidErrors.Update_Current_X_Rotation_Error(xWantedAbsoluteOrientation         => math.Matrices.xCreate_Rotation_Around_X_Axis(tfAngleInDegrees => 120.0),
                                                  xCurrentAbsoluteOrientationInverse => math.Matrices.xCreate_Rotation_Around_Y_Axis(tfAngleInDegrees => 00.0));
      ada.Text_IO.Put_Line("Rotation Around X: " & math.Angles.fRadians_To_Degrees(pxPidErrors.tfPIDErrors(RotationX))'img);
      AUnit.Assertions.Assert(Condition => abs(math.Angles.fRadians_To_Degrees(pxPidErrors.tfPIDErrors(RotationX))-(-120.0))<0.0001,
                              Message   => "Simulator.Pid_Errors.Update_Current_X_Rotation_Error failed,");

--  begin read only
   end Test_Update_Current_X_Rotation_Error;
--  end read only

end Simulator.Pid_Errors.CPidErrors_Test_Data.CPidErrors_Tests;
