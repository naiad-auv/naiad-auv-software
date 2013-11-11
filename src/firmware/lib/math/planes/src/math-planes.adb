

package body Math.Planes is

   function xCreate (xNormalVector : in Math.Vectors.CVector; fDistanceFromOrigin : in float) return CPlane is
      UndefinedPlane : exception;
   begin
      if xNormalVector.fLength_Squared = 0.0 then
         raise UndefinedPlane;
      end if;

      return CPlane'(fA => xNormalVector.fGet_X,
                         fB => xNormalVector.fGet_Y,
                         fC => xNormalVector.fGet_Z,
                     fD => fDistanceFromOrigin / xNormalVector.fLength);
   exception
      when UndefinedPlane =>
         return CPlane'(fA => 0.0,
                         fB => 0.0,
                         fC => 0.0,
                     fD => 0.0);
   end xCreate;


   function xGet_Normal_Vector (this : in CPlane) return Math.Vectors.CVector is
      xNormalVector : Math.Vectors.CVector;
   begin
      xNormalVector := Math.Vectors.xCreate(fX => this.fA,
                                              fY => this.fB,
                                              fZ => this.fC);
      xNormalVector := xNormalVector.xGet_Normalized;
      return xNormalVector;
   end xGet_Normal_Vector;

   function fGet_Distance_From_Origin (this : in CPlane) return float is
      xNormalVector : Math.Vectors.CVector;
      fDistanceFromOrigin : float;
   begin
      xNormalVector := Math.Vectors.xCreate(fX => this.fA,
                                              fY => this.fB,
                                              fZ => this.fC);
      fDistanceFromOrigin := this.fD * xNormalVector.fLength;

      return abs(fDistanceFromOrigin);
   end fGet_Distance_From_Origin;

   function fAngle_Between_In_Radians (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return float is
      use math.Vectors;

   begin
      if xLeftOperandPlane.xGet_Normal_Vector = xRightOperandPlane.xGet_Normal_Vector or
        xLeftOperandPlane.xGet_Normal_Vector = -xRightOperandPlane.xGet_Normal_Vector then
         return 0.0;
      end if;

      return Math.Vectors.fAngle_Between_In_Radians(xLeftOperandPlane.xGet_Normal_Vector,
                                                                xRightOperandPlane.xGet_Normal_Vector);
   end fAngle_Between_In_Radians;


--     procedure Log_Plane(this : in CPlane) is
--     begin
--        Ada.Text_IO.Put_Line("Plane normal: " & float'Image(this.xGet_Normal_Vector.fGet_X) & ", " & float'Image(this.xGet_Normal_Vector.fGet_Y) & ", " & float'Image(this.xGet_Normal_Vector.fGet_Z) & ".");
--     end Log_Plane;


   function xGet_Intersection_Vector_Between (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return Math.Vectors.CVector is
      use Math.Vectors;
      PlanesNotIntersecting : exception;
   begin
      if xLeftOperandPlane.fGet_Distance_From_Origin * xLeftOperandPlane.xGet_Normal_Vector /=
        xRightOperandPlane.fGet_Distance_From_Origin * xRightOperandPlane.xGet_Normal_Vector and then
        Math.Vectors.fAngle_Between_In_Radians(xLeftOperandPlane.xGet_Normal_Vector, xRightOperandPlane.xGet_Normal_Vector) = 0.0 then
         raise PlanesNotIntersecting;
      end if;

      return Math.Vectors.xCross_Product(xLeftOperandPlane.xGet_Normal_Vector, xRightOperandPlane.xGet_Normal_Vector).xGet_Normalized;

   exception
      when PlanesNotIntersecting =>
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



end Math.Planes;
