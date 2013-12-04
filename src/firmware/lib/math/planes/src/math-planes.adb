

package body Math.Planes is

   function xCreate (xNormalVector : in Math.Vectors.CVector; fDistanceFromOrigin : in float) return CPlane is
      UndefinedPlane : exception;
   begin
      if Math.Vectors.fLength_Squared(xNormalVector) = 0.0 then
         raise UndefinedPlane;
      end if;

      return CPlane'(fA => Math.Vectors.fGet_X(xNormalVector),
                         fB => Math.Vectors.fGet_Y(xNormalVector),
                         fC => Math.Vectors.fGet_Z(xNormalVector),
                     fD => fDistanceFromOrigin / Math.Vectors.fLength(xNormalVector));
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
      xNormalVector := Math.Vectors.xGet_Normalized(xNormalVector);
      return xNormalVector;
   end xGet_Normal_Vector;

   function fGet_Distance_From_Origin (this : in CPlane) return float is
      xNormalVector : Math.Vectors.CVector;
      fDistanceFromOrigin : float;
   begin
      xNormalVector := Math.Vectors.xCreate(fX => this.fA,
                                              fY => this.fB,
                                              fZ => this.fC);
      fDistanceFromOrigin := this.fD * Math.Vectors.fLength(xNormalVector);

      return abs(fDistanceFromOrigin);
   end fGet_Distance_From_Origin;

   function fAngle_Between_In_Radians (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return float is
      use math.Vectors;

   begin
      if xGet_Normal_Vector(xLeftOperandPlane) = xGet_Normal_Vector(xRightOperandPlane) or
        xGet_Normal_Vector(xLeftOperandPlane) = -xGet_Normal_Vector(xRightOperandPlane) then
         return 0.0;
      end if;

      return Math.Vectors.fAngle_Between_In_Radians(xGet_Normal_Vector(xLeftOperandPlane),
                                                                xGet_Normal_Vector(xRightOperandPlane));
   end fAngle_Between_In_Radians;


--     procedure Log_Plane(this : in CPlane) is
--     begin
--        Ada.Text_IO.Put_Line("Plane normal: " & float'Image(this.xGet_Normal_Vector.fGet_X) & ", " & float'Image(this.xGet_Normal_Vector.fGet_Y) & ", " & float'Image(this.xGet_Normal_Vector.fGet_Z) & ".");
--     end Log_Plane;


   function xGet_Intersection_Vector_Between (xLeftOperandPlane : in CPlane; xRightOperandPlane : in CPlane) return Math.Vectors.CVector is
      use Math.Vectors;
      PlanesNotIntersecting : exception;
   begin
      if fGet_Distance_From_Origin(xLeftOperandPlane) * xGet_Normal_Vector(xLeftOperandPlane) /=
        fGet_Distance_From_Origin(xRightOperandPlane) * xGet_Normal_Vector(xRightOperandPlane) and then
        Math.Vectors.fAngle_Between_In_Radians(xGet_Normal_Vector(xLeftOperandPlane), xGet_Normal_Vector(xRightOperandPlane)) = 0.0 then
         raise PlanesNotIntersecting;
      end if;

      return xGet_Normalized(Math.Vectors.xCross_Product(xGet_Normal_Vector(xLeftOperandPlane), xGet_Normal_Vector(xRightOperandPlane)));

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
