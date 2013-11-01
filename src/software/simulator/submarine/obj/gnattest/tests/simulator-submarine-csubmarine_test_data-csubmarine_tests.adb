--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into simulator.submarine.CSubmarine_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System; use System;
with math.Vectors; use Math.Vectors;
with math.Matrices; use Math.Matrices;
with math.Angles; use math.Angles;
with Simulator.Motor_Info; use Simulator.Motor_Info;
with ada.Text_IO; use ada.Text_IO;

package body simulator.submarine.CSubmarine_Test_Data.CSubmarine_Tests is


--  begin read only
   procedure Test_pxGet_Position_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_pxGet_Position_Vector_1a4a9e (Gnattest_T : in out Test_CSubmarine) renames Test_pxGet_Position_Vector;
--  id:2.1/1a4a9e42b6f7389a/pxGet_Position_Vector/1/0/
   procedure Test_pxGet_Position_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:20:4:pxGet_Position_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxSubmarine : simulator.submarine.pCSubmarine;
      pxPositionReturned : math.Vectors.pCVector;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.pxPositionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(15.1,11.2,4.7));
      pxPositionReturned := pxSubmarine.pxGet_Position_Vector;
      AUnit.Assertions.Assert(Condition => pxPositionReturned'Address /= pxSubmarine.pxPositionVector'Address,
                              Message   => "pxGet_Position_Vector failed, mathing pointers to object");
            AUnit.Assertions.Assert(Condition => pxPositionReturned.all = pxSubmarine.pxPositionVector.all,
                              Message   => "pxGet_Position_Vector failed, faulty value");


--  begin read only
   end Test_pxGet_Position_Vector;
--  end read only


--  begin read only
   procedure Test_pxGet_Velocity_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_pxGet_Velocity_Vector_feac87 (Gnattest_T : in out Test_CSubmarine) renames Test_pxGet_Velocity_Vector;
--  id:2.1/feac874dcd43d0b4/pxGet_Velocity_Vector/1/0/
   procedure Test_pxGet_Velocity_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:21:4:pxGet_Velocity_Vector
--  end read only

      pxSubmarine : simulator.submarine.pCSubmarine;
      pxVelocityReturned : math.Vectors.pCVector;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.pxVelocityVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(15.1,11.2,4.7));
      pxVelocityReturned := pxSubmarine.pxGet_Velocity_Vector;
      AUnit.Assertions.Assert(Condition => pxVelocityReturned'Address /= pxSubmarine.pxVelocityVector'Address,
                              Message   => "pxGet_Velocity_Vector failed, mathing pointers to object");
            AUnit.Assertions.Assert(Condition => pxVelocityReturned.all = pxSubmarine.pxVelocityVector.all,
                              Message   => "pxGet_Velocity_Vector failed, faulty value");

--  begin read only
   end Test_pxGet_Velocity_Vector;
--  end read only


--  begin read only
   procedure Test_pxGet_Orientation_Matrix (Gnattest_T : in out Test_CSubmarine);
   procedure Test_pxGet_Orientation_Matrix_a37cba (Gnattest_T : in out Test_CSubmarine) renames Test_pxGet_Orientation_Matrix;
--  id:2.1/a37cbadda4a40973/pxGet_Orientation_Matrix/1/0/
   procedure Test_pxGet_Orientation_Matrix (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:22:4:pxGet_Orientation_Matrix
--  end read only
      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
      pxOrientationMatrix : math.Matrices.pCMatrix;
      pxOrinetationReturned : math.Matrices.pCMatrix;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxOrientationMatrix := math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_Rotation_Around_X_Axis((39.0)));
      pxSubmarine.pxOrientationMatrix := pxOrientationMatrix;
      pxOrinetationReturned := pxSubmarine.pxGet_Orientation_Matrix;
      AUnit.Assertions.Assert(Condition => pxOrientationMatrix'Address /= pxOrinetationReturned'Address,
                              Message   => "pxGet_Orientation_Matrix failed, mathing pointers to object");
            AUnit.Assertions.Assert(Condition => pxOrientationMatrix.all = pxOrinetationReturned.all,
                              Message   => "pxGet_Orientation_Matrix failed, faulty value");


--  begin read only
   end Test_pxGet_Orientation_Matrix;
--  end read only


--  begin read only
   procedure Test_pxGet_Angular_Velocity_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_pxGet_Angular_Velocity_Vector_1d26d6 (Gnattest_T : in out Test_CSubmarine) renames Test_pxGet_Angular_Velocity_Vector;
--  id:2.1/1d26d6e8225b344c/pxGet_Angular_Velocity_Vector/1/0/
   procedure Test_pxGet_Angular_Velocity_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:23:4:pxGet_Angular_Velocity_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
      pxAngularVelocityVector : math.Vectors.pCVector;
      pxAngularVelocityReturned : math.Vectors.pCVector;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxAngularVelocityVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(15.1,11.2,4.7));
      pxSubmarine.pxAngularVelocityVector := pxAngularVelocityVector;
      pxAngularVelocityReturned := pxSubmarine.pxGet_Angular_Velocity_Vector;
      AUnit.Assertions.Assert(Condition => pxAngularVelocityReturned'Address /= pxAngularVelocityVector'Address,
                              Message   => "pxGet_Angular_Velocity failed, mathing pointers to object");
            AUnit.Assertions.Assert(Condition => pxAngularVelocityReturned.all = pxAngularVelocityVector.all,
                              Message   => "pxGet_Angular_Velocity failed, faulty value");

