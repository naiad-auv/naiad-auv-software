with Math;
with Math.Quaternions;
with Math.Vectors;
with Math.Planes;
with System; use System;
with Math.Angles;


package Math.Matrices is
   type CMatrix is tagged private;
   type pCMatrix is access CMatrix;

   type TMatrix is array(1 .. 3, 1 .. 3) of float;

   function pxCreate_From_Quaternion (pxFromQuaternion : in Math.Quaternions.pCQuaternion) return pCMatrix;
   function pxCreate_Rotation_Around_X_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return pCMatrix;
   function pxCreate_Rotation_Around_Y_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return pCMatrix;
   function pxCreate_Rotation_Around_Z_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return pCMatrix;
   function pxCreate_Identity return pCMatrix;
   function pxCreate (tfMatrix : in TMatrix) return pCMatrix;

   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pCMatrix) return pCMatrix;
   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandVector : in Math.Vectors.pCVector) return Math.Vectors.pCVector;
   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandPlane : in Math.Planes.pCPlane) return Math.Planes.pCPlane;
   function "=" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pCMatrix) return boolean;

   function pxGet_Inverse (this : in CMatrix) return pCMatrix;
   function pxGet_Copy (this : in CMatrix) return pCMatrix;
   function pxGet_Transpose (this : in CMatrix) return pCMatrix;
   function tfGet_Raw_Matrix (this : in CMatrix) return TMatrix;
   function fGet_Determinant (this : in CMatrix) return float;

   function pxGet_X_Vector (this : in CMatrix) return Math.Vectors.pCVector;
   function pxGet_Y_Vector (this : in CMatrix) return Math.Vectors.pCVector;
   function pxGet_Z_Vector (this : in CMatrix) return Math.Vectors.pCVector;


private
   type TExtendedMatrix is array(1 .. 3, 1 .. 6) of float;
   type CMatrix is tagged
      record
         tfMatrix : TMatrix;
      end record;

   procedure Swap_Values_In_Extended_Matrix(fValue1 : in out float; fValue2 : in out float);
   procedure Swap_Rows_In_Extended_Matrix(tfExtendedMatrix : in out TExtendedMatrix; iRow1 : in integer; iRow2 : in integer);
   procedure Scale_Row_In_Extended_Matrix(tfExtendedMatrix : in out TExtendedMatrix; iStartingColumn : in integer);
   procedure Remove_Component_In_Following_Rows(tfExtendedMatrix : in out TExtendedMatrix; iRow : in integer);
   procedure Remove_Component_In_Leading_Rows(tfExtendedMatrix : in out TExtendedMatrix; iRow : in integer);
   function Find_Row_With_Highest_Component(tfExtendedMatrix : in TExtendedMatrix; iColumn : in integer) return integer;
   procedure Perform_Gauss_Jordan_Elimination_On(tfExtendedMatrix : in out TExtendedMatrix);
   function tfCreate_Extended_Matrix_From(tfMatrix : in TMatrix) return TExtendedMatrix;
   function tfGet_Inverse_Part_From(tfExtendedMatrix : in TExtendedMatrix) return TMatrix;
   function bMatrix_Has_No_Inverse(fValue : in float) return boolean;

end Math.Matrices;
