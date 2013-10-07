with Math.Vectors;
with Math.Angles;
with Math.Matrices;

package Math.Rotators is

   type CRotator is tagged private;
   type pCRotator is access CRotator;


   function pxCreate(fYaw : in float; fPitch : in float; fRoll : in float) return pCRotator;

   function "+" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator;
   function "-" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator;
--   function "*" (pxLeftOperandMatrix : in Math.Matrices.pCMatrix; pxRightOperandRotator : in pCRotator) return pCRotator;


   function tfGet_Yaw (this : in CRotator) return Math.Angles.TAngle;
   function tfGet_Pitch (this : in CRotator) return Math.Angles.TAngle;
   function tfGet_Roll (this : in CRotator) return Math.Angles.TAngle;

   type ERotatorAngleName is (Yaw, Pitch, Roll);
   type TRotatorAngles is array (Yaw .. Roll) of Math.Angles.TAngle;

private
   type TMatrixArray is array (1 .. 3) of Math.Matrices.pCMatrix;
   type TVectorArray is array (1 .. 3) of Math.Vectors.pCVector;
   type TFloatArray is array (1 .. 3) of float;
   function fGet_Angle_In_Range(fAngle : in float; fRangeFrom : in float) return float;
   procedure Set_Rotator_Angle(this : in out CRotator; eAngle : ERotatorAngleName; fAngle : float);
   function fGet_Signed_Angle(fAngle : in float; pxCrossVector : in Math.Vectors.pCVector; pxComparisonVector : in Math.Vectors.pCVector; pxAxisVector : in Math.Vectors.pCVector) return float;

   procedure Make_Rotator_Angles(pxAxisMatrices : TMatrixArray; pxAxisVectors : TVectorArray; fAngles : out TFloatArray);
   type CRotator is tagged
      record
         tAngles : TRotatorAngles;
         pxXRotMatrix : Math.Matrices.pCMatrix;
         pxYRotMatrix : Math.Matrices.pCMatrix;
         pxZRotMatrix : Math.Matrices.pCMatrix;
      end record;
end Math.Rotators;
