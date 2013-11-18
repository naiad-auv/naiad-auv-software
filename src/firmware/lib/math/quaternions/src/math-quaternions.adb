with Math.Vectors;

package body Math.Quaternions is


   function xCreate (xAxisVector : in Math.Vectors.CVector; fAngleInDegrees : in float) return CQuaternion is
      fAngleInRadians : float;
      fNorm : float;
      fScale : float;
      xNormalizedAxisVector : Math.Vectors.CVector;
      fX, fY, fZ, fW : float;
   begin

      if xAxisVector.fLength_Squared /= 1.0 then
         xNormalizedAxisVector := xAxisVector.xGet_Normalized;
      else
         xNormalizedAxisVector := xAxisVector;
      end if;

      fAngleInRadians := fAngleInDegrees * (Math.Elementary.Pi / 180.0);
      fNorm :=fAngleInRadians / 2.0;
      fScale := Math.Elementary.Sin(fNorm);

      fX := fScale * xNormalizedAxisVector.fGet_X;
      fY := fScale * xNormalizedAxisVector.fGet_Y;
      fZ := fScale * xNormalizedAxisVector.fGet_Z;
      fW := Math.Elementary.Cos(fNorm);

      return CQuaternion'(fX => fX,
                          fY => fY,
                          fZ => fZ,
                          fW => fW);
   end xCreate;




   function "*" (xLeftOperandQuaternion, xRightOperandQuaternion : in CQuaternion) return CQuaternion is
   begin
      return Math.Quaternions.CQuaternion'(fX => ((xLeftOperandQuaternion.fW*xRightOperandQuaternion.fX)+(xLeftOperandQuaternion.fX*xRightOperandQuaternion.fW)+(xLeftOperandQuaternion.fY*xRightOperandQuaternion.fZ)-(xLeftOperandQuaternion.fZ*xRightOperandQuaternion.fY)),
                                           fY => ((xLeftOperandQuaternion.fW*xRightOperandQuaternion.fY)-(xLeftOperandQuaternion.fX*xRightOperandQuaternion.fZ)+(xLeftOperandQuaternion.fY*xRightOperandQuaternion.fW)+(xLeftOperandQuaternion.fZ*xRightOperandQuaternion.fX)),
                                           fZ => ((xLeftOperandQuaternion.fW*xRightOperandQuaternion.fZ)+(xLeftOperandQuaternion.fX*xRightOperandQuaternion.fY)-(xLeftOperandQuaternion.fY*xRightOperandQuaternion.fX)-(xLeftOperandQuaternion.fZ*xRightOperandQuaternion.fW)),
                                           fW => ((xLeftOperandQuaternion.fW*xRightOperandQuaternion.fW)-(xLeftOperandQuaternion.fX*xRightOperandQuaternion.fX)-(xLeftOperandQuaternion.fY*xRightOperandQuaternion.fY)-(xLeftOperandQuaternion.fZ*xRightOperandQuaternion.fZ)));
   end "*";


   function "=" (xLeftOperandQuaternion, xRightOperandQuaternion : in CQuaternion) return boolean is
   begin
      return (xLeftOperandQuaternion.fX = xRightOperandQuaternion.fX) and then
        (xLeftOperandQuaternion.fY = xRightOperandQuaternion.fY) and then
        (xLeftOperandQuaternion.fZ = xRightOperandQuaternion.fZ) and then
        (xLeftOperandQuaternion.fW = xRightOperandQuaternion.fW);
   end "=";

   function fGet_Dot_Product (xLeftOperandQuaternion, xRightOperandQuaternion : in CQuaternion) return float is
   begin
      return (xLeftOperandQuaternion.fX * xRightOperandQuaternion.fX) +
        (xLeftOperandQuaternion.fY * xRightOperandQuaternion.fY) +
        (xLeftOperandQuaternion.fZ * xRightOperandQuaternion.fZ) +
        (xLeftOperandQuaternion.fW * xRightOperandQuaternion.fW);
   end fGet_Dot_Product;


   function xGet_Normalized (this : in CQuaternion) return CQuaternion is
      fLength : float;
      DivisionByZero : exception;
   begin

      if this.fGet_Length_Squared = 0.0 then
         raise DivisionByZero;
      end if;

      fLength := this.fGet_Length;

      return Math.Quaternions.CQuaternion'(fX => this.fX / fLength,
                                           fY => this.fY / fLength,
                                           fZ => this.fZ / fLength,
                                           fW => this.fW / fLength);
   exception
      when DivisionByZero =>
         return Math.Quaternions.CQuaternion'(fX => 0.0,
                                              fY => 0.0,
                                              fZ => 0.0,
                                              fW => 0.0);
   end xGet_Normalized;

   function fGet_Length (this : in CQuaternion) return float is
   begin
      return Math.Elementary.Sqrt((this.fX*this.fX) + (this.fY*this.fY) + (this.fZ*this.fZ) + (this.fW*this.fW));
   end fGet_Length;

   function fGet_Length_Squared (this : in CQuaternion) return float is
   begin
      return (this.fX*this.fX) + (this.fY*this.fY) + (this.fZ*this.fZ) + (this.fW*this.fW);
   end fGet_Length_Squared;

   function fGet_X ( this : in CQuaternion) return float is
   begin
      return this.fX;
   end fGet_X;

   function fGet_Y ( this : in CQuaternion) return float is
   begin
      return this.fY;
   end fGet_Y;

   function fGet_Z ( this : in CQuaternion) return float is
   begin
      return this.fZ;
   end fGet_Z;

   function fGet_W ( this : in CQuaternion) return float is
   begin
      return this.fW;
   end fGet_W;

   function xGet_Axis_Vector ( this : in CQuaternion) return Math.Vectors.CVector is
      fScale : float;
      xAxisVector : Math.Vectors.CVector;
   begin
      fScale := Math.Elementary.Sqrt((this.fX*this.fX)+(this.fY*this.fY)+(this.fZ*this.fZ));
      if fScale = 0.0 then
         xAxisVector := Math.Vectors.xCreate(fX => 1.0,
                                               fY => 0.0,
                                               fZ => 0.0);
      else
         xAxisVector := Math.Vectors.xCreate(fX => this.fX / fScale,
                                               fY => this.fY / fScale,
                                               fZ => this.fZ / fScale);
      end if;

      return xAxisVector;
   end xGet_Axis_Vector;

   function fGet_Angle_In_Degrees (this : in CQuaternion) return float is
   begin
      return ((2.0*180.0)/Math.Elementary.Pi) * Math.Elementary.Acos(this.fW);
   end fGet_Angle_In_Degrees;

   procedure Copy_From(this : in out CQuaternion; xSourceQuaternion : in CQuaternion) is
   begin
      this.fX := xSourceQuaternion.fX;
      this.fY := xSourceQuaternion.fY;
      this.fZ := xSourceQuaternion.fZ;
      this.fW := xSourceQuaternion.fW;
   end Copy_From;


end Math.Quaternions;
