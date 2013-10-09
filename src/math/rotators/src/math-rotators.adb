with Ada.Numerics.Elementary_Functions;
with Ada.Numerics;
with Ada.Text_IO;

package body Math.Rotators is



   function pxCreate(fYaw : in float; fPitch : in float; fRoll : in float) return pCRotator is

      pxNewRotator : pCRotator;

      fAngles : array (Yaw .. Roll) of float;
   begin

      pxNewRotator := new CRotator;

      fAngles(Yaw) := Math.Angles.fGet_Angle_Degrees_In_Range(fYaw,-180.0);
      pxNewRotator.Set_Rotator_Angle(eAngle => Yaw,
                                     fAngle => fAngles(Yaw));

      fAngles(Pitch) := Math.Angles.fGet_Angle_Degrees_In_Range(fPitch,-180.0);
      pxNewRotator.Set_Rotator_Angle(eAngle => Pitch,
                                     fAngle => fAngles(Pitch));

      fAngles(Roll) := Math.Angles.fGet_Angle_Degrees_In_Range(fRoll,-180.0);
      pxNewRotator.Set_Rotator_Angle(eAngle => Roll,
                                     fAngle => fAngles(Roll));


      return pxNewRotator;
   end pxCreate;

   function pxCreate_From_Matrix(pxMatrix : in Math.Matrices.pCMatrix) return pCRotator is
      pxNewRotator : pCRotator;
   begin
      pxNewRotator := new CRotator;
      pxNewRotator.Set_Rotator_Angles_From_Matrix(pxMatrix => pxMatrix);
      return pxNewRotator;
   end pxCreate_From_Matrix;



   function "+" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator is
      pxSumRotator : pCRotator;
   begin
      pxSumRotator := Math.Rotators.pxCreate(fYaw   => float(pxLeftOperandRotator.tAngles(Yaw)) + float(pxRightOperandRotator.tAngles(Yaw)),
                                             fPitch => float(pxLeftOperandRotator.tAngles(Pitch)) + float(pxRightOperandRotator.tAngles(Pitch)),
                                             fRoll  => float(pxLeftOperandRotator.tAngles(Roll)) + float(pxRightOperandRotator.tAngles(Roll)));
      return pxSumRotator;
   end "+";

   function "-" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator is
      pxDifferenceRotator : pCRotator;
   begin
      pxDifferenceRotator := Math.Rotators.pxCreate(fYaw   => float(pxLeftOperandRotator.tAngles(Yaw)) - float(pxRightOperandRotator.tAngles(Yaw)),
                                                    fPitch => float(pxLeftOperandRotator.tAngles(Pitch)) - float(pxRightOperandRotator.tAngles(Pitch)),
                                                    fRoll  => float(pxLeftOperandRotator.tAngles(Roll)) - float(pxRightOperandRotator.tAngles(Roll)));
      return pxDifferenceRotator;
   end "-";


   function "*" (pxLeftOperandMatrix : in Math.Matrices.pCMatrix; pxRightOperandRotator : in pCRotator) return pCRotator is
      use Math.Matrices;
      pxRotMatrix : Math.Matrices.pCMatrix;
      pxProductRotator : pCRotator;
   begin

      pxRotMatrix := Math.Matrices.pxCreate_Rotation_Around_Z_Axis(pxRightOperandRotator.tfGet_Yaw) *
        Math.Matrices.pxCreate_Rotation_Around_Y_Axis(pxRightOperandRotator.tfGet_Pitch) *
        Math.Matrices.pxCreate_Rotation_Around_X_Axis(pxRightOperandRotator.tfGet_Roll);
      pxRotMatrix := pxLeftOperandMatrix * pxRotMatrix;
      pxProductRotator := new CRotator;
      pxProductRotator.Set_Rotator_Angles_From_Matrix(pxRotMatrix);
      return pxProductRotator;
   end "*";



   function tfGet_Yaw (this : in CRotator) return Math.Angles.TAngle is
   begin
      return this.tAngles(Yaw);
   end tfGet_Yaw;

   function tfGet_Pitch (this : in CRotator) return Math.Angles.TAngle is
   begin
      return this.tAngles(Pitch);
   end tfGet_Pitch;

   function tfGet_Roll (this : in CRotator) return Math.Angles.TAngle is
   begin
      return this.tAngles(Roll);
   end tfGet_Roll;


   procedure Set_Rotator_Angle(this : in out CRotator; eAngle : ERotatorAngleName; fAngle : float) is
   begin
      this.tAngles(eAngle) := Math.Angles.TAngle(Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fAngle,
                                                                                         fRangeFromExclusive => -180.0));
   end Set_Rotator_Angle;






   procedure Set_Rotator_Angles_From_Matrix(this : in out CRotator; pxMatrix : Math.Matrices.pCMatrix) is



      use Math.Matrices;
      use Ada.Numerics.Elementary_Functions;
      use Ada.Numerics;

      pxXColumnVector : Math.Vectors.pCVector;
      pxYColumnVector : Math.Vectors.pCVector;
      pxZColumnVector : Math.Vectors.pCVector;

      fA11 : float;
      fA12 : float;
      fA21 : float;
      fA22 : float;
      fA31 : float;
      fA32 : float;
      fA33 : float;

      fY1 : float;
      fY2 : float;

      fZ11 : float;
      fZ12 : float;
      fZ21 : float;
      fZ22 : float;

      fX11 : float;
      fX12 : float;
      fX21 : float;
      fX22 : float;

      fZ1 : float;
      fZ2 : float;

      fX1 : float;
      fX2 : float;

      fYaw : float;
      fPitch : float;
      fRoll : float;

      fV : float;
      fV1 : float;
      fV2 : float;
      fV3 : float;
      fV4 : float;

   begin
      pxXColumnVector := pxMatrix * Math.Vectors.pxCreate(1.0, 0.0, 0.0);
      pxYColumnVector := pxMatrix * Math.Vectors.pxCreate(0.0, 1.0, 0.0);
      pxZColumnVector := pxMatrix * Math.Vectors.pxCreate(0.0, 0.0, 1.0);

      fA11 := pxXColumnVector.fGet_X;
      fA12 := pxYColumnVector.fGet_X;
      fA21 := pxXColumnVector.fGet_Y;
      fA22 := pxYColumnVector.fGet_Y;
      fA31 := pxXColumnVector.fGet_Z;
      fA32 := pxYColumnVector.fGet_Z;
      fA33 := pxZColumnVector.fGet_Z;


      if abs(fA31) = 1.0 then
         fPitch := fSafeArcsin(-fA31);
         if fPitch > 0.0 then
            fV1 := fSafeArcsin(fA12);
            fV2 := Pi - fV1;
            if abs(Cos(fV1) - fA22) < 0.0001 then
               fV := fV1;
            else
               fV := fV2;
            end if;
            fRoll := 0.0;
            fYaw := fRoll - fV;
         else
            fV3 := fSafeArcsin(-fA12);
            fV4 := Pi - fV3;
            if abs(Cos(fV3) - fA22) < 0.0001 then
               fV := fV3;
            else
               fV := fV4;
            end if;
            fRoll := 0.0;
            fYaw := fV - fRoll;
         end if;
      else

         fY1 := fSafeArcsin(-fA31);
         fY2 := Pi - fY1;

         fZ11 := fSafeArcsin(fA21 / Cos(fY1));
         fZ12 := Pi - fZ11;
         fZ21 := fSafeArcsin(fA21 / Cos(fY2));
         fZ22 := Pi - fZ21;

         if abs((Cos(fZ11) * Cos(fY1)) - fA11) < 0.0001 then
            fZ1 := fZ11;
            fZ2 := fZ22;
         else
            fZ1 := fZ12;
            fZ2 := fZ21;
         end if;

         fX11 := fSafeArcsin(fA32 / Cos(fY1));
         fX12 := Pi - fX11;
         fX21 := fSafeArcsin(fA32 / Cos(fY2));
         fX22 := Pi - fX21;

         if abs((Cos(fX11) * Cos(fY1)) - fA33) < 0.0001 then
            fX1 := fX11;
            fX2 := fX22;
         else
            fX1 := fX12;
            fX2 := fX21;
         end if;

         if abs(((Cos(fZ2) * Sin(fY2) * Sin(fX2)) - (Cos(fX2) * Sin(fZ2))) - fA12) < 0.0001 then
            fRoll := fX2;
            fPitch := fY2;
            fYaw := fZ2;
         else
            fRoll := fX1;
            fPitch := fY1;
            fYaw := fZ1;
         end if;



      end if;

      this.tAngles(Yaw) := Math.Angles.TAngle(Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => Math.Angles.fRadians_To_Degrees(fYaw),
                                                                                      fRangeFromExclusive => -180.0));
      this.tAngles(Pitch) := Math.Angles.TAngle(Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => Math.Angles.fRadians_To_Degrees(fPitch),
                                                                                        fRangeFromExclusive => -180.0));
      this.tAngles(Roll) := Math.Angles.TAngle(Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => Math.Angles.fRadians_To_Degrees(fRoll),
                                                                                       fRangeFromExclusive => -180.0));
   end Set_Rotator_Angles_From_Matrix;

   function fSafeArcsin(X : float) return float is
   begin
      if X > 1.0 then
         return Ada.Numerics.Elementary_Functions.Arcsin(1.0);
      end if;
      if X < -1.0 then
         return Ada.Numerics.Elementary_Functions.Arcsin(-1.0);
      end if;

      return Ada.Numerics.Elementary_Functions.Arcsin(X);
   end fSafeArcsin;


end Math.Rotators;
