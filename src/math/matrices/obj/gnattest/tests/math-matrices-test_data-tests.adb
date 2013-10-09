--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Matrices.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
package body Math.Matrices.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate_From_Quaternion (Gnattest_T : in out Test);
   procedure Test_pxCreate_From_Quaternion_7a9b71 (Gnattest_T : in out Test) renames Test_pxCreate_From_Quaternion;
--  id:2.1/7a9b71c21c8b2562/pxCreate_From_Quaternion/1/0/
   procedure Test_pxCreate_From_Quaternion (Gnattest_T : in out Test) is
   --  math-matrices.ads:15:4:pxCreate_From_Quaternion
--  end read only

      pragma Unreferenced (Gnattest_T);
      
      use Math.Vectors;

      pxOriginalVector : Math.Vectors.pCVector;
      pxRotatedVectorWithMat : Math.Vectors.pCVector;
      pxRotatedVectorWithQuat : Math.Vectors.pCVector;

      --pxRealRotMatrix : pCMatrix;
      pxQuatRotMatrix : pCMatrix;
      pxRotQuat : Math.Quaternions.pCQuaternion;
      fAngle : float;
      fSqrtAngle : float;
   begin
      
      pxOriginalVector := Math.Vectors.pxCreate(fX => 0.0,
                                                fY => 0.0,
                                                fZ => 1.0);
    
      for i in 1 .. 16
      loop
         fAngle := (float(i) * 22.5) - 180.0;
         pxRotatedVectorWithMat := Math.Vectors.pxCreate(fX => 0.0,
                                                fY => 0.0,
                                                         fZ => 1.0);
         
         fSqrtAngle := fAngle / Ada.Numerics.Elementary_Functions.Sqrt(2.0);
         for j in 1 .. 10000
         loop
            pxRotatedVectorWithMat := Math.Matrices.pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(fSqrtAngle * 0.0001)) * pxRotatedVectorWithMat;
            pxRotatedVectorWithMat := Math.Matrices.pxCreate_Rotation_Around_Y_Axis(Math.Angles.TAngle(fSqrtAngle * 0.0001)) * pxRotatedVectorWithMat;
         end loop;
         
         pxRotQuat := Math.Quaternions.pxCreate(pxAxisVector    => Math.Vectors.pxCreate(1.0,1.0,0.0),
                                                fAngleInDegrees => fAngle);

         pxQuatRotMatrix := Math.Matrices.pxCreate_From_Quaternion(pxRotQuat);
         --pxRotatedVectorWithMat := pxRealRotMatrix * pxOriginalVector;
         pxRotatedVectorWithQuat := pxQuatRotMatrix * pxOriginalVector;
         
