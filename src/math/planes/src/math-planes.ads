with Math;
with Math.Vectors; use Math.Vectors;

package Math.Planes is

   type CPlane is tagged private;
   type pCPlane is access CPlane;

   function pxCreate (pxNormalVector : in Math.Vectors.pCVector; fDistanceFromOrigin : in float) return pCPlane;

   function pxGet_Normal_Vector (this : in CPlane) return Math.Vectors.pCVector;
   function fGet_Distance_From_Origin (this : in CPlane) return float;

   function fAngle_Between_In_Degrees (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return float;

   function pxGet_Intersection_Vector_Between (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return Math.Vectors.pCVector;



private
   type CPlane is tagged
      record
         pxNormalVector : Math.Vectors.pCVector;
         fDistanceFromOrigin : float;
      end record;

end Math.Planes;