--  begin read only
   end Test_pxGet_Angular_Velocity_Vector;
--  end read only


--  begin read only
   procedure Test_pxGet_Motor_Values (Gnattest_T : in out Test_CSubmarine);
   procedure Test_pxGet_Motor_Values_45ed60 (Gnattest_T : in out Test_CSubmarine) renames Test_pxGet_Motor_Values;
--  id:2.1/45ed60b2ccf2eafa/pxGet_Motor_Values/1/0/
   procedure Test_pxGet_Motor_Values (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:24:4:pxGet_Motor_Values
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : submarine.pCSubmarine;
      txMotorForce : submarine.TMotorForce;
      txMotorForceResult : submarine.TMotorForce;
   begin
      pxSubmarine := submarine.pxCreate;
      txMotorForce := (5.3,2.1,5.6,7.1,8.1,-3.4);
      pxSubmarine.Set_Motor_Force(txMotorForce);
      txMotorForceResult := pxSubmarine.pxGet_Motor_Values;
      for i in 1..6 loop
         Aunit.Assertions.Assert(Condition => txMotorForce(i) = txMotorForceResult(i),
                                 Message   => "Simulator.Submarine.pxGet_Motor_Values failed, faulty values");

      end loop;




--  begin read only
   end Test_pxGet_Motor_Values;
--  end read only


--  begin read only
   procedure Test_Set_Position_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Position_Vector_decf7f (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Position_Vector;
--  id:2.1/decf7f4f687e05e2/Set_Position_Vector/1/0/
   procedure Test_Set_Position_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:26:4:Set_Position_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      pxPositionVector : math.Vectors.pCVector;
   begin
      pxSubmarine := Submarine.pxCreate;
      pxPositionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(13.2, 15.1, -1.4));
      pxSubmarine.Set_Position_Vector(pxPositionVector => pxPositionVector);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxPositionVector'Address /= pxPositionVector'Address,
                              Message   => "Simulator.Submarine.Set_Position_Vector failed, matching addresses");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxPositionVector.all=pxPositionVector.all,
                              Message   => "Simulator.Submarine.Set_Position_Vector failed, faulty value");
--  begin read only
   end Test_Set_Position_Vector;
--  end read only


--  begin read only
   procedure Test_Set_Orientation_Matrix (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Orientation_Matrix_6a4bc0 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Orientation_Matrix;
--  id:2.1/6a4bc0b1aa52b33b/Set_Orientation_Matrix/1/0/
   procedure Test_Set_Orientation_Matrix (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:27:4:Set_Orientation_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      pxOrientationMatrix : math.Matrices.pCMatrix;
   begin
      pxSubmarine := Submarine.pxCreate;
      pxOrientationMatrix := math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_Rotation_Around_X_Axis(15.0));
      pxSubmarine.Set_Orientation_Matrix(pxOrientationMatrix);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxOrientationMatrix'Address /= pxOrientationMatrix'Address,
                              Message   => "Simulator.Submarine.Orientation_Matrix failed, matching addresses");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxOrientationMatrix.all = pxOrientationMatrix.all,
                              Message   => "Simulator.Submarine.Orientation_Matrix failed, faulty value");
--  begin read only
   end Test_Set_Orientation_Matrix;
--  end read only


--  begin read only
   procedure Test_Set_Velocity_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Velocity_Vector_174b8c (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Velocity_Vector;
--  id:2.1/174b8c1749988537/Set_Velocity_Vector/1/0/
   procedure Test_Set_Velocity_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:28:4:Set_Velocity_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      pxVelocityVector : math.Vectors.pCVector;
   begin
      pxSubmarine := Submarine.pxCreate;
      pxVelocityVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(13.2, 15.1, -1.4));
      pxSubmarine.Set_Velocity_Vector(pxVelocityVector);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxVelocityVector'Address /= pxVelocityVector'Address,
                              Message   => "Simulator.Submarine.Set_Position_Vector failed, matching addresses");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxVelocityVector.all=pxVelocityVector.all,
                              Message   => "Simulator.Submarine.Set_Position_Vector failed, faulty value");
--  begin read only
   end Test_Set_Velocity_Vector;
--  end read only


--  begin read only
   procedure Test_Set_Angular_Velocity_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Angular_Velocity_Vector_49aadb (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Angular_Velocity_Vector;
--  id:2.1/49aadb28185370c1/Set_Angular_Velocity_Vector/1/0/
   procedure Test_Set_Angular_Velocity_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:29:4:Set_Angular_Velocity_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      pxAngularVelocityVector : math.Vectors.pCVector;
   begin
      pxSubmarine := Submarine.pxCreate;
      pxAngularVelocityVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(13.2, 15.1, -1.4));
      pxSubmarine.Set_Angular_Velocity_Vector(pxAngularVelocityVector => pxAngularVelocityVector);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxAngularVelocityVector'Address /= pxAngularVelocityVector'Address,
                              Message   => "Simulator.Submarine.Set_Position_Vector failed, matching addresses");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxAngularVelocityVector.all=pxAngularVelocityVector.all,
                              Message   => "Simulator.Submarine.Set_Position_Vector failed, faulty value");
