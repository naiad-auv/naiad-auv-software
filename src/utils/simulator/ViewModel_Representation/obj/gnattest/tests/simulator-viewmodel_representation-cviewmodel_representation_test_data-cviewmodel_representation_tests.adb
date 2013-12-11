--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.ViewModel_Representation.CViewModel_Representation_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Matrices; use Math.Matrices;
with math.Vectors; use Math.Vectors;
with Simulator.Model; use Simulator.Model;
with Ada.Text_IO;

package body Simulator.ViewModel_Representation.CViewModel_Representation_Test_Data.CViewModel_Representation_Tests is


--  begin read only
   procedure Test_xGet_Submarine_Current_Position (Gnattest_T : in out Test_CViewModel_Representation);
   procedure Test_xGet_Submarine_Current_Position_0f045e (Gnattest_T : in out Test_CViewModel_Representation) renames Test_xGet_Submarine_Current_Position;
--  id:2.1/0f045eb0411e51f9/xGet_Submarine_Current_Position/1/0/
   procedure Test_xGet_Submarine_Current_Position (Gnattest_T : in out Test_CViewModel_Representation) is
   --  simulator-viewmodel_representation.ads:35:4:xGet_Submarine_Current_Position
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Representation;
      pxModel : Simulator.Model.pCModel;
      xCurrentPosition : Math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,0.0);
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);

      --pxViewModel.xGet_Submarine_Current_Position;
      AUnit.Assertions.Assert(Condition => pxViewModel.xGet_Submarine_Current_Position=xCurrentPosition,
                              Message   => "Simulator.ViewModel_Representation.xGet_Submarine_Current_Position failed, position was not 0");


--  begin read only
   end Test_xGet_Submarine_Current_Position;
--  end read only


--  begin read only
   procedure Test_xGet_Submarine_Wanted_Position (Gnattest_T : in out Test_CViewModel_Representation);
   procedure Test_xGet_Submarine_Wanted_Position_db19f2 (Gnattest_T : in out Test_CViewModel_Representation) renames Test_xGet_Submarine_Wanted_Position;
--  id:2.1/db19f2bb04913f27/xGet_Submarine_Wanted_Position/1/0/
   procedure Test_xGet_Submarine_Wanted_Position (Gnattest_T : in out Test_CViewModel_Representation) is
   --  simulator-viewmodel_representation.ads:36:4:xGet_Submarine_Wanted_Position
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Representation;
      pxModel : Simulator.Model.pCModel;
      xWantedPosition : Math.Vectors.CVector := math.Vectors.xCreate(3.1,1.5,2.3);
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => xWantedPosition,
                                                              xWantedOrientation => math.Matrices.xCreate_Identity);
      AUnit.Assertions.Assert(Condition => pxViewModel.xGet_Submarine_Wanted_Position=xWantedPosition,
                              Message   => "Simulator.ViewModel_Representation.xGet_Submarine_Wanted_Position failed, position was not 0");


--  begin read only
   end Test_xGet_Submarine_Wanted_Position;
--  end read only


--  begin read only
   procedure Test_xGet_Submarine_Current_Orientation (Gnattest_T : in out Test_CViewModel_Representation);
   procedure Test_xGet_Submarine_Current_Orientation_73c54b (Gnattest_T : in out Test_CViewModel_Representation) renames Test_xGet_Submarine_Current_Orientation;
--  id:2.1/73c54b0f1175d1ff/xGet_Submarine_Current_Orientation/1/0/
   procedure Test_xGet_Submarine_Current_Orientation (Gnattest_T : in out Test_CViewModel_Representation) is
   --  simulator-viewmodel_representation.ads:38:4:xGet_Submarine_Current_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Representation;
      pxModel : Simulator.Model.pCModel;
      xWantedPosition : Math.Vectors.CVector := math.Vectors.xCreate(3.1,1.5,2.3);
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => xWantedPosition,
                                                              xWantedOrientation => math.Matrices.xCreate_Identity);
      AUnit.Assertions.Assert(Condition => pxViewModel.xGet_Submarine_Current_Orientation=math.Matrices.xCreate_Identity,
                              Message   => "Simulator.ViewModel_Representation.xGet_Submarine_Current_Orientation failed, position was not 0");

--  begin read only
   end Test_xGet_Submarine_Current_Orientation;
--  end read only


--  begin read only
   procedure Test_xGet_Submarine_Wanted_Orientation (Gnattest_T : in out Test_CViewModel_Representation);
   procedure Test_xGet_Submarine_Wanted_Orientation_5ce8e5 (Gnattest_T : in out Test_CViewModel_Representation) renames Test_xGet_Submarine_Wanted_Orientation;
