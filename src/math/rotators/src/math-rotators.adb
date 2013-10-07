with Ada.Numerics.Elementary_Functions;
with Ada.Text_IO;

package body Math.Rotators is



   function pxCreate(fYaw : in float; fPitch : in float; fRoll : in float) return pCRotator is

      use Ada.Numerics.Elementary_Functions;
      use Math.Matrices;
      use Math.Vectors;
      pxNewRotator : pCRotator;

      pxAxisMatrices : TMatrixArray;
      pxAxisVectors : TVectorArray;
      fAngles : TFloatArray;

   begin

      pxNewRotator := new CRotator;

      pxAxisMatrices(1) := Math.Matrices.pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fRoll,
                                                                                                                                    fRangeFromExclusive => -180.0)));
      pxAxisMatrices(2) := Math.Matrices.pxCreate_Rotation_Around_Y_Axis(Math.Angles.TAngle(Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fPitch,
                                                                                                                                    fRangeFromExclusive => -180.0)));
      pxAxisMatrices(3) := Math.Matrices.pxCreate_Rotation_Around_Z_Axis(Math.Angles.TAngle(Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fYaw,
                                                                                                                                    fRangeFromExclusive => -180.0)));

      pxAxisVectors(1) := Math.Vectors.pxCreate(1.0, 0.0, 0.0);
      pxAxisVectors(2) := Math.Vectors.pxCreate(0.0, 1.0, 0.0);
      pxAxisVectors(3) := Math.Vectors.pxCreate(0.0, 0.0, 1.0);

      Make_Rotator_Angles(pxAxisMatrices => pxAxisMatrices,
                          pxAxisVectors => pxAxisVectors,
                          fAngles       => fAngles);