--           Ada.Text_IO.Put_Line("X: " & float'Image(pxRotatedVectorWithMat.fGet_X) & " -> " & float'Image(pxRotatedVectorWithQuat.fGet_X));
--           Ada.Text_IO.Put_Line("Y: " & float'Image(pxRotatedVectorWithMat.fGet_Y) & " -> " & float'Image(pxRotatedVectorWithQuat.fGet_Y));
--           Ada.Text_IO.Put_Line("Z: " & float'Image(pxRotatedVectorWithMat.fGet_Z) & " -> " & float'Image(pxRotatedVectorWithQuat.fGet_Z));
         
         
         AUnit.Assertions.Assert(Condition => abs(pxRotatedVectorWithMat.fGet_X - pxRotatedVectorWithQuat.fGet_X) < 0.01,
                                 Message   => "Matrices.pxCreate_From_Quaternion failed, X component in vector is wrong. Angle: " & float'Image(fAngle) & ". Value: " & float'Image(pxRotatedVectorWithQuat.fGet_X) & ". Expected: " & float'Image(pxRotatedVectorWithMat.fGet_X) & ".");
         AUnit.Assertions.Assert(Condition => abs(pxRotatedVectorWithMat.fGet_Y - pxRotatedVectorWithQuat.fGet_Y) < 0.01,
                                 Message   => "Matrices.pxCreate_From_Quaternion failed, Y component in vector is wrong. Angle: " & float'Image(fAngle) & ". Value: " & float'Image(pxRotatedVectorWithQuat.fGet_Y) & ". Expected: " & float'Image(pxRotatedVectorWithMat.fGet_Y) & ".");
         AUnit.Assertions.Assert(Condition => abs(pxRotatedVectorWithMat.fGet_Z - pxRotatedVectorWithQuat.fGet_Z) < 0.01,
                                 Message   => "Matrices.pxCreate_From_Quaternion failed, Z component in vector is wrong. Angle: " & float'Image(fAngle) & ". Value: " & float'Image(pxRotatedVectorWithQuat.fGet_Z) & ". Expected: " & float'Image(pxRotatedVectorWithMat.fGet_Z) & ".");
         
         
      end loop;
      
--  begin read only
   end Test_pxCreate_From_Quaternion;
--  end read only


--  begin read only
   procedure Test_pxCreate_Rotation_Around_X_Axis (Gnattest_T : in out Test);
   procedure Test_pxCreate_Rotation_Around_X_Axis_dc136b (Gnattest_T : in out Test) renames Test_pxCreate_Rotation_Around_X_Axis;
--  id:2.1/dc136b6fcd55b227/pxCreate_Rotation_Around_X_Axis/1/0/
   procedure Test_pxCreate_Rotation_Around_X_Axis (Gnattest_T : in out Test) is
   --  math-matrices.ads:16:4:pxCreate_Rotation_Around_X_Axis
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxOriginalVector : Math.Vectors.pCVector;
      pxRotatedVector : Math.Vectors.pCVector;

      pxRotMatrix : pCMatrix;
      fAngle : float;
      fNewAngle : float;
   begin
      
      pxOriginalVector := Math.Vectors.pxCreate(fX => 0.0,
                                                fY => 0.0,
                                                fZ => 1.0);

      for i in 1 .. 360
      loop
         fAngle := float(i - 180);
         pxRotMatrix := Math.Matrices.pxCreate_Rotation_Around_X_Axis(tfAngle => Math.Angles.TAngle(fAngle));
         pxRotatedVector := pxRotMatrix * pxOriginalVector;
         fNewAngle := Math.Vectors.fAngle_Between(pxOriginalVector, pxRotatedVector);
         fNewAngle := Math.Angles.fRadians_To_Degrees(fNewAngle);

         if fAngle /= 0.0 then
            fNewAngle := abs(fNewAngle) * (fAngle/abs(fAngle));
         end if;
         
         
         AUnit.Assertions.Assert(Condition => abs(fAngle - fNewAngle) < 0.001,
                                 Message   => "CMatrix.pxCreate_Rotation_Around_X_Axis failed, wrong angle. Value: " & float'Image(fNewAngle) & ". Expected: " & float'Image(fAngle) & ".");
         
         
      end loop;
      

--  begin read only
   end Test_pxCreate_Rotation_Around_X_Axis;
--  end read only


--  begin read only
   procedure Test_pxCreate_Rotation_Around_Y_Axis (Gnattest_T : in out Test);
   procedure Test_pxCreate_Rotation_Around_Y_Axis_1fc26a (Gnattest_T : in out Test) renames Test_pxCreate_Rotation_Around_Y_Axis;
--  id:2.1/1fc26a5b46dacfbe/pxCreate_Rotation_Around_Y_Axis/1/0/
   procedure Test_pxCreate_Rotation_Around_Y_Axis (Gnattest_T : in out Test) is
   --  math-matrices.ads:17:4:pxCreate_Rotation_Around_Y_Axis
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxOriginalVector : Math.Vectors.pCVector;
      pxRotatedVector : Math.Vectors.pCVector;

      pxRotMatrix : pCMatrix;
      fAngle : float;
      fNewAngle : float;
   begin
      
      pxOriginalVector := Math.Vectors.pxCreate(fX => 0.0,
                                                fY => 0.0,
                                                fZ => 1.0);

      for i in 1 .. 360
      loop
         fAngle := float(i - 180);
         pxRotMatrix := Math.Matrices.pxCreate_Rotation_Around_Y_Axis(tfAngle => Math.Angles.TAngle(fAngle));
         pxRotatedVector := pxRotMatrix * pxOriginalVector;
         fNewAngle := Math.Vectors.fAngle_Between(pxOriginalVector, pxRotatedVector);
         fNewAngle := Math.Angles.fRadians_To_Degrees(fNewAngle);

         if fAngle /= 0.0 then
            fNewAngle := abs(fNewAngle) * (fAngle/abs(fAngle));
         end if;
         
         
         AUnit.Assertions.Assert(Condition => abs(fAngle - fNewAngle) < 0.001,
                                 Message   => "CMatrix.pxCreate_Rotation_Around_Y_Axis failed, wrong angle. Value: " & float'Image(fNewAngle) & ". Expected: " & float'Image(fAngle) & ".");
         
         
      end loop;
      

--  begin read only
   end Test_pxCreate_Rotation_Around_Y_Axis;
--  end read only


--  begin read only
   procedure Test_pxCreate_Rotation_Around_Z_Axis (Gnattest_T : in out Test);
   procedure Test_pxCreate_Rotation_Around_Z_Axis_0d121c (Gnattest_T : in out Test) renames Test_pxCreate_Rotation_Around_Z_Axis;
--  id:2.1/0d121c8183192933/pxCreate_Rotation_Around_Z_Axis/1/0/
   procedure Test_pxCreate_Rotation_Around_Z_Axis (Gnattest_T : in out Test) is
   --  math-matrices.ads:18:4:pxCreate_Rotation_Around_Z_Axis
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxOriginalVector : Math.Vectors.pCVector;
      pxRotatedVector : Math.Vectors.pCVector;

      pxRotMatrix : pCMatrix;
      fAngle : float;
      fNewAngle : float;
   begin
      
      pxOriginalVector := Math.Vectors.pxCreate(fX => 0.0,
                                                fY => 1.0,
                                                fZ => 0.0);

      for i in 1 .. 360
      loop
         fAngle := float(i - 180);
         pxRotMatrix := Math.Matrices.pxCreate_Rotation_Around_Z_Axis(tfAngle => Math.Angles.TAngle(fAngle));
         pxRotatedVector := pxRotMatrix * pxOriginalVector;
         fNewAngle := Math.Vectors.fAngle_Between(pxOriginalVector, pxRotatedVector);
         fNewAngle := Math.Angles.fRadians_To_Degrees(fNewAngle);

         if fAngle /= 0.0 then
            fNewAngle := abs(fNewAngle) * (fAngle/abs(fAngle));
         end if;
         
         
         AUnit.Assertions.Assert(Condition => abs(fAngle - fNewAngle) < 0.001,
                                 Message   => "CMatrix.pxCreate_Rotation_Around_Z_Axis failed, wrong angle. Value: " & float'Image(fNewAngle) & ". Expected: " & float'Image(fAngle) & ".");
         
         
      end loop;

--  begin read only
   end Test_pxCreate_Rotation_Around_Z_Axis;
--  end read only


--  begin read only
   procedure Test_pxCreate_Identity (Gnattest_T : in out Test);
   procedure Test_pxCreate_Identity_4ca1dd (Gnattest_T : in out Test) renames Test_pxCreate_Identity;
--  id:2.1/4ca1ddd48ff74b85/pxCreate_Identity/1/0/
   procedure Test_pxCreate_Identity (Gnattest_T : in out Test) is
   --  math-matrices.ads:19:4:pxCreate_Identity
--  end read only

      pragma Unreferenced (Gnattest_T);

      tfMatrix : TMatrix;
      pxNewMatrix : pCMatrix;
   begin

      tfMatrix := ((1.0,0.0,0.0),(0.0,1.0,0.0),(0.0,0.0,1.0));
      pxNewMatrix := Math.Matrices.pxCreate_Identity;

      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            AUnit.Assertions.Assert(Condition => pxNewMatrix.tfMatrix(i,j) = tfMatrix(i,j),
                                    Message   => "CMatrix.pxCreate_Identity failed, wrong value in (" & integer'Image(i) & "," & integer'Image(j) & "). Value: " & float'Image(pxNewMatrix.tfMatrix(i,j)) & ". Expected: " & float'Image(tfMatrix(i,j)) & ".");
         end loop;
      end loop;

--  begin read only
   end Test_pxCreate_Identity;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_23e020 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/23e0209614501591/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  math-matrices.ads:20:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      tfMatrix : TMatrix;
      pxNewMatrix : pCMatrix;
   begin

      tfMatrix := ((1.0,2.0,3.0),(4.0,5.0,6.0),(7.0,8.0,9.0));
      pxNewMatrix := Math.Matrices.pxCreate(tfMatrix => tfMatrix);

      AUnit.Assertions.Assert(Condition => tfMatrix'Address /= pxNewMatrix.tfMatrix'Address,
                              Message   => "CMatrix.pxCreate failed, shared address between original tfMatrix and the Matrix' tfMatrix.");

      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            AUnit.Assertions.Assert(Condition => pxNewMatrix.tfMatrix(i,j) = tfMatrix(i,j),
                                    Message   => "CMatrix.pxCreate failed, wrong value in (" & integer'Image(i) & "," & integer'Image(j) & "). Value: " & float'Image(pxNewMatrix.tfMatrix(i,j)) & ". Expected: " & float'Image(tfMatrix(i,j)) & ".");
         end loop;
      end loop;

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_1_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_519195 (Gnattest_T : in out Test) renames Test_1_Multiply;
--  id:2.1/519195d06a3006e3/Multiply/1/0/
   procedure Test_1_Multiply (Gnattest_T : in out Test) is
   --  math-matrices.ads:22:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftOperandMatrix : pCMatrix;
      pxRightOperandMatrix : pCMatrix;
      pxProductMatrix : pCMatrix;
      tfMatrix : TMatrix;
   begin

      tfMatrix := ((1.0, 2.0, 3.0),
                   (4.0, 5.0, 6.0),
                   (7.0, 8.0, 9.0));
      pxLeftOperandMatrix := Math.Matrices.pxCreate(tfMatrix => tfMatrix);
      tfMatrix := ((3.0, 4.0, 5.0),
                   (6.0, 7.0, 8.0),
                   (3.0, 4.0, 5.0));
      pxRightOperandMatrix := Math.Matrices.pxCreate(tfMatrix => tfMatrix);
      pxProductMatrix := pxLeftOperandMatrix * pxRightOperandMatrix;

      tfMatrix := ((24.0, 30.0, 36.0),
                   (60.0, 75.0, 90.0),
                   (96.0, 120.0, 144.0));

      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            AUnit.Assertions.Assert(Condition => pxProductMatrix.tfMatrix(i,j) = tfMatrix(i,j),
                                    Message   => "CMatrix.*(binary matrix * matrix) failed, wrong value in (" & integer'Image(i) & "," & integer'Image(j) & "). Value: " & float'Image(pxProductMatrix.tfMatrix(i,j)) & ". Expected: " & float'Image(tfMatrix(i,j)) & ".");
         end loop;
      end loop;

--  begin read only
   end Test_1_Multiply;
--  end read only


--  begin read only
   procedure Test_2_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_89b399 (Gnattest_T : in out Test) renames Test_2_Multiply;
--  id:2.1/89b399b1e6416175/Multiply/0/0/
   procedure Test_2_Multiply (Gnattest_T : in out Test) is
   --  math-matrices.ads:23:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

       use Math.Vectors;
      
      pxLeftOperandMatrix : pCMatrix;
      pxRightOperandVector : Math.Vectors.pCVector;
      pxProductVector : Math.Vectors.pCVector;
      tfMatrix : TMatrix;
   begin

      tfMatrix := ((1.0, 2.0, 3.0),
                   (4.0, 5.0, 6.0),
                   (7.0, 8.0, 9.0));
      pxLeftOperandMatrix := Math.Matrices.pxCreate(tfMatrix => tfMatrix);

      pxRightOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                    fY => -5.0,
                                                    fZ => 10.0);
      pxProductVector := pxLeftOperandMatrix * pxRightOperandVector;

      
      pxRightOperandVector := Math.Vectors.pxCreate(fX => 22.0,
                                                    fY => 43.0,
                                                    fZ => 64.0);
      AUnit.Assertions.Assert(Condition => pxProductVector = pxRightOperandVector,
                                    Message   => "CMatrix.*(binary matrix * vector) failed.");


--  begin read only
   end Test_2_Multiply;
--  end read only


--  begin read only
   procedure Test_3_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_a96879 (Gnattest_T : in out Test) renames Test_3_Multiply;
--  id:2.1/a96879e66708ce70/Multiply/0/0/
   procedure Test_3_Multiply (Gnattest_T : in out Test) is
   --  math-matrices.ads:24:4:"*"
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
   procedure Test_Equal (Gnattest_T : in out Test);
   procedure Test_Equal_1c1727 (Gnattest_T : in out Test) renames Test_Equal;
--  id:2.1/1c1727b7e69435f3/Equal/1/0/
   procedure Test_Equal (Gnattest_T : in out Test) is
   --  math-matrices.ads:25:4:"="
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
   procedure Test_Swap_Values_In_Extended_Matrix (Gnattest_T : in out Test);
   procedure Test_Swap_Values_In_Extended_Matrix_d790ab (Gnattest_T : in out Test) renames Test_Swap_Values_In_Extended_Matrix;
--  id:2.1/d790ab373c6b2b67/Swap_Values_In_Extended_Matrix/1/0/
   procedure Test_Swap_Values_In_Extended_Matrix (Gnattest_T : in out Test) is
   --  math-matrices.ads:41:4:Swap_Values_In_Extended_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      fValueOld1 : float;
      fValueOld2 : float;
      fValueNew1 : float;
      fValueNew2 : float;
      
   begin

      for i in -100 .. 100
      loop
         fValueOld1 := float(i);
         fValueOld2 := float(i)*(-1.0);
         fValueNew1 := fValueOld1;
         fValueNew2 := fValueOld2;
         Math.Matrices.Swap_Values_In_Extended_Matrix(fValueNew1, fValueNew2);
         AUnit.Assertions.Assert(Condition => fValueOld1 = fValueNew2,
                                 Message   => "Matrices.Swap_Values_In_Extended_Matrix failed, first check failed.");
         AUnit.Assertions.Assert(Condition => fValueOld2 = fValueNew1,
                                 Message   => "Matrices.Swap_Values_In_Extended_Matrix failed, second check failed.");
         
      end loop;
      

--  begin read only
   end Test_Swap_Values_In_Extended_Matrix;
--  end read only


--  begin read only
   procedure Test_Swap_Rows_In_Extended_Matrix (Gnattest_T : in out Test);
   procedure Test_Swap_Rows_In_Extended_Matrix_e8fd17 (Gnattest_T : in out Test) renames Test_Swap_Rows_In_Extended_Matrix;
--  id:2.1/e8fd17c37874e11a/Swap_Rows_In_Extended_Matrix/1/0/
   procedure Test_Swap_Rows_In_Extended_Matrix (Gnattest_T : in out Test) is
   --  math-matrices.ads:42:4:Swap_Rows_In_Extended_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      tfExtendedMatrixOld : TExtendedMatrix;
      tfExtendedMatrixNew : TExtendedMatrix;
   begin
      
      tfExtendedMatrixOld := ((1.0,2.0,3.0,4.0,5.0,6.0),
                               (7.0,8.0,9.0,10.0,11.0,12.0),
                              (13.0,14.0,15.0,16.0,17.0,18.0));
      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            tfExtendedMatrixNew := ((1.0,2.0,3.0,4.0,5.0,6.0),
                                    (7.0,8.0,9.0,10.0,11.0,12.0),
                                    (13.0,14.0,15.0,16.0,17.0,18.0));
            Math.Matrices.Swap_Rows_In_Extended_Matrix(tfExtendedMatrix => tfExtendedMatrixNew,
                                                       iRow1            => i,
                                                       iRow2            => j);
            for a in 1 .. 6
            loop
               AUnit.Assertions.Assert(Condition => tfExtendedMatrixOld(i,a) = tfExtendedMatrixNew(j,a),
                                       Message   => "Matrices.Swap_Rows_In_Extended_Matrix failed. Rows swapped: " & integer'Image(i) & " <-> " & integer'Image(j) & ". Value: " & float'Image(tfExtendedMatrixNew(j,a)) & ". Expected: " & float'Image(tfExtendedMatrixOld(i,a)) & ".");
               
            end loop;
         end loop;
      end loop;
      


--  begin read only
   end Test_Swap_Rows_In_Extended_Matrix;
--  end read only


--  begin read only
   procedure Test_Scale_Row_In_Extended_Matrix (Gnattest_T : in out Test);
   procedure Test_Scale_Row_In_Extended_Matrix_51dfbc (Gnattest_T : in out Test) renames Test_Scale_Row_In_Extended_Matrix;
--  id:2.1/51dfbc1174bc677d/Scale_Row_In_Extended_Matrix/1/0/
   procedure Test_Scale_Row_In_Extended_Matrix (Gnattest_T : in out Test) is
   --  math-matrices.ads:43:4:Scale_Row_In_Extended_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      tfExtendedMatrix : TExtendedMatrix;
      tfScaledMatrix : TExtendedMatrix;
   begin
      tfExtendedMatrix := ((3.0,9.0,12.0,27.0,30.0,6.0),
                          (0.0,2.0,4.0,8.0,6.0,20.0),
                         (0.0,0.0,15.0,30.0,60.0,150.0));
      tfScaledMatrix := ((1.0,3.0,4.0,9.0,10.0,2.0),
                          (0.0,1.0,2.0,4.0,3.0,10.0),
                         (0.0,0.0,1.0,2.0,4.0,10.0));
      

      
      for iY in 1 .. 3
      loop
      
         Math.Matrices.Scale_Row_In_Extended_Matrix(tfExtendedMatrix => tfExtendedMatrix,
                                                    iStartingColumn   => iY);

         for iX in 1 .. 6
         loop
            AUnit.Assertions.Assert(Condition => tfExtendedMatrix(iY,iX) = tfScaledMatrix(iY,iX),
                                    Message   => "Matrices.Scale_Row_In_Extended_Matrix failed, wrong value at (" & integer'Image(iY) & "," & integer'Image(iX) & "). Value: " & float'Image(tfExtendedMatrix(iY,iX)) & ". Expected: " & float'Image(tfScaledMatrix(iY,iX)) & ".");
         end loop;        
      end loop;
      
      

--  begin read only
   end Test_Scale_Row_In_Extended_Matrix;
--  end read only


--  begin read only
   procedure Test_Remove_Component_In_Following_Rows (Gnattest_T : in out Test);
   procedure Test_Remove_Component_In_Following_Rows_6495d3 (Gnattest_T : in out Test) renames Test_Remove_Component_In_Following_Rows;
--  id:2.1/6495d3336c05d94a/Remove_Component_In_Following_Rows/1/0/
   procedure Test_Remove_Component_In_Following_Rows (Gnattest_T : in out Test) is
   --  math-matrices.ads:44:4:Remove_Component_In_Following_Rows
--  end read only

      pragma Unreferenced (Gnattest_T);

      tfExtendedMatrix : TExtendedMatrix;
      tfScaledMatrix : TExtendedMatrix;
   begin
      tfExtendedMatrix := ((1.0,9.0,12.0,27.0,30.0,6.0),
                          (6.0,2.0,4.0,8.0,6.0,20.0),
                         (9.0,2.0,15.0,30.0,60.0,150.0));
      tfScaledMatrix := ((1.0,9.0,12.0,27.0,30.0,6.0),
                          (0.0,-52.0,-68.0,-154.0,-174.0,-16.0),
                         (0.0,-79.0,-93.0,-213.0,-210.0,96.0));
      
--        tfExtendedMatrix := ((3.0,9.0,12.0,27.0,30.0,6.0),
--                            (6.0,2.0,4.0,8.0,6.0,20.0),
--                           (9.0,2.0,15.0,30.0,60.0,150.0));
--        tfScaledMatrix := ((3.0,9.0,12.0,27.0,30.0,6.0),
--                            (0.0,-1.0,0.0,-1.0,-4.0,18.0),
--                           (0.0,-25.0,-21.0,-51.0,-84.0,2.0));
--        


      
      Math.Matrices.Remove_Component_In_Following_Rows(tfExtendedMatrix => tfExtendedMatrix,
                                                       iRow             => 1);

      for iY in 1 .. 3
      loop
         for iX in 1 .. 6
         loop
            AUnit.Assertions.Assert(Condition => tfExtendedMatrix(iY,iX) = tfScaledMatrix(iY,iX),
                                    Message   => "Matrices.Remove_Component_In_Following_Rows failed, wrong value at (" & integer'Image(iY) & "," & integer'Image(iX) & "). Value: " & float'Image(tfExtendedMatrix(iY,iX)) & ". Expected: " & float'Image(tfScaledMatrix(iY,iX)) & ".");
         end loop;        
      end loop;
      

--  begin read only
   end Test_Remove_Component_In_Following_Rows;
--  end read only


--  begin read only
   procedure Test_Remove_Component_In_Leading_Rows (Gnattest_T : in out Test);
   procedure Test_Remove_Component_In_Leading_Rows_4f91f1 (Gnattest_T : in out Test) renames Test_Remove_Component_In_Leading_Rows;
--  id:2.1/4f91f1bfc85381f1/Remove_Component_In_Leading_Rows/1/0/
   procedure Test_Remove_Component_In_Leading_Rows (Gnattest_T : in out Test) is
   --  math-matrices.ads:45:4:Remove_Component_In_Leading_Rows
--  end read only

      pragma Unreferenced (Gnattest_T);


      tfExtendedMatrix : TExtendedMatrix;
      tfScaledMatrix : TExtendedMatrix;
   begin
      tfExtendedMatrix := ((1.0,9.0,12.0,27.0,30.0,6.0),
                          (0.0,1.0,4.0,2.0,6.0,2.0),
                         (0.0,-79.0,-93.0,-213.0,-210.0,96.0));
      tfScaledMatrix :=         ((1.0,0.0,-24.0,9.0,-24.0,-12.0),
                          (0.0,1.0,4.0,2.0,6.0,2.0),
                         (0.0,-79.0,-93.0,-213.0,-210.0,96.0));

      
--        tfExtendedMatrix := ((3.0,9.0,12.0,27.0,30.0,6.0),
--                            (6.0,2.0,4.0,8.0,6.0,20.0),
--                           (9.0,2.0,15.0,30.0,60.0,150.0));
--        tfScaledMatrix := ((3.0,9.0,12.0,27.0,30.0,6.0),
--                            (0.0,-1.0,0.0,-1.0,-4.0,18.0),
--                           (0.0,-25.0,-21.0,-51.0,-84.0,2.0));
--        


      
      Math.Matrices.Remove_Component_In_Leading_Rows(tfExtendedMatrix => tfExtendedMatrix,
                                                     iRow             => 2);

      for iY in 1 .. 3
      loop
         for iX in 1 .. 6
         loop
            AUnit.Assertions.Assert(Condition => tfExtendedMatrix(iY,iX) = tfScaledMatrix(iY,iX),
                                    Message   => "Matrices.Remove_Component_In_Leading_Rows failed, wrong value at (" & integer'Image(iY) & "," & integer'Image(iX) & "). Value: " & float'Image(tfExtendedMatrix(iY,iX)) & ". Expected: " & float'Image(tfScaledMatrix(iY,iX)) & ".");
         end loop;        
      end loop;
      

--  begin read only
   end Test_Remove_Component_In_Leading_Rows;
--  end read only


--  begin read only
   procedure Test_Find_Row_With_Highest_Component (Gnattest_T : in out Test);
   procedure Test_Find_Row_With_Highest_Component_203fad (Gnattest_T : in out Test) renames Test_Find_Row_With_Highest_Component;
--  id:2.1/203fad08cc0aa40d/Find_Row_With_Highest_Component/1/0/
   procedure Test_Find_Row_With_Highest_Component (Gnattest_T : in out Test) is
   --  math-matrices.ads:46:4:Find_Row_With_Highest_Component
--  end read only

      pragma Unreferenced (Gnattest_T);

      tfExtendedMatrix : TExtendedMatrix;
   begin
      tfExtendedMatrix := ((1.0,9.0,12.0,27.0,30.0,6.0),
                          (18.0,1.0,4.0,2.0,60.0,2.0),
                           (9.0,-79.0,1.0,4.0,10.0,96.0));
      
      AUnit.Assertions.Assert(Condition => Find_Row_With_Highest_Component(tfExtendedMatrix, 1) = 2,
                              Message   => "Matrices.Find_Row_With_Highest_Component failed, wrong value for column 1.");
      AUnit.Assertions.Assert(Condition => Find_Row_With_Highest_Component(tfExtendedMatrix, 2) = 3,
                              Message   => "Matrices.Find_Row_With_Highest_Component failed, wrong value for column 2.");
      AUnit.Assertions.Assert(Condition => Find_Row_With_Highest_Component(tfExtendedMatrix, 3) = 3,
                              Message   => "Matrices.Find_Row_With_Highest_Component failed, wrong value for column 3.");


--  begin read only
   end Test_Find_Row_With_Highest_Component;
--  end read only


--  begin read only
   procedure Test_Perform_Gauss_Jordan_Elimination_On (Gnattest_T : in out Test);
   procedure Test_Perform_Gauss_Jordan_Elimination_On_00378a (Gnattest_T : in out Test) renames Test_Perform_Gauss_Jordan_Elimination_On;
--  id:2.1/00378a185cddf76c/Perform_Gauss_Jordan_Elimination_On/1/0/
   procedure Test_Perform_Gauss_Jordan_Elimination_On (Gnattest_T : in out Test) is
   --  math-matrices.ads:47:4:Perform_Gauss_Jordan_Elimination_On
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Perform_Gauss_Jordan_Elimination_On;
--  end read only


--  begin read only
   procedure Test_tfCreate_Extended_Matrix_From (Gnattest_T : in out Test);
   procedure Test_tfCreate_Extended_Matrix_From_d7fdf5 (Gnattest_T : in out Test) renames Test_tfCreate_Extended_Matrix_From;
--  id:2.1/d7fdf56c22324800/tfCreate_Extended_Matrix_From/1/0/
   procedure Test_tfCreate_Extended_Matrix_From (Gnattest_T : in out Test) is
   --  math-matrices.ads:48:4:tfCreate_Extended_Matrix_From
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMatrix : pCMatrix;
      pxIdentity : pCMatrix;
      pxExtendedMatrix : TExtendedMatrix;
      fXAngle : float;
      fYAngle : float;
      fZAngle : float;
   begin
      pxIdentity := pxCreate_Identity;
      
      for iX in 1 .. 4       
      loop
         fXAngle := (360.0 / float(iX)) - 180.0;
         for iY in 1 .. 4
         loop
            fYAngle := (360.0 / float(iX)) - 180.0;
            for iZ in 1 .. 4
            loop
               fZAngle := (360.0 / float(iX)) - 180.0;               
               pxMatrix := pxCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(fZAngle)) * 
                 pxCreate_Rotation_Around_Y_Axis(Math.Angles.TAngle(fYAngle)) *
                 pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(fXAngle));
               pxExtendedMatrix := tfCreate_Extended_Matrix_From(pxMatrix.tfMatrix);
               for i in 1 .. 3
               loop
                  for j in 1 .. 3
                  loop
                     AUnit.Assertions.Assert(Condition => pxExtendedMatrix(i,j) = pxMatrix.tfMatrix(i,j),
                                             Message   => "Matrices.tfCreate_Extended_Matrix_From failed, wrong value for (" & integer'Image(i) & "," & integer'Image(j) & "). Value: " & float'Image(pxExtendedMatrix(i,j)) & ". Expected: " & float'Image(pxMatrix.tfMatrix(i,j)) & ".");
                     AUnit.Assertions.Assert(Condition => pxExtendedMatrix(i,j+3) = pxIdentity.tfMatrix(i,j),
                                             Message   => "Matrices.tfCreate_Extended_Matrix_From failed, wrong value for (" & integer'Image(i) & "," & integer'Image(j+3) & "). Value: " & float'Image(pxExtendedMatrix(i,j+3)) & ". Expected: " & float'Image(pxIdentity.tfMatrix(i,j)) & ".");
                     
                  end loop;
               end loop;
               
            end loop;
            
         end loop;
         
      end loop;

