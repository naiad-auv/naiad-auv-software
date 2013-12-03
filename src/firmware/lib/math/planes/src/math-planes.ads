with Math;
with Math.Vectors;
with Math.Angles;

-- Planes package for classes and functionality regarding planes. A plane object is stored in a pCPlane variable and is created with the pxCreate function.
package Math.Planes is

   type CPlane is private;
   --  <summary>Class for plane.</summary>


   function xCreate (xNormalVector : in Math.Vectors.CVector; fDistanceFromOrigin : in float) return CPlane;
   --  <summary>Creates an object of type CPlane. Returns a pointer of type pCPlane to the object created.</summary>
   --  <parameter name="pxNormalVector">The normal vector of the plane to be created.</parameter>
   --  <parameter name="fDistanceFromOrigin">The distance from origin to plane along the normal vector.</parameter>
   --  <exception>Numeric_Error, if pxNormalVector vector length = 0.0.</exception>


   --procedure Log_Plane(this : in CPlane);

   function xGet_Normal_Vector (this : in CPlane) return Math.Vectors.CVector;
   --  <summary>Returns a copy of the plane's normal vector.</summary>
   --  <parameter name="this">Represents the plane which the normal vector will be copied from.</parameter>

   function fGet_Distance_From_Origin (this : in CPlane) return float;
   --  <summary>Returns the distance from origin to plane along the normal vector.</summary>
   --  <parameter name="this">Represents the plane which the distance will be read from.</parameter>


   function fAngle_Between_In_Radians (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return float;
   --  <summary>Returns the closest angle in degrees between the two planes.</summary>
   --  <parameter name="pxLeftOperandPlane">Represents the left operand plane.</parameter>
   --  <parameter name="pxRightOperandPlane">Represents the right operand plane.</parameter>

   function xGet_Intersection_Vector_Between (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return Math.Vectors.CVector;
   --  <summary>Creates an object of type CVector representing the vector defining the intersection line between the two planes.</summary>
   --  <parameter name="pxLeftOperandPlane">Represents the left operand plane.</parameter>
   --  <parameter name="pxRightOperandPlane">Represents the right operand plane.</parameter>
   --  <exception>Numeric_Error, if the planes are parallel.</exception>


   procedure Copy_From(this : in out CPlane; xSourcePlane : in CPlane);


private
   type CPlane is
      record
         fA : float;
         fB : float;
         fC : float;
         fD : float;
      end record;

end Math.Planes;