--        for i in 1 .. 3
--        loop
--           pxAxisVector := pxRotMatrix * pxAxisVectors(i);
--           pxComparisonVector := pxRotMatrices(i) * pxAxisVectors(i);
--           pxCrossVector := pxRotMatrix * pxAxisVectors(((i+1) mod 3) + 1);
--           for j in 2 .. 3
--           loop
--              if pxAxisVector /= pxComparisonVector then
--                 exit;
--              end if;
--
--              pxAxisVector := pxRotMatrix * pxAxisVectors(j);
--              pxComparisonVector := pxRotMatrices(i) * pxAxisVectors(j);
--              pxCrossVector := pxRotMatrix * pxAxisVectors(((i+1) mod 3) + 1);
--           end loop;
--
--           Ada.Text_IO.Put_Line("Axis X: " & float'Image(pxAxisVector.fGet_X));
--           Ada.Text_IO.Put_Line("Axis Y: " & float'Image(pxAxisVector.fGet_Y));
--           Ada.Text_IO.Put_Line("Axis Z: " & float'Image(pxAxisVector.fGet_Z));
--           Ada.Text_IO.Put_Line("Comp X: " & float'Image(pxComparisonVector.fGet_X));
--           Ada.Text_IO.Put_Line("Comp Y: " & float'Image(pxComparisonVector.fGet_Y));
--           Ada.Text_IO.Put_Line("Comp Z: " & float'Image(pxComparisonVector.fGet_Z));
--           Ada.Text_IO.Put_Line("Angle between: " & float'Image(Math.Vectors.fAngle_Between(pxAxisVector, pxComparisonVector)));
--
--           fAngles(i) := Math.Vectors.fAngle_Between(pxAxisVector, pxComparisonVector);
--           fAngles(i) := Math.Angles.fRadians_To_Degrees(fAngles(i));
--
--           fAngles(i) := fGet_Signed_Angle(fAngle             => fAngles(i),
--                                           pxCrossVector      => pxCrossVector,
--                                           pxComparisonVector => pxComparisonVector,
--                                           pxAxisVector       => pxAxisVector);
--        end loop;

      --Set_Rotator_Angle(eAngle : ERotatorAngleName, fAngle : float)
      fAngles(1) := Math.Angles.fGet_Angle_Degrees_In_Range(fAngles(1),-180.0);
      pxNewRotator.Set_Rotator_Angle(eAngle => Yaw,
                                     fAngle => fAngles(1));

      fAngles(2) := Math.Angles.fGet_Angle_Degrees_In_Range(fAngles(2),-180.0);
      pxNewRotator.Set_Rotator_Angle(eAngle => Pitch,
                                     fAngle => fAngles(2));

      fAngles(3) := Math.Angles.fGet_Angle_Degrees_In_Range(fAngles(3),-180.0);
      pxNewRotator.Set_Rotator_Angle(eAngle => Roll,
                                     fAngle => fAngles(3));


      return pxNewRotator;
   end pxCreate;


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



   function fGet_Angle_In_Range(fAngle : in float; fRangeFrom : in float) return float is
      fNewAngle : float;
   begin
      fNewAngle := fAngle;
      while fNewAngle <= fRangeFrom loop
         fNewAngle := fNewAngle + 360.0;
      end loop;
      while fNewAngle > (fRangeFrom + 360.0) loop
         fNewAngle := fNewAngle - 360.0;
      end loop;
      return fNewAngle;
   end fGet_Angle_In_Range;

   procedure Set_Rotator_Angle(this : in out CRotator; eAngle : ERotatorAngleName; fAngle : float) is
   begin
      this.tAngles(eAngle) := Math.Angles.TAngle(fAngle);
   end Set_Rotator_Angle;

   function fGet_Signed_Angle(fAngle : in float; pxCrossVector : in Math.Vectors.pCVector; pxComparisonVector : in Math.Vectors.pCVector; pxAxisVector : in Math.Vectors.pCVector) return float is
   begin
      if Math.Vectors.fDot_Product(Math.Vectors.pxCross_Product(pxCrossVector, pxComparisonVector),pxAxisVector) > 0.0 then
         return (-fAngle);
      end if;
      return fAngle;
   end fGet_Signed_Angle;

   procedure Make_Rotator_Angles(pxAxisMatrices : TMatrixArray; pxAxisVectors : TVectorArray; fAngles : out TFloatArray) is

      use Math.Matrices;
      use Math.Vectors;

      pxAxisVector : Math.Vectors.pCVector;
      pxComparisonVector : Math.Vectors.pCVector;
      pxCrossVector : Math.Vectors.pCVector;
      pxRotMatrix : Math.Matrices.pCMatrix;
      pxRotMatrices : TMatrixArray;
   begin

      pxRotMatrices(1) := pxAxisMatrices(2) * pxAxisMatrices(1);
      pxRotMatrices(2) := pxAxisMatrices(3) * pxAxisMatrices(1);
      pxRotMatrices(3) := pxAxisMatrices(3) * pxAxisMatrices(2);

      pxRotMatrix := pxAxisMatrices(3) * pxAxisMatrices(2) * pxAxisMatrices(1);

      for i in 1 .. 3
      loop
         pxAxisVector := pxRotMatrix * pxAxisVectors(i);
         pxComparisonVector := pxRotMatrices(i) * pxAxisVectors(i);
         pxCrossVector := pxRotMatrix * pxAxisVectors(((i+1) mod 3) + 1);
         for j in 2 .. 3
         loop
            if pxAxisVector /= pxComparisonVector then
               exit;
            end if;

            pxAxisVector := pxRotMatrix * pxAxisVectors(j);
            pxComparisonVector := pxRotMatrices(i) * pxAxisVectors(j);
            pxCrossVector := pxRotMatrix * pxAxisVectors(((i+1) mod 3) + 1);
         end loop;

         Ada.Text_IO.Put_Line("Axis X: " & float'Image(pxAxisVector.fGet_X));
         Ada.Text_IO.Put_Line("Axis Y: " & float'Image(pxAxisVector.fGet_Y));
         Ada.Text_IO.Put_Line("Axis Z: " & float'Image(pxAxisVector.fGet_Z));
         Ada.Text_IO.Put_Line("Comp X: " & float'Image(pxComparisonVector.fGet_X));
         Ada.Text_IO.Put_Line("Comp Y: " & float'Image(pxComparisonVector.fGet_Y));
         Ada.Text_IO.Put_Line("Comp Z: " & float'Image(pxComparisonVector.fGet_Z));
         Ada.Text_IO.Put_Line("Cross X: " & float'Image(pxCrossVector.fGet_X));
         Ada.Text_IO.Put_Line("Cross Y: " & float'Image(pxCrossVector.fGet_Y));
         Ada.Text_IO.Put_Line("Cross Z: " & float'Image(pxCrossVector.fGet_Z));

         Ada.Text_IO.Put_Line("Angle between: " & float'Image(Math.Vectors.fAngle_Between(pxAxisVector, pxComparisonVector)));

         fAngles(i) := Math.Vectors.fAngle_Between(pxAxisVector, pxComparisonVector);
         fAngles(i) := Math.Angles.fRadians_To_Degrees(fAngles(i));

         fAngles(i) := fGet_Signed_Angle(fAngle             => fAngles(i),
                                         pxCrossVector      => pxCrossVector,
                                         pxComparisonVector => pxComparisonVector,
                                         pxAxisVector       => pxAxisVector);
      end loop;
   end Make_Rotator_Angles;




end Math.Rotators;




--        fNewYaw := (fYaw * Ada.Numerics.Pi) / 180.0;
--        fNewPitch := (fPitch * Ada.Numerics.Pi) / 180.0;
--        fNewRoll := (fRoll * Ada.Numerics.Pi) / 180.0;
--
--        tfYaw := TAngle(fGet_Angle_In_Range(fAngle     => fYaw,
--                                            fRangeFrom => -180.0));
--        tfPitch := TAngle(fGet_Angle_In_Range(fAngle     => fPitch,
--                                              fRangeFrom => -180.0));
--        tfRoll := TAngle(fGet_Angle_In_Range(fAngle     => fRoll,
--                                             fRangeFrom => -180.0));
--        pxNewRotator := new CRotator;
--        pxNewRotator.pxForwardVector := Math.Vectors.pxCreate(fX => 1.0,
--                                                              fY => 0.0,
--                                                              fZ => 0.0);
--        pxNewRotator.pxYawVector := Math.Vectors.pxCreate(fX => Cos(fNewPitch) * Cos(fNewYaw),
--                                                          fY => (Cos(fNewRoll) * Sin(fNewYaw))+(Cos(fNewYaw) * Sin(fNewRoll) * Sin(fNewPitch)),
--                                                          fZ => 0.0);--(Sin(fNewRoll) * Sin(fNewYaw))-(Cos(fNewRoll) * Cos(fNewYaw) * Sin(fNewPitch)) );
--        pxNewRotator.pxPitchVector := Math.Vectors.pxCreate(fX => pxNewRotator.pxYawVector.fGet_X,
--                                                            fY => pxNewRotator.pxYawVector.fGet_Y,
--                                                            fZ => (Cos(fNewYaw) * Sin(fNewRoll))+(Cos(fNewRoll) * Sin(fNewPitch) * Sin(fNewYaw)));
--        pxNewRotator.pxUpVector := Math.Vectors.pxCreate(fX => Sin(fNewPitch),
--                                                         fY => -Cos()*Sin(0.0),
--                                                         fZ => (Cos(0.0) * Sin(fNewYaw))+(Cos(fNewYaw) * Sin(fNewPitch) * Sin(0.0)));
--
--        pxNewRotator.pxRollVector := Math.Vectors.pxCreate(fX => -Cos(fNewPitch) * Sin(fNewRoll),
--                                                         fY => (Cos(fNewYaw) * Cos(fNewRoll))-(Sin(fNewYaw) * Sin(fNewPitch) * Sin(fNewRoll)),
--                                                           fZ => (Cos(fNewRoll) * Sin(fNewYaw))+(Cos(fNewYaw) * Sin(fNewPitch) * Sin(fNewRoll)));
--
--        fNewYaw := Math.Vectors.fAngle_Between(pxLeftOperandVector  => pxNewRotator.pxYawVector,
--                                                          pxRightOperandVector => pxNewRotator.pxForwardVector);
--        if pxNewRotator.pxYawVector.fGet_Y < pxNewRotator.pxForwardVector.fGet_Y then
--           fNewYaw := -fNewYaw;
--        end if;
--
--        fNewPitch := Math.Vectors.fAngle_Between(pxLeftOperandVector  => pxNewRotator.pxPitchVector,
--                                                            pxRightOperandVector => pxNewRotator.pxYawVector);
--        if pxNewRotator.pxPitchVector.fGet_Z < pxNewRotator.pxYawVector.fGet_Z then
--           fNewPitch := -fNewPitch;
--        end if;
--
--        fNewRoll := Math.Vectors.fAngle_Between(pxLeftOperandVector  => pxNewRotator.pxRollVector,
--                                                           pxRightOperandVector => pxNewRotator.pxUpVector);
--        if Math.Vectors.fDot_Product(Math.Vectors.pxCross_Product(pxNewRotator.pxUpVector, pxNewRotator.pxRollVector), pxNewRotator.pxYawVector) < 0.0 then
--           fNewRoll := -fNewRoll;
--        end if;
--
--        pxNewRotator.tfYaw := TAngle(fGet_Angle_In_Range(fAngle     => (fNewYaw * 180.0) / Ada.Numerics.Pi,
--                                                         fRangeFrom => -180.0));
--        pxNewRotator.tfPitch := TAngle(fGet_Angle_In_Range(fAngle     => (fNewPitch * 180.0) / Ada.Numerics.Pi,
--                                                         fRangeFrom => -180.0));
--        pxNewRotator.tfRoll := TAngle(fGet_Angle_In_Range(fAngle     => (fNewRoll * 180.0) / Ada.Numerics.Pi,
--                                                         fRangeFrom => -180.0));





--        fCosYaw := Cos((fYaw * Ada.Numerics.Pi) / 180.0);
--        fCosPitch := Cos((fPitch * Ada.Numerics.Pi) / 180.0);
--        fCosRoll := Cos((fRoll * Ada.Numerics.Pi) / 180.0);
--        fSinYaw := Sin((fYaw * Ada.Numerics.Pi) / 180.0);
--        fSinPitch := Sin((fPitch * Ada.Numerics.Pi) / 180.0);
--        fSinRoll := Sin((fRoll * Ada.Numerics.Pi) / 180.0);
--
--
--
--        pxNewRotator := new CRotator;
--        pxNewRotator.pxResultXVector := Math.Vectors.pxCreate(fX => (fCosYaw*fCosPitch),
--                                                             fY => (fCosPitch*fSinYaw),
--                                                             fZ => (-fSinPitch));
--        pxNewRotator.pxResultYVector := Math.Vectors.pxCreate(fX => ((fCosYaw*fSinPitch*fSinRoll)-(fCosRoll*fSinYaw)),
--                                                             fY => ((fCosYaw*fCosRoll)+(fSinYaw*fSinPitch*fSinRoll)),
--                                                             fZ => (fCosPitch*fSinRoll));
--        pxNewRotator.pxResultZVector := Math.Vectors.pxCreate(fX => ((fSinYaw*fSinRoll)+(fCosYaw*fCosRoll*fSinPitch)),
--                                                             fY => ((fCosRoll*fSinYaw*fSinPitch)-(fCosYaw*fSinRoll)),
--                                                             fZ => (fCosPitch*fCosRoll));
--
--        pxNewRotator.pxXVector := Math.Vectors.pxCreate(fX => (fCosPitch),
--                                                        fY => (0.0),
--                                                        fZ => (-fSinPitch));
--
--        pxNewRotator.pxYVector := Math.Vectors.pxCreate(fX => -(fCosRoll*fSinYaw),
--                                                        fY => (fCosYaw*fCosRoll),
--                                                        fZ => (fSinRoll));
--
--        pxNewRotator.pxZVector := Math.Vectors.pxCreate(fX => (fCosYaw*fSinPitch),
--                                                        fY => (fSinYaw*fSinPitch),
--                                                        fZ => (fCosPitch));
