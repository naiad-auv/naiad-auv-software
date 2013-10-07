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
   function pxCreate_Rotation_Around_X_Axis (tfAngle : in Math.Angles.TAngle) return pCMatrix;
   function pxCreate_Rotation_Around_Y_Axis (tfAngle : in Math.Angles.TAngle) return pCMatrix;
   function pxCreate_Rotation_Around_Z_Axis (tfAngle : in Math.Angles.TAngle) return pCMatrix;
   function pxCreate_Identity return pCMatrix;
   function pxCreate (tfMatrix : in TMatrix) return pCMatrix;

   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pCMatrix) return pCMatrix;
   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandVector : in Math.Vectors.pCVector) return Math.Vectors.pCVector;
   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandPlane : in Math.Planes.pCPlane) return Math.Planes.pCPlane;

   function pxGet_Inverse (this : in CMatrix) return pCMatrix;
   function pxGet_Copy (this : in CMatrix) return pCMatrix;
   function pxGet_Transpose (this : in CMatrix) return pCMatrix;


private
   type CMatrix is tagged
      record
         tfMatrix : TMatrix;
      end record;

end Math.Matrices;
