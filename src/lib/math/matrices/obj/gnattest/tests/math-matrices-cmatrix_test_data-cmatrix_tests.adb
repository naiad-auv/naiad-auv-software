--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Matrices.CMatrix_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Matrices.CMatrix_Test_Data.CMatrix_Tests is


--  begin read only
   procedure Test_pxGet_Inverse (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_Inverse_4c7f5a (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_Inverse;
--  id:2.1/4c7f5ab12bd672d4/pxGet_Inverse/1/0/
   procedure Test_pxGet_Inverse (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:28:4:pxGet_Inverse
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxOriginalMatrix : pCMatrix;
      pxInverseMatrix : pCMatrix;
      pxIdentityMatrix : pCMatrix;
      tfXRotAngle : Math.Angles.TAngle;
      tfYRotAngle : Math.Angles.TAngle;
      tfZRotAngle : Math.Angles.TAngle;
   begin

      pxIdentityMatrix := xCreate_Identity.pxGet_Copy;
      for iXRot in 1 .. 10
      loop
         tfXRotAngle := Math.Angles.TAngle(float(36 * iXRot - 180) );
         for iYRot in 1 .. 10
         loop
            tfYRotAngle := Math.Angles.TAngle(float(36 * iYRot - 180));
            for iZRot in 1 .. 10
            loop
               tfZRotAngle := Math.Angles.TAngle(float(36 * iZRot - 180));
               pxOriginalMatrix := CMatrix(xCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                 xCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                 xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Copy;

               if abs(pxOriginalMatrix.fGet_Determinant) = 0.0 then
                  -- raise expection
                  null;
               else
                  pxInverseMatrix := pxOriginalMatrix.xGet_Inverse.pxGet_Copy;

                  AUnit.Assertions.Assert(Condition => CMatrix(pxOriginalMatrix * pxInverseMatrix) = pxIdentityMatrix.all,
                                          Message => "CMatrix.pxGet_Inverse failed, M * M-1 != I. Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
                  AUnit.Assertions.Assert(Condition => CMatrix(pxInverseMatrix * pxOriginalMatrix) = pxIdentityMatrix.all,
                                          Message => "CMatrix.pxGet_Inverse failed, M-1 * M != I. Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
                  Math.Matrices.Free(pxMatrixToDeallocate => pxInverseMatrix);
               end if;

               Math.Matrices.Free(pxMatrixToDeallocate => pxOriginalMatrix);

            end loop;

         end loop;
      end loop;
      Math.Matrices.Free(pxMatrixToDeallocate => pxIdentityMatrix);





--  begin read only
   end Test_pxGet_Inverse;
--  end read only


--  begin read only
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_Copy_3c9397 (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_Copy;
--  id:2.1/3c9397de3adc8e2e/pxGet_Copy/1/0/
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:29:4:pxGet_Copy
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxOriginalMatrix : pCMatrix;
      pxCopyMatrix : pCMatrix;
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
               pxOriginalMatrix := CMatrix(xCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                                             xCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                                             xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Copy;

               pxCopyMatrix := pxOriginalMatrix.pxGet_Copy;

               AUnit.Assertions.Assert(Condition => pxOriginalMatrix.all = pxCopyMatrix.all,
                                       Message => "CMatrix.pxGet_Copy failed, Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
               Math.Matrices.Free(pxMatrixToDeallocate => pxOriginalMatrix);
               Math.Matrices.Free(pxMatrixToDeallocate => pxCopyMatrix);
            end loop;

         end loop;
      end loop;

--  begin read only
   end Test_pxGet_Copy;
--  end read only


--  begin read only
   procedure Test_pxGet_Transpose (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_Transpose_88bdfe (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_Transpose;
--  id:2.1/88bdfed098f158c5/pxGet_Transpose/1/0/
   procedure Test_pxGet_Transpose (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:30:4:pxGet_Transpose
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxOriginalMatrix : pCMatrix;
     pxTransposeMatrix : pCMatrix;
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
               pxOriginalMatrix := CMatrix(xCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                                             xCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                                             xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Copy;

               pxTransposeMatrix := pxOriginalMatrix.xGet_Transpose.pxGet_Copy;

               for i in 1 ..3
               loop
                  for j in 1 .. 3
                  loop
                     AUnit.Assertions.Assert(Condition => pxOriginalMatrix.tfMatrix(i,j) = pxTransposeMatrix.tfMatrix(j,i),
                                             Message => "CMatrix.pxGet_Transpose failed, wrong value in (" & integer'Image(j) & "," & integer'Image(i) & "). Value: " & float'Image(float(pxTransposeMatrix.tfMatrix(j,i))) & ". Expected: " & float'Image(float(pxOriginalMatrix.tfMatrix(i,j))) & ".");
                  end loop;
               end loop;

               Math.Matrices.Free(pxMatrixToDeallocate => pxOriginalMatrix);
               Math.Matrices.Free(pxMatrixToDeallocate => pxTransposeMatrix);
            end loop;

         end loop;
      end loop;

--  begin read only
   end Test_pxGet_Transpose;
--  end read only


--  begin read only
   procedure Test_tfGet_Raw_Matrix (Gnattest_T : in out Test_CMatrix);
   procedure Test_tfGet_Raw_Matrix_d46bc2 (Gnattest_T : in out Test_CMatrix) renames Test_tfGet_Raw_Matrix;
--  id:2.1/d46bc24c8df48416/tfGet_Raw_Matrix/1/0/
   procedure Test_tfGet_Raw_Matrix (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:31:4:tfGet_Raw_Matrix
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
                                     xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Copy;

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
   --  math-matrices.ads:32:4:fGet_Determinant
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
                                     xCreate_Rotation_Around_X_Axis(tfXRotAngle)).pxGet_Copy;


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
   procedure Test_pxGet_X_Vector (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_X_Vector_160735 (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_X_Vector;
--  id:2.1/160735b33c12b065/pxGet_X_Vector/1/0/
   procedure Test_pxGet_X_Vector (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:34:4:pxGet_X_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Math.Vectors;
      pxTestVector : Math.Vectors.pCVector;
      pxXVector : Math.Vectors.pCVector;
   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 1.0,
                                            fY => 0.0,
                                            fZ => 0.0);
      pxXVector := Math.Matrices.xCreate_Identity.xGet_X_Vector.pxGet_Copy;

      AUnit.Assertions.Assert(Condition => pxTestVector.all = pxXVector.all,
                              Message   => "CMatrix.pxGet_X_Vector failed.");
      Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
      Math.Vectors.Free(pxVectorToDeallocate => pxXVector);


--  begin read only
   end Test_pxGet_X_Vector;
--  end read only


--  begin read only
   procedure Test_pxGet_Y_Vector (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_Y_Vector_2cb764 (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_Y_Vector;
--  id:2.1/2cb764bb93e43f1b/pxGet_Y_Vector/1/0/
   procedure Test_pxGet_Y_Vector (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:35:4:pxGet_Y_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Math.Vectors;
      pxTestVector : Math.Vectors.pCVector;
      pxYVector : Math.Vectors.pCVector;
   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 0.0,
                                            fY => 1.0,
                                            fZ => 0.0);
      pxYVector := Math.Matrices.xCreate_Identity.xGet_Y_Vector.pxGet_Copy;

      AUnit.Assertions.Assert(Condition => pxTestVector.all = pxYVector.all,
                              Message   => "CMatrix.pxGet_Y_Vector failed.");
      Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
      Math.Vectors.Free(pxVectorToDeallocate => pxYVector);

--  begin read only
   end Test_pxGet_Y_Vector;
--  end read only


--  begin read only
   procedure Test_pxGet_Z_Vector (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_Z_Vector_fd9c88 (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_Z_Vector;
--  id:2.1/fd9c8886cfec5468/pxGet_Z_Vector/1/0/
   procedure Test_pxGet_Z_Vector (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:36:4:pxGet_Z_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);
      use Math.Vectors;
      pxTestVector : Math.Vectors.pCVector;
      pxZVector : Math.Vectors.pCVector;
   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 0.0,
                                            fY => 0.0,
                                            fZ => 1.0);
      pxZVector := Math.Matrices.xCreate_Identity.xGet_Z_Vector.pxGet_Copy;

      AUnit.Assertions.Assert(Condition => pxTestVector.all = pxZVector.all,
                              Message   => "CMatrix.pxGet_Z_Vector failed.");
      Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
      Math.Vectors.Free(pxVectorToDeallocate => pxZVector);


--  begin read only
   end Test_pxGet_Z_Vector;
--  end read only


--  begin read only
   procedure Test_Copy_From (Gnattest_T : in out Test_CMatrix);
   procedure Test_Copy_From_d33e2b (Gnattest_T : in out Test_CMatrix) renames Test_Copy_From;
--  id:2.1/d33e2b48baa0fe97/Copy_From/1/0/
   procedure Test_Copy_From (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:38:4:Copy_From
--  end read only

      pragma Unreferenced (Gnattest_T);
      use System;

      pxTestMatrix : Math.Matrices.pCMatrix;
      pxCopyMatrix : Math.Matrices.pCMatrix;
      pxCopyPointerMatrix : Math.Matrices.pCMatrix;

   begin

      pxTestMatrix := CMatrix(Math.Matrices.xCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(25.0)) *
        Math.Matrices.xCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(-25.0)) *
        Math.Matrices.xCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(50.0))).pxGet_Copy;

      pxCopyMatrix := Math.Matrices.xCreate_Identity.pxGet_Copy;
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

end Math.Matrices.CMatrix_Test_Data.CMatrix_Tests;
