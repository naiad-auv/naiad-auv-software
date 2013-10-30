with Math.Vectors;
with Ada.Numerics;
with Exception_Handling;

package body Math.Planes is

   function xCreate (xNormalVector : in Math.Vectors.CVector; fDistanceFromOrigin : in float) return CPlane is
   begin
      if xNormalVector.fLength_Squared = 0.0 then
         Exception_Handling.Raise_Exception(E => Exception_Handling.UndefinedPlane'Identity,
                                            Message => "Math.Planes.xCreate (xNormalVector : in Math.Vectors.CVector; fDistanceFromOrigin : in float) return CPlane");
      end if;

      return CPlane'(fA => xNormalVector.fGet_X,
                         fB => xNormalVector.fGet_Y,
                         fC => xNormalVector.fGet_Z,
                         fD => fDistanceFromOrigin / xNormalVector.fLength);
   end xCreate;

   function xCreate (pxNormalVector : in Math.Vectors.pCVector; fDistanceFromOrigin : in float) return CPlane is
      use Math.Vectors;
   begin
      if pxNormalVector /= null then
         return Math.Planes.xCreate(xNormalVector       => pxNormalVector.all,
                                    fDistanceFromOrigin => fDistanceFromOrigin);
      end if;

      Exception_Handling.Raise_Exception(E => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Planes.xCreate (pxNormalVector : in Math.Vectors.pCVector; fDistanceFromOrigin : in float) return CPlane");
      return CPlane'(fA => 0.0,
                     fB => 0.0,
                     fC => 0.0,
                     fD => 0.0);
   end xCreate;

   function pxGet_Allocated_Copy(this : in CPlane) return pCPlane is
   begin
      return new CPlane'(fA => this.fA,
                         fB => this.fB,
                         fC => this.fC,
                         fD => this.fD);
   end pxGet_Allocated_Copy;

   function xGet_Normal_Vector (this : in CPlane) return Math.Vectors.CVector is
      pxNormalVector : Math.Vectors.pCVector;
      xNormalVector : Math.Vectors.CVector;
   begin
      pxNormalVector := Math.Vectors.xCreate(fX => this.fA,
                                              fY => this.fB,
                                              fZ => this.fC).pxGet_Allocated_Copy;
      xNormalVector := pxNormalVector.xGet_Normalized;
      Math.Vectors.Free(pxVectorToDeallocate => pxNormalVector);
      return xNormalVector;
   end xGet_Normal_Vector;

   function fGet_Distance_From_Origin (this : in CPlane) return float is
      pxNormalVector : Math.Vectors.pCVector;
      fDistanceFromOrigin : float;
   begin
      pxNormalVector := Math.Vectors.xCreate(fX => this.fA,
                                              fY => this.fB,
                                              fZ => this.fC).pxGet_Allocated_Copy;
      fDistanceFromOrigin := this.fD * pxNormalVector.fLength;
      Math.Vectors.Free(pxVectorToDeallocate => pxNormalVector);

      return abs(fDistanceFromOrigin);
   end fGet_Distance_From_Origin;

   function fAngle_Between_In_Degrees (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return float is
      fAngleInRadians : float;
      fAngleInDegrees : float;
   begin
      fAngleInRadians := Math.Vectors.fAngle_Between_In_Radians(xLeftOperandPlane.xGet_Normal_Vector,
                                                                xRightOperandPlane.xGet_Normal_Vector);
      fAngleInDegrees :=  fAngleInRadians * (180.0 / Ada.Numerics.Pi);

      return fAngleInDegrees;
   end fAngle_Between_In_Degrees;

   function fAngle_Between_In_Degrees (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return float is
   begin
      if pxLeftOperandPlane /= null and then pxRightOperandPlane /= null then
         return fAngle_Between_In_Degrees(pxLeftOperandPlane.all, pxRightOperandPlane.all);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Planes.fAngle_Between_In_Degrees (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return float");
      return 0.0;
   end fAngle_Between_In_Degrees;

   function fAngle_Between_In_Degrees (pxLeftOperandPlane : in pCPlane; xRightOperandPlane : in CPlane) return float is
   begin
      if pxLeftOperandPlane /= null then
         return fAngle_Between_In_Degrees(pxLeftOperandPlane.all, xRightOperandPlane);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Planes.fAngle_Between_In_Degrees (pxLeftOperandPlane : in pCPlane; xRightOperandPlane : in CPlane) return float");
      return 0.0;
   end fAngle_Between_In_Degrees;

   function fAngle_Between_In_Degrees (xLeftOperandPlane : in CPlane; pxRightOperandPlane : in pCPlane) return float is
   begin
      if pxRightOperandPlane /= null then
         return fAngle_Between_In_Degrees(xLeftOperandPlane, pxRightOperandPlane.all);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Planes.fAngle_Between_In_Degrees (xLeftOperandPlane : in CPlane; pxRightOperandPlane : in pCPlane) return float");
      return 0.0;
   end fAngle_Between_In_Degrees;

--     procedure Log_Plane(this : in CPlane) is
--     begin
--        Ada.Text_IO.Put_Line("Plane normal: " & float'Image(this.xGet_Normal_Vector.fGet_X) & ", " & float'Image(this.xGet_Normal_Vector.fGet_Y) & ", " & float'Image(this.xGet_Normal_Vector.fGet_Z) & ".");
--     end Log_Plane;


   function xGet_Intersection_Vector_Between (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return Math.Vectors.CVector is
      use Math.Vectors;
      xVector : Math.Vectors.CVector;
   begin
      if xLeftOperandPlane.fGet_Distance_From_Origin * xLeftOperandPlane.xGet_Normal_Vector /=
        xRightOperandPlane.fGet_Distance_From_Origin * xRightOperandPlane.xGet_Normal_Vector and then
        Math.Vectors.fAngle_Between_In_Radians(xLeftOperandPlane.xGet_Normal_Vector, xRightOperandPlane.xGet_Normal_Vector) = 0.0 then
         Exception_Handling.Raise_Exception(E       => Exception_Handling.NoIntersectionBetweenPlanes'Identity,
                                            Message => "Math.Planes.xGet_Intersection_Vector_Between (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return Math.Vectors.CVector");
      end if;

      return Math.Vectors.xCross_Product(xLeftOperandPlane.xGet_Normal_Vector, xRightOperandPlane.xGet_Normal_Vector).xGet_Normalized;

   exception
      when Exception_Handling.DivisionByZero =>
         Exception_Handling.Handled_Exception;
         xVector := Math.Vectors.xCreate(fX => 1.0,
                                           fY => 0.0,
                                           fZ => 0.0);
         if xVector = xLeftOperandPlane.xGet_Normal_Vector then
            xVector := Math.Vectors.xCreate(fX => 0.0,
                                              fY => 1.0,
                                              fZ => 0.0);
         end if;
         return Math.Vectors.xCross_Product(xLeftOperandPlane.xGet_Normal_Vector + xVector, xRightOperandPlane.xGet_Normal_Vector).xGet_Normalized;
   end xGet_Intersection_Vector_Between;

   function xGet_Intersection_Vector_Between (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return Math.Vectors.CVector is
   begin
      if pxLeftOperandPlane /= null and then pxRightOperandPlane /= null then
         return xGet_Intersection_Vector_Between(pxLeftOperandPlane.all, pxRightOperandPlane.all);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Planes.xGet_Intersection_Vector_Between (pxLeftOperandPlane : in pCPlane; pxRightOperandPlane : in pCPlane) return Math.Vectors.CVector");
      return Math.Vectors.xCreate(fX => 0.0,
                                  fY => 0.0,
                                  fZ => 0.0);
   end xGet_Intersection_Vector_Between;

   function xGet_Intersection_Vector_Between (pxLeftOperandPlane : in pCPlane; xRightOperandPlane : in CPlane) return Math.Vectors.CVector is
   begin
      if pxLeftOperandPlane /= null then
         return xGet_Intersection_Vector_Between(pxLeftOperandPlane.all, xRightOperandPlane);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Planes.xGet_Intersection_Vector_Between (pxLeftOperandPlane : in pCPlane; xRightOperandPlane : in CPlane) return Math.Vectors.CVector");
      return Math.Vectors.xCreate(fX => 0.0,
                                  fY => 0.0,
                                  fZ => 0.0);
   end xGet_Intersection_Vector_Between;

   function xGet_Intersection_Vector_Between (xLeftOperandPlane : in CPlane; pxRightOperandPlane : in pCPlane) return Math.Vectors.CVector is
   begin
      if pxRightOperandPlane /= null then
         return xGet_Intersection_Vector_Between(xLeftOperandPlane, pxRightOperandPlane.all);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Planes.xGet_Intersection_Vector_Between (xLeftOperandPlane : in CPlane; pxRightOperandPlane : in pCPlane) return Math.Vectors.CVector");
      return Math.Vectors.xCreate(fX => 0.0,
                                  fY => 0.0,
                                  fZ => 0.0);
   end xGet_Intersection_Vector_Between;

   procedure Copy_From(this : in out CPlane; xSourcePlane : in CPlane) is
   begin
         this.fA := xSourcePlane.fA;
         this.fB := xSourcePlane.fB;
         this.fC := xSourcePlane.fC;
         this.fD := xSourcePlane.fD;
   end Copy_From;


   procedure Free(pxPlaneToDeallocate : in out pCPlane) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CPlane, pCPlane);
   begin
      Dealloc(pxPlaneToDeallocate);
   end Free;

end Math.Planes;
