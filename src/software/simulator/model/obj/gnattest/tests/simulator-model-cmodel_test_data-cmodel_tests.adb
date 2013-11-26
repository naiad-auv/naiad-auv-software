--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Model.CModel_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with math.Vectors; use math.Vectors;
with math.Matrices; use Math.Matrices;
with Navigation.Dispatcher; use Navigation.Dispatcher;
with ada.Text_IO; use ada.Text_IO;
with Simulator.submarine;use simulator.submarine;
with Math.Angles; use math.Angles;
package body Simulator.Model.CModel_Test_Data.CModel_Tests is
type TArrayOfPidScalings is array (PositionX .. RotationZ) of simulator.Model.TPIDComponentScalings;


--  begin read only
   procedure Test_Update_Model (Gnattest_T : in out Test_CModel);
   procedure Test_Update_Model_3461c1 (Gnattest_T : in out Test_CModel) renames Test_Update_Model;
--  id:2.1/3461c1011aad0ee2/Update_Model/1/0/
   procedure Test_Update_Model (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:22:4:Update_Model
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel;
      xPositionVector : math.Vectors.CVector := math.Vectors.xCreate(1.7,-3.2,1.5);
      txPidScalings : TArrayOfPidScalings;
   begin
      pxModel := simulator.Model.pxCreate(4);

      pxModel.pxSubmarine.Set_Position_Vector(xPositionVector => xPositionVector);
      -- Put_Line("Before Setting Updating X:" & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_X'img & " Y: " & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Y'img & " Z: " & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Z'img);

      pxModel.Update_Model(fDeltaTime => 1.0);
      pxModel.Update_Model(fDeltaTime => 1.0);
      aunit.Assertions.Assert(Condition => pxModel.xGet_Current_Submarine_Positional_Vector.fGet_X = xPositionVector.fGet_X,
                              Message   => "Simulator.Model.Update_Model failed, Faulty X Value, should be equal");
      aunit.Assertions.Assert(Condition => pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Y = xPositionVector.fGet_Y,
                              Message   => "Simulator.Model.Update_Model failed, Faulty Y Value, should be equal");
      -- Put_Line("Before Setting txPidScalings X:" & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_X'img & " Y: " & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Y'img & " Z: " & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Z'img);

      txPidScalings(PositionX) :=(0.1,0.2,0.5);
      txPidScalings(PositionY) :=(0.3,0.6,0.7);
      txPidScalings(PositionZ) :=(0.8,0.9,1.0);
      txPidScalings(RotationX) :=(1.7,1.8,1.9);
      txPidScalings(RotationY) :=(2.0,2.1,2.2);
      txPidScalings(RotationZ) :=(2.3,2.4,2.5);

      for i in simulator.Model.EMotionComponent(PositionX) .. simulator.Model.EMotionComponent(RotationZ) loop
         pxModel.Set_Pid_Scaling(xComponentScaling => txPidScalings(i),
                                       eComponentToScale => i);
      end loop;
      pxModel.pxSubmarine.Set_Position_Vector(xPositionVector => xPositionVector);
      pxModel.Update_Model(fDeltaTime => 1.0);
      pxModel.Update_Model(fDeltaTime => 1.0);
      -- Put_Line("After Updating with pids set X:" & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_X'img & " Y: " & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Y'img & " Z: " & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Z'img);

      aunit.Assertions.Assert(Condition => pxModel.xGet_Current_Submarine_Positional_Vector.fGet_X /= xPositionVector.fGet_X,
                              Message   => "Simulator.Model.Update_Model failed, Faulty X Value, should be different");
      aunit.Assertions.Assert(Condition => pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Y /= xPositionVector.fGet_Y,
                              Message   => "Simulator.Model.Update_Model failed, Faulty Y Value, should be different");


--  begin read only
   end Test_Update_Model;
--  end read only


--  begin read only
   procedure Test_xGet_Current_Submarine_Positional_Vector (Gnattest_T : in out Test_CModel);
   procedure Test_xGet_Current_Submarine_Positional_Vector_288392 (Gnattest_T : in out Test_CModel) renames Test_xGet_Current_Submarine_Positional_Vector;
--  id:2.1/2883922ac7ea4723/xGet_Current_Submarine_Positional_Vector/1/0/
   procedure Test_xGet_Current_Submarine_Positional_Vector (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:24:4:xGet_Current_Submarine_Positional_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel := simulator.Model.pxCreate(4);
      xPositionVector : math.Vectors.CVector := math.Vectors.xCreate(1.7,-3.2,1.5);
   begin
      pxModel.pxSubmarine.Set_Position_Vector(xPositionVector => xPositionVector);
      aunit.Assertions.Assert(Condition => pxModel.xGet_Current_Submarine_Positional_Vector = xPositionVector,
                              Message   => "Simulator.Model.xGetCurrent_Submarine_Positional_Vector failed, Faulty Value");


--  begin read only
   end Test_xGet_Current_Submarine_Positional_Vector;
--  end read only


--  begin read only
   procedure Test_xGet_Current_Submarine_Orientation_Matrix (Gnattest_T : in out Test_CModel);
   procedure Test_xGet_Current_Submarine_Orientation_Matrix_926383 (Gnattest_T : in out Test_CModel) renames Test_xGet_Current_Submarine_Orientation_Matrix;
--  id:2.1/926383e092d39bc6/xGet_Current_Submarine_Orientation_Matrix/1/0/
   procedure Test_xGet_Current_Submarine_Orientation_Matrix (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:25:4:xGet_Current_Submarine_Orientation_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel := simulator.Model.pxCreate(4);
      xOrientationMatrix : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(14.7)* math.Matrices.xCreate_Rotation_Around_Y_Axis(14.3);
   begin
      pxModel.pxSubmarine.Set_Orientation_Matrix(xOrientationMatrix => xOrientationMatrix);
      aunit.Assertions.Assert(Condition => pxModel.xGet_Current_Submarine_Orientation_Matrix = xOrientationMatrix,
                              Message   => "Simulator.Model.xGetCurrent_Submarine_Orientation_Matrix failed, Faulty Value");

--  begin read only
   end Test_xGet_Current_Submarine_Orientation_Matrix;
--  end read only


--  begin read only
   procedure Test_xGet_Wanted_Submarine_Positional_Vector (Gnattest_T : in out Test_CModel);
   procedure Test_xGet_Wanted_Submarine_Positional_Vector_58e8e7 (Gnattest_T : in out Test_CModel) renames Test_xGet_Wanted_Submarine_Positional_Vector;
--  id:2.1/58e8e77cdf435c5e/xGet_Wanted_Submarine_Positional_Vector/1/0/
   procedure Test_xGet_Wanted_Submarine_Positional_Vector (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:26:4:xGet_Wanted_Submarine_Positional_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxModel : simulator.Model.pCModel := simulator.Model.pxCreate(4);
      xPositionVector : math.Vectors.CVector := math.Vectors.xCreate(1.7,-3.2,1.5);
   begin
      pxModel.pxMotionControlWrapper.Update_Wanted_Position(xWantedPosition    => xPositionVector,
                                                            xWantedOrientation => math.Matrices.xCreate_Identity);
      aunit.Assertions.Assert(Condition => pxModel.xGet_Wanted_Submarine_Positional_Vector = xPositionVector,
                              Message   => "Simulator.Model.xGetWanted_Submarine_Positional_Vector failed, Faulty Value");

--  begin read only
   end Test_xGet_Wanted_Submarine_Positional_Vector;
--  end read only


--  begin read only
   procedure Test_xGet_Wanted_Submarine_Orientation_Matrix (Gnattest_T : in out Test_CModel);
   procedure Test_xGet_Wanted_Submarine_Orientation_Matrix_490d57 (Gnattest_T : in out Test_CModel) renames Test_xGet_Wanted_Submarine_Orientation_Matrix;
--  id:2.1/490d57e2e9237dd0/xGet_Wanted_Submarine_Orientation_Matrix/1/0/
   procedure Test_xGet_Wanted_Submarine_Orientation_Matrix (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:27:4:xGet_Wanted_Submarine_Orientation_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxModel : simulator.Model.pCModel := simulator.Model.pxCreate(4);
      xPositionVector : math.Vectors.CVector := math.Vectors.xCreate(1.7,-3.2,1.5);
      xOrientationMatrix : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(31.7)*math.Matrices.xCreate_Rotation_Around_Y_Axis(13.9);
   begin
      pxModel.pxMotionControlWrapper.Update_Wanted_Position(xWantedPosition    => xPositionVector,
                                                            xWantedOrientation => xOrientationMatrix);
      aunit.Assertions.Assert(Condition => pxModel.xGet_Wanted_Submarine_Orientation_Matrix = xOrientationMatrix,
                              Message   => "Simulator.Model.xGetWanted_Submarine_Orientation_Matrix failed, Faulty Value");
--  begin read only
   end Test_xGet_Wanted_Submarine_Orientation_Matrix;
--  end read only


--  begin read only
   procedure Test_xGet_Current_Submarine_Velocity_Vector (Gnattest_T : in out Test_CModel);
   procedure Test_xGet_Current_Submarine_Velocity_Vector_a272c0 (Gnattest_T : in out Test_CModel) renames Test_xGet_Current_Submarine_Velocity_Vector;
--  id:2.1/a272c0636309be16/xGet_Current_Submarine_Velocity_Vector/1/0/
   procedure Test_xGet_Current_Submarine_Velocity_Vector (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:28:4:xGet_Current_Submarine_Velocity_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : pCModel;
      xVelocityVector : math.Vectors.CVector := math.Vectors.xCreate(fX => 16.3,
                                                                     fY => 0.1,
                                                                     fZ => -7.9);
   begin
      pxModel := pxCreate(4);
      pxModel.pxSubmarine.Set_Velocity_Vector(xVelocityVector);
      Aunit.Assertions.Assert(Condition => xVelocityVector=pxModel.xGet_Current_Submarine_Velocity_Vector,
                              Message   => "Simulator.Model.xGet_Current_Submarine_Velocity_Vector failed, Faulty value");
--  begin read only
   end Test_xGet_Current_Submarine_Velocity_Vector;
--  end read only


--  begin read only
   procedure Test_fGet_Motor_Force (Gnattest_T : in out Test_CModel);
   procedure Test_fGet_Motor_Force_6e127f (Gnattest_T : in out Test_CModel) renames Test_fGet_Motor_Force;
--  id:2.1/6e127fd80c359bc1/fGet_Motor_Force/1/0/
   procedure Test_fGet_Motor_Force (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:29:4:fGet_Motor_Force
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel := simulator.Model.pxCreate(4);
      xPositionVector : math.Vectors.CVector := math.Vectors.xCreate(1.7,-3.2,1.5);
      xOrientationMatrix : math.Matrices.CMatrix := math.Matrices.xCreate_Identity;
   begin
      pxModel.pxMotionControlWrapper.Update_Wanted_Position(xWantedPosition    => xPositionVector,
                                                            xWantedOrientation => xOrientationMatrix);
      Aunit.Assertions.Assert(Condition => pxModel.fGet_Motor_Force(iIndexMotor => 1)=pxModel.pxSubmarine.xGet_Motor_Values(1),
                              Message   => "Simulator.Model.fGet_Motor_Force failed, ");
      aunit.Assertions.Assert(Condition => pxModel.xGet_Wanted_Submarine_Orientation_Matrix = xOrientationMatrix,
                              Message   => "Simulator.Model.xGetWanted_Submarine_Orientation_Matrix failed, Faulty Value");

--  begin read only
   end Test_fGet_Motor_Force;
--  end read only


--  begin read only
   procedure Test_Set_Wanted_Position_And_Orientation (Gnattest_T : in out Test_CModel);
   procedure Test_Set_Wanted_Position_And_Orientation_d82248 (Gnattest_T : in out Test_CModel) renames Test_Set_Wanted_Position_And_Orientation;
--  id:2.1/d822485dc546686b/Set_Wanted_Position_And_Orientation/1/0/
   procedure Test_Set_Wanted_Position_And_Orientation (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:31:4:Set_Wanted_Position_And_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : pCModel;
      xWantedPosition : math.Vectors.CVector := math.Vectors.xCreate(fX => 15.2,
                                                                     fY => 1.9,
                                                                     fZ => -17.2);
      xWantedOrientation: math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(-18.2)*math.Matrices.xCreate_Rotation_Around_Y_Axis(19.2)*math.Matrices.xCreate_Rotation_Around_Z_Axis(31.4);
   begin
      pxModel := pxCreate(4);
      pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    =>xWantedPosition,
                                                  xWantedOrientation => xWantedOrientation);
      Aunit.Assertions.Assert(Condition => pxModel.xGet_Wanted_Submarine_Positional_Vector=xWantedPosition,
                              Message   => "Simulator.Model.Set_Wanted_Position_And_Orientation failed, Faulty position value");
      Aunit.Assertions.Assert(Condition => pxModel.xGet_Wanted_Submarine_Orientation_Matrix=xWantedOrientation,
                              Message   => "Simulator.Model.Set_Wanted_Position_And_Orientation failed, Faulty Orientation");

--  begin read only
   end Test_Set_Wanted_Position_And_Orientation;
--  end read only


--  begin read only
   procedure Test_Set_Pid_Scaling (Gnattest_T : in out Test_CModel);
   procedure Test_Set_Pid_Scaling_ecf840 (Gnattest_T : in out Test_CModel) renames Test_Set_Pid_Scaling;
--  id:2.1/ecf840ce7f537f92/Set_Pid_Scaling/1/0/
   procedure Test_Set_Pid_Scaling (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:33:4:Set_Pid_Scaling
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel;
      xPositionVector : math.Vectors.CVector := math.Vectors.xCreate(1.7,-3.2,1.5);
      txPidScalings : TArrayOfPidScalings;
   begin
      pxModel := simulator.Model.pxCreate(4);

      txPidScalings(PositionX) :=(0.1,0.2,0.5);
      txPidScalings(PositionY) :=(0.3,0.6,0.7);
      txPidScalings(PositionZ) :=(0.8,0.9,1.0);
      txPidScalings(RotationX) :=(1.7,1.8,1.9);
      txPidScalings(RotationY) :=(2.0,2.1,2.2);
      txPidScalings(RotationZ) :=(2.3,2.4,2.5);

      for i in simulator.Model.EMotionComponent(PositionX) .. simulator.Model.EMotionComponent(RotationZ) loop
         pxModel.Set_Pid_Scaling(xComponentScaling => txPidScalings(i),
                                       eComponentToScale => i);
      end loop;

      pxModel.pxSubmarine.Set_Position_Vector(xPositionVector => xPositionVector);

--  begin read only
   end Test_Set_Pid_Scaling;
--  end read only


--  begin read only
   procedure Test_Restart (Gnattest_T : in out Test_CModel);
   procedure Test_Restart_3f83e6 (Gnattest_T : in out Test_CModel) renames Test_Restart;
--  id:2.1/3f83e6d22c8c8847/Restart/1/0/
   procedure Test_Restart (Gnattest_T : in out Test_CModel) is
   --  simulator-model.ads:34:4:Restart
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel := simulator.Model.pxCreate(4);
      pxSubmarine : simulator.submarine.pCSubmarine;
      --pxDispatcher : navigation.Dispatcher.pCDispatcher;
      txPidScalings : TArrayOfPidScalings;
      xPositionVector : math.Vectors.CVector := math.Vectors.xCreate(1.7,-3.2,1.5);

   begin
      pxModel := simulator.Model.pxCreate(4);

      txPidScalings(PositionX) :=(0.1,0.2,0.5);
      txPidScalings(PositionY) :=(0.3,0.6,0.7);
      txPidScalings(PositionZ) :=(0.8,0.9,1.0);
      txPidScalings(RotationX) :=(1.7,1.8,1.9);
      txPidScalings(RotationY) :=(2.0,2.1,2.2);
      txPidScalings(RotationZ) :=(2.3,2.4,2.5);

      for i in simulator.Model.EMotionComponent(PositionX) .. simulator.Model.EMotionComponent(RotationZ) loop
         pxModel.Set_Pid_Scaling(xComponentScaling => txPidScalings(i),
                                       eComponentToScale => i);
      end loop;
      pxSubmarine := pxModel.pxSubmarine;
      pxModel.Restart;
      pxModel.pxSubmarine.Set_Position_Vector(xPositionVector);

      Aunit.Assertions.Assert(Condition => pxModel.pxSubmarine /= pxSubmarine,
                              Message   => "Simulator.Model.Restart Failed, Pointers from old to new Submarine is the same");
      pxModel.Update_Model(fDeltaTime => 1.0);
      pxModel.Update_Model(fDeltaTime => 1.0);
      -- Put_Line("After Updating with pids set X:" & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_X'img & " Y: " & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Y'img & " Z: " & pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Z'img);

      aunit.Assertions.Assert(Condition => pxModel.xGet_Current_Submarine_Positional_Vector.fGet_X = xPositionVector.fGet_X,
                              Message   => "Simulator.Model.Restart failed, Faulty X Value, should be equal");
      aunit.Assertions.Assert(Condition => pxModel.xGet_Current_Submarine_Positional_Vector.fGet_Y = xPositionVector.fGet_Y,
                              Message   => "Simulator.Model.Update_Model failed, Faulty Y Value, should be equal");
--  begin read only
   end Test_Restart;
--  end read only

end Simulator.Model.CModel_Test_Data.CModel_Tests;
