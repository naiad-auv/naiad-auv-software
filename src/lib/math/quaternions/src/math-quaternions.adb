with Math.Vectors;
with Ada.Numerics.Elementary_Functions;
with Ada.Numerics;


package body Math.Quaternions is


   function pxCreate (fX, fY, fZ, fW : float) return pCQuaternion is
      pxNewQuaternion : pCQuaternion;
   begin
      pxNewQuaternion := new CQuaternion;
      pxNewQuaternion.fX := fX;
      pxNewQuaternion.fY := fY;
      pxNewQuaternion.fZ := fZ;
      pxNewQuaternion.fW := fW;
      return pxNewQuaternion;
   end pxCreate;

   function pxCreate (pxAxisVector : in Math.Vectors.pCVector; fAngleInDegrees : in float) return pCQuaternion is
      fAngleInRadians : float;
      fNorm : float;
      fScale : float;
      pxNormalizedAxisVector : Math.Vectors.pCVector;
   begin
      if pxAxisVector.fLength_Squared /= 1.0 then
         pxNormalizedAxisVector := pxAxisVector.pxGet_Normalized;
      else
         pxNormalizedAxisVector := pxAxisVector;
      end if;

        fAngleInRadians := fAngleInDegrees * (Ada.Numerics.Pi / 180.0);
      fNorm :=fAngleInRadians / 2.0;
      fScale := Ada.Numerics.Elementary_Functions.Sin(fNorm);

      return Math.Quaternions.pxCreate(fX => fScale * pxNormalizedAxisVector.fGet_X,
                                       fY => fScale * pxNormalizedAxisVector.fGet_Y,
                                       fZ => fScale * pxNormalizedAxisVector.fGet_Z,
                                       fW => Ada.Numerics.Elementary_Functions.Cos(fNorm));

   end pxCreate;

   function pxGet_Copy (this : in CQuaternion) return pCQuaternion is
      pxNewQuaternion : pCQuaternion;
   begin
      pxNewQuaternion := new CQuaternion;
      pxNewQuaternion.fX := this.fX;
      pxNewQuaternion.fY := this.fY;
      pxNewQuaternion.fZ := this.fZ;
      pxNewQuaternion.fW := this.fW;
      return pxNewQuaternion;
   end pxGet_Copy;




   function "+" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion is
      pxSumQuaternion : pCQuaternion;
   begin
      pxSumQuaternion := Math.Quaternions.pxCreate(fX => pxLeftOperandQuaternion.fX + pxRightOperandQuaternion.fX,
                                                   fY => pxLeftOperandQuaternion.fY + pxRightOperandQuaternion.fY,
                                                   fZ => pxLeftOperandQuaternion.fZ + pxRightOperandQuaternion.fZ,
                                                   fW => pxLeftOperandQuaternion.fW + pxRightOperandQuaternion.fW);
      return pxSumQuaternion;

   end "+";

   function "-" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion is
      pxDifferenceQuaternion : pCQuaternion;
   begin
      pxDifferenceQuaternion := Math.Quaternions.pxCreate(fX => pxLeftOperandQuaternion.fX - pxRightOperandQuaternion.fX,
                                                   fY => pxLeftOperandQuaternion.fY - pxRightOperandQuaternion.fY,
                                                   fZ => pxLeftOperandQuaternion.fZ - pxRightOperandQuaternion.fZ,
                                                   fW => pxLeftOperandQuaternion.fW - pxRightOperandQuaternion.fW);
      return pxDifferenceQuaternion;

   end "-";

   function "*" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion is
   begin

      return Math.Quaternions.pxCreate(fX => ((pxLeftOperandQuaternion.fW*pxRightOperandQuaternion.fX)+(pxLeftOperandQuaternion.fX*pxRightOperandQuaternion.fW)+(pxLeftOperandQuaternion.fY*pxRightOperandQuaternion.fZ)-(pxLeftOperandQuaternion.fZ*pxRightOperandQuaternion.fY)),
                                       fY => ((pxLeftOperandQuaternion.fW*pxRightOperandQuaternion.fY)-(pxLeftOperandQuaternion.fX*pxRightOperandQuaternion.fZ)+(pxLeftOperandQuaternion.fY*pxRightOperandQuaternion.fW)+(pxLeftOperandQuaternion.fZ*pxRightOperandQuaternion.fX)),
                                       fZ => ((pxLeftOperandQuaternion.fW*pxRightOperandQuaternion.fZ)+(pxLeftOperandQuaternion.fX*pxRightOperandQuaternion.fY)-(pxLeftOperandQuaternion.fY*pxRightOperandQuaternion.fX)-(pxLeftOperandQuaternion.fZ*pxRightOperandQuaternion.fW)),
                                       fW => ((pxLeftOperandQuaternion.fW*pxRightOperandQuaternion.fW)-(pxLeftOperandQuaternion.fX*pxRightOperandQuaternion.fX)-(pxLeftOperandQuaternion.fY*pxRightOperandQuaternion.fY)-(pxLeftOperandQuaternion.fZ*pxRightOperandQuaternion.fZ)));
   end "*";

   function "=" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return boolean is
   begin
      return (pxLeftOperandQuaternion.fX = pxRightOperandQuaternion.fX) and
        (pxLeftOperandQuaternion.fY = pxRightOperandQuaternion.fY) and
        (pxLeftOperandQuaternion.fZ = pxRightOperandQuaternion.fZ) and
        (pxLeftOperandQuaternion.fW = pxRightOperandQuaternion.fW);
   end "=";




   function fGet_Dot_Product (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return float is
   begin
      return (pxLeftOperandQuaternion.fX * pxRightOperandQuaternion.fX) +
        (pxLeftOperandQuaternion.fY * pxRightOperandQuaternion.fY) +
        (pxLeftOperandQuaternion.fZ * pxRightOperandQuaternion.fZ) +
        (pxLeftOperandQuaternion.fW * pxRightOperandQuaternion.fW);
   end fGet_Dot_Product;



   function pxGet_Spherical_Linear_Interpolation_Quaternion (pxFromQuaternion : in pCQuaternion; pxToQuaternion : in pCQuaternion; fInterpolationCoefficient : float) return pCQuaternion is
      --pxInterpolatedQuaternion : pCQuaternion;
      cosHalfTheta : float;
      halfTheta : float;
      sinHalfTheta : float;
      --fInvSinAngle : float;
      ratioA : float;
      ratioB : float;
   begin


      cosHalfTheta := Math.Quaternions.fGet_Dot_Product(pxLeftOperandQuaternion  => pxFromQuaternion,
                                                        pxRightOperandQuaternion => pxToQuaternion);

      if abs(cosHalfTheta) >= 1.0 then
         return pxFromQuaternion.pxGet_Copy;
      end if;

      halfTheta := Ada.Numerics.Elementary_Functions.Arccos(cosHalfTheta);
      sinHalfTheta := Ada.Numerics.Elementary_Functions.Sqrt(1.0 - (cosHalfTheta * cosHalfTheta));

      if abs(sinHalfTheta) < 0.001 then
         return Math.Quaternions.pxCreate(fX => (pxFromQuaternion.fX * 0.5) + (pxToQuaternion.fX * 0.5),
                                          fY => (pxFromQuaternion.fY * 0.5) + (pxToQuaternion.fY * 0.5),
                                          fZ => (pxFromQuaternion.fZ * 0.5) + (pxToQuaternion.fZ * 0.5),
                                          fW => (pxFromQuaternion.fW * 0.5) + (pxToQuaternion.fW * 0.5));
      end if;

      ratioA := Ada.Numerics.Elementary_Functions.Sin((1.0 - fInterpolationCoefficient) * halfTheta) / sinHalfTheta;
      ratioB := Ada.Numerics.Elementary_Functions.Sin(fInterpolationCoefficient * halfTheta) / sinHalfTheta;

      return Math.Quaternions.pxCreate(fX => (pxFromQuaternion.fX * ratioA) + (pxToQuaternion.fX * ratioB),
                                          fY => (pxFromQuaternion.fY * ratioA) + (pxToQuaternion.fY * ratioB),
                                          fZ => (pxFromQuaternion.fZ * ratioA) + (pxToQuaternion.fZ * ratioB),
                                          fW => (pxFromQuaternion.fW * ratioA) + (pxToQuaternion.fW * ratioB));


   end pxGet_Spherical_Linear_Interpolation_Quaternion;



   function pxGet_Normalized (this : in CQuaternion) return pCQuaternion is
      fLength : float;
   begin
      fLength := this.fGet_Length;
      if fLength = 0.0 then
         raise Numeric_Error;
      end if;

      return Math.Quaternions.pxCreate(fX => this.fX / fLength,
                                       fY => this.fY / fLength,
                                       fZ => this.fZ / fLength,
                                       fW => this.fW / fLength);
   end pxGet_Normalized;

   function fGet_Length (this : in CQuaternion) return float is
   begin
      return Ada.Numerics.Elementary_Functions.Sqrt((this.fX*this.fX) + (this.fY*this.fY) + (this.fZ*this.fZ) + (this.fW*this.fW));
   end fGet_Length;

   function fGet_Length_Squared (this : in CQuaternion) return float is
   begin
      return (this.fX*this.fX) + (this.fY*this.fY) + (this.fZ*this.fZ) + (this.fW*this.fW);
   end fGet_Length_Squared;




   function fGet_X ( this : in CQuaternion) return float is
   begin
      return this.fX;
   end fGet_X;

   function fGet_Y ( this : in CQuaternion) return float is
   begin
      return this.fY;
   end fGet_Y;

   function fGet_Z ( this : in CQuaternion) return float is
   begin
      return this.fZ;
   end fGet_Z;

   function fGet_W ( this : in CQuaternion) return float is
   begin
      return this.fW;
   end fGet_W;

   function fGet_Axis_Vector ( this : in CQuaternion) return Math.Vectors.pCVector is
      fScale : float;
   begin
      fScale := Ada.Numerics.Elementary_Functions.Sqrt((this.fX*this.fX)+(this.fY*this.fY)+(this.fZ*this.fZ));
      if fScale = 0.0 then
         return Math.Vectors.pxCreate(fX => 1.0,
                                   fY => 0.0,
                                   fZ => 0.0);
      end if;

      return Math.Vectors.pxCreate(fX => this.fX / fScale,
                                   fY => this.fY / fScale,
                                   fZ => this.fZ / fScale);
   end fGet_Axis_Vector;

   function fGet_Angle_In_Degrees (this : in CQuaternion) return float is
   begin
      return ((2.0*180.0)/Ada.Numerics.Pi) * Ada.Numerics.Elementary_Functions.Arccos(this.fW);
   end fGet_Angle_In_Degrees;


end Math.Quaternions;
