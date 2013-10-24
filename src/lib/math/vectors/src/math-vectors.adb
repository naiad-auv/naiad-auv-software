with Ada.Numerics.Elementary_Functions;
with Ada.Unchecked_Deallocation;
with System;
with Ada.Text_IO;
with Exception_Handling;

package body Math.Vectors is

   function pxCreate (fX, fY, fZ : float) return pCVector is
   begin

      return new CVector'(fX => fX,
                          fY => fY,
                          fZ => fZ);
   end pxCreate;

   function fLength_Squared (this : in CVector) return float is
   begin
      return (this.fX**2) +
        (this.fY**2) +
        (this.fZ**2);
   end fLength_Squared;

   function fLength (this : in CVector) return float is
   begin
      return Ada.Numerics.Elementary_Functions.Sqrt(this.fLength_Squared);
   end fLength;

   function "+" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector is
   begin
      return CVector'(fX => xLeftOperandVector.fX + xRightOperandVector.fX,
                      fY => xLeftOperandVector.fY + xRightOperandVector.fY,
                      fZ => xLeftOperandVector.fZ + xRightOperandVector.fZ);
   end "+";

   function "+" (pxLeftOperandVector : in pCVector; xRightOperandVector : in CVector) return CVector is
   begin
      if pxLeftOperandVector /= null then
         return pxLeftOperandVector.all + xRightOperandVector;
      end if;

      raise Exception_Handling.NullPointer;
   end "+";

   function "+" (xLeftOperandVector : in CVector; pxRightOperandVector : in pCVector) return CVector is
   begin
      if pxRightOperandVector /= null then
         return xLeftOperandVector + pxRightOperandVector.all;
      end if;

      raise Exception_Handling.NullPointer;
   end "+";

   function "+" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return CVector is
   begin
      if pxLeftOperandVector /= null and then pxRightOperandVector /= null then
         return pxLeftOperandVector.all + pxRightOperandVector.all;
      end if;

      raise Exception_Handling.NullPointer;
   end "+";


   function "-" (xOperandVector : in CVector) return CVector is
   begin
      return CVector'(fX => -xOperandVector.fX,
                      fY => -xOperandVector.fY,
                      fZ => -xOperandVector.fZ);
   end "-";

   function "-" (pxOperandVector : in pCVector) return CVector is
   begin
      if pxOperandVector /= null then
         return -pxOperandVector.all;
      end if;

      raise Exception_Handling.NullPointer;
   end "-";

   function "-" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector is
   begin
      return xLeftOperandVector + (-xRightOperandVector);
   end "-";

   function "-" (pxLeftOperandVector : in pCVector; xRightOperandVector : in CVector) return CVector is
   begin
      if pxLeftOperandVector /= null then
         return pxLeftOperandVector.all - xRightOperandVector;
      end if;

      raise Exception_Handling.NullPointer;
   end "-";

   function "-" (xLeftOperandVector : in CVector; pxRightOperandVector : in pCVector) return CVector is
   begin
      if pxRightOperandVector /= null then
         return xLeftOperandVector - pxRightOperandVector.all;
      end if;

      raise Exception_Handling.NullPointer;
   end "-";

   function "-" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return CVector is
   begin
      if pxLeftOperandVector /= null and then pxRightOperandVector /= null then
         return pxLeftOperandVector.all - pxRightOperandVector.all;
      end if;

      raise Exception_Handling.NullPointer;
   end "-";

   function "*" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector is
   begin
      return CVector'(fX => xLeftOperandVector.fX * xRightOperandVector.fX,
                      fY => xLeftOperandVector.fY * xRightOperandVector.fY,
                      fZ => xLeftOperandVector.fZ * xRightOperandVector.fZ);
   end "*";

   function "*" (pxLeftOperandVector : in pCVector; xRightOperandVector : in CVector) return CVector is
   begin
      if pxLeftOperandVector /= null then
         return pxLeftOperandVector.all * xRightOperandVector;
      end if;

      raise Exception_Handling.NullPointer;
   end "*";

   function "*" (xLeftOperandVector : in CVector; pxRightOperandVector : in pCVector) return CVector is
   begin
      if pxRightOperandVector /= null then
         return xLeftOperandVector * pxRightOperandVector.all;
      end if;

      raise Exception_Handling.NullPointer;
   end "*";

   function "*" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return CVector is
   begin
      if pxLeftOperandVector /= null and then pxRightOperandVector /= null then
         return pxLeftOperandVector.all * pxRightOperandVector.all;
      end if;

      raise Exception_Handling.NullPointer;
   end "*";

   function "*" (xLeftOperandVector : in CVector; fRightOperand : in float) return CVector is
   begin

      return CVector'(fX => xLeftOperandVector.fX * fRightOperand,
                      fY => xLeftOperandVector.fY * fRightOperand,
                      fZ => xLeftOperandVector.fZ * fRightOperand);
   end "*";

   function "*" (pxLeftOperandVector : in pCVector; fRightOperand : in float) return CVector is
   begin
      if pxLeftOperandVector /= null then
         return pxLeftOperandVector.all * fRightOperand;
      end if;

      raise Exception_Handling.NullPointer;
   end "*";

   function "*" (fLeftOperand : in float; xRightOperandVector : in CVector) return CVector is
   begin
      return xRightOperandVector * fLeftOperand;
   end "*";

   function "*" (fLeftOperand : in float; pxRightOperandVector : in pCVector) return CVector is
   begin
      return pxRightOperandVector * fLeftOperand;
   end "*";

   function "/" (xLeftOperandVector : in CVector; fRightOperand : in float) return CVector is
      fScaleFactor : float;
   begin
      if abs(fRightOperand) = 0.0 then
         raise Exception_Handling.DivisionByZero;
      end if;

      fScaleFactor := 1.0 / fRightOperand;

      return xLeftOperandVector * fScaleFactor;
   end "/";

   function "/" (pxLeftOperandVector : in pCVector; fRightOperand : in float) return CVector is
   begin
      if pxLeftOperandVector /= null then
         return pxLeftOperandVector.all / fRightOperand;
      end if;

      raise Exception_Handling.NullPointer;
   end "/";

   function "=" (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return boolean is
   begin
      return abs(xLeftOperandVector.fX - xRightOperandVector.fX) < fVECTOR_PRECISION and
      abs(xLeftOperandVector.fY - xRightOperandVector.fY) < fVECTOR_PRECISION and
      abs(xLeftOperandVector.fZ - xRightOperandVector.fZ) < fVECTOR_PRECISION;
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


   function fDot_Product (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return float is
   begin
      return (xLeftOperandVector.fX * xRightOperandVector.fX)
        + (xLeftOperandVector.fY * xRightOperandVector.fY)
        + (xLeftOperandVector.fZ * xRightOperandVector.fZ);
   end fDot_Product;

   function fDot_Product (pxLeftOperandVector : in pCVector; xRightOperandVector : in CVector) return float is
   begin
      if pxLeftOperandVector /= null then
         return fDot_Product(pxLeftOperandVector.all, xRightOperandVector);
      end if;

      raise Exception_Handling.NullPointer;
   end fDot_Product;

   function fDot_Product (xLeftOperandVector : in CVector; pxRightOperandVector : in pCVector) return float is
   begin
      if pxRightOperandVector /= null then
         return fDot_Product(xLeftOperandVector, pxRightOperandVector.all);
      end if;

      raise Exception_Handling.NullPointer;
   end fDot_Product;

   function fDot_Product (pxLeftOperandVector : in pCVector; pxRightOperandVector : in pCVector) return float is
   begin
      if pxLeftOperandVector /= null and then pxRightOperandVector /= null then
         return fDot_Product(pxLeftOperandVector.all, pxRightOperandVector.all);
      end if;

      raise Exception_Handling.NullPointer;
   end fDot_Product;

   function fAngle_Between_In_Radians (xLeftOperandVector, xRightOperandVector : in CVector) return float is
      fDotProduct : float;
   begin
      if abs(xLeftOperandVector.fLength_Squared) = 0.0 or abs(xRightOperandVector.fLength_Squared) = 0.0 then
         raise Exception_Handling.DivisionByZero;
      end if;

      fDotProduct := Math.Vectors.fDot_Product(xLeftOperandVector, xRightOperandVector);

      fDotProduct := fDotProduct / (xLeftOperandVector.fLength * xRightOperandVector.fLength);

      fDotProduct := float'Min(float'Max(fDotProduct,-1.0),1.0);

      return Ada.Numerics.Elementary_Functions.Arccos(fDotProduct);
   end fAngle_Between_In_Radians;

   function fAngle_Between_In_Radians (xLeftOperandVector : in CVector; pxRightOperandVector : in pCVector) return float is
   begin
      if pxRightOperandVector /= null then
         return fAngle_Between_In_Radians(xLeftOperandVector, pxRightOperandVector.all);
      end if;

      raise Exception_Handling.NullPointer;
   end fAngle_Between_In_Radians;

   function fAngle_Between_In_Radians (pxLeftOperandVector : in pCVector; xRightOperandVector : in CVector) return float is
   begin
      if pxLeftOperandVector /= null then
         return fAngle_Between_In_Radians(pxLeftOperandVector.all, xRightOperandVector);
      end if;

      raise Exception_Handling.NullPointer;
   end fAngle_Between_In_Radians;

   function fAngle_Between_In_Radians (pxLeftOperandVector, pxRightOperandVector : in pCVector) return float is
   begin
      if pxLeftOperandVector /= null and then pxRightOperandVector /= null then
         return fAngle_Between_In_Radians(pxLeftOperandVector.all, pxRightOperandVector.all);
      end if;

      raise Exception_Handling.NullPointer;
   end fAngle_Between_In_Radians;

   function xGet_Normalized (this : in CVector) return CVector is
   begin
      if this.fLength_Squared = 0.0 then
         raise Exception_Handling.DivisionByZero;
      end if;

      return this / this.fLength;
   end xGet_Normalized;

   function xCross_Product (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return CVector is
   begin
      return CVector'(fX => (xLeftOperandVector.fY * xRightOperandVector.fZ) - (xLeftOperandVector.fZ * xRightOperandVector.fY),
                      fY => (xLeftOperandVector.fZ * xRightOperandVector.fX) - (xLeftOperandVector.fX * xRightOperandVector.fZ),
                      fZ => (xLeftOperandVector.fX * xRightOperandVector.fY) - (xLeftOperandVector.fY * xRightOperandVector.fX));
   end xCross_Product;

   function xCross_Product (pxLeftOperandVector : in pCVector; pxRightOperandVector : in pCVector) return CVector is
   begin
      if pxLeftOperandVector /= null and then pxRightOperandVector /= null then
         return xCross_Product(pxLeftOperandVector.all, pxRightOperandVector.all);
      end if;

      raise Exception_Handling.NullPointer;
   end xCross_Product;

   function xCross_Product (pxLeftOperandVector : in pCVector; xRightOperandVector : in CVector) return CVector is
   begin
      if pxLeftOperandVector /= null then
         return xCross_Product(pxLeftOperandVector.all, xRightOperandVector);
      end if;

      raise Exception_Handling.NullPointer;
   end xCross_Product;

   function xCross_Product (xLeftOperandVector : in CVector; pxRightOperandVector : in pCVector) return CVector is
   begin
      if pxRightOperandVector /= null then
         return xCross_Product(xLeftOperandVector, pxRightOperandVector);
      end if;

      raise Exception_Handling.NullPointer;
   end xCross_Product;

   function pxGet_Copy (this : in CVector) return pCVector is
   begin
      return Math.Vectors.pxCreate(fX => this.fX,
                                   fY => this.fY,
                                   fZ => this.fZ);
   end pxGet_Copy;

   procedure Copy_From (this : in out CVector; xSourceVector : in CVector) is
   begin
      this.fX := xSourceVector.fX;
      this.fY := xSourceVector.fY;
      this.fZ := xSourceVector.fZ;
   end Copy_From;

   procedure Free(pxVectorToDeallocate : in out pCVector) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CVector, pCVector);
   begin
      Dealloc(pxVectorToDeallocate);
   end Free;

end Math.Vectors;