--  begin read only
   end Test_Set_Angular_Velocity_Vector;
--  end read only


--  begin read only
   procedure Test_Set_Motor_Info (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Motor_Info_ae0f8d (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Motor_Info;
--  id:2.1/ae0f8d45af54da56/Set_Motor_Info/1/0/
   procedure Test_Set_Motor_Info (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:31:4:Set_Motor_Info
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      txMotors : submarine.TMotors;
   begin
      pxSubmarine := Submarine.pxCreate;
      for iLoopThroughMotors in txMotors'Range loop
         txMotors(iLoopThroughMotors) := simulator.Motor_Info.pxCreate(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(float(iLoopThroughMotors*5),float(iLoopThroughMotors*10),float(iLoopThroughMotors*7))),
                                                                       math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(float(iLoopThroughMotors*6),float(iLoopThroughMotors*8),float(iLoopThroughMotors*4))));
         pxSubmarine.txMotorInfo(iLoopThroughMotors) := txMotors(iLoopThroughMotors).pxGet_Copy;
      end loop;
      for iLoopThroughMotors in txMotors'Range loop
         pxSubmarine.Set_Motor_Info(txMotorInfo => txMotors);
         Aunit.Assertions.Assert(Condition => pxSubmarine.txMotorInfo(iLoopThroughMotors).all=txMotors(ILoopThroughMotors).all,
                                 Message   => "Simulator.submarine.Set_Motor_Info failed, faulty values");
         Aunit.Assertions.Assert(Condition => pxSubmarine.txMotorInfo(iLoopThroughMotors)'Address /= txMotors(iLoopThroughMotors)'Address,
                                 Message   => "Simulator.submarine.Set_Motor_Info failed, matching pointers");
      end loop;
--  begin read only
   end Test_Set_Motor_Info;
--  end read only


--  begin read only
   procedure Test_Set_Motor_Force (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Motor_Force_22e88d (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Motor_Force;
--  id:2.1/22e88dd077a74849/Set_Motor_Force/1/0/
   procedure Test_Set_Motor_Force (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:32:4:Set_Motor_Force
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      tMotors : submarine.TMotorForce;
   begin
      pxSubmarine := Submarine.pxCreate;
      for iLoopThroughMotors in tMotors'Range loop
         tMotors(iLoopThroughMotors) := float(iLoopThroughMotors);
      end loop;
      for iLoopThroughMotors in tMotors'Range loop
         pxSubmarine.Set_Motor_Force(tMotors);
         Aunit.Assertions.Assert(Condition => pxSubmarine.txMotorForce(iLoopThroughMotors) = tMotors(ILoopThroughMotors),
                                 Message   => "Simulator.submarine.Set_Motor_Force failed, faulty values");
      end loop;
--  begin read only
   end Test_Set_Motor_Force;
--  end read only


--  begin read only
   procedure Test_Set_Weight (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Weight_df8cdc (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Weight;
--  id:2.1/df8cdc5661478d3b/Set_Weight/1/0/
   procedure Test_Set_Weight (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:34:4:Set_Weight
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      fWeight : float;
   begin
      pxSubmarine := Submarine.pxCreate;
      fWeight:=5.6;
      pxSubmarine.Set_Weight(fWeight => fWeight);
      AUnit.Assertions.Assert(Condition => fWeight = pxSubmarine.fWeight,
                              Message   => "Simulator.Submarine.Set_Weight failed, faulty value");

--  begin read only
   end Test_Set_Weight;
--  end read only


--  begin read only
   procedure Test_Set_Buoyancy_Force (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Buoyancy_Force_c2f9a4 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Buoyancy_Force;
--  id:2.1/c2f9a4c4dd7e622e/Set_Buoyancy_Force/1/0/
   procedure Test_Set_Buoyancy_Force (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:35:4:Set_Buoyancy_Force
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      fBouyancyForce: float;
   begin
      pxSubmarine := Submarine.pxCreate;
      fBouyancyForce := 7.2;
      pxSubmarine.Set_Buoyancy_Force(fBouyancyForce);
      AUnit.Assertions.Assert(Condition => pxSubmarine.fBuoyancyForce=fBouyancyForce,
                              Message   => "Simulator.Submarine.Set_Buoyancy_Force failed, faulty value");
--  begin read only
   end Test_Set_Buoyancy_Force;
--  end read only


--  begin read only
   procedure Test_Set_Buoyancy_Force_Position_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Buoyancy_Force_Position_Vector_dee059 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Buoyancy_Force_Position_Vector;
--  id:2.1/dee05945749e1845/Set_Buoyancy_Force_Position_Vector/1/0/
   procedure Test_Set_Buoyancy_Force_Position_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:36:4:Set_Buoyancy_Force_Position_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxSubmarine : Submarine.pCSubmarine;
      pxBuoyancyForcePositionVector : math.Vectors.pCVector;
   begin
      pxSubmarine := Submarine.pxCreate;
      pxBuoyancyForcePositionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(13.2, 15.1, -1.4));
      pxSubmarine.Set_Buoyancy_Force_Position_Vector(pxBuoyancyForcePositionVector);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxBuoyancyForcePositionVector'Address /= pxBuoyancyForcePositionVector'Address,
                              Message   => "Simulator.Submarine.Set_Buoyancy_Force_Position_Vector failed, matching addresses");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxSubmarine.pxBuoyancyForcePositionVector.all,pxBuoyancyForcePositionVector.all),
                              Message   => "Simulator.Submarine.Set_Buoyancy_Force_Position_Vector failed, faulty value");
--  begin read only
   end Test_Set_Buoyancy_Force_Position_Vector;
--  end read only


--  begin read only
   procedure Test_Set_Rotation_Friction_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Rotation_Friction_Vector_b6db04 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Rotation_Friction_Vector;
--  id:2.1/b6db04c658b520c3/Set_Rotation_Friction_Vector/1/0/
   procedure Test_Set_Rotation_Friction_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:37:4:Set_Rotation_Friction_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      pxRotationFrictionVector : math.Vectors.pCVector;
   begin
      pxSubmarine := Submarine.pxCreate;
      pxRotationFrictionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(13.2, 15.1, -1.4));
      pxSubmarine.Set_Rotation_Friction_Vector(pxRotationFrictionVector);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxRotationFrictionVector'Address /= pxRotationFrictionVector'Address,
                              Message   => "Simulator.Submarine.Set_Buoyancy_Force_Position_Vector failed, matching addresses");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxSubmarine.pxRotationFrictionVector.all,pxRotationFrictionVector.all),
                              Message   => "Simulator.Submarine.Set_Rotation_Friction_Vector failed, faulty value");
--  begin read only
   end Test_Set_Rotation_Friction_Vector;
--  end read only


--  begin read only
   procedure Test_Set_Veclocity_Friction_Vector (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Veclocity_Friction_Vector_57733d (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Veclocity_Friction_Vector;
--  id:2.1/57733d9b83fc2da3/Set_Veclocity_Friction_Vector/1/0/
   procedure Test_Set_Veclocity_Friction_Vector (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:38:4:Set_Veclocity_Friction_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : Submarine.pCSubmarine;
      pxVelocityFrictionVector : math.Vectors.pCVector;
   begin
      pxSubmarine := Submarine.pxCreate;
      pxVelocityFrictionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(13.2, 15.1, -1.4));
      pxSubmarine.Set_Veclocity_Friction_Vector(pxVelocityFrictionVector);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxVelocityFrictionVector'Address /= pxVelocityFrictionVector'Address,
                              Message   => "Simulator.Submarine.Set_Buoyancy_Force_Position_Vector failed, matching addresses");
      AUnit.Assertions.Assert(Condition => math.Vectors."="(pxSubmarine.pxVelocityFrictionVector.all,pxVelocityFrictionVector.all),
                              Message   => "Simulator.Submarine.Set_Rotation_Friction_Vector failed, faulty value");
--  begin read only
   end Test_Set_Veclocity_Friction_Vector;
--  end read only


--  begin read only
   procedure Test_Set_Inertia_Matrix (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Inertia_Matrix_5d5d83 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Inertia_Matrix;
--  id:2.1/5d5d836ead8b845c/Set_Inertia_Matrix/1/0/
   procedure Test_Set_Inertia_Matrix (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:40:4:Set_Inertia_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxSubmarine : Submarine.pCSubmarine;
      pxInertiaMatrix : math.Matrices.pCMatrix;
   begin
      pxSubmarine := Submarine.pxCreate;
      pxInertiaMatrix := math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_Rotation_Around_X_Axis(32.1));
      pxSubmarine.Set_Inertia_Matrix(pxInertiaMatrix);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxInertiaMatrix'Address /= pxInertiaMatrix'Address,
                              Message   => "Simulator.Submarine.Set_Buoyancy_Force_Position_Vector failed, matching addresses");
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxInertiaMatrix.all = pxInertiaMatrix.all,
                              Message   => "Simulator.Submarine.Set_Rotation_Friction_Vector failed, faulty value");

--  begin read only
   end Test_Set_Inertia_Matrix;
--  end read only


--  begin read only
   procedure Test_Calculate_Acceleration (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Calculate_Acceleration_559bc8 (Gnattest_T : in out Test_CSubmarine) renames Test_Calculate_Acceleration;
--  id:2.1/559bc85b126f9fe1/Calculate_Acceleration/1/0/
   procedure Test_Calculate_Acceleration (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:42:4:Calculate_Acceleration
--  end read only

      use math.Vectors;
      use math.Matrices;

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : submarine.pCSubmarine;
      txMotorInfo : submarine.TMotors;
      tfMotorForce : submarine.TMotorForce;
      pxUnitTestForce : math.Vectors.pCVector;
      pxUnitTestAcceleration : math.Vectors.pCVector;
   begin
      for iLoopThroughMotors in 1..6 loop
         txMotorInfo(iLoopThroughMotors) := simulator.Motor_Info.pxCreate(pxPositionVector => math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(fX => float(iLoopThroughMotors+2),
                                                                                                                    fY => float(iLoopThroughMotors-5),
                                                                                                                    fZ => float(iLoopThroughMotors-3))),
                                                                          pxForceVector    => math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(fX => float(iLoopThroughMotors+3),
                                                                                                                    fY => float(iLoopThroughMotors-4),
                                                                                                                    fZ => float(iLoopThroughMotors+1))));
         tfMotorForce(iLoopThroughMotors) := float(iLoopThroughMotors)*3.3;
      end loop;
      pxSubmarine := submarine.pxCreate;
      pxSubmarine.Set_Position_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Orientation_Matrix(math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_Identity));
      pxSubmarine.Set_Velocity_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Angular_Velocity_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Motor_Info(txMotorInfo);
      pxSubmarine.Set_Motor_Force(tfMotorForce);
      pxSubmarine.Set_Weight(45.0);
      pxSubmarine.Set_Buoyancy_Force(50.0*9.82);
      pxSubmarine.Set_Buoyancy_Force_Position_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Rotation_Friction_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Veclocity_Friction_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));

      pxSubmarine.Calculate_Acceleration;
      pxUnitTestForce := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,pxSubmarine.fBuoyancyForce-pxSubmarine.fWeight*9.82));

      for i in 1..6 loop
         pxUnitTestForce := math.Vectors.pxGet_Allocated_Copy(pxUnitTestForce + (pxSubmarine.txMotorInfo(i).pxGet_Force_Vector * pxSubmarine.txMotorForce(i)));
      end loop;
      pxUnitTestAcceleration := math.Vectors.pxGet_Allocated_Copy(pxUnitTestForce/pxSubmarine.fWeight);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxAccelerationVector.all = pxUnitTestAcceleration.all,
                              Message   => "Calculate_Acceleration failed, Faulty Values");


