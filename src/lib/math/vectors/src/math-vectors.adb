-- Vector package for Project Naiad
-- Written by Per-Erik Måhl, 2013

with Ada.Numerics.Elementary_Functions;

with System;

with Ada.Text_IO;

package body Math.Vectors is

   function pxCreate (fX, fY, fZ : float) return pCVector is
      pxNew_Vector : pCVector := new CVector;
   begin
      pxNew_Vector.fX := fX;
      pxNew_Vector.fY := fY;
      pxNew_Vector.fZ := fZ;
      return pxNew_Vector;
   end pxCreate;


   function fLength_Squared (this : in CVector) return float is
   begin
      return (this.fX**2) + (this.fY**2) + (this.fZ**2);
   end fLength_Squared;

   function fLength (this : in CVector) return float is
   begin
      return Ada.Numerics.Elementary_Functions.Sqrt(this.fLength_Squared);
   end fLength;


   function "*" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return pCVector is
      pxProductVector : pCVector;
   begin
      pxProductVector := pxCreate(fX => pxLeftOperandVector.fX * pxRightOperandVector.fX,
                                  fY => pxLeftOperandVector.fY * pxRightOperandVector.fY,
                                  fZ => pxLeftOperandVector.fZ * pxRightOperandVector.fZ);
      return pxProductVector;
   end "*";

   function "*" (pxLeftOperandVector : in pCVector; fRightOperand : in float) return pCVector is
      pxScaledVector : pCVector;
   begin
      pxScaledVector := pxCreate(fX => pxLeftOperandVector.fX * fRightOperand,
                                 fY => pxLeftOperandVector.fY * fRightOperand,
                                 fZ => pxLeftOperandVector.fZ * fRightOperand);
      return pxScaledVector;
   end "*";

   function "*" (fLeftOperand : in float; pxRightOperandVector : in pCVector) return pCVector is
      pxScaledVector : pCVector;
   begin
      pxScaledVector := pxCreate(fX => pxRightOperandVector.fX * fLeftOperand,
                                 fY => pxRightOperandVector.fY * fLeftOperand,
                                 fZ => pxRightOperandVector.fZ * fLeftOperand);
      return pxScaledVector;
   end "*";

   function "/" (pxLeftOperandVector : in pCVector; fRightOperand : in float) return pCVector is
      fScaleFactor : float;
   begin
      if fRightOperand = 0.0 then
         raise Numeric_Error;
      end if;

      fScaleFactor := 1.0 / fRightOperand;
      return pxLeftOperandVector * fScaleFactor;
   end "/";

   function "=" (pxLeftOperandVector : in pCVector; pxRightOperandVector : in pCVector) return boolean is
      use System;
   begin
      return abs(pxLeftOperandVector.fX - pxRightOperandVector.fX) < 0.0001 and
        abs(pxLeftOperandVector.fY - pxRightOperandVector.fY) < 0.0001 and
        abs(pxLeftOperandVector.fZ - pxRightOperandVector.fZ) < 0.0001;

   exception
         when CONSTRAINT_ERROR => return false;
   end "=";

   function fGet_X (this : in CVector) return float is
   begin
      return this.fX;
   end fGet_X;

   function fGet_Y (this : in CVector) return float is
   begin
      return this.fY;
   end fGet_Y;

   function fGet_Z (this : in CVector) return float is
   begin
      return this.fZ;
   end fGet_Z;






   function "+" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return pCVector is
      pxSumVector : pCVector;
   begin
      pxSumVector := pxCreate(fX => pxLeftOperandVector.fX + pxRightOperandVector.fX,
                              fY => pxLeftOperandVector.fY + pxRightOperandVector.fY,
                              fZ => pxLeftOperandVector.fZ + pxRightOperandVector.fZ);
      return pxSumVector;
   end "+";

   function "-" (pxOperandVector : in pCVector) return pCVector is
      pxNegatedVector : pCVector;
   begin
      pxNegatedVector := pxCreate(fX => -pxOperandVector.fX,
                                  fY => -pxOperandVector.fY,
                                  fZ => -pxOperandVector.fZ);
      return pxNegatedVector;
   end "-";

   function "-" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return pCVector is
   begin
      return pxLeftOperandVector + (-pxRightOperandVector);
   end "-";

   function fDot_Product (pxLeftOperandVector : in pCVector; pxRightOperandVector : in pCVector) return float is
      fDotProduct : float;
   begin
      fDotProduct := (pxLeftOperandVector.fX * pxRightOperandVector.fX)
        + (pxLeftOperandVector.fY * pxRightOperandVector.fY)
        + (pxLeftOperandVector.fZ * pxRightOperandVector.fZ);
      return fDotProduct;
   end fDot_Product;


   function fAngle_Between_In_Radians (pxLeftOperandVector, pxRightOperandVector : in pCVector) return float is
      fDotProduct : float;
   begin
      fDotProduct := Math.Vectors.fDot_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                               pxRightOperandVector => pxRightOperandVector);
      fDotProduct := fDotProduct / (pxLeftOperandVector.fLength * pxRightOperandVector.fLength);
      if fDotProduct > 1.0 then
         fDotProduct := 1.0;
      end if;

      return Ada.Numerics.Elementary_Functions.Arccos(fDotProduct);
   end fAngle_Between_In_Radians;


   function pxGet_Normalized (this : in CVector) return pCVector is
      pxNormalizedVector : pCVector;
   begin
      if this.fLength_Squared = 0.0 then
         raise Numeric_Error;
      end if;

      pxNormalizedVector := this / this.fLength;
      return pxNormalizedVector;
   end pxGet_Normalized;

   function pxCross_Product (pxLeftOperandVector : in pCVector; pxRightOperandVector : in pCVector) return pCVector is
      pxCrossProductVector : pCVector;
   begin
      pxCrossProductVector := Math.Vectors.pxCreate(fX => (pxLeftOperandVector.fY * pxRightOperandVector.fZ) - (pxLeftOperandVector.fZ * pxRightOperandVector.fY),
                                                          fY => (pxLeftOperandVector.fZ * pxRightOperandVector.fX) - (pxLeftOperandVector.fX * pxRightOperandVector.fZ),
                                                          fZ => (pxLeftOperandVector.fX * pxRightOperandVector.fY) - (pxLeftOperandVector.fY * pxRightOperandVector.fX));
      return pxCrossProductVector;
   end pxCross_Product;


   function "/" (xLeftOperandVector : in CVector; fRightOperand : in float) return pCVector is
   begin
      if fRightOperand = 0.0 then
         raise Numeric_Error;
      end if;

      return Math.Vectors.pxCreate(fX => xLeftOperandVector.fX / fRightOperand,
                                         fY => xLeftOperandVector.fY / fRightOperand,
                                         fZ => xLeftOperandVector.fZ / fRightOperand);
   end "/";

   function pxGet_Copy (this : in CVector) return pCVector is
      pxCopy : pCVector;
   begin
      pxCopy := Math.Vectors.pxCreate(fX => this.fX,
                                            fY => this.fY,
                                            fZ => this.fZ);
      return pxCopy;
   end pxGet_Copy;


   procedure Copy_From(this : in out CVector; pxSourceVector : in pCVector) is
   begin
      this.fX := pxSourceVector.fX;
      this.fY := pxSourceVector.fY;
      this.fZ := pxSourceVector.fZ;
   end Copy_From;


end Math.Vectors;
