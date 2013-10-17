with Math;
with Math.Vectors; use Math.Vectors;
with System; use System;
with Ada.Exceptions;

-- Quaternions package for classes and functionality regarding quaternions. A quaternion object is stored in a pCQuaternion variable and is created with the pxCreate functions.
package Math.Quaternions is
   type CQuaternion is tagged private;
   --  <summary>Class for quaternion.</summary>

   type pCQuaternion is access CQuaternion;
   --  <summary>Pointer type for object of type CQuaternion. Objects of type CQuaternion should always be stored in variables of this type.</summary>

   function pxCreate (fX, fY, fZ, fW : in float) return pCQuaternion;
   --  <summary>Creates an object of type CQuaternion. Returns a pointer of type pCQuaternion to the object created.</summary>
   --  <parameter name="fX">The value of the quaternion's X-component.</parameter>
   --  <parameter name="fY">The value of the quaternion's Y-component.</parameter>
   --  <parameter name="fZ">The value of the quaternion's Z-component.</parameter>
   --  <parameter name="fW">The value of the quaternion's W-component.</parameter>

   function pxCreate (pxAxisVector : in Math.Vectors.pCVector; fAngleInDegrees : in float) return pCQuaternion;
   --  <summary>Creates an object of type CQuaternion defining it with an axis vector and an angle in degrees of rotation around that axis. Returns a pointer of type pCQuaternion to the object created.</summary>
   --  <parameter name="pxAxisVector">The axis vector of the quaternion.</parameter>
   --  <parameter name="fAngleInDegrees">The angle (in degrees) of rotation of the quaternion.</parameter>

   function pxGet_Copy (this : in CQuaternion) return pCQuaternion;
   --  <summary>Creates an object of type CQuaternion with all components copied from the object called on. Returns a pointer of type pCQuaternion to the object created.</summary>
   --  <parameter name="this">The quaternion to copy the components from.</parameter>

   function "+" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion;
   --  <summary>Creates an object of type CQuaternion with each component the sum of the two operand quaternions' components. Returns a pointer of type pCQuaternion to the object created.</summary>
   --  <parameter name="pxLeftOperandQuaternion">The CQuaternion object representing the left operand.</parameter>
   --  <parameter name="pxRightOperandQuaternion">The CQuaternion object representing the right operand.</parameter>

   function "-" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion;
   --  <summary>Creates an object of type CQuaternion with each component the difference of the two operand quaternions' components. Returns a pointer of type pCQuaternion to the object created.</summary>
   --  <parameter name="pxLeftOperandQuaternion">The CQuaternion object representing the left operand.</parameter>
   --  <parameter name="pxRightOperandQuaternion">The CQuaternion object representing the right operand.</parameter>

   function "*" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return pCQuaternion;
   --  <summary>Creates an object of type CQuaternion with each component the product of the two operand quaternions' components. Returns a pointer of type pCQuaternion to the object created.</summary>
   --  <parameter name="pxLeftOperandQuaternion">The CQuaternion object representing the left operand.</parameter>
   --  <parameter name="pxRightOperandQuaternion">The CQuaternion object representing the right operand.</parameter>

   function "=" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return boolean;
   --  <summary>Returns true if the two quaternions are equal, false otherwise.</summary>
   --  <parameter name="pxLeftOperandQuaternion">The CQuaternion object representing the left operand.</parameter>
   --  <parameter name="pxRightOperandQuaternion">The CQuaternion object representing the right operand.</parameter>

   function fGet_Dot_Product (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return float;
   --  <summary>Returns the dot product of the two quaternions.</summary>
   --  <parameter name="pxLeftOperandQuaternion">The CQuaternion object representing the left operand.</parameter>
   --  <parameter name="pxRightOperandQuaternion">The CQuaternion object representing the right operand.</parameter>

--   function pxGet_Spherical_Linear_Interpolation_Quaternion (pxFromQuaternion : in pCQuaternion; pxToQuaternion : in pCQuaternion; fInterpolationCoefficient : float) return pCQuaternion;
   function pxGet_Normalized (this : in CQuaternion) return pCQuaternion;
   --  <summary>Creates an object of type CQuaternion which is a normalized copy of the object called on. Returns a pointer of type pCQuaternion to the object created.</summary>
   --  <parameter name="this">The quaternion to normalize.</parameter>

   function fGet_Length (this : in CQuaternion) return float;
   --  <summary>Returns the length of the quaternion called on.</summary>
   --  <parameter name="this">The quaternion to return the length of.</parameter>

   function fGet_Length_Squared (this : in CQuaternion) return float;
   --  <summary>Returns the squared length of the quaternion called on.</summary>
   --  <parameter name="this">The quaternion to return the squared length of.</parameter>

   function fGet_X ( this : in CQuaternion) return float;
   --  <summary>Returns the quaternion's X-component value.</summary>
   --  <parameter name="this">The quaternion holding the wanted X-component.</parameter>

   function fGet_Y ( this : in CQuaternion) return float;
   --  <summary>Returns the quaternion's Y-component value.</summary>
   --  <parameter name="this">The quaternion holding the wanted Y-component.</parameter>

   function fGet_Z ( this : in CQuaternion) return float;
   --  <summary>Returns the quaternion's Z-component value.</summary>
   --  <parameter name="this">The quaternion holding the wanted Z-component.</parameter>

   function fGet_W ( this : in CQuaternion) return float;
   --  <summary>Returns the quaternion's W-component value.</summary>
   --  <parameter name="this">The quaternion holding the wanted W-component.</parameter>


   function pxGet_Axis_Vector ( this : in CQuaternion) return Math.Vectors.pCVector;
    --  <summary>Returns a copy of the quaternion's axis vector.</summary>
   --  <parameter name="this">The quaternion holding the wanted axis vector.</parameter>

   function fGet_Angle_In_Degrees (this : in CQuaternion) return float;
   --  <summary>Returns the quaternion's angle of rotation. (in degrees)</summary>
   --  <parameter name="this">The quaternion holding the wanted angle of rotation.</parameter>


private
   type CQuaternion is tagged
      record
         fX : float;
         fY : float;
         fZ : float;
         fW : float;
      end record;

end Math.Quaternions;