--  id:2.1/5ce8e5d479e4fc20/xGet_Submarine_Wanted_Orientation/1/0/
   procedure Test_xGet_Submarine_Wanted_Orientation (Gnattest_T : in out Test_CViewModel_Representation) is
   --  simulator-viewmodel_representation.ads:39:4:xGet_Submarine_Wanted_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Representation;
      pxModel : Simulator.Model.pCModel;
      xWantedPosition : Math.Vectors.CVector := math.Vectors.xCreate(3.1,1.5,2.3);
      xWantedOrientation : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_Y_Axis(23.1);
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => xWantedPosition,
                                                              xWantedOrientation => xWantedOrientation);
      AUnit.Assertions.Assert(Condition => pxViewModel.xGet_Submarine_Wanted_Orientation=xWantedOrientation,
                              Message   => "Simulator.ViewModel_Representation.xGet_Submarine_Wanted_Orientation failed, position was not 0");

--  begin read only
   end Test_xGet_Submarine_Wanted_Orientation;
--  end read only


--  begin read only
   procedure Test_fGet_Pid_Errors (Gnattest_T : in out Test_CViewModel_Representation);
   procedure Test_fGet_Pid_Errors_7cbe4b (Gnattest_T : in out Test_CViewModel_Representation) renames Test_fGet_Pid_Errors;
--  id:2.1/7cbe4b894680a207/fGet_Pid_Errors/1/0/
   procedure Test_fGet_Pid_Errors (Gnattest_T : in out Test_CViewModel_Representation) is
   --  simulator-viewmodel_representation.ads:41:4:fGet_Pid_Errors
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Representation;
      pxModel : Simulator.Model.pCModel;
      xWantedPosition : Math.Vectors.CVector := math.Vectors.xCreate(3.1,1.5,2.3);
      xWantedOrientation : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_Y_Axis(23.1);
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      pxViewModel.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => xWantedPosition,
                                                              xWantedOrientation => xWantedOrientation);
      Ada.Text_IO.Put_Line("RotY Error is: " & pxViewModel.fGet_Pid_Errors(eErrorComponent => RotationY)'img & " expected: 23.1");
      --AUnit.Assertions.Assert(abs(pxViewModel.fGet_Pid_Errors(eErrorComponent => RotationY) + 23.1 )<0.001,
      --                        Message => "Simulator.ViewModel_Representation.fGet_Pid_Errors failed, faulty RotY value");
--  begin read only
   end Test_fGet_Pid_Errors;
--  end read only


--  begin read only
   procedure Test_Restart (Gnattest_T : in out Test_CViewModel_Representation);
   procedure Test_Restart_ec643c (Gnattest_T : in out Test_CViewModel_Representation) renames Test_Restart;
--  id:2.1/ec643ce8f9adab28/Restart/1/0/
   procedure Test_Restart (Gnattest_T : in out Test_CViewModel_Representation) is
   --  simulator-viewmodel_representation.ads:43:4:Restart
--  end read only

      pxModel : simulator.Model.pCModel;
      pxViewModel : pCViewModel_Representation;
      xComponentScaling : simulator.Model.TPIDComponentScalings;
      xWantedPosition : math.Vectors.CVector := math.Vectors.xCreate(fX => 3.5,
                                                                     fY => 6.2,
                                                                     fZ => 7.1);
      xWantedOrientation : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(tfAngleInDegrees => 12.1)*math.Matrices.xCreate_Rotation_Around_Y_Axis(tfAngleInDegrees => 17.3)*math.Matrices.xCreate_Rotation_Around_Z_Axis(tfAngleInDegrees => 5.1);


      fErrorPosX : float;
      fErrorPosY : float;
      fErrorPosZ : float;
      fErrorRotX : float;
      fErrorRotY : float;
      fErrorRotZ : float;

   begin
      xComponentScaling.fProportionalScale:=1.0;
      xComponentScaling.fIntegralScale:=1.0;
      xComponentScaling.fDerivativeScale:=1.0;
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);

      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.PositionX);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.PositionY);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.PositionZ);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.RotationX);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.RotationY);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.RotationZ);
      pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => xWantedPosition,
                                                  xWantedOrientation => xWantedOrientation);

      fErrorPosX := pxViewmodel.fGet_Pid_Errors(eErrorComponent => PositionX);
      fErrorPosY := pxViewmodel.fGet_Pid_Errors(eErrorComponent => PositionY);
      fErrorPosZ := pxViewmodel.fGet_Pid_Errors(eErrorComponent => PositionZ);
      fErrorRotX := pxViewmodel.fGet_Pid_Errors(eErrorComponent => RotationX);
      fErrorRotY := pxViewmodel.fGet_Pid_Errors(eErrorComponent => RotationY);
      fErrorRotZ := pxViewmodel.fGet_Pid_Errors(eErrorComponent => RotationZ);


      pxViewModel.pxModel.Update_Model(fDeltaTime => 0.3);
      pxViewModel.pxModel.Update_Model(fDeltaTime => 0.3);
      pxViewModel.pxModel.Update_Model(fDeltaTime => 0.3);

      pxViewModel.Restart;

      pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => xWantedPosition,
                                                  xWantedOrientation => xWantedOrientation);

      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => PositionX) - fErrorPosX = 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty PosX");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => PositionY) - fErrorPosY = 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty PosY");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => PositionZ) - fErrorPosZ = 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty PosZ");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => RotationX) - fErrorRotX = 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty RotX");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => RotationY) - fErrorRotY = 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty RotY");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => RotationZ) - fErrorRotZ = 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty RotZ");



