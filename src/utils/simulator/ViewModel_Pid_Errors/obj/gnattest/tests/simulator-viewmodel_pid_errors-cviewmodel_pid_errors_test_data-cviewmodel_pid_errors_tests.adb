--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with math.Vectors; use math.Vectors;
with math.Matrices; use math.Matrices;
with math.Angles; use Math.Angles;
with Simulator.Pid_Errors;
with Ada.Text_IO; use Ada.Text_IO;

package body Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors_Test_Data.CViewModel_Pid_Errors_Tests is


--  begin read only
   procedure Test_fGet_Pid_Errors (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Test_fGet_Pid_Errors_6a722c (Gnattest_T : in out Test_CViewModel_Pid_Errors) renames Test_fGet_Pid_Errors;
--  id:2.1/6a722c7100f04e64/fGet_Pid_Errors/1/0/
   procedure Test_fGet_Pid_Errors (Gnattest_T : in out Test_CViewModel_Pid_Errors) is
   --  simulator-viewmodel_pid_errors.ads:14:4:fGet_Pid_Errors
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
      pxWantedPosition : math.Vectors.CVector := math.Vectors.xCreate(fX => 16.7,
                                                                      fY => 1.9,
                                                                      fZ => -7.4);
      fwantedXRotation : TAngle := -7.2;
      fwantedYRotation : TAngle := 13.5;
      fwantedZRotation : TAngle := 0.9;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => pxWantedPosition,
                                                              xWantedOrientation => math.Matrices.xCreate_Rotation_Around_X_Axis(fwantedXRotation));
      Aunit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(PositionX)=pxWantedPosition.fGet_X,
                              Message   => "Simulator.ViewModel_Pid_Errors.fGet_Pid_Errors failed, faulty X pos Error");
      Aunit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(PositionY)=pxWantedPosition.fGet_Y,
                              Message   => "Simulator.ViewModel_Pid_Errors.fGet_Pid_Errors failed, faulty Y pos Error");
      Aunit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(PositionZ)=pxWantedPosition.fGet_Z,
                              Message   => "Simulator.ViewModel_Pid_Errors.fGet_Pid_Errors failed, faulty Z pos Error");

      Aunit.Assertions.Assert(Condition => abs(pxViewModel.fGet_Pid_Errors(RotationX)+float(fwantedXRotation))<0.01,
                              Message   => "Simulator.ViewModel_Pid_Errors.fGet_Pid_Errors failed, faulty X rot Error");

      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => pxWantedPosition,
                                                              xWantedOrientation => math.Matrices.xCreate_Rotation_Around_Y_Axis(fwantedYRotation));
      Aunit.Assertions.Assert(Condition => abs(pxViewModel.fGet_Pid_Errors(RotationY)+float(fwantedYRotation))<0.001,
                              Message   => "Simulator.ViewModel_Pid_Errors.fGet_Pid_Errors failed, faulty Y rot Error");

      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => pxWantedPosition,
                                                              xWantedOrientation => math.Matrices.xCreate_Rotation_Around_Z_Axis(fwantedZRotation));
      Aunit.Assertions.Assert(Condition => abs(pxViewModel.fGet_Pid_Errors(RotationZ)+float(fwantedZRotation))<0.001,
                              Message   => "Simulator.ViewModel_Pid_Errors.fGet_Pid_Errors failed, faulty Z rot Error");
--  begin read only
   end Test_fGet_Pid_Errors;
--  end read only


