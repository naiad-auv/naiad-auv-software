--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Matrices.CMatrix_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;

package body Math.Matrices.CMatrix_Test_Data.CMatrix_Tests is


--  begin read only
   procedure Test_pxGet_Inverse (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_Inverse_4c7f5a (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_Inverse;
--  id:2.1/4c7f5ab12bd672d4/pxGet_Inverse/1/0/
   procedure Test_pxGet_Inverse (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:27:4:pxGet_Inverse
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxOriginalMatrix : pCMatrix;
      pxInverseMatrix : pCMatrix;
      pxIdentityMatrix : pCMatrix;
      tfXRotAngle : Math.Angles.TAngle;
      tfYRotAngle : Math.Angles.TAngle;
      tfZRotAngle : Math.Angles.TAngle;
   begin

      pxIdentityMatrix := pxCreate_Identity;
      for iXRot in 1 .. 10
      loop
         tfXRotAngle := Math.Angles.TAngle(float(36 * iXRot - 180) );
         for iYRot in 1 .. 10
         loop
            tfYRotAngle := Math.Angles.TAngle(float(36 * iYRot - 180));
            for iZRot in 1 .. 10
            loop
               tfZRotAngle := Math.Angles.TAngle(float(36 * iZRot - 180));
               pxOriginalMatrix := pxCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                 pxCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                 pxCreate_Rotation_Around_X_Axis(tfXRotAngle);

               if abs(pxOriginalMatrix.fGet_Determinant) = 0.0 then
                  -- raise expection
                  null;
               else
                  pxInverseMatrix := pxOriginalMatrix.pxGet_Inverse;

                  AUnit.Assertions.Assert(Condition => pxOriginalMatrix * pxInverseMatrix = pxIdentityMatrix,
                                          Message => "CMatrix.pxGet_Inverse failed, M * M-1 != I. Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
                  AUnit.Assertions.Assert(Condition => pxInverseMatrix * pxOriginalMatrix = pxIdentityMatrix,
                                          Message => "CMatrix.pxGet_Inverse failed, M-1 * M != I. Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
               end if;

            end loop;

         end loop;
      end loop;

   exception
      when Numeric_Error =>
         for i in 1 .. 3
         loop
            for j in 1 .. 3
            loop
               Ada.Text_IO.Put_Line(integer'Image(i) & "," & integer'Image(j) & " -> " & float'Image(float(pxOriginalMatrix.tfMatrix(i,j))));
            end loop;
         end loop;




--  begin read only
   end Test_pxGet_Inverse;
--  end read only


--  begin read only
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CMatrix);
   procedure Test_pxGet_Copy_3c9397 (Gnattest_T : in out Test_CMatrix) renames Test_pxGet_Copy;
--  id:2.1/3c9397de3adc8e2e/pxGet_Copy/1/0/
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CMatrix) is
   --  math-matrices.ads:28:4:pxGet_Copy
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
               pxOriginalMatrix := pxCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                 pxCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                 pxCreate_Rotation_Around_X_Axis(tfXRotAngle);

              pxCopyMatrix := pxOriginalMatrix.pxGet_Copy;

                  AUnit.Assertions.Assert(Condition => pxOriginalMatrix = pxCopyMatrix,
                                          Message => "CMatrix.pxGet_Copy failed, Values: " & float'Image(float(tfXRotAngle)) & float'Image(float(tfYRotAngle)) & float'Image(float(tfZRotAngle)));
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
   --  math-matrices.ads:29:4:pxGet_Transpose
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
                 pxOriginalMatrix := pxCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                   pxCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                   pxCreate_Rotation_Around_X_Axis(tfXRotAngle);

               pxTransposeMatrix := pxOriginalMatrix.pxGet_Transpose;

               for i in 1 ..3
               loop
                  for j in 1 .. 3
                  loop
                     AUnit.Assertions.Assert(Condition => pxOriginalMatrix.tfMatrix(i,j) = pxTransposeMatrix.tfMatrix(j,i),
                                             Message => "CMatrix.pxGet_Transpose failed, wrong value in (" & integer'Image(j) & "," & integer'Image(i) & "). Value: " & float'Image(float(pxTransposeMatrix.tfMatrix(j,i))) & ". Expected: " & float'Image(float(pxOriginalMatrix.tfMatrix(i,j))) & ".");
                  end loop;
               end loop;

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
   --  math-matrices.ads:30:4:tfGet_Raw_Matrix
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
                 pxMatrix := pxCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                   pxCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                   pxCreate_Rotation_Around_X_Axis(tfXRotAngle);

               tfMatrix := pxMatrix.tfGet_Raw_Matrix;

               for i in 1 ..3
               loop
                  for j in 1 .. 3
                  loop
                     AUnit.Assertions.Assert(Condition => pxMatrix.tfMatrix(i,j) = tfMatrix(i,j),
                                             Message => "CMatrix.tfGet_Raw_Matrix failed, wrong value in (" & integer'Image(i) & "," & integer'Image(j) & "). Value: " & float'Image(float(tfMatrix(i,j))) & ". Expected: " & float'Image(float(pxMatrix.tfMatrix(i,j))) & ".");
                  end loop;
               end loop;

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
   --  math-matrices.ads:31:4:fGet_Determinant
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
                 pxMatrix := pxCreate_Rotation_Around_Z_Axis(tfZRotAngle) *
                   pxCreate_Rotation_Around_Y_Axis(tfYRotAngle) *
                   pxCreate_Rotation_Around_X_Axis(tfXRotAngle);


                   AUnit.Assertions.Assert(Condition => pxMatrix.fGet_Determinant - 1.0 < 0.00001,
                                             Message => "CMatrix.pxGet_Determinant failed, wrong value for (" & integer'Image(iXRot) & "," & integer'Image(iYRot) & "," & integer'Image(iZRot) & "). Value: " & float'Image(pxMatrix.fGet_Determinant) & ". Expected: " & float'Image(1.0) & ".");
            end loop;

         end loop;
      end loop;

--  begin read only
   end Test_fGet_Determinant;
--  end read only

end Math.Matrices.CMatrix_Test_Data.CMatrix_Tests;
