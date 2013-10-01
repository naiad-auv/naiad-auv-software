with Math;
with Math.Vectors; use Math.Vectors;

package Math.Planes is

   type CPlane is tagged private;
   type pCPlane is access CPlane;

   function pxCreate (pxNormalVector : in Math.Vectors.pCVector; fDistanceFromOrigin : in float) return pCPlane;

   function fGet_AX (this : in CPlane) return float;
   function fGet_BY (this : in CPlane) return float;
   function fGet_CZ (this : in CPlane) return float;
   function fGet_D (this : in CPlane) return float;

   function fAngle_Between (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return float;

   function pxGet_Normal_Vector (this : in CPlane) return Math.Vectors.pCVector;


private
   type CPlane is tagged
      record
         fAX : float;
         fBY : float;
         fCZ : float;
         fD : float;
      end record;

end Math.Planes;