--  begin read only
   procedure Test_fGet_Maximum_Error (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Test_fGet_Maximum_Error_32e500 (Gnattest_T : in out Test_CViewModel_Pid_Errors) renames Test_fGet_Maximum_Error;
--  id:2.1/32e50043c584e655/fGet_Maximum_Error/1/0/
   procedure Test_fGet_Maximum_Error (Gnattest_T : in out Test_CViewModel_Pid_Errors) is
   --  simulator-viewmodel_pid_errors.ads:16:4:fGet_Maximum_Error
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.tMaximumPIDErrors(PositionX) := 15.2;
      pxViewModel.tMaximumPIDErrors(PositionY) := 3.2;
      pxViewModel.tMaximumPIDErrors(PositionZ) := 1.2;
      pxViewModel.tMaximumPIDErrors(RotationX) := -5.2;
      pxViewModel.tMaximumPIDErrors(RotationY) := -1.5;
      pxViewModel.tMaximumPIDErrors(RotationZ) := 12.0;
      AUnit.Assertions.Assert(pxViewModel.fGet_Maximum_Error(eErrorComponent => PositionX)=pxViewModel.tMaximumPIDErrors(PositionX),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Maximum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Maximum_Error(eErrorComponent => PositionY)=pxViewModel.tMaximumPIDErrors(PositionY),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Maximum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Maximum_Error(eErrorComponent => PositionZ)=pxViewModel.tMaximumPIDErrors(PositionZ),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Maximum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Maximum_Error(eErrorComponent => RotationX)=pxViewModel.tMaximumPIDErrors(RotationX),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Maximum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Maximum_Error(eErrorComponent => RotationY)=pxViewModel.tMaximumPIDErrors(RotationY),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Maximum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Maximum_Error(eErrorComponent => RotationZ)=pxViewModel.tMaximumPIDErrors(RotationZ),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Maximum_Error failed, faulty Value");

   end Test_fGet_Maximum_Error;
--  end read only


--  begin read only
   procedure Test_fGet_Minimum_Error (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Test_fGet_Minimum_Error_7e5a06 (Gnattest_T : in out Test_CViewModel_Pid_Errors) renames Test_fGet_Minimum_Error;
--  id:2.1/7e5a069f7dad7496/fGet_Minimum_Error/1/0/
   procedure Test_fGet_Minimum_Error (Gnattest_T : in out Test_CViewModel_Pid_Errors) is
   --  simulator-viewmodel_pid_errors.ads:18:4:fGet_Minimum_Error
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.tMinimumPIDErrors(PositionX) := 15.2;
      pxViewModel.tMinimumPIDErrors(PositionY) := 3.2;
      pxViewModel.tMinimumPIDErrors(PositionZ) := 1.2;
      pxViewModel.tMinimumPIDErrors(RotationX) := -5.2;
      pxViewModel.tMinimumPIDErrors(RotationY) := -1.5;
      pxViewModel.tMinimumPIDErrors(RotationZ) := 12.0;
      AUnit.Assertions.Assert(pxViewModel.fGet_Minimum_Error(eErrorComponent => PositionX)=pxViewModel.tMinimumPIDErrors(PositionX),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Minimum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Minimum_Error(eErrorComponent => PositionY)=pxViewModel.tMinimumPIDErrors(PositionY),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Minimum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Minimum_Error(eErrorComponent => PositionZ)=pxViewModel.tMinimumPIDErrors(PositionZ),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Minimum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Minimum_Error(eErrorComponent => RotationX)=pxViewModel.tMinimumPIDErrors(RotationX),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Minimum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Minimum_Error(eErrorComponent => RotationY)=pxViewModel.tMinimumPIDErrors(RotationY),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Minimum_Error failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Minimum_Error(eErrorComponent => RotationZ)=pxViewModel.tMinimumPIDErrors(RotationZ),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Minimum_Error failed, faulty Value");
--  begin read only
   end Test_fGet_Minimum_Error;
--  end read only


--  begin read only
   procedure Test_fGet_Min_Max_Error_Diff (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Test_fGet_Min_Max_Error_Diff_5f43c8 (Gnattest_T : in out Test_CViewModel_Pid_Errors) renames Test_fGet_Min_Max_Error_Diff;
--  id:2.1/5f43c85afa40b815/fGet_Min_Max_Error_Diff/1/0/
   procedure Test_fGet_Min_Max_Error_Diff (Gnattest_T : in out Test_CViewModel_Pid_Errors) is
   --  simulator-viewmodel_pid_errors.ads:20:4:fGet_Min_Max_Error_Diff
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);

      pxViewModel.tLastHighPIDErrors(PositionX) := 1.2;
      pxViewModel.tLastHighPIDErrors(PositionY) := 6.2;
      pxViewModel.tLastHighPIDErrors(PositionZ) := 3.2;
      pxViewModel.tLastHighPIDErrors(RotationX) := -9.2;
      pxViewModel.tLastHighPIDErrors(RotationY) := -0.5;
      pxViewModel.tLastHighPIDErrors(RotationZ) := 15.0;

      pxViewModel.tLastLowPIDErrors(PositionX) := 15.2;
      pxViewModel.tLastLowPIDErrors(PositionY) := 3.2;
      pxViewModel.tLastLowPIDErrors(PositionZ) := 1.2;
      pxViewModel.tLastLowPIDErrors(RotationX) := -5.2;
      pxViewModel.tLastLowPIDErrors(RotationY) := -1.5;
      pxViewModel.tLastLowPIDErrors(RotationZ) := 12.0;
      AUnit.Assertions.Assert(pxViewModel.fGet_Min_Max_Error_Diff(eErrorComponent => PositionX)=pxViewModel.tLastHighPIDErrors(PositionX)-pxViewModel.tLastLowPIDErrors(PositionX),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Min_Max_Error_Diff failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Min_Max_Error_Diff(eErrorComponent => PositionY)=pxViewModel.tLastHighPIDErrors(PositionY)-pxViewModel.tLastLowPIDErrors(PositionY),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Min_Max_Error_Diff failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Min_Max_Error_Diff(eErrorComponent => PositionZ)=pxViewModel.tLastHighPIDErrors(PositionZ)-pxViewModel.tLastLowPIDErrors(PositionZ),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Min_Max_Error_Diff failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Min_Max_Error_Diff(eErrorComponent => RotationX)=pxViewModel.tLastHighPIDErrors(RotationX)-pxViewModel.tLastLowPIDErrors(RotationX),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Min_Max_Error_Diff failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Min_Max_Error_Diff(eErrorComponent => RotationY)=pxViewModel.tLastHighPIDErrors(RotationY)-pxViewModel.tLastLowPIDErrors(RotationY),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Min_Max_Error_Diff failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_Min_Max_Error_Diff(eErrorComponent => RotationZ)=pxViewModel.tLastHighPIDErrors(RotationZ)-pxViewModel.tLastLowPIDErrors(RotationZ),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_Min_Max_Error_Diff failed, faulty Value");

--  begin read only
   end Test_fGet_Min_Max_Error_Diff;
--  end read only


--  begin read only
   procedure Test_fGet_OscilationTime (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Test_fGet_OscilationTime_cceda5 (Gnattest_T : in out Test_CViewModel_Pid_Errors) renames Test_fGet_OscilationTime;
--  id:2.1/cceda5ea56a81893/fGet_OscilationTime/1/0/
   procedure Test_fGet_OscilationTime (Gnattest_T : in out Test_CViewModel_Pid_Errors) is
   --  simulator-viewmodel_pid_errors.ads:22:4:fGet_OscilationTime
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.fOscTimes(PositionX) := 14.32;
      pxViewModel.fOscTimes(PositionY) := 4.32;
      pxViewModel.fOscTimes(PositionZ) := 1.32;
      pxViewModel.fOscTimes(RotationX) := 4.2;
      pxViewModel.fOscTimes(RotationY) := 1.3;
      pxViewModel.fOscTimes(RotationZ) := 1.2;
      AUnit.Assertions.Assert(pxViewModel.fGet_OscilationTime(eErrorComponent => PositionX)=pxViewModel.fOscTimes(PositionX),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_OscilationTime failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_OscilationTime(eErrorComponent => PositionY)=pxViewModel.fOscTimes(PositionY),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_OscilationTime failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_OscilationTime(eErrorComponent => PositionZ)=pxViewModel.fOscTimes(PositionZ),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_OscilationTime failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_OscilationTime(eErrorComponent => RotationX)=pxViewModel.fOscTimes(RotationX),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_OscilationTime failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_OscilationTime(eErrorComponent => RotationY)=pxViewModel.fOscTimes(RotationY),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_OscilationTime failed, faulty Value");
      AUnit.Assertions.Assert(pxViewModel.fGet_OscilationTime(eErrorComponent => RotationZ)=pxViewModel.fOscTimes(RotationZ),
                              Message => "Simulator.ViewModel_Pid_Errors.fGet_OscilationTime failed, faulty Value");

--  begin read only
   end Test_fGet_OscilationTime;
--  end read only


--  begin read only
   procedure Test_Update_Min_Max_Error_Buffers (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Test_Update_Min_Max_Error_Buffers_7ae9d9 (Gnattest_T : in out Test_CViewModel_Pid_Errors) renames Test_Update_Min_Max_Error_Buffers;
--  id:2.1/7ae9d9a200a2e067/Update_Min_Max_Error_Buffers/1/0/
   procedure Test_Update_Min_Max_Error_Buffers (Gnattest_T : in out Test_CViewModel_Pid_Errors) is
   --  simulator-viewmodel_pid_errors.ads:26:4:Update_Min_Max_Error_Buffers
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
--      pxPidErrors : Simulator.Pid_Errors.pCpidErrors;
      pxPositionVector : math.Vectors.CVector := math.Vectors.xCreate(6.0,5.0,4.0);
      pxOrientationMatrix : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(3.2);
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);

      --
      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => pxPositionVector,
                                                              xWantedOrientation => pxOrientationMatrix);
      pxViewModel.Update_Min_Max_Error_Buffers;
--      Ada.Text_IO.Put_Line("pxViewModelError Buffer x coord:" & pxViewModel.tLastHighPIDErrors(PositionX)'img & " " & pxViewModel.tLastLowPIDErrors(PositionX)'img);

      --
      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => pxPositionVector*2.0,
                                                              xWantedOrientation => pxOrientationMatrix);
      pxViewModel.Update_Min_Max_Error_Buffers;
--      Ada.Text_IO.Put_Line("pxViewModelError Buffer x coord:" & pxViewModel.tLastHighPIDErrors(PositionX)'img & " " & pxViewModel.tLastLowPIDErrors(PositionX)'img);

      --
      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => -pxPositionVector,
                                                              xWantedOrientation => pxOrientationMatrix);
      pxViewModel.Update_Min_Max_Error_Buffers;

      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => pxPositionVector*0.0,
                                                              xWantedOrientation => pxOrientationMatrix);
      pxViewModel.Update_Min_Max_Error_Buffers;
--      Ada.Text_IO.Put_Line("pxViewModelError Buffer x coord:" & pxViewModel.tLastHighPIDErrors(PositionX)'img & " " & pxViewModel.tLastLowPIDErrors(PositionX)'img);
      AUnit.Assertions.Assert(Condition => pxViewModel.tLastHighPIDErrors(PositionX)-pxViewModel.tLastLowPIDErrors(PositionX)=3.0*6.0,
                              Message   => "Simulator.ViewModel_Pid_Errors.fGet_Min_Max_Error_Diff failed, Faulty x errors");
--  begin read only
   end Test_Update_Min_Max_Error_Buffers;
--  end read only


--  begin read only
   procedure Test_Update_Delta_Time (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Test_Update_Delta_Time_e463ab (Gnattest_T : in out Test_CViewModel_Pid_Errors) renames Test_Update_Delta_Time;
--  id:2.1/e463abce37b06b2a/Update_Delta_Time/1/0/
   procedure Test_Update_Delta_Time (Gnattest_T : in out Test_CViewModel_Pid_Errors) is
   --  simulator-viewmodel_pid_errors.ads:28:4:Update_Delta_Time
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.Update_Delta_Time;
      pxViewModel.Update_Delta_Time;
      pxViewModel.Update_Delta_Time;
      AUnit.Assertions.Assert(Condition => pxViewModel.fCurrentOscTimeCounter(PositionX)=0.03,
                              Message   => "Simulator.ViewModel_Pid_Errors.Update_Delta_Time failed, faulty X Value");

--  begin read only
   end Test_Update_Delta_Time;
--  end read only


--  begin read only
   procedure Test_Reset_Min_Max_Error_Buffers (Gnattest_T : in out Test_CViewModel_Pid_Errors);
   procedure Test_Reset_Min_Max_Error_Buffers_367ec6 (Gnattest_T : in out Test_CViewModel_Pid_Errors) renames Test_Reset_Min_Max_Error_Buffers;
--  id:2.1/367ec6c6ca8b83c8/Reset_Min_Max_Error_Buffers/1/0/
   procedure Test_Reset_Min_Max_Error_Buffers (Gnattest_T : in out Test_CViewModel_Pid_Errors) is
   --  simulator-viewmodel_pid_errors.ads:30:4:Reset_Min_Max_Error_Buffers
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.tMaximumPIDErrors(PositionX):=7.1;
      pxViewModel.tMinimumPIDErrors(PositionX):=3.2;
      Aunit.Assertions.Assert(Condition => pxViewModel.tMaximumPIDErrors(PositionX)=7.1,
                              Message   => "Simulator.ViewModel_Pid_Errors.Reset_Min_Max_Error_Buffers failed, faulty x max value should be 7.1");
      Aunit.Assertions.Assert(Condition => pxViewModel.tMinimumPIDErrors(PositionX)=3.2,
                              Message   => "Simulator.ViewModel_Pid_Errors.Reset_Min_Max_Error_Buffers failed, faulty x min value should be 3.2");
      pxViewModel.Reset_Min_Max_Error_Buffers;
      Aunit.Assertions.Assert(Condition => pxViewModel.tMaximumPIDErrors(PositionX)=0.0,
                              Message   => "Simulator.ViewModel_Pid_Errors.Reset_Min_Max_Error_Buffers failed, faulty x max value should be 0.0");
      Aunit.Assertions.Assert(Condition => pxViewModel.tMinimumPIDErrors(PositionX)=0.0,
                              Message   => "Simulator.ViewModel_Pid_Errors.Reset_Min_Max_Error_Buffers failed, faulty x min value should be 0.0");

--  begin read only
   end Test_Reset_Min_Max_Error_Buffers;
--  end read only

end Simulator.ViewModel_Pid_Errors.CViewModel_Pid_Errors_Test_Data.CViewModel_Pid_Errors_Tests;
