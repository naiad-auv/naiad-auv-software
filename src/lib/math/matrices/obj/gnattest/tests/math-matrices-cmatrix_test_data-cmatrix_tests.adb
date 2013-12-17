--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Matrices.CMatrix_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Matrices.CMatrix_Test_Data.CMatrix_Tests is


--  begin read only
   procedure Test_1_xCreate_From_Quaternion (Gnattest_T : in out Test_CMatrix);
   procedure Test_xCreate_From_Quaternion_f86e2f (Gnattest_T : in out Test_CMatrix) renames Test_1_xCreate_From_Quaternion;
--  id:2.1/f86e2f48a4d79369/xCreate_From_Quaternion/1/0/
   procedure Test_1_xCreate_From_Quaternion (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:30:4:xCreate_From_Quaternion
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Math.Angles;
      use Math.Vectors;
      xMat : CMatrix := Math.Matrices.xCreate_Rotation_Around_Z_Axis(45.0) *
        Math.Matrices.xCreate_Rotation_Around_Y_Axis(45.0) *
        Math.Matrices.xCreate_Rotation_Around_X_Axis(45.0);
      xComp : CMatrix := Math.Matrices.xCreate_Rotation_Around_Z_Axis(-45.0) *
        Math.Matrices.xCreate_Rotation_Around_Y_Axis(45.0) *
        Math.Matrices.xCreate_Rotation_Around_X_Axis(45.0);
      
      xVec : Math.Vectors.CVector := Math.Vectors.xCreate(fX => 0.0,
                                                          fY => 0.0,
                                                          fZ => 32.0);
      
   begin

      for i in 1 .. 3 loop
         for j in 1 .. 3 loop
            Ada.Text_IO.Put(xMat.tfGet_Raw_Matrix(i,j)'Img & " ");
         end loop;
         Ada.Text_IO.New_Line;
      end loop;
         Ada.Text_IO.New_Line;

      for i in 1 .. 3 loop
         for j in 1 .. 3 loop
            Ada.Text_IO.Put(xComp.tfGet_Raw_Matrix(i,j)'Img & " ");
         end loop;
         Ada.Text_IO.New_Line;
      end loop;
      
      xMat := xMat * Math.Matrices.xCreate_Rotation_Around_Z_Axis(90.0);
      
      AUnit.Assertions.Assert(Condition => xMat * xVec = xComp * xVec,
                              Message => "LOL.");
      AUnit.Assertions.Assert(Condition => xMat = xComp,
                              Message => "FAN.");

      --  begin read only
   end Test_1_xCreate_From_Quaternion;
--  end read only


--  begin read only
   procedure Test_2_xCreate_From_Quaternion (Gnattest_T : in out Test_CMatrix);
   procedure Test_xCreate_From_Quaternion_86afc5 (Gnattest_T : in out Test_CMatrix) renames Test_2_xCreate_From_Quaternion;
--  id:2.1/86afc5a34b5a51e6/xCreate_From_Quaternion/0/0/
   procedure Test_2_xCreate_From_Quaternion (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:31:4:xCreate_From_Quaternion
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_xCreate_From_Quaternion;
--  end read only


--  begin read only
   procedure Test_xCreate_Rotation_Around_X_Axis (Gnattest_T : in out Test_CMatrix);
   procedure Test_xCreate_Rotation_Around_X_Axis_7041a2 (Gnattest_T : in out Test_CMatrix) renames Test_xCreate_Rotation_Around_X_Axis;
--  id:2.1/7041a2c9737ed14d/xCreate_Rotation_Around_X_Axis/1/0/
   procedure Test_xCreate_Rotation_Around_X_Axis (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:36:4:xCreate_Rotation_Around_X_Axis
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xCreate_Rotation_Around_X_Axis;
--  end read only


--  begin read only
   procedure Test_xCreate_Rotation_Around_Y_Axis (Gnattest_T : in out Test_CMatrix);
   procedure Test_xCreate_Rotation_Around_Y_Axis_1798e3 (Gnattest_T : in out Test_CMatrix) renames Test_xCreate_Rotation_Around_Y_Axis;
--  id:2.1/1798e354501d8cea/xCreate_Rotation_Around_Y_Axis/1/0/
   procedure Test_xCreate_Rotation_Around_Y_Axis (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:41:4:xCreate_Rotation_Around_Y_Axis
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xCreate_Rotation_Around_Y_Axis;
--  end read only


--  begin read only
   procedure Test_xCreate_Rotation_Around_Z_Axis (Gnattest_T : in out Test_CMatrix);
   procedure Test_xCreate_Rotation_Around_Z_Axis_733338 (Gnattest_T : in out Test_CMatrix) renames Test_xCreate_Rotation_Around_Z_Axis;
--  id:2.1/73333823041c1294/xCreate_Rotation_Around_Z_Axis/1/0/
   procedure Test_xCreate_Rotation_Around_Z_Axis (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:46:4:xCreate_Rotation_Around_Z_Axis
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xCreate_Rotation_Around_Z_Axis;
--  end read only


--  begin read only
   procedure Test_xCreate_Identity (Gnattest_T : in out Test_CMatrix);
   procedure Test_xCreate_Identity_06e45e (Gnattest_T : in out Test_CMatrix) renames Test_xCreate_Identity;
--  id:2.1/06e45ef3dc75f840/xCreate_Identity/1/0/
   procedure Test_xCreate_Identity (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:51:4:xCreate_Identity
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xCreate_Identity;
--  end read only


--  begin read only
   procedure Test_xCreate (Gnattest_T : in out Test_CMatrix);
   procedure Test_xCreate_eccce0 (Gnattest_T : in out Test_CMatrix) renames Test_xCreate;
--  id:2.1/eccce0cbd48f681b/xCreate/1/0/
   procedure Test_xCreate (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:54:4:xCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xCreate;
--  end read only


--  begin read only
   procedure Test_1_Multiply (Gnattest_T : in out Test_CMatrix);
   procedure Test_Multiply_de58ed (Gnattest_T : in out Test_CMatrix) renames Test_1_Multiply;
--  id:2.1/de58ed73eb46c424/Multiply/1/0/
   procedure Test_1_Multiply (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:58:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_Multiply;
--  end read only


--  begin read only
   procedure Test_2_Multiply (Gnattest_T : in out Test_CMatrix);
   procedure Test_Multiply_cd8faa (Gnattest_T : in out Test_CMatrix) renames Test_2_Multiply;
--  id:2.1/cd8faaa7bbdc7bc8/Multiply/0/0/
   procedure Test_2_Multiply (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:59:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_Multiply;
--  end read only


--  begin read only
   procedure Test_3_Multiply (Gnattest_T : in out Test_CMatrix);
   procedure Test_Multiply_a7f632 (Gnattest_T : in out Test_CMatrix) renames Test_3_Multiply;
--  id:2.1/a7f6320a2287c8bf/Multiply/0/0/
   procedure Test_3_Multiply (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:60:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_3_Multiply;
--  end read only


--  begin read only
   procedure Test_4_Multiply (Gnattest_T : in out Test_CMatrix);
   procedure Test_Multiply_ef8be2 (Gnattest_T : in out Test_CMatrix) renames Test_4_Multiply;
--  id:2.1/ef8be211ca1e2582/Multiply/0/0/
   procedure Test_4_Multiply (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:61:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_4_Multiply;
--  end read only


--  begin read only
   procedure Test_5_Multiply (Gnattest_T : in out Test_CMatrix);
   procedure Test_Multiply_00cd6c (Gnattest_T : in out Test_CMatrix) renames Test_5_Multiply;
--  id:2.1/00cd6c759af2253d/Multiply/0/0/
   procedure Test_5_Multiply (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:67:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_5_Multiply;
--  end read only


--  begin read only
   procedure Test_6_Multiply (Gnattest_T : in out Test_CMatrix);
   procedure Test_Multiply_516784 (Gnattest_T : in out Test_CMatrix) renames Test_6_Multiply;
--  id:2.1/51678488f870f4bc/Multiply/0/0/
   procedure Test_6_Multiply (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:69:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_6_Multiply;
--  end read only


--  begin read only
   procedure Test_7_Multiply (Gnattest_T : in out Test_CMatrix);
   procedure Test_Multiply_9d5466 (Gnattest_T : in out Test_CMatrix) renames Test_7_Multiply;
--  id:2.1/9d5466f7c5482268/Multiply/0/0/
   procedure Test_7_Multiply (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:75:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_7_Multiply;
--  end read only


--  begin read only
   procedure Test_8_Multiply (Gnattest_T : in out Test_CMatrix);
   procedure Test_Multiply_e3eb8a (Gnattest_T : in out Test_CMatrix) renames Test_8_Multiply;
--  id:2.1/e3eb8a2968a93212/Multiply/0/0/
   procedure Test_8_Multiply (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:77:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_8_Multiply;
--  end read only


--  begin read only
   procedure Test_Equal (Gnattest_T : in out Test_CMatrix);
   procedure Test_Equal_696cd5 (Gnattest_T : in out Test_CMatrix) renames Test_Equal;
--  id:2.1/696cd5d5d4e728f2/Equal/1/0/
   procedure Test_Equal (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:82:4:"="
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Equal;
--  end read only


--  begin read only
   procedure Test_xGet_Inverse (Gnattest_T : in out Test_CMatrix);
   procedure Test_xGet_Inverse_f43d19 (Gnattest_T : in out Test_CMatrix) renames Test_xGet_Inverse;
--  id:2.1/f43d199fd55f3364/xGet_Inverse/1/0/
   procedure Test_xGet_Inverse (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:87:4:xGet_Inverse
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xGet_Inverse;
--  end read only


--  begin read only
   procedure Test_pxGet_Allocated_Copy (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_Allocated_Copy_14197c (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_Allocated_Copy;
--  id:2.1/14197cbba225bd63/pxGet_Allocated_Copy/1/0/
   procedure Test_pxGet_Allocated_Copy (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:92:4:pxGet_Allocated_Copy
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_pxGet_Allocated_Copy;
--  end read only


--  begin read only
   procedure Test_xGet_Transpose (Gnattest_T : in out Test_CMatrix);
   procedure Test_xGet_Transpose_9e263e (Gnattest_T : in out Test_CMatrix) renames Test_xGet_Transpose;
--  id:2.1/9e263e9be6275aa3/xGet_Transpose/1/0/
   procedure Test_xGet_Transpose (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:96:4:xGet_Transpose
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xGet_Transpose;
--  end read only


--  begin read only
   procedure Test_tfGet_Raw_Matrix (Gnattest_T : in out Test_CMatrix);
   procedure Test_tfGet_Raw_Matrix_d46bc2 (Gnattest_T : in out Test_CMatrix) renames Test_tfGet_Raw_Matrix;
--  id:2.1/d46bc24c8df48416/tfGet_Raw_Matrix/1/0/
   procedure Test_tfGet_Raw_Matrix (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:100:4:tfGet_Raw_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMatrix : pCMatrix;
      tfMatrix : TMatrix;

      tfXRotAngle : Math.Angles.TAngle;
      tfYRotAngle : Math.Angles.TAngle;
      tfZRotAngle : Math.Angles.TAngle;
   begin

      for iXRot in 1 .. 10
      loop
         tfXRotAngle := Math.Angles.TAngle(float(36 * iXRot - 180));
         for iYRot in 1 .. 10
         loop
            tfYRotAngle := Math.Angles.TAngle(float(36 * iYRot - 180));
            for iZRot in 1 .. 10
            loop
               tfZRotAngle := Math.Angles.TAngle(float(36 * iZRot - 180));
               pxMatrix := CMatrix(xCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                                     xCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                                     xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Allocated_Copy;

               tfMatrix := pxMatrix.tfGet_Raw_Matrix;

               for i in 1 ..3
               loop
                  for j in 1 .. 3
                  loop
                     AUnit.Assertions.Assert(Condition => pxMatrix.tfMatrix(i,j) = tfMatrix(i,j),
                                             Message => "CMatrix.tfGet_Raw_Matrix failed, wrong value in (" & integer'Image(i) & "," & integer'Image(j) & "). Value: " & float'Image(float(tfMatrix(i,j))) & ". Expected: " & float'Image(float(pxMatrix.tfMatrix(i,j))) & ".");
                  end loop;
               end loop;

               Math.Matrices.Free(pxMatrixToDeallocate => pxMatrix);

            end loop;

         end loop;
      end loop;

--  begin read only
   end Test_tfGet_Raw_Matrix;
--  end read only


--  begin read only
   procedure Test_fGet_Determinant (Gnattest_T : in out Test_CMatrix);
   procedure Test_fGet_Determinant_6a3440 (Gnattest_T : in out Test_CMatrix) renames Test_fGet_Determinant;
--  id:2.1/6a34401378c12db4/fGet_Determinant/1/0/
   procedure Test_fGet_Determinant (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:104:4:fGet_Determinant
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMatrix : pCMatrix;
      tfXRotAngle : Math.Angles.TAngle;
      tfYRotAngle : Math.Angles.TAngle;
      tfZRotAngle : Math.Angles.TAngle;
   begin

      for iXRot in 1 .. 10
      loop
         tfXRotAngle := Math.Angles.TAngle(float(36 * iXRot - 180));
         for iYRot in 1 .. 10
         loop
            tfYRotAngle := Math.Angles.TAngle(float(36 * iYRot - 180));
            for iZRot in 1 .. 10
            loop
               tfZRotAngle := Math.Angles.TAngle(float(36 * iZRot - 180));
               pxMatrix := CMatrix(xCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                                     xCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                                     xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Allocated_Copy;


               AUnit.Assertions.Assert(Condition => pxMatrix.fGet_Determinant - 1.0 < 0.00001,
                                       Message => "CMatrix.pxGet_Determinant failed, wrong value for (" & integer'Image(iXRot) & "," & integer'Image(iYRot) & "," & integer'Image(iZRot) & "). Value: " & float'Image(pxMatrix.fGet_Determinant) & ". Expected: " & float'Image(1.0) & ".");
               Math.Matrices.Free(pxMatrixToDeallocate => pxMatrix);
            end loop;

         end loop;
      end loop;

--  begin read only
   end Test_fGet_Determinant;
--  end read only


--  begin read only
   procedure Test_xGet_X_Vector (Gnattest_T : in out Test_CMatrix);
   procedure Test_xGet_X_Vector_3797d4 (Gnattest_T : in out Test_CMatrix) renames Test_xGet_X_Vector;
--  id:2.1/3797d4c7a0ad6831/xGet_X_Vector/1/0/
   procedure Test_xGet_X_Vector (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:107:4:xGet_X_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xGet_X_Vector;
--  end read only


--  begin read only
   procedure Test_xGet_Y_Vector (Gnattest_T : in out Test_CMatrix);
   procedure Test_xGet_Y_Vector_d433bc (Gnattest_T : in out Test_CMatrix) renames Test_xGet_Y_Vector;
--  id:2.1/d433bcf87fc06145/xGet_Y_Vector/1/0/
   procedure Test_xGet_Y_Vector (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:110:4:xGet_Y_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xGet_Y_Vector;
--  end read only


--  begin read only
   procedure Test_xGet_Z_Vector (Gnattest_T : in out Test_CMatrix);
   procedure Test_xGet_Z_Vector_af4bea (Gnattest_T : in out Test_CMatrix) renames Test_xGet_Z_Vector;
--  id:2.1/af4beacb8fa1e692/xGet_Z_Vector/1/0/
   procedure Test_xGet_Z_Vector (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:113:4:xGet_Z_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xGet_Z_Vector;
--  end read only


--  begin read only
   procedure Test_Copy_From (Gnattest_T : in out Test_CMatrix);
   procedure Test_Copy_From_64b66f (Gnattest_T : in out Test_CMatrix) renames Test_Copy_From;
--  id:2.1/64b66fa8d70f7049/Copy_From/1/0/
   procedure Test_Copy_From (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:116:4:Copy_From
--  end read only

      pragma Unreferenced (Gnattest_T);
      use System;

      pxTestMatrix : Math.Matrices.pCMatrix;
      pxCopyMatrix : Math.Matrices.pCMatrix;
      pxCopyPointerMatrix : Math.Matrices.pCMatrix;

   begin

      pxTestMatrix := CMatrix(Math.Matrices.xCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(25.0)) *
        Math.Matrices.xCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(-25.0)) *
        Math.Matrices.xCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(50.0))).pxGet_Allocated_Copy;

      pxCopyMatrix := Math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;
      pxCopyPointerMatrix := pxCopyMatrix;
      pxCopyMatrix.Copy_From(pxTestMatrix.all);

      AUnit.Assertions.Assert(Condition => pxTestMatrix.all = pxCopyPointerMatrix.all,
                              Message   => "CMatrix.Copy_From failed, matrices do not match.");
        AUnit.Assertions.Assert(Condition => pxCopyPointerMatrix.all'Address = pxCopyMatrix.all'Address,
                                Message   => "CMatrix.Copy_From failed, addresses do not match.");

      Math.Matrices.Free(pxMatrixToDeallocate => pxTestMatrix);
      Math.Matrices.Free(pxMatrixToDeallocate => pxCopyMatrix);


--  begin read only
   end Test_Copy_From;
--  end read only


--  begin read only
   --  procedure Test_pxGet_X_Vector (Gnattest_T : in out Test);
   --  procedure Test_pxGet_X_Vector_160735 (Gnattest_T : in out Test) renames Test_pxGet_X_Vector;
--  id:2.1/160735b33c12b065/pxGet_X_Vector/0/1/
   --  procedure Test_pxGet_X_Vector (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use Math.Vectors;
--        pxTestVector : Math.Vectors.pCVector;
--        pxXVector : Math.Vectors.pCVector;
--     begin
--  
--        pxTestVector := Math.Vectors.xCreate(fX => 1.0,
--                                              fY => 0.0,
--                                              fZ => 0.0).pxGet_Allocated_Copy;
--        pxXVector := Math.Matrices.xCreate_Identity.xGet_X_Vector.pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxTestVector.all = pxXVector.all,
--                                Message   => "CMatrix.pxGet_X_Vector failed.");
--        Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxXVector);
--  
--  
--  begin read only
   --  end Test_pxGet_X_Vector;
--  end read only


--  begin read only
   --  procedure Test_pxGet_Y_Vector (Gnattest_T : in out Test);
   --  procedure Test_pxGet_Y_Vector_2cb764 (Gnattest_T : in out Test) renames Test_pxGet_Y_Vector;
--  id:2.1/2cb764bb93e43f1b/pxGet_Y_Vector/0/1/
   --  procedure Test_pxGet_Y_Vector (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use Math.Vectors;
--        pxTestVector : Math.Vectors.pCVector;
--        pxYVector : Math.Vectors.pCVector;
--     begin
--  
--        pxTestVector := Math.Vectors.xCreate(fX => 0.0,
--                                              fY => 1.0,
--                                              fZ => 0.0).pxGet_Allocated_Copy;
--        pxYVector := Math.Matrices.xCreate_Identity.xGet_Y_Vector.pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxTestVector.all = pxYVector.all,
--                                Message   => "CMatrix.pxGet_Y_Vector failed.");
--        Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxYVector);
--  
--  begin read only
   --  end Test_pxGet_Y_Vector;
--  end read only


--  begin read only
   --  procedure Test_pxGet_Copy (Gnattest_T : in out Test);
   --  procedure Test_pxGet_Copy_3c9397 (Gnattest_T : in out Test) renames Test_pxGet_Copy;
--  id:2.1/3c9397de3adc8e2e/pxGet_Copy/0/1/
   --  procedure Test_pxGet_Copy (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxOriginalMatrix : pCMatrix;
--        pxCopyMatrix : pCMatrix;
--        tfXRotAngle : Math.Angles.TAngle;
--        tfYRotAngle : Math.Angles.TAngle;
--        tfZRotAngle : Math.Angles.TAngle;
--     begin
--  
--        for iXRot in 1 .. 10
--        loop
--           tfXRotAngle := Math.Angles.TAngle(float(36 * iXRot - 180));
--           for iYRot in 1 .. 10
--           loop
--              tfYRotAngle := Math.Angles.TAngle(float(36 * iYRot - 180));
--              for iZRot in 1 .. 10
--              loop
--                 tfZRotAngle := Math.Angles.TAngle(float(36 * iZRot - 180));
--                 pxOriginalMatrix := CMatrix(xCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
--                                               xCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
--                                               xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Allocated_Copy;
--  
--                 pxCopyMatrix := pxOriginalMatrix.pxGet_Allocated_Copy;
--  
--                 AUnit.Assertions.Assert(Condition => pxOriginalMatrix.all = pxCopyMatrix.all,
--                                         Message => "CMatrix.pxGet_Allocated_Copy failed, Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
--                 Math.Matrices.Free(pxMatrixToDeallocate => pxOriginalMatrix);
--                 Math.Matrices.Free(pxMatrixToDeallocate => pxCopyMatrix);
--              end loop;
--  
--           end loop;
--        end loop;
--  
--  begin read only
   --  end Test_pxGet_Copy;
--  end read only


--  begin read only
   --  procedure Test_pxGet_Inverse (Gnattest_T : in out Test);
   --  procedure Test_pxGet_Inverse_4c7f5a (Gnattest_T : in out Test) renames Test_pxGet_Inverse;
--  id:2.1/4c7f5ab12bd672d4/pxGet_Inverse/0/1/
   --  procedure Test_pxGet_Inverse (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxOriginalMatrix : pCMatrix;
--        pxInverseMatrix : pCMatrix;
--        pxIdentityMatrix : pCMatrix;
--        tfXRotAngle : Math.Angles.TAngle;
--        tfYRotAngle : Math.Angles.TAngle;
--        tfZRotAngle : Math.Angles.TAngle;
--     begin
--  
--        pxIdentityMatrix := xCreate_Identity.pxGet_Allocated_Copy;
--        for iXRot in 1 .. 10
--        loop
--           tfXRotAngle := Math.Angles.TAngle(float(36 * iXRot - 180) );
--           for iYRot in 1 .. 10
--           loop
--              tfYRotAngle := Math.Angles.TAngle(float(36 * iYRot - 180));
--              for iZRot in 1 .. 10
--              loop
--                 tfZRotAngle := Math.Angles.TAngle(float(36 * iZRot - 180));
--                 pxOriginalMatrix := CMatrix(xCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
--                   xCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
--                   xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Allocated_Copy;
--  
--                 if abs(pxOriginalMatrix.fGet_Determinant) = 0.0 then
--                    -- raise expection
--                    null;
--                 else
--                    pxInverseMatrix := pxOriginalMatrix.xGet_Inverse.pxGet_Allocated_Copy;
--  
--                    AUnit.Assertions.Assert(Condition => CMatrix(pxOriginalMatrix * pxInverseMatrix) = pxIdentityMatrix.all,
--                                            Message => "CMatrix.pxGet_Inverse failed, M * M-1 != I. Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
--                    AUnit.Assertions.Assert(Condition => CMatrix(pxInverseMatrix * pxOriginalMatrix) = pxIdentityMatrix.all,
--                                            Message => "CMatrix.pxGet_Inverse failed, M-1 * M != I. Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
--                    Math.Matrices.Free(pxMatrixToDeallocate => pxInverseMatrix);
--                 end if;
--  
--                 Math.Matrices.Free(pxMatrixToDeallocate => pxOriginalMatrix);
--  
--              end loop;
--  
--           end loop;
--        end loop;
--        Math.Matrices.Free(pxMatrixToDeallocate => pxIdentityMatrix);
--  
--  
--  
--  
--  
--  begin read only
   --  end Test_pxGet_Inverse;
--  end read only


--  begin read only
   --  procedure Test_pxGet_Transpose (Gnattest_T : in out Test);
   --  procedure Test_pxGet_Transpose_88bdfe (Gnattest_T : in out Test) renames Test_pxGet_Transpose;
--  id:2.1/88bdfed098f158c5/pxGet_Transpose/0/1/
   --  procedure Test_pxGet_Transpose (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxOriginalMatrix : pCMatrix;
--       pxTransposeMatrix : pCMatrix;
--        tfXRotAngle : Math.Angles.TAngle;
--        tfYRotAngle : Math.Angles.TAngle;
--        tfZRotAngle : Math.Angles.TAngle;
--     begin
--  
--        for iXRot in 1 .. 10
--        loop
--           tfXRotAngle := Math.Angles.TAngle(float(36 * iXRot - 180));
--           for iYRot in 1 .. 10
--           loop
--              tfYRotAngle := Math.Angles.TAngle(float(36 * iYRot - 180));
--              for iZRot in 1 .. 10
--              loop
--                 tfZRotAngle := Math.Angles.TAngle(float(36 * iZRot - 180));
--                 pxOriginalMatrix := CMatrix(xCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
--                                               xCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
--                                               xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Allocated_Copy;
--  
--                 pxTransposeMatrix := pxOriginalMatrix.xGet_Transpose.pxGet_Allocated_Copy;
--  
--                 for i in 1 ..3
--                 loop
--                    for j in 1 .. 3
--                    loop
--                       AUnit.Assertions.Assert(Condition => pxOriginalMatrix.tfMatrix(i,j) = pxTransposeMatrix.tfMatrix(j,i),
--                                               Message => "CMatrix.pxGet_Transpose failed, wrong value in (" & integer'Image(j) & "," & integer'Image(i) & "). Value: " & float'Image(float(pxTransposeMatrix.tfMatrix(j,i))) & ". Expected: " & float'Image(float(pxOriginalMatrix.tfMatrix(i,j))) & ".");
--                    end loop;
--                 end loop;
--  
--                 Math.Matrices.Free(pxMatrixToDeallocate => pxOriginalMatrix);
--                 Math.Matrices.Free(pxMatrixToDeallocate => pxTransposeMatrix);
--              end loop;
--  
--           end loop;
--        end loop;
--  
--  begin read only
   --  end Test_pxGet_Transpose;
--  end read only


--  begin read only
   --  procedure Test_pxGet_Z_Vector (Gnattest_T : in out Test);
   --  procedure Test_pxGet_Z_Vector_fd9c88 (Gnattest_T : in out Test) renames Test_pxGet_Z_Vector;
--  id:2.1/fd9c8886cfec5468/pxGet_Z_Vector/0/1/
   --  procedure Test_pxGet_Z_Vector (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--        use Math.Vectors;
--        pxTestVector : Math.Vectors.pCVector;
--        pxZVector : Math.Vectors.pCVector;
--     begin
--  
--        pxTestVector := Math.Vectors.xCreate(fX => 0.0,
--                                              fY => 0.0,
--                                              fZ => 1.0).pxGet_Allocated_Copy;
--        pxZVector := Math.Matrices.xCreate_Identity.xGet_Z_Vector.pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxTestVector.all = pxZVector.all,
--                                Message   => "CMatrix.pxGet_Z_Vector failed.");
--        Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxZVector);
--  
--  
--  begin read only
   --  end Test_pxGet_Z_Vector;
--  end read only

end Math.Matrices.CMatrix_Test_Data.CMatrix_Tests;
