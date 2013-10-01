with Math;
with Math.Vectors;
with Ada.Numerics;

package body Math.Planes is

   function pxCreate (pxNormalVector : in Math.Vectors.pCVector; fDistanceFromOrigin : in float) return pCPlane is
      pxNewPlane : pCPlane;
      pxNormalizedNormal : Math.Vectors.pCVector;
   begin
      pxNewPlane := new CPlane;
      pxNormalizedNormal := pxNormalVector.pxGet_Normalized;
      pxNewPlane.fAX := pxNormalizedNormal.fGet_X;
      pxNewPlane.fBY := pxNormalizedNormal.fGet_Y;
      pxNewPlane.fCZ := pxNormalizedNormal.fGet_Z;
      pxNewPlane.fD := fDistanceFromOrigin;
      return pxNewPlane;
   end pxCreate;

   function fGet_AX (this : in CPlane) return float is
   begin
      return this.fAX;
   end fGet_AX;

   function fGet_BY (this : in CPlane) return float is
   begin
      return this.fBY;
   end fGet_BY;

   function fGet_CZ (this : in CPlane) return float is
   begin
      return this.fCZ;
   end fGet_CZ;

   function fGet_D (this : in CPlane) return float is
   begin
      return this.fD;
   end fGet_D;

   function fAngle_Between (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return float is
      fAngleInRadians : float;
      fAngleInDegrees : float;
   begin
      fAngleInRadians := Math.Vectors.fAngle_Between(pxLeftOperandVector  => pxLeftOperandPlane.pxGet_Normal_Vector,
                                                     pxRightOperandVector => pxRightOperandPlane.pxGet_Normal_Vector);
      fAngleInDegrees :=  fAngleInRadians * (180.0 / Ada.Numerics.Pi);
      return fAngleInDegrees;
   end fAngle_Between;


   function pxGet_Normal_Vector (this : in CPlane) return Math.Vectors.pCVector is
   begin
      return Math.Vectors.pxCreate(fX => this.fAX,
                                   fY => this.fBY,
                                   fZ => this.fCZ);
   end pxGet_Normal_Vector;

   function pxGet_Intersection_Vector_Between (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return Math.Vectors.pCVector is
      pxIntersectionVector : Math.Vectors.pCVector;
   begin

      pxIntersectionVector := Math.Vectors.pxCross_Product(pxLeftOperandVector  => pxLeftOperandPlane.pxGet_Normal_Vector,
                                                           pxRightOperandVector => pxRightOperandPlane.pxGet_Normal_Vector);
      return pxIntersectionVector.pxGet_Normalized;
   end pxGet_Intersection_Vector_Between;




end Math.Planes;
