with Math.Vectors;
with Ada.Numerics;

package body Math.Planes is

   function pxCreate (pxNormalVector : in Math.Vectors.pCVector; fDistanceFromOrigin : in float) return pCPlane is
      pxNewPlane : pCPlane;
   begin
      pxNewPlane := new CPlane;
      pxNewPlane.pxNormalVector := pxNormalVector.pxGet_Normalized;
      pxNewPlane.fDistanceFromOrigin := fDistanceFromOrigin;
      return pxNewPlane;
   end pxCreate;

   function pxGet_Normal_Vector (this : in CPlane) return Math.Vectors.pCVector is
   begin
      return this.pxNormalVector.pxGet_Copy;
   end pxGet_Normal_Vector;



   function fGet_Distance_From_Origin (this : in CPlane) return float is
   begin
      return this.fDistanceFromOrigin;
   end fGet_Distance_From_Origin;

   function fAngle_Between_In_Degrees (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return float is
      fAngleInRadians : float;
      fAngleInDegrees : float;
   begin
      fAngleInRadians := Math.Vectors.fAngle_Between_In_Radians(pxLeftOperandVector  => pxLeftOperandPlane.pxGet_Normal_Vector,
                                                                pxRightOperandVector => pxRightOperandPlane.pxGet_Normal_Vector);
      fAngleInDegrees :=  fAngleInRadians * (180.0 / Ada.Numerics.Pi);
      return fAngleInDegrees;
   end fAngle_Between_In_Degrees;


   function pxGet_Intersection_Vector_Between (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return Math.Vectors.pCVector is
      pxIntersectionVector : Math.Vectors.pCVector;
   begin

      if abs(Math.Vectors.fDot_Product(pxLeftOperandPlane.pxNormalVector, pxRightOperandPlane.pxNormalVector)) = 1.0 then
         raise Numeric_Error;
      end if;

      pxIntersectionVector := Math.Vectors.pxCross_Product(pxLeftOperandVector  => pxLeftOperandPlane.pxGet_Normal_Vector,
                                                           pxRightOperandVector => pxRightOperandPlane.pxGet_Normal_Vector);
      return pxIntersectionVector.pxGet_Normalized;
   end pxGet_Intersection_Vector_Between;




end Math.Planes;