--  begin read only
   end Test_tfCreate_Extended_Matrix_From;
--  end read only


--  begin read only
   procedure Test_tfGet_Inverse_Part_From (Gnattest_T : in out Test);
   procedure Test_tfGet_Inverse_Part_From_e434a4 (Gnattest_T : in out Test) renames Test_tfGet_Inverse_Part_From;
--  id:2.1/e434a4d0aac93f30/tfGet_Inverse_Part_From/1/0/
   procedure Test_tfGet_Inverse_Part_From (Gnattest_T : in out Test) is
   --  math-matrices.ads:49:4:tfGet_Inverse_Part_From
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxMatrix : pCMatrix;
      pxIdentity : pCMatrix;
      pxExtendedMatrix : TExtendedMatrix;
      tfIdentityPart : TMatrix;
      fXAngle : float;
      fYAngle : float;
      fZAngle : float;
   begin
      pxIdentity := pxCreate_Identity;
      
      for iX in 1 .. 4       
      loop
         fXAngle := (360.0 / float(iX)) - 180.0;
         for iY in 1 .. 4
         loop
            fYAngle := (360.0 / float(iX)) - 180.0;
            for iZ in 1 .. 4
            loop
               fZAngle := (360.0 / float(iX)) - 180.0;               
               pxMatrix := pxCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(fZAngle)) * 
                 pxCreate_Rotation_Around_Y_Axis(Math.Angles.TAngle(fYAngle)) *
                 pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(fXAngle));
               pxExtendedMatrix := tfCreate_Extended_Matrix_From(pxMatrix.tfMatrix);
               tfIdentityPart := Math.Matrices.tfGet_Inverse_Part_From(pxExtendedMatrix);
               for i in 1 .. 3
               loop
                  for j in 1 .. 3
                  loop
                     AUnit.Assertions.Assert(Condition => tfIdentityPart(i,j) = pxIdentity.tfMatrix(i,j),
                                             Message   => "Matrices.tfGet_Inverse_Part_From failed, wrong value for (" & integer'Image(i) & "," & integer'Image(j) & "). Value: " & float'Image(tfIdentityPart(i,j)) & ". Expected: " & float'Image(pxIdentity.tfMatrix(i,j)) & ".");
                     
                  end loop;
               end loop;
               
            end loop;
            
         end loop;
         
      end loop;
