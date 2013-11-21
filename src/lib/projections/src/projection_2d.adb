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

      fXScale : float := float(iWidth / 2);
      fYScale : float := float(iHeight / 2);
      fCurrentX : float;
      fCurrentY : float;

      fW : float;
   begin

      xPlaneCornerVectors(UpperLeft) := xPlaneYVector + xPlaneXVector;
      xPlaneCornerVectors(UpperRight) := -xPlaneYVector + xPlaneXVector;
      xPlaneCornerVectors(LowerLeft) := xPlaneYVector - xPlaneXVector;
      xPlaneCornerVectors(LowerRight) := -xPlaneYVector - xPlaneXVector;

      for i in txProjection'Range loop
         fW := 2.0 + xPlaneCornerVectors(i).fGet_X;

         if fW = 0.0 then
            raise Div_By_Zero;
         end if;

         fCurrentX := (fXScale * (-xPlaneCornerVectors(i).fGet_Y)) / fW;
         fCurrentY := (fYScale * (-xPlaneCornerVectors(i).fGet_Z)) / fW;
         txProjection(i) := TPoint'(X => fCurrentX + float(iCenterX),
                                   Y => fCurrentY + float(iCenterY));
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

      xAxiVectors : array (XVector .. ZArrowRightTail) of Math.Vectors.CVector;
      xVectorPoints : array(XVector .. ZarrowRightTail) of TPoint;

      fXScale : float := float(iWidth / 2);
      fYScale : float := float(iHeight / 2);
      fCurrentX : float;
      fCurrentY : float;

      fW : float;
   begin

      xAxiVectors(XVector) := xOrientation.xGet_X_Vector;
      xAxiVectors(YVector) := xOrientation.xGet_Y_Vector;
      xAxiVectors(ZVector) := xOrientation.xGet_Z_Vector;

      xAxiVectors(XArrowRightTail) := 0.9*xOrientation.xGet_X_Vector - 0.1*xOrientation.xGet_Y_Vector;
      xAxiVectors(YArrowRightTail) := 0.9*xOrientation.xGet_Y_Vector + 0.1*xOrientation.xGet_Z_Vector;
      xAxiVectors(ZArrowRightTail) := 0.9*xOrientation.xGet_Z_Vector + 0.1*xOrientation.xGet_X_Vector;

      xAxiVectors(XArrowLeftTail) := 0.9*xOrientation.xGet_X_Vector + 0.1*xOrientation.xGet_Y_Vector;
      xAxiVectors(YArrowLeftTail) := 0.9*xOrientation.xGet_Y_Vector - 0.1*xOrientation.xGet_Z_Vector;
      xAxiVectors(ZArrowLeftTail) := 0.9*xOrientation.xGet_Z_Vector - 0.1*xOrientation.xGet_X_Vector;


      for i in xAxiVectors'Range loop
         fW := 2.0 + xAxiVectors(i).fGet_X;

         if fW = 0.0 then
            raise Div_By_Zero;
         end if;

         fCurrentX := (fXScale * (-xAxiVectors(i).fGet_Y)) / fW;
         fCurrentY := (fYScale * (-xAxiVectors(i).fGet_Z)) / fW;
         xVectorPoints(i) := TPoint'(X => fCurrentX + float(iCenterX),
                                     Y => fCurrentY + float(iCenterY));

      end loop;

      txProjection(XVector) := Projection_2D.TAxisArrow'(Head => xVectorPoints(XVector),
                                                         LeftTail => xVectorPoints(XArrowLeftTail),
                                                         RightTail => xVectorPoints(XArrowRightTail));

      txProjection(YVector) := Projection_2D.TAxisArrow'(Head => xVectorPoints(YVector),
                                                         LeftTail => xVectorPoints(YArrowLeftTail),
                                                         RightTail => xVectorPoints(YArrowRightTail));

      txProjection(ZVector) := Projection_2D.TAxisArrow'(Head => xVectorPoints(ZVector),
                                                         LeftTail => xVectorPoints(ZArrowLeftTail),
                                                         RightTail => xVectorPoints(ZArrowRightTail));



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


      fXScale : float := float(iWidth / 2);
      fYScale : float := float(iHeight / 2);
      fCurrentX : float;
      fCurrentY : float;

      fW : float;
   begin

      fW := xVector.fGet_X + 2.0;

      if fW = 0.0 then
         raise Div_By_Zero;
      end if;

      fCurrentX := (fXScale * (-xVector.fGet_Y)) / fW;
      fCurrentY := (fYScale * (-xVector.fGet_Z)) / fW;
      xPoint := TPoint'(X => fCurrentX + float(iCenterX),
                        Y => fCurrentY + float(iCenterY));

      return xPoint;

   end xGet_Vector_2D_Projection;

end Projection_2D;
