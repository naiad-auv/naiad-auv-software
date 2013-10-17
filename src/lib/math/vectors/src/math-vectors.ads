-- Vector package for Project Naiad
-- Written by Per-Erik Måhl, 2013
with Math;
with Ada.Numerics;
with Ada.Exceptions;
with System;

-- Vectors package for classes, types and functionality regarding vectors. A vector object is stored in a pCVector variable and is created with the pxCreate function.
package Math.Vectors is
   type CVector is tagged private;
   --  <summary>Class for vector.</summary>

   type pCVector is access CVector;
   --  <summary>Pointer type for object of type CVector. Objects of type CVector should always be stored in variables of this type.</summary>

   function pxCreate (fX, fY, fZ : float) return pCVector;
   --  <summary>Creates an object of type CVector. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="fX">The value of the vector's X-component.</parameter>
   --  <parameter name="fY">The value of the vector's Y-component.</parameter>
   --  <parameter name="fZ">The value of the vector's Z-component.</parameter>

   function pxGet_Copy (this : in CVector) return pCVector;
   --  <summary>Creates an object of type CVector with the same component values as the object called on. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="this">The CVector object to copy the component values from.</parameter>

   function pxGet_Normalized (this : in CVector) return pCVector;
   --  <summary>Creates an object of type CVector which is equal to the normalized vector of the object called on. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="this">The CVector object to base the normalized vector on.</parameter>


   function fLength_Squared (this : in CVector) return float;
   --  <summary>Returns the length of the vector squared.</summary>
   --  <parameter name="this">The CVector object to calculate the length of.</parameter>

   function fLength (this : in CVector) return float;
   --  <summary>Returns the length of the vector.</summary>
   --  <parameter name="this">The CVector object to calculate the length of.</parameter>

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
   function fAngle_Between_In_Radians (pxLeftOperandVector, pxRightOperandVector : in pCVector) return float;


   function fGet_X (this : in CVector) return float;
   function fGet_Y (this : in CVector) return float;
   function fGet_Z (this : in CVector) return float;

   procedure Copy_From(this : in out CVector; pxSourceVector : in pCVector);

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
