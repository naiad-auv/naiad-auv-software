-- Vector package for Project Naiad
-- Written by Per-Erik Måhl, 2013

with Math;
with Ada.Numerics;
with Ada.Exceptions;

package Math.Vectors is
   type CVector is tagged private;
   type pCVector is access CVector;

   function pxCreate (fX, fY, fZ : float) return pCVector;
   function pxGet_Copy (this : in CVector) return pCVector;
   function pxGet_Normalized (this : in CVector) return pCVector;

   function fLength_Squared (this : in CVector) return float;
   function fLength (this : in CVector) return float;

   function "+" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return pCVector;
   function "-" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return pCVector;
   function "-" (pxOperandVector : in pCVector) return pCVector;
   function "*" (pxLeftOperandVector, pxRightOperandVector : in pCVector) return pCVector;
   function "*" (pxLeftOperandVector : in pCVector; fRightOperand : in float) return pCVector;
   function "*" (fLeftOperand : in float; pxRightOperandVector : in pCVector) return pCVector;
   function "/" (pxLeftOperandVector : in pCVector; fRightOperand : in float) return pCVector;
   function "=" (pxLeftOperandVector : in pCVector; pxRightOperandVector : in pCVector) return boolean;


   function fDot_Product (pxLeftOperandVector : in pCVector; pxRightOperandVector : in pCVector) return float;
   function pxCross_Product (pxLeftOperandVector : in pCVector; pxRightOperandVector : in pCVector) return pCVector;
   function fAngle_Between (pxLeftOperandVector, pxRightOperandVector : in pCVector) return float;

   function fGet_X (this : in CVector) return float;
   function fGet_Y (this : in CVector) return float;
   function fGet_Z (this : in CVector) return float;

private
   type CVector is tagged
      record
         fX : float;
         fY : float;
         fZ : float;
      end record;

   -- used in pxGet_Normalized to allow division by a vector's length without pointer
   function "/" (xLeftOperandVector : in CVector; fRightOperand : in float) return pCVector;

end Math.Vectors;