--  begin read only
   end Test_Calculate_Acceleration;
--  end read only


--  begin read only
   procedure Test_Calculate_Angular_Acceleration (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Calculate_Angular_Acceleration_daef8b (Gnattest_T : in out Test_CSubmarine) renames Test_Calculate_Angular_Acceleration;
--  id:2.1/daef8b88a1a16409/Calculate_Angular_Acceleration/1/0/
   procedure Test_Calculate_Angular_Acceleration (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:43:4:Calculate_Angular_Acceleration
--  end read only
      use math.Vectors;
      use math.Matrices;
      pragma Unreferenced (Gnattest_T);
      pxSubmarine : submarine.pCSubmarine;
      txMotorInfo : submarine.TMotors;
      tfMotorForce : submarine.TMotorForce;
      pxUnitTestTorque : math.Vectors.pCVector;
      pxUnitTestAngularAcceleration : math.Vectors.pCVector;
   begin
      for iLoopThroughMotors in 1..6 loop
         txMotorInfo(iLoopThroughMotors) := simulator.Motor_Info.pxCreate(pxPositionVector => math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(fX => float(iLoopThroughMotors+2),
                                                                                                                    fY => float(iLoopThroughMotors-5),
                                                                                                                    fZ => float(iLoopThroughMotors-3))),
                                                                          pxForceVector    => math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(fX => float(iLoopThroughMotors+3),
                                                                                                                    fY => float(iLoopThroughMotors-4),
                                                                                                                    fZ => float(iLoopThroughMotors+1))));
         tfMotorForce(iLoopThroughMotors) := float(iLoopThroughMotors)*3.3;
      end loop;
      pxSubmarine := submarine.pxCreate;
      pxSubmarine.Set_Position_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Orientation_Matrix(math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_Identity));
      pxSubmarine.pxInertiaMatrix := math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_Identity);
      pxSubmarine.Set_Velocity_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Angular_Velocity_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Motor_Info(txMotorInfo);
      pxSubmarine.Set_Motor_Force(tfMotorForce);
      pxSubmarine.Set_Weight(45.0);
      pxSubmarine.Set_Buoyancy_Force(50.0*9.82);
      pxSubmarine.Set_Buoyancy_Force_Position_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Rotation_Friction_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));
      pxSubmarine.Set_Veclocity_Friction_Vector(math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0)));

      pxSubmarine.Calculate_Angular_Acceleration;
      pxUnitTestTorque := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0,0.0,0.0));

      for i in 1..6 loop
         pxUnitTestTorque := math.Vectors.pxGet_Allocated_Copy(pxUnitTestTorque + (pxSubmarine.txMotorInfo(i).pxGet_Torque_Vector * pxSubmarine.txMotorForce(i)));
      end loop;
      pxUnitTestAngularAcceleration := math.Vectors.pxGet_Allocated_Copy(pxSubmarine.pxInertiaMatrix.xGet_Inverse * pxUnitTestTorque);
      AUnit.Assertions.Assert(Condition => pxSubmarine.pxAngularAccelerationVector.all = pxUnitTestAngularAcceleration.all,
                              Message   => "Calculate_Angular_Acceleration failed, Faulty Values");

