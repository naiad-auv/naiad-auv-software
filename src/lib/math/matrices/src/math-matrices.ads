with Math;
with Math.Quaternions;
with Math.Vectors;
with Math.Planes;
with System; -- use System;
with Math.Angles;
with Ada.Exceptions;
with Ada.Numerics.Elementary_Functions;

-- Matrices package for classes, types and functionality regarding 3x3 rotation matrices. A 3x3 rotation matrix object is stored in a pCMatrix variable and is created with the different pxCreate functions.
package Math.Matrices is

   type CMatrix is tagged private;
   --  <summary>Class for 3x3 rotation matrix.</summary>

   type pCMatrix is access CMatrix;
   --  <summary>Pointer type for object of type CMatrix. Objects of type CMatrix should always be stored in variables of this type.</summary>

   type TMatrix is array(1 .. 3, 1 .. 3) of float;
   --  <summary>Primitive type for a 3x3 rotation matrix. A CMatrix object can be created directly from a variable of this type using pxCreate.</summary>

   function pxCreate_From_Quaternion (pxFromQuaternion : in Math.Quaternions.pCQuaternion) return pCMatrix;
   --  <summary>Creates an object of type CMatrix based on a quaternion. Returns a pointer of type pCMatrix to the object created.</summary>
   --  <parameter name="pxFromQuaternion">The quaternion used to create the rotation matrix.</parameter>
   --  <exception>Numeric_Error if pxFromQuaternion is not a unit quaternion (length /= 1.0).</exception>

   function pxCreate_Rotation_Around_X_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return pCMatrix;
   --  <summary>Creates an object of type CMatrix with tfAngleInDegrees rotation around the X-axis. Returns a pointer of type pCMatrix to the object created.</summary>
   --  <parameter name="tfAngleInDegrees">The angle of rotation.</parameter>
   --  <seealso>pxCreate_Rotation_Around_Y_Axis, pxCreate_Rotation_Around_Z_Axis</seealso>

   function pxCreate_Rotation_Around_Y_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return pCMatrix;
   --  <summary>Creates an object of type CMatrix with tfAngleInDegrees rotation around the Y-axis. Returns a pointer of type pCMatrix to the object created.</summary>
   --  <parameter name="tfAngleInDegrees">The angle of rotation.</parameter>
   --  <seealso>pxCreate_Rotation_Around_X_Axis, pxCreate_Rotation_Around_Z_Axis</seealso>

   function pxCreate_Rotation_Around_Z_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return pCMatrix;
   --  <summary>Creates an object of type CMatrix with tfAngleInDegrees rotation around the Z-axis. Returns a pointer of type pCMatrix to the object created.</summary>
   --  <parameter name="tfAngleInDegrees">The angle of rotation.</parameter>
   --  <seealso>pxCreate_Rotation_Around_X_Axis, pxCreate_Rotation_Around_Y_Axis</seealso>

   function pxCreate_Identity return pCMatrix;
   --  <summary>Creates an object of type CMatrix representing the identity matrix. Returns a pointer of type pCMatrix to the object created.</summary>

   function pxCreate (tfMatrix : in TMatrix) return pCMatrix;
   --  <summary>Creates an object of type CMatrix from tfMatrix. Returns a pointer of type pCMatrix to the object created. This can be used to specify each element in the matrix.</summary>
   --  <parameter name="tfMatrix">The raw matrix.</parameter>

   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pCMatrix) return pCMatrix;
   --  <summary>Creates an object of type CMatrix with pxLeftOperandMatrix multiplied by pxRightOperandMatrix. Returns a pointer of type pCMatrix to the object created.</summary>
   --  <parameter name="pxLeftOperandMatrix">Left operand matrix for operation.</parameter>
   --  <parameter name="pxRightOperandMatrix">Right operand matrix for operation.</parameter>

   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandVector : in Math.Vectors.pCVector) return Math.Vectors.pCVector;
   --  <summary>Creates an object of type CVector with pxRightOperandVector multiplied by pxLeftOperandMatrix. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="pxLeftOperandMatrix">Left operand matrix for operation.</parameter>
   --  <parameter name="pxRightOperandVector">Right operand vector for operation.</parameter>

   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandPlane : in Math.Planes.pCPlane) return Math.Planes.pCPlane;
   --  <summary>Creates an object of type CPlane with pxRightOperandPlane multiplied by pxLeftOperandMatrix. Returns a pointer of type pCPlane to the object created.</summary>
   --  <parameter name="pxLeftOperandMatrix">Left operand matrix for operation.</parameter>
   --  <parameter name="pxRightOperandPlane">Right operand plane for operation.</parameter>

   function "=" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pCMatrix) return boolean;
   --  <summary>Returns true if pxLeftOperandMatrix's elements are equal to pxRightOperandMatrix's elements, otherwise returns false.</summary>
   --  <parameter name="pxLeftOperandMatrix">Left operand matrix for operation.</parameter>
   --  <parameter name="pxRightOperandMatrix">Right operand matrix for operation.</parameter>

   function pxGet_Inverse (this : in CMatrix) return pCMatrix;
   --  <summary>Creates an object of type CMatrix representing the inverse of the CMatrix called on. Returns a pointer of type pCMatrix to the object created.</summary>
   --  <parameter name="this">The CMatrix object to get the inverse of.</parameter>
   --  <exception>Numeric_Error if the object called on has no inverse (matrix is singular).</exception>

   function pxGet_Copy (this : in CMatrix) return pCMatrix;
   --  <summary>Creates an object of type CMatrix with the same elements as the object called on. Returns a pointer of type pCMatrix to the object created.</summary>
   --  <parameter name="this">The CMatrix object to get a copy of.</parameter>

   function pxGet_Transpose (this : in CMatrix) return pCMatrix;
   --  <summary>Creates an object of type CMatrix with representing the transpose of the object called on. Returns a pointer of type pCMatrix to the object created.</summary>
   --  <parameter name="this">The CMatrix object to get the transpose of.</parameter>

   function tfGet_Raw_Matrix (this : in CMatrix) return TMatrix;
   --  <summary>Creates and returns an object of type TMatrix containing the elements of the object called on.</summary>
   --  <parameter name="this">The CMatrix object to get the elements of.</parameter>

   function fGet_Determinant (this : in CMatrix) return float;
   --  <summary>Calculates and returns the determinant of the matrix called on.</summary>

   function pxGet_X_Vector (this : in CMatrix) return Math.Vectors.pCVector;
   --  <summary>Creates an object of type CVector containing the X-vector of the matrix called on. Returns a pointer of type pCVector to the object created.</summary>

   function pxGet_Y_Vector (this : in CMatrix) return Math.Vectors.pCVector;
   --  <summary>Creates an object of type CVector containing the Y-vector of the matrix called on. Returns a pointer of type pCVector to the object created.</summary>

   function pxGet_Z_Vector (this : in CMatrix) return Math.Vectors.pCVector;
   --  <summary>Creates an object of type CVector containing the Z-vector of the matrix called on. Returns a pointer of type pCVector to the object created.</summary>

   procedure Copy_From(this : in out CMatrix; pxSourceMatrix : in pCMatrix);
   --  <summary>Copies the elements from pxSourceMatrix to the object called on.</summary>
   --  <parameter name="this">The CMatrix object to copy the elements to.</parameter>
   --  <parameter name="pxSourceMatrix">A pointer to the CMatrix object to copy the elements from.</parameter>


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