--  begin read only
   end Test_tfGet_Inverse_Part_From;
--  end read only


--  begin read only
   procedure Test_bMatrix_Has_No_Inverse (Gnattest_T : in out Test);
   procedure Test_bMatrix_Has_No_Inverse_8de23e (Gnattest_T : in out Test) renames Test_bMatrix_Has_No_Inverse;
--  id:2.1/8de23e19802d9aa9/bMatrix_Has_No_Inverse/1/0/
   procedure Test_bMatrix_Has_No_Inverse (Gnattest_T : in out Test) is
   --  math-matrices.ads:50:4:bMatrix_Has_No_Inverse
--  end read only

      pragma Unreferenced (Gnattest_T);

      fValue : float;
   begin

      fValue := 0.0;
      
      AUnit.Assertions.Assert(Condition => Math.Matrices.bMatrix_Has_No_Inverse(fValue),
                              Message   => "Matrices.bMatrix_Has_No_Inverse failed with value: " & float'Image(fValue));
      
      fValue := -0.0;
      
      AUnit.Assertions.Assert(Condition => Math.Matrices.bMatrix_Has_No_Inverse(fValue),
                              Message   => "Matrices.bMatrix_Has_No_Inverse failed with value: " & float'Image(fValue));

      fValue := 10.0;
      
      AUnit.Assertions.Assert(Condition => not Math.Matrices.bMatrix_Has_No_Inverse(fValue),
                              Message   => "Matrices.bMatrix_Has_No_Inverse failed with value: " & float'Image(fValue));
      
      fValue := -10.0;
      
      AUnit.Assertions.Assert(Condition => not Math.Matrices.bMatrix_Has_No_Inverse(fValue),
                              Message   => "Matrices.bMatrix_Has_No_Inverse failed with value: " & float'Image(fValue));
      

--  begin read only
   end Test_bMatrix_Has_No_Inverse;
--  end read only


--  begin read only
   --  procedure Test_Multiply (Gnattest_T : in out Test_);
   --  procedure Test_Multiply_0bc568 (Gnattest_T : in out Test_) renames Test_Multiply;
--  id:2.1/0bc568aae554970f/Multiply/0/1/
   --  procedure Test_Multiply (Gnattest_T : in out Test_) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--        use Math.Rotators;
--  
--        pxRightOperandRotator : Math.Rotators.pCRotator;
--        pxLeftOperandMatrix : pCMatrix;
--        pxProductRotator : Math.Rotators.pCRotator;
--     begin
--  
--        pxRightOperandRotator := Math.Rotators.pxCreate(fYaw   => 45.0,
--                                                        fPitch => 0.0,
--                                                        fRoll  => 0.0);
--        pxLeftOperandMatrix := Math.Matrices.pxCreate_Rotation_Around_Z_Axis(tfAngle => 1.0);
--        
--        pxProductRotator := pxLeftOperandMatrix * pxRightOperandRotator;
--        
--  
--        AUnit.Assertions.Assert(Condition => float(pxProductRotator.tfGet_Yaw) = 90.0,
--                                      Message   => "CMatrix.*(binary matrix * rotator), wrong value in yaw. Value: " & float'Image(float(pxProductRotator.tfGet_Roll)) & ". Expected: " & float'Image(90.0) & ".");
--  
--  begin read only
   --  end Test_Multiply;
--  end read only


--  begin read only
   --  procedure Test_Multiply (Gnattest_T : in out Test_);
   --  procedure Test_Multiply_27d2dc (Gnattest_T : in out Test_) renames Test_Multiply;
--  id:2.1/27d2dc5916b25a8e/Multiply/0/1/
   --  procedure Test_Multiply (Gnattest_T : in out Test_) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--     begin
--  
--        AUnit.Assertions.Assert
--          (Gnattest_Generated.Default_Assert_Value,
--           "Test not implemented.");
--  
--  begin read only
   --  end Test_Multiply;
--  end read only


--  begin read only
   --  procedure Test_pxCreate_From_Rotator (Gnattest_T : in out Test_);
   --  procedure Test_pxCreate_From_Rotator_7cf7c8 (Gnattest_T : in out Test_) renames Test_pxCreate_From_Rotator;
--  id:2.1/7cf7c8677930ae54/pxCreate_From_Rotator/1/1/
   --  procedure Test_pxCreate_From_Rotator (Gnattest_T : in out Test_) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--     begin
--  
--        AUnit.Assertions.Assert
--          (Gnattest_Generated.Default_Assert_Value,
--           "Test not implemented.");
--  
--  begin read only
   --  end Test_pxCreate_From_Rotator;
--  end read only


--  begin read only
   --  procedure Test_Multiply (Gnattest_T : in out Test_);
   --  procedure Test_Multiply_82bc09 (Gnattest_T : in out Test_) renames Test_Multiply;
--  id:2.1/82bc09ebb76c2479/Multiply/0/1/
   --  procedure Test_Multiply (Gnattest_T : in out Test_) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--     begin
--  
--        AUnit.Assertions.Assert
--          (Gnattest_Generated.Default_Assert_Value,
--           "Test not implemented.");
--  
--  begin read only
   --  end Test_Multiply;
--  end read only


--  begin read only
   --  procedure Test_Multiply (Gnattest_T : in out Test_);
   --  procedure Test_Multiply_ddb4ca (Gnattest_T : in out Test_) renames Test_Multiply;
--  id:2.1/ddb4cab884764c67/Multiply/0/1/
   --  procedure Test_Multiply (Gnattest_T : in out Test_) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--     begin
--  
--        AUnit.Assertions.Assert
--          (Gnattest_Generated.Default_Assert_Value,
--           "Test not implemented.");
--  
--  begin read only
   --  end Test_Multiply;
--  end read only

end Math.Matrices.Test_Data.Tests;