--  begin read only
   end Test_Restart;
--  end read only


--  begin read only
   procedure Test_Update (Gnattest_T : in out Test_CViewModel_Representation);
   procedure Test_Update_05249c (Gnattest_T : in out Test_CViewModel_Representation) renames Test_Update;
--  id:2.1/05249ca0a56f4229/Update/1/0/
   procedure Test_Update (Gnattest_T : in out Test_CViewModel_Representation) is
   --  simulator-viewmodel_representation.ads:44:4:Update
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel;
      pxViewModel : pCViewModel_Representation;
      xComponentScaling : simulator.Model.TPIDComponentScalings;
      xWantedPosition : math.Vectors.CVector := math.Vectors.xCreate(fX => 3.5,
                                                                     fY => 6.2,
                                                                     fZ => 7.1);
      xWantedOrientation : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(tfAngleInDegrees => 12.1)*math.Matrices.xCreate_Rotation_Around_Y_Axis(tfAngleInDegrees => 17.3)*math.Matrices.xCreate_Rotation_Around_Z_Axis(tfAngleInDegrees => 5.1);


      fErrorPosX : float;
      fErrorPosY : float;
      fErrorPosZ : float;
      fErrorRotX : float;
      fErrorRotY : float;
      fErrorRotZ : float;

   begin
      xComponentScaling.fProportionalScale:=1.0;
      xComponentScaling.fIntegralScale:=1.0;
      xComponentScaling.fDerivativeScale:=1.0;
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);

      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.PositionX);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.PositionY);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.PositionZ);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.RotationX);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.RotationY);
      pxModel.Set_Pid_Scaling(xComponentScaling => xComponentScaling,
                              eComponentToScale => simulator.Model.RotationZ);
      pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => xWantedPosition,
                                                  xWantedOrientation => xWantedOrientation);

      fErrorPosX := pxViewmodel.fGet_Pid_Errors(eErrorComponent => PositionX);
      fErrorPosY := pxViewmodel.fGet_Pid_Errors(eErrorComponent => PositionY);
      fErrorPosZ := pxViewmodel.fGet_Pid_Errors(eErrorComponent => PositionZ);
      fErrorRotX := pxViewmodel.fGet_Pid_Errors(eErrorComponent => RotationX);
      fErrorRotY := pxViewmodel.fGet_Pid_Errors(eErrorComponent => RotationY);
      fErrorRotZ := pxViewmodel.fGet_Pid_Errors(eErrorComponent => RotationZ);


      pxViewModel.pxModel.Update_Model(fDeltaTime => 0.3);
      pxViewModel.pxModel.Update_Model(fDeltaTime => 0.3);
      pxViewModel.pxModel.Update_Model(fDeltaTime => 0.3);

      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => PositionX) - fErrorPosX /= 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty PosX");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => PositionY) - fErrorPosY /= 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty PosY");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => PositionZ) - fErrorPosZ /= 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty PosZ");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => RotationX) - fErrorRotX /= 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty RotX");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => RotationY) - fErrorRotY /= 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty RotY");
      AUnit.Assertions.Assert(Condition => pxViewModel.fGet_Pid_Errors(eErrorComponent => RotationZ) - fErrorRotZ /= 0.0,
                              Message   => "Simulator.ViewModel_Representation.Update failed, faulty RotZ");

--  begin read only
   end Test_Update;
--  end read only

end Simulator.ViewModel_Representation.CViewModel_Representation_Test_Data.CViewModel_Representation_Tests;