--  begin read only
   end Test_Calculate_Angular_Acceleration;
--  end read only


--  begin read only
   procedure Test_Integrate_Submarine_Variables (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Integrate_Submarine_Variables_8288c8 (Gnattest_T : in out Test_CSubmarine) renames Test_Integrate_Submarine_Variables;
--  id:2.1/8288c89aefabd6d4/Integrate_Submarine_Variables/1/0/
   procedure Test_Integrate_Submarine_Variables (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:44:4:Integrate_Submarine_Variables
--  end read only


      package FLOAT_INUT is new FLOAT_IO(FLOAT);
      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
      pxCalculateOrientationMatrix : math.Matrices.pCMatrix;
      pxTestOrientationXVector : math.Vectors.pCVector;
      pxTestOrientationYVector : math.Vectors.pCVector;
      pxTestOrientationZVector : math.Vectors.pCVector;
      pxSimOrientationXVector : math.Vectors.pCVector;
      pxSimOrientationYVector : math.Vectors.pCVector;
      pxSimOrientationZVector : math.Vectors.pCVector;
      pxDifferentialXVector : math.Vectors.pCVector;
      pxDifferentialYVector : math.Vectors.pCVector;
      pxDifferentialZVector : math.Vectors.pCVector;
      pxDifferentialPositionVector : math.Vectors.pCVector;
      pxCalculatedPositionVector : math.Vectors.pCVector;
   begin

      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.pxPositionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0 , 0.0 , 0.0));
      pxSubmarine.pxVelocityVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0 , 0.0 , 0.0));
      pxSubmarine.pxOrientationMatrix := math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_Identity);
      pxSubmarine.pxAngularVelocityVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.0 , 0.0 , 0.0));
      for i in 1..10000 loop
         pxSubmarine.pxAccelerationVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(1.0 , 0.0 , 0.0));
         pxSubmarine.pxAngularAccelerationVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(1.0 , 1.0 , 1.0));
         pxSubmarine.Integrate_Submarine_Variables(0.0001);
      end loop;
      pxCalculateOrientationMatrix:=math.Matrices.pxGet_Allocated_Copy(math.Matrices.xCreate_From_Quaternion(math.Quaternions.xCreate(xAxisVector => math.Vectors.xCreate(fX => 1.0,
                                                                                                                                             fY => 1.0,
                                                                                                                                             fZ => 1.0),
                                                                                                             fAngleInDegrees                       => Math.Angles.fRadians_To_Degrees(0.5*1.73205080757))));


      for i in 1..3 loop
         for j in 1..3 loop
            FLOAT_INUT.Put(pxSubmarine.pxOrientationMatrix.tfGet_Raw_Matrix(i,j));
         end loop;
         new_line;
      end loop;
      new_line;
      new_line;
      for i in 1..3 loop
         for j in 1..3 loop
            FLOAT_INUT.Put(pxCalculateOrientationMatrix.tfGet_Raw_Matrix(i,j));
         end loop;
         new_line;
      end loop;

      pxCalculatedPositionVector := math.Vectors.pxGet_Allocated_Copy(math.Vectors.xCreate(0.5 , 0.0 , 0.0));

      pxDifferentialPositionVector := math.Vectors.pxGet_Allocated_Copy(pxCalculatedPositionVector-pxSubmarine.pxPositionVector);

      pxTestOrientationXVector := math.Vectors.pxGet_Allocated_Copy(pxCalculateOrientationMatrix * math.Vectors.xCreate(1.0 , 0.0 , 0.0));
      pxTestOrientationYVector := math.Vectors.pxGet_Allocated_Copy(pxCalculateOrientationMatrix * math.Vectors.xCreate(0.0 , 1.0 , 0.0));
      pxTestOrientationZVector := math.Vectors.pxGet_Allocated_Copy(pxCalculateOrientationMatrix * math.Vectors.xCreate(0.0 , 0.0 , 1.0));
      pxSimOrientationXVector := math.Vectors.pxGet_Allocated_Copy(pxSubmarine.pxOrientationMatrix * math.Vectors.xCreate(1.0 , 0.0 , 0.0));
      pxSimOrientationYVector := math.Vectors.pxGet_Allocated_Copy(pxSubmarine.pxOrientationMatrix * math.Vectors.xCreate(0.0 , 1.0 , 0.0));
      pxSimOrientationZVector := math.Vectors.pxGet_Allocated_Copy(pxSubmarine.pxOrientationMatrix * math.Vectors.xCreate(0.0 , 0.0 , 1.0));

      pxDifferentialXVector := math.Vectors.pxGet_Allocated_Copy(pxTestOrientationXVector-pxSimOrientationXVector);
      pxDifferentialYVector := math.Vectors.pxGet_Allocated_Copy(pxTestOrientationYVector-pxSimOrientationYVector);
      pxDifferentialZVector := math.Vectors.pxGet_Allocated_Copy(pxTestOrientationZVector-pxSimOrientationZVector);
      pxDifferentialPositionVector := math.Vectors.pxGet_Allocated_Copy(pxCalculatedPositionVector - pxSubmarine.pxPositionVector);
      AUnit.Assertions.Assert(Condition => pxDifferentialXVector.fLength<0.1,
                              Message   => "Simulator.Submarine.Integrate_Submarine_Values failed, faulty orientation matrix");
      AUnit.Assertions.Assert(Condition => pxDifferentialYVector.fLength<0.1,
                              Message   => "Simulator.Submarine.Integrate_Submarine_Values failed, faulty orientation matrix");
      AUnit.Assertions.Assert(Condition => pxDifferentialZVector.fLength<0.1,
                              Message   => "Simulator.Submarine.Integrate_Submarine_Values failed, faulty orientation matrix");
      AUnit.Assertions.Assert(Condition => pxDifferentialPositionVector.fLength<0.1,
                              Message   => "Simulator.Submarine.Integrate_Submarine_Values failed, faulty position matrix");



