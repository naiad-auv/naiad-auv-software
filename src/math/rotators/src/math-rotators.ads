with Math.Vectors;
with Math.Angles;
with Math.Matrices;

package Math.Rotators is

   type CRotator is tagged private;
   type pCRotator is access CRotator;


   function pxCreate(fYaw : in float; fPitch : in float; fRoll : in float) return pCRotator;
   function pxCreate_From_Matrix(pxMatrix : in Math.Matrices.pCMatrix) return pCRotator;


   function "+" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator;
   function "-" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator;
   function "*" (pxLeftOperandMatrix : in Math.Matrices.pCMatrix; pxRightOperandRotator : in pCRotator) return pCRotator;


   function tfGet_Yaw (this : in CRotator) return Math.Angles.TAngle;
   function tfGet_Pitch (this : in CRotator) return Math.Angles.TAngle;
   function tfGet_Roll (this : in CRotator) return Math.Angles.TAngle;

   type ERotatorAngleName is (Yaw, Pitch, Roll);
   type TRotatorAngles is array (Yaw .. Roll) of Math.Angles.TAngle;

private
   procedure Set_Rotator_Angle(this : in out CRotator; eAngle : ERotatorAngleName; fAngle : float);
   procedure Set_Rotator_Angles_From_Matrix(this : in out CRotator; pxMatrix : Math.Matrices.pCMatrix);

   function fSafeArcsin(X : float) return float;
   type CRotator is tagged
      record
         tAngles : TRotatorAngles;
      end record;
end Math.Rotators;
