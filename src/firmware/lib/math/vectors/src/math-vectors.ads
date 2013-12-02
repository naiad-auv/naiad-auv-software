with Math;
with Math.Elementary;

-- Vectors package for classes, types and functionality regarding vectors. A vector object is stored in a pCVector variable and is created with the pxCreate function.
package Math.Vectors is

   fVECTOR_PRECISION : constant float := 0.0001;

   type CVector is private;
   --  <summary>Class for vector.</summary>

   function xCreate (fX, fY, fZ : float) return CVector;
   --  <summary>Creates an object of type CVector. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="fX">The value of the vector's X-component.</parameter>
   --  <parameter name="fY">The value of the vector's Y-component.</parameter>
   --  <parameter name="fZ">The value of the vector's Z-component.</parameter>


   function xGet_Normalized (this : in CVector) return CVector;
   --  <summary>Creates an object of type CVector which is equal to the normalized vector of the object called on. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="this">The CVector object to base the normalized vector on.</parameter>
   --  <exception>Numeric_Error, if vector length = 0.0.</exception>

   function fLength_Squared (this : in CVector) return float;
   --  <summary>Returns the length of the vector squared.</summary>
   --  <parameter name="this">The CVector object to calculate the length of.</parameter>

   function fLength (this : in CVector) return float;
   --  <summary>Returns the length of the vector.</summary>
   --  <parameter name="this">The CVector object to calculate the length of.</parameter>

   function "+" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector;
   --  <summary>Creates an object of type CVector with each component the sum of the two operand vectors' components. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing the left operand.</parameter>
   --  <parameter name="pxRightOperandVector">The CVector object representing the right operand.</parameter>

   function "-" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector;
   --  <summary>Creates an object of type CVector with each component the difference of the two operand vectors' components. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing the left operand.</parameter>
   --  <parameter name="pxRightOperandVector">The CVector object representing the right operand.</parameter>

   function "-" (xOperandVector : in CVector) return CVector;
   --  <summary>Creates an object of type CVector which has all the operand vector's components negated. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="pxOperandVector">The CVector object to negate.</parameter>

   function "*" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector;
   --  <summary>Creates an object of type CVector with each component the product of the two operand vectors' components. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing the left operand.</parameter>
   --  <parameter name="pxRightOperandVector">The CVector object representing the right operand.</parameter>

   function "*" (xLeftOperandVector : in CVector; fRightOperand : in float) return CVector;
   --  <summary>Creates an object of type CVector with each component scaled with the right operand. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing the left operand.</parameter>
   --  <parameter name="fRightOperand">A floating point number saying how much the vector should be scaled.</parameter>

   function "*" (fLeftOperand : in float; xRightOperandVector : in CVector) return CVector;
   --  <summary>Creates an object of type CVector with each component scaled with the left operand. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="fLeftOperand">A floating point number saying how much the vector should be scaled.</parameter>
   --  <parameter name="pxRightOperandVector">The CVector object representing the right operand.</parameter>

   function "/" (xLeftOperandVector : in CVector; fRightOperand : in float) return CVector;
   --  <summary>Creates an object of type CVector with each component divided by the right operand. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing left operand.</parameter>
   --  <parameter name="fRightOperand">A floating point number representing the denominator.</parameter>
   --  <exception>Numeric_Error, if fRightOperand = 0.0.</exception>

   function "=" (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return boolean;
   --  <summary>Returns true if the vectors are equal, false otherwise.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing left operand.</parameter>
   --  <parameter name="pxRightOperandVector">The CVector object representing right operand.</parameter>


   function fDot_Product (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return float;
   --  <summary>Calculates and returns the dot product between two vectors.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing left operand.</parameter>
   --  <parameter name="pxRightOperandVector">The CVector object representing right operand.</parameter>

   function xCross_Product (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return CVector;
   --  <summary>Creates an object of type CVector which is the cross product between the two vectors. Returns a pointer of type pCVector to the object created.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing left operand.</parameter>
   --  <parameter name="pxRightOperandVector">The CVector object representing right operand.</parameter>

   function fAngle_Between_In_Radians (xLeftOperandVector, xRightOperandVector : in CVector) return float;
   --  <summary>Calculates and returns the angle in radians between two vectors.</summary>
   --  <parameter name="pxLeftOperandVector">The CVector object representing left operand.</parameter>
   --  <parameter name="pxRightOperandVector">The CVector object representing right operand.</parameter>


   function fGet_X (this : in CVector) return float;
   --  <summary>Returns the X-component of the vector.</summary>
   --  <parameter name="this">The CVector object to get the X-component from.</parameter>

   function fGet_Y (this : in CVector) return float;
   --  <summary>Returns the Y-component of the vector.</summary>
   --  <parameter name="this">The CVector object to get the Y-component from.</parameter>

   function fGet_Z (this : in CVector) return float;
   --  <summary>Returns the Z-component of the vector.</summary>
   --  <parameter name="this">The CVector object to get the Z-component from.</parameter>

   procedure Copy_From(this : in out CVector; xSourceVector : in CVector);
   --  <summary>Copies the components from source vector and puts into this vector.</summary>
   --  <parameter name="this">The CVector object to copy the component values to.</parameter>
   --  <parameter name="pxSourceVector">The CVector object to copy the component values from.</parameter>

private
   type CVector is
      record
         fX : float;
         fY : float;
         fZ : float;
      end record;


end Math.Vectors;
