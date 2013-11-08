package body Projection_2D is


   function txGet_Plane_2D_Projection
     (iCenterX : in integer;
      iCenterY : in integer;
      iWidth : in integer;
      iHeight : in integer;
      xOrientation : in Math.Matrices.CMatrix)
      return TPlaneProjectionPoints
   is

      use Math.Vectors;
      Div_By_Zero : exception;

      txProjection : TPlaneProjectionPoints;

      xPlaneXVector : Math.Vectors.CVector := Math.Vectors.xCross_Product(xLeftOperandVector  => xOrientation.xGet_Y_Vector,
                                                                          xRightOperandVector => xOrientation.xGet_Z_Vector);
      xPlaneYVector : Math.Vectors.CVector := xOrientation.xGet_Y_Vector;

      xPlaneCornerVectors : array (UpperLeft .. LowerRight) of Math.Vectors.CVector;

--        xScaleVector : Math.Vectors.CVector := Math.Vectors.xCreate(fX => -1.0,
--                                                                    fY => 1.0,
--                                                                    fZ => 1.0);
      xMoveVector : Math.Vectors.CVector := Math.Vectors.xCreate(fX => 0.0,
                                                                 fY => 0.0,
                                                                 fZ => -2.0);
      fXScale : float := float(iWidth / 2);
      fYScale : float := float(iHeight / 2);
      fCurrentX : float;
      fCurrentY : float;

      fW : float;
   begin
      xPlaneXVector := xPlaneXVector + xMoveVector;
      xPlaneYVector := xPlaneYVector + xMoveVector;

      xPlaneCornerVectors(UpperLeft) := xPlaneYVector + xPlaneXVector;
      xPlaneCornerVectors(UpperRight) := -xPlaneYVector + xPlaneXVector;
      xPlaneCornerVectors(LowerLeft) := xPlaneYVector - xPlaneXVector;
      xPlaneCornerVectors(LowerRight) := -xPlaneYVector - xPlaneXVector;

      for i in txProjection'Range loop
         fW := 2.0 - xPlaneCornerVectors(i).fGet_Z;

         if fW = 0.0 then
            raise Div_By_Zero;
         end if;

         fCurrentX := (fXScale * (-xPlaneCornerVectors(i).fGet_Y)) / fW;
         fCurrentY := (fYScale * (xPlaneCornerVectors(i).fGet_X)) / fW;
         txProjection(i) := TPoint'(X => integer(fCurrentX) + iCenterX,
                                   Y => integer(fCurrentX) + iCenterY);
      end loop;

      return txProjection;
   end txGet_Plane_2D_Projection;


   function txGet_Orientation_2D_Projection
     (iCenterX : in integer;
      iCenterY : in integer;
      iWidth : in integer;
      iHeight : in integer;
      xOrientation : in Math.Matrices.CMatrix)
      return TOrientationProjectionPoints
   is

      use Math.Vectors;
      Div_By_Zero : exception;

      txProjection : TOrientationProjectionPoints;

      xAxiVectors : array (XVector .. ZVector) of Math.Vectors.CVector;
--        xScaleVector : Math.Vectors.CVector := Math.Vectors.xCreate(fX => -1.0,
--                                                                    fY => 1.0,
--                                                                    fZ => 1.0);
      xMoveVector : Math.Vectors.CVector := Math.Vectors.xCreate(fX => 0.0,
                                                                 fY => 0.0,
                                                                 fZ => -2.0);
      fXScale : float := float(iWidth / 2);
      fYScale : float := float(iHeight / 2);
      fCurrentX : float;
      fCurrentY : float;

      fW : float;
   begin
      xAxiVectors(XVector) := xOrientation.xGet_X_Vector + xMoveVector;
      xAxiVectors(YVector) := xOrientation.xGet_Y_Vector + xMoveVector;
      xAxiVectors(ZVector) := xOrientation.xGet_Z_Vector + xMoveVector;

      for i in txProjection'Range loop
         fW := 2.0 - xAxiVectors(i).fGet_Z;

         if fW = 0.0 then
            raise Div_By_Zero;
         end if;

         fCurrentX := (fXScale * (-xAxiVectors(i).fGet_Y)) / fW;
         fCurrentY := (fYScale * (xAxiVectors(i).fGet_X)) / fW;
         txProjection(i) := TPoint'(X => integer(fCurrentX) + iCenterX,
                                   Y => integer(fCurrentX) + iCenterY);
      end loop;

      return txProjection;
   end txGet_Orientation_2D_Projection;




   function xGet_Vector_2D_Projection ( iCenterX : in integer;
                                       iCenterY : in integer;
                                       iWidth : in integer;
                                       iHeight : in integer;
                                       xVector : in Math.Vectors.CVector) return TPoint is
      use Math.Vectors;
      Div_By_Zero : exception;

      xPoint : TPoint;

      xMoveVector : Math.Vectors.CVector := Math.Vectors.xCreate(fX => 0.0,
                                                                 fY => 0.0,
                                                                 fZ => -2.0);

      xTransformedVector : Math.Vectors.CVector;

      fXScale : float := float(iWidth / 2);
      fYScale : float := float(iHeight / 2);
      fCurrentX : float;
      fCurrentY : float;

      fW : float;
   begin
      xTransformedVector := xVector + xMoveVector;

      fW := 2.0 - xTransformedVector.fGet_Z;

      if fW = 0.0 then
         raise Div_By_Zero;
      end if;

      fCurrentX := (fXScale * (-xTransformedVector.fGet_Y)) / fW;
      fCurrentY := (fYScale * (xTransformedVector.fGet_X)) / fW;
      xPoint := TPoint'(X => integer(fCurrentX) + iCenterX,
                        Y => integer(fCurrentX) + iCenterY);

      return xPoint;
   end xGet_Vector_2D_Projection;

end Projection_2D;
