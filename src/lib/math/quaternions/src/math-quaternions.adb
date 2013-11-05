with Math.Vectors;
with Ada.Numerics.Elementary_Functions;
with Ada.Numerics;
with Exception_Handling;

package body Math.Quaternions is

--     function xCreate (fX : in float; fY : in float; fZ : in float; fW : in float) return CQuaternion is
--     begin
--        return CQuaternion'(fX => fX,
--                                fY => fY,
--                                fZ => fZ,
--                                fW => fW);
--     end xCreate;


   function xCreate (xAxisVector : in Math.Vectors.CVector; fAngleInDegrees : in float) return CQuaternion is
      fAngleInRadians : float;
      fNorm : float;
      fScale : float;
      pxNormalizedAxisVector : Math.Vectors.pCVector;
      fX, fY, fZ, fW : float;
   begin
      if xAxisVector.fLength_Squared /= 1.0 then
         pxNormalizedAxisVector := xAxisVector.xGet_Normalized.pxGet_Allocated_Copy;
      else
         pxNormalizedAxisVector := xAxisVector.pxGet_Allocated_Copy;
      end if;

      fAngleInRadians := fAngleInDegrees * (Ada.Numerics.Pi / 180.0);
      fNorm :=fAngleInRadians / 2.0;
      fScale := Ada.Numerics.Elementary_Functions.Sin(fNorm);

      fX := fScale * pxNormalizedAxisVector.fGet_X;
      fY := fScale * pxNormalizedAxisVector.fGet_Y;
      fZ := fScale * pxNormalizedAxisVector.fGet_Z;
      fW := Ada.Numerics.Elementary_Functions.Cos(fNorm);
      Math.Vectors.Free(pxVectorToDeallocate => pxNormalizedAxisVector);

      return CQuaternion'(fX => fX,
                          fY => fY,
                          fZ => fZ,
                          fW => fW);
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Math.Quaternions.xCreate (xAxisVector : in Math.Vectors.CVector; fAngleInDegrees : in float) return CQuaternion");
         return CQuaternion'(fX => fX,
                             fY => fY,
                             fZ => fZ,
                             fW => fW);
   end xCreate;

   function xCreate (pxAxisVector : in Math.Vectors.pCVector; fAngleInDegrees : in float) return CQuaternion is
      use Math.Vectors;
   begin
      if pxAxisVector /= null then
         return Math.Quaternions.xCreate(xAxisVector    => pxAxisVector.all,
                                          fAngleInDegrees => fAngleInDegrees);
      end if;


      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Quaternions.xCreate (pxAxisVector : in Math.Vectors.pCVector; fAngleInDegrees : in float) return CQuaternion");
      return CQuaternion'(fX => 0.0,
                          fY => 0.0,
                          fZ => 0.0,
                          fW => 0.0);
   end xCreate;

   function pxGet_Allocated_Copy (this : in CQuaternion) return pCQuaternion is
   begin
      return new CQuaternion'(fX => this.fX,
                              fY => this.fY,
                              fZ => this.fZ,
                              fW => this.fW);
   end pxGet_Allocated_Copy;

   function "*" (xLeftOperandQuaternion, xRightOperandQuaternion : in CQuaternion) return CQuaternion is
   begin
      return Math.Quaternions.CQuaternion'(fX => ((xLeftOperandQuaternion.fW*xRightOperandQuaternion.fX)+(xLeftOperandQuaternion.fX*xRightOperandQuaternion.fW)+(xLeftOperandQuaternion.fY*xRightOperandQuaternion.fZ)-(xLeftOperandQuaternion.fZ*xRightOperandQuaternion.fY)),
                                           fY => ((xLeftOperandQuaternion.fW*xRightOperandQuaternion.fY)-(xLeftOperandQuaternion.fX*xRightOperandQuaternion.fZ)+(xLeftOperandQuaternion.fY*xRightOperandQuaternion.fW)+(xLeftOperandQuaternion.fZ*xRightOperandQuaternion.fX)),
                                           fZ => ((xLeftOperandQuaternion.fW*xRightOperandQuaternion.fZ)+(xLeftOperandQuaternion.fX*xRightOperandQuaternion.fY)-(xLeftOperandQuaternion.fY*xRightOperandQuaternion.fX)-(xLeftOperandQuaternion.fZ*xRightOperandQuaternion.fW)),
                                           fW => ((xLeftOperandQuaternion.fW*xRightOperandQuaternion.fW)-(xLeftOperandQuaternion.fX*xRightOperandQuaternion.fX)-(xLeftOperandQuaternion.fY*xRightOperandQuaternion.fY)-(xLeftOperandQuaternion.fZ*xRightOperandQuaternion.fZ)));
   end "*";

   function "*" (xLeftOperandQuaternion : in CQuaternion; pxRightOperandQuaternion : in pCQuaternion) return CQuaternion is
   begin
      if pxRightOperandQuaternion /= null then
         return xLeftOperandQuaternion * pxRightOperandQuaternion.all;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Quaternions.""*"" (xLeftOperandQuaternion : in CQuaternion; pxRightOperandQuaternion : in pCQuaternion) return CQuaternion");
      return CQuaternion'(fX => 0.0,
                          fY => 0.0,
                          fZ => 0.0,
                          fW => 0.0);
   end "*";

   function "*" (pxLeftOperandQuaternion : in pCQuaternion; xRightOperandQuaternion : in CQuaternion) return CQuaternion is
   begin
      if pxLeftOperandQuaternion /= null then
         return pxLeftOperandQuaternion.all * xRightOperandQuaternion;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Quaternions.""*"" (pxLeftOperandQuaternion : in pCQuaternion; xRightOperandQuaternion : in CQuaternion) return CQuaternion");
      return CQuaternion'(fX => 0.0,
                          fY => 0.0,
                          fZ => 0.0,
                          fW => 0.0);
   end "*";

   function "*" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return CQuaternion is
   begin
      if pxLeftOperandQuaternion /= null and then pxRightOperandQuaternion /= null then
         return pxLeftOperandQuaternion.all * pxRightOperandQuaternion.all;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Quaternions.""*"" (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return CQuaternion");
      return CQuaternion'(fX => 0.0,
                          fY => 0.0,
                          fZ => 0.0,
                          fW => 0.0);
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

   function fGet_Dot_Product (pxLeftOperandQuaternion : in pCQuaternion; xRightOperandQuaternion : in CQuaternion) return float is
   begin
      if pxLeftOperandQuaternion /= null then
         return fGet_Dot_Product(pxLeftOperandQuaternion.all, xRightOperandQuaternion);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Quaternions.fGet_Dot_Product (pxLeftOperandQuaternion : in pCQuaternion; xRightOperandQuaternion : in CQuaternion) return float");
      return 0.0;
   end fGet_Dot_Product;

   function fGet_Dot_Product (xLeftOperandQuaternion : in CQuaternion; pxRightOperandQuaternion : in pCQuaternion) return float is
   begin
      if pxRightOperandQuaternion /= null then
         return fGet_Dot_Product(xLeftOperandQuaternion, pxRightOperandQuaternion.all);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Quaternions.fGet_Dot_Product (xLeftOperandQuaternion : in CQuaternion; pxRightOperandQuaternion : in pCQuaternion) return float");
      return 0.0;
   end fGet_Dot_Product;

   function fGet_Dot_Product (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return float is
   begin
      if pxLeftOperandQuaternion /= null and then pxRightOperandQuaternion /= null then
         return fGet_Dot_Product(pxLeftOperandQuaternion.all, pxRightOperandQuaternion.all);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Quaternions.fGet_Dot_Product (pxLeftOperandQuaternion, pxRightOperandQuaternion : in pCQuaternion) return float");
      return 0.0;
   end fGet_Dot_Product;

   function xGet_Normalized (this : in CQuaternion) return CQuaternion is
      fLength : float;
   begin

      if this.fGet_Length_Squared = 0.0 then
         Exception_Handling.Raise_Exception(E       => Exception_Handling.DivisionByZero'Identity,
                                            Message => "Math.Quaternions.xGet_Normalized (this : in CQuaternion) return CQuaternion");
      end if;

      fLength := this.fGet_Length;

      return Math.Quaternions.CQuaternion'(fX => this.fX / fLength,
                                       fY => this.fY / fLength,
                                       fZ => this.fZ / fLength,
                                       fW => this.fW / fLength);
   end xGet_Normalized;

   function fGet_Length (this : in CQuaternion) return float is
   begin
      return Ada.Numerics.Elementary_Functions.Sqrt((this.fX*this.fX) + (this.fY*this.fY) + (this.fZ*this.fZ) + (this.fW*this.fW));
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
      pxAxisVector : Math.Vectors.pCVector;
      xAxisVector : Math.Vectors.CVector;
   begin
      fScale := Ada.Numerics.Elementary_Functions.Sqrt((this.fX*this.fX)+(this.fY*this.fY)+(this.fZ*this.fZ));
      if fScale = 0.0 then
         pxAxisVector := Math.Vectors.xCreate(fX => 1.0,
                                               fY => 0.0,
                                               fZ => 0.0).pxGet_Allocated_Copy;
      else
         pxAxisVector := Math.Vectors.xCreate(fX => this.fX / fScale,
                                               fY => this.fY / fScale,
                                               fZ => this.fZ / fScale).pxGet_Allocated_Copy;
      end if;

      xAxisVector.Copy_From(xSourceVector => pxAxisVector.all);
      Math.Vectors.Free(pxVectorToDeallocate => pxAxisVector);

      return xAxisVector;
   end xGet_Axis_Vector;

   function fGet_Angle_In_Degrees (this : in CQuaternion) return float is
   begin
      return ((2.0*180.0)/Ada.Numerics.Pi) * Ada.Numerics.Elementary_Functions.Arccos(this.fW);
   end fGet_Angle_In_Degrees;

   procedure Copy_From(this : in out CQuaternion; xSourceQuaternion : in CQuaternion) is
   begin
      this.fX := xSourceQuaternion.fX;
      this.fY := xSourceQuaternion.fY;
      this.fZ := xSourceQuaternion.fZ;
      this.fW := xSourceQuaternion.fW;
   end Copy_From;

   procedure Free(pxQuaternionToDeallocate : in out pCQuaternion) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CQuaternion, pCQuaternion);
   begin
      Dealloc(pxQuaternionToDeallocate);
   end Free;

end Math.Quaternions;