--  begin read only
   end Test_Integrate_Submarine_Variables;
--  end read only


--  begin read only
   procedure Test_Time_Step_Motor_Force_To_Integrate (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Time_Step_Motor_Force_To_Integrate_5a3176 (Gnattest_T : in out Test_CSubmarine) renames Test_Time_Step_Motor_Force_To_Integrate;
--  id:2.1/5a31763b92496da9/Time_Step_Motor_Force_To_Integrate/1/0/
   procedure Test_Time_Step_Motor_Force_To_Integrate (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:46:4:Time_Step_Motor_Force_To_Integrate
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : submarine.pCSubmarine;
      txMotorForce : submarine.TMotorForce;
   begin
      txMotorForce := (0.1,0.4,0.21,0.123,0.145,1.5);
      pxSubmarine := submarine.pxCreate_Naiad;
      pxSubmarine.Time_Step_Motor_Force_To_Integrate(txMotorForce,0.1);
      pxSubmarine.Time_Step_Motor_Force_To_Integrate(txMotorForce,0.1);
      Aunit.Assertions.Assert(Condition => pxSubmarine.pxPositionVector.all /= math.Vectors.xCreate(0.0,0.0,0.0),
                              Message   => "Test_Time_Step_Motor_Force_To_Integrate failed, no change in positionw with motor calues");
      pxSubmarine.Time_Step_Motor_Force_To_Integrate(txMotorForce,0.1);
      pxSubmarine.Time_Step_Motor_Force_To_Integrate(txMotorForce,0.1);


--  begin read only
   end Test_Time_Step_Motor_Force_To_Integrate;
--  end read only


--  begin read only
   procedure Test_Set_Gripper_Left_Status (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Gripper_Left_Status_9066c9 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Gripper_Left_Status;
--  id:2.1/9066c9efe19c9d07/Set_Gripper_Left_Status/1/0/
   procedure Test_Set_Gripper_Left_Status (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:48:4:Set_Gripper_Left_Status
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.Set_Gripper_Left_Status(true);
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGripperLeft = true,
                              Message   => "Simulator.Submarine.Set_Gripper_Left_Status failed, was false should have been true");
      pxSubmarine.Set_Gripper_Left_Status(false);
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGripperLeft = false,
                              Message   => "Simulator.Submarine.Set_Gripper_Left_Status failed, was true should have been false");



--  begin read only
   end Test_Set_Gripper_Left_Status;
--  end read only


--  begin read only
   procedure Test_Set_Gripper_Right_Status (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Gripper_Right_Status_82ca32 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Gripper_Right_Status;
--  id:2.1/82ca32037c3a658c/Set_Gripper_Right_Status/1/0/
   procedure Test_Set_Gripper_Right_Status (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:49:4:Set_Gripper_Right_Status
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.Set_Dropper_Right_Status(true);
      Aunit.Assertions.Assert(Condition => pxSubmarine.bDropperRight = true,
                              Message   => "Simulator.Submarine.Set_Dropper_Right_Status failed, was false should have been true");
      pxSubmarine.Set_Dropper_Right_Status(false);
      Aunit.Assertions.Assert(Condition => pxSubmarine.bDropperRight = false,
                              Message   => "Simulator.Submarine.Set_Dropper_Right_Status failed, was true should have been false");
--  begin read only
   end Test_Set_Gripper_Right_Status;
--  end read only


--  begin read only
   procedure Test_Set_Dropper_Left_Status (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Dropper_Left_Status_9382b7 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Dropper_Left_Status;
--  id:2.1/9382b717e35a9866/Set_Dropper_Left_Status/1/0/
   procedure Test_Set_Dropper_Left_Status (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:50:4:Set_Dropper_Left_Status
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.Set_Dropper_Left_Status(true);
      Aunit.Assertions.Assert(Condition => pxSubmarine.bDropperLeft = true,
                              Message   => "Simulator.Submarine.Set_Dropper_Left_Status failed, was false should have been true");
      pxSubmarine.Set_Dropper_Left_Status(false);
      Aunit.Assertions.Assert(Condition => pxSubmarine.bDropperLeft = false,
                              Message   => "Simulator.Submarine.Set_Dropper_Left_Status failed, was true should have been false");
--  begin read only
   end Test_Set_Dropper_Left_Status;
--  end read only


--  begin read only
   procedure Test_Set_Dropper_Right_Status (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Dropper_Right_Status_c22d27 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Dropper_Right_Status;
--  id:2.1/c22d27f57bbbd985/Set_Dropper_Right_Status/1/0/
   procedure Test_Set_Dropper_Right_Status (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:51:4:Set_Dropper_Right_Status
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin

      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.Set_Dropper_Right_Status(true);
      Aunit.Assertions.Assert(Condition => pxSubmarine.bDropperRight = true,
                              Message   => "Simulator.Submarine.Set_Dropper_Right_Status failed, was false should have been true");
      pxSubmarine.Set_Dropper_Right_Status(false);
      Aunit.Assertions.Assert(Condition => pxSubmarine.bDropperRight = false,
                              Message   => "Simulator.Submarine.Set_Dropper_Right_Status failed, was true should have been false");


--  begin read only
   end Test_Set_Dropper_Right_Status;
--  end read only


--  begin read only
   procedure Test_Set_Depth (Gnattest_T : in out Test_CSubmarine);
   procedure Test_Set_Depth_3efef2 (Gnattest_T : in out Test_CSubmarine) renames Test_Set_Depth;
--  id:2.1/3efef2efc816260b/Set_Depth/1/0/
   procedure Test_Set_Depth (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:52:4:Set_Depth
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin

      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.Set_Depth(31.4);

      Aunit.Assertions.Assert(Condition => pxSubmarine.fDepth = 31.4,
                              Message   => "Simulator.Submarine.Set_Depth failed, faulty value");


--  begin read only
   end Test_Set_Depth;
--  end read only


--  begin read only
   procedure Test_bGet_Gripper_Left_Status (Gnattest_T : in out Test_CSubmarine);
   procedure Test_bGet_Gripper_Left_Status_878bba (Gnattest_T : in out Test_CSubmarine) renames Test_bGet_Gripper_Left_Status;
--  id:2.1/878bbaa6f638f496/bGet_Gripper_Left_Status/1/0/
   procedure Test_bGet_Gripper_Left_Status (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:54:4:bGet_Gripper_Left_Status
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.bGripperLeft := true;
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGet_Gripper_Left_Status = true,
                              Message   => "Simulator.Submarine.bGet_Gripper_Left_Status failed, was false should have been true");
      pxSubmarine.bGripperLeft := false;
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGet_Gripper_Left_Status = false,
                              Message   => "Simulator.Submarine.bGet_Gripper_Left_Status failed, was true should have been false");


--  begin read only
   end Test_bGet_Gripper_Left_Status;
--  end read only


--  begin read only
   procedure Test_bGet_Gripper_Right_Status (Gnattest_T : in out Test_CSubmarine);
   procedure Test_bGet_Gripper_Right_Status_d2fdd1 (Gnattest_T : in out Test_CSubmarine) renames Test_bGet_Gripper_Right_Status;
--  id:2.1/d2fdd1965550a2c6/bGet_Gripper_Right_Status/1/0/
   procedure Test_bGet_Gripper_Right_Status (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:55:4:bGet_Gripper_Right_Status
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.bGripperLeft := true;
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGet_Gripper_Left_Status = true,
                              Message   => "Simulator.Submarine.bGet_Gripper_Right failed, was false should have been true");
      pxSubmarine.bGripperLeft := false;
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGet_Gripper_Left_Status = false,
                              Message   => "Simulator.Submarine.bGet_Gripper_Right_Status failed, was true should have been false");


--  begin read only
   end Test_bGet_Gripper_Right_Status;
--  end read only


--  begin read only
   procedure Test_bGet_Dropper_Left_Status (Gnattest_T : in out Test_CSubmarine);
   procedure Test_bGet_Dropper_Left_Status_e732c2 (Gnattest_T : in out Test_CSubmarine) renames Test_bGet_Dropper_Left_Status;
--  id:2.1/e732c2ac5f279402/bGet_Dropper_Left_Status/1/0/
   procedure Test_bGet_Dropper_Left_Status (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:56:4:bGet_Dropper_Left_Status
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.bDropperLeft := true;
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGet_Dropper_Left_Status = true,
                              Message   => "Simulator.Submarine.bGet_Dropper_Left failed, was false should have been true");
      pxSubmarine.bDropperLeft := false;
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGet_Dropper_Left_Status = false,
                              Message   => "Simulator.Submarine.bGet_Dropper_Left failed, was true should have been false");

--  begin read only
   end Test_bGet_Dropper_Left_Status;
--  end read only


--  begin read only
   procedure Test_bGet_Dropper_Right_Status (Gnattest_T : in out Test_CSubmarine);
   procedure Test_bGet_Dropper_Right_Status_be1f1c (Gnattest_T : in out Test_CSubmarine) renames Test_bGet_Dropper_Right_Status;
--  id:2.1/be1f1cc24987f329/bGet_Dropper_Right_Status/1/0/
   procedure Test_bGet_Dropper_Right_Status (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:57:4:bGet_Dropper_Right_Status
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.bDropperRight := true;
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGet_Dropper_Right_Status = true,
                              Message   => "Simulator.Submarine.bGet_Dropper_Right failed, was false should have been true");
      pxSubmarine.bDropperRight := false;
      Aunit.Assertions.Assert(Condition => pxSubmarine.bGet_Dropper_Right_Status = false,
                              Message   => "Simulator.Submarine.bGet_Dropper_Right failed, was true should have been false");


--  begin read only
   end Test_bGet_Dropper_Right_Status;
--  end read only


--  begin read only
   procedure Test_fGet_Depth (Gnattest_T : in out Test_CSubmarine);
   procedure Test_fGet_Depth_100ec6 (Gnattest_T : in out Test_CSubmarine) renames Test_fGet_Depth;
--  id:2.1/100ec640b5133647/fGet_Depth/1/0/
   procedure Test_fGet_Depth (Gnattest_T : in out Test_CSubmarine) is
   --  simulator-submarine.ads:58:4:fGet_Depth
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSubmarine : simulator.submarine.pCSubmarine;
   begin
      pxSubmarine := simulator.submarine.pxCreate;
      pxSubmarine.fDepth := 15.3;
      Aunit.Assertions.Assert(Condition => pxSubmarine.fDepth = 15.3,
                              Message   => "Simulator.Submarine.bGet_Dropper_Left failed, was false should have been true");
--  begin read only
   end Test_fGet_Depth;
--  end read only

end simulator.submarine.CSubmarine_Test_Data.CSubmarine_Tests;
