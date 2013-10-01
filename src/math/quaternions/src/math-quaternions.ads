with Math;
with Math.Vectors; use Math.Vectors;
with System; use System;
with Ada.Exceptions;

package Math.Quaternions is
   type CQuaternion is tagged private;
   type pCQuaternion is access CQuaternion;

   function pxCreate (fX, fY, fZ, fW : in float) return pCQuaternion;
   function pxCreate (pxAxisVector : in Math.Vectors.pCVector; fAngleInDegrees : in float) return pCQuaternion;
   function pxGet_Copy (this : in CQuaternion) return pCQuaternion;

   function "+" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion;
   function "-" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion;
   function "*" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion;
   function "=" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return boolean;
   function fGet_Dot_Product (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return float;

   function pxGet_Spherical_Linear_Interpolation_Quaternion (pxFromQuaternion : in pCQuaternion; pxToQuaternion : in pCQuaternion; fInterpolationCoefficient : float) return pCQuaternion;
   function pxGet_Normalized (this : in CQuaternion) return pCQuaternion;

   function fGet_Length (this : in CQuaternion) return float;
   function fGet_Length_Squared (this : in CQuaternion) return float;
   function fGet_X ( this : in CQuaternion) return float;
   function fGet_Y ( this : in CQuaternion) return float;
   function fGet_Z ( this : in CQuaternion) return float;
   function fGet_W ( this : in CQuaternion) return float;
   function fGet_Axis_Vector ( this : in CQuaternion) return Math.Vectors.pCVector;
   function fGet_Angle (this : in CQuaternion) return float;


private
   type CQuaternion is tagged
      record
         fX : float;
         fY : float;
         fZ : float;
         fW : float;
      end record;

end Math.Quaternions;
