
package body Math.Vectors is

   function xCreate (fX, fY, fZ : float) return CVector is
   begin

      return CVector'(fX => fX,
                          fY => fY,
                          fZ => fZ);
   end xCreate;

   function fLength_Squared (this : in CVector) return float is
   begin
      return (this.fX**2) +
        (this.fY**2) +
        (this.fZ**2);
   end fLength_Squared;

   function fLength (this : in CVector) return float is
   begin
      return Math.Elementary.Sqrt(fLength_Squared(this));
   end fLength;

   function "+" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector is
   begin
      return CVector'(fX => xLeftOperandVector.fX + xRightOperandVector.fX,
                      fY => xLeftOperandVector.fY + xRightOperandVector.fY,
                      fZ => xLeftOperandVector.fZ + xRightOperandVector.fZ);
   end "+";



   function "-" (xOperandVector : in CVector) return CVector is
   begin
      return CVector'(fX => -xOperandVector.fX,
                      fY => -xOperandVector.fY,
                      fZ => -xOperandVector.fZ);
   end "-";


   function "-" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector is
   begin
      return xLeftOperandVector + (-xRightOperandVector);
   end "-";


   function "*" (xLeftOperandVector, xRightOperandVector : in CVector) return CVector is
   begin
      return CVector'(fX => xLeftOperandVector.fX * xRightOperandVector.fX,
                      fY => xLeftOperandVector.fY * xRightOperandVector.fY,
                      fZ => xLeftOperandVector.fZ * xRightOperandVector.fZ);
   end "*";


   function "*" (xLeftOperandVector : in CVector; fRightOperand : in float) return CVector is
   begin

      return CVector'(fX => xLeftOperandVector.fX * fRightOperand,
                      fY => xLeftOperandVector.fY * fRightOperand,
                      fZ => xLeftOperandVector.fZ * fRightOperand);
   end "*";


   function "*" (fLeftOperand : in float; xRightOperandVector : in CVector) return CVector is
   begin
      return xRightOperandVector * fLeftOperand;
   end "*";


   function "/" (xLeftOperandVector : in CVector; fRightOperand : in float) return CVector is
      fScaleFactor : float;
      DivisionByZero : exception;
   begin
      if abs(fRightOperand) = 0.0 then
         raise DivisionByZero;
      end if;

      fScaleFactor := 1.0 / fRightOperand;

      return xLeftOperandVector * fScaleFactor;

   exception
      when DivisionByZero =>
         return Math.Vectors.xCreate(fX => 0.0,
                                     fY => 0.0,
                                     fZ => 0.0);
   end "/";

   function "=" (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return boolean is
   begin
      return abs(xLeftOperandVector.fX - xRightOperandVector.fX) < fVECTOR_PRECISION and
      abs(xLeftOperandVector.fY - xRightOperandVector.fY) < fVECTOR_PRECISION and
      abs(xLeftOperandVector.fZ - xRightOperandVector.fZ) < fVECTOR_PRECISION;
   end "=";

   function fGet_X (this : in CVector) return float is
   begin
      return this.fX;
   end fGet_X;

   function fGet_Y (this : in CVector) return float is
   begin
      return this.fY;
   end fGet_Y;

   function fGet_Z (this : in CVector) return float is
   begin
      return this.fZ;
   end fGet_Z;


   function fDot_Product (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return float is
   begin
      return (xLeftOperandVector.fX * xRightOperandVector.fX)
        + (xLeftOperandVector.fY * xRightOperandVector.fY)
        + (xLeftOperandVector.fZ * xRightOperandVector.fZ);
   end fDot_Product;

   function fAngle_Between_In_Radians (xLeftOperandVector, xRightOperandVector : in CVector) return float is
      fDotProduct : float;
      DivisionByZero : exception;
   begin
      if abs(fLength_Squared(xLeftOperandVector)) = 0.0 or abs(fLength_Squared(xRightOperandVector)) = 0.0 then
         raise DivisionByZero;
      end if;

      fDotProduct := Math.Vectors.fDot_Product(xLeftOperandVector, xRightOperandVector);

      fDotProduct := fDotProduct / (fLength(xLeftOperandVector) * fLength(xRightOperandVector));

      fDotProduct := float'Min(float'Max(fDotProduct,-1.0),1.0);

      return Math.Elementary.Acos(fDotProduct);

   exception
      when DivisionByZero =>
         return 0.0;
   end fAngle_Between_In_Radians;

   function xGet_Normalized (this : in CVector) return CVector is
      DivisionByZero : exception;
   begin
      if fLength_Squared(this) = 0.0 then
         raise DivisionByZero;
      end if;

      return this / fLength(this);

   exception
      when DivisionByZero =>
         return Math.Vectors.xCreate(fX => 0.0,
                                     fY => 0.0,
                                     fZ => 0.0);
   end xGet_Normalized;

   function xCross_Product (xLeftOperandVector : in CVector; xRightOperandVector : in CVector) return CVector is
   begin
      return CVector'(fX => (xLeftOperandVector.fY * xRightOperandVector.fZ) - (xLeftOperandVector.fZ * xRightOperandVector.fY),
                      fY => (xLeftOperandVector.fZ * xRightOperandVector.fX) - (xLeftOperandVector.fX * xRightOperandVector.fZ),
                      fZ => (xLeftOperandVector.fX * xRightOperandVector.fY) - (xLeftOperandVector.fY * xRightOperandVector.fX));
   end xCross_Product;

   procedure Copy_From (this : in out CVector; xSourceVector : in CVector) is
   begin
      this.fX := xSourceVector.fX;
      this.fY := xSourceVector.fY;
      this.fZ := xSourceVector.fZ;
   end Copy_From;

end Math.Vectors;
