package body Math.Matrices is


   function fGet_Determinant (this : in CMatrix) return float is
      xXVector : Math.Vectors.CVector;
      xYVector : Math.Vectors.CVector;
      xZVector : Math.Vectors.CVector;
      xMatrix : CMatrix;
      fDeterminant : float;
   begin
      xMatrix := Math.Matrices.xCreate_Identity;
      xXVector := xGet_X_Vector(xMatrix);
      xYVector := xGet_Y_Vector(xMatrix);
      xZVector := xGet_Z_Vector(xMatrix);
      Copy_From(this          => xMatrix,
                xSourceMatrix => this);

      Math.Vectors.Copy_From(this          => xXVector,
                             xSourceVector => xMatrix * xXVector);
      Math.Vectors.Copy_From(this          => xYVector,
                             xSourceVector => xMatrix * xYVector);
      Math.Vectors.Copy_From(this          => xZVector,
                             xSourceVector => xMatrix * xZVector);


      fDeterminant := Math.Vectors.fDot_Product(xXVector, Math.Vectors.xCross_Product(xYVector, xZVector));

      return fDeterminant;
   end fGet_Determinant;

   procedure Copy_From(this : in out CMatrix; xSourceMatrix : in CMatrix) is
   begin
      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            this.tfMatrix(i,j) := xSourceMatrix.tfMatrix(i,j);
         end loop;

      end loop;
   end Copy_From;



   function tfGet_Raw_Matrix (this : in CMatrix) return TMatrix is
   begin
      return this.tfMatrix;
   end tfGet_Raw_Matrix;

   function xCreate_From_Quaternion (xFromQuaternion : in Math.Quaternions.CQuaternion) return CMatrix
   is
      tfMatrix : TMatrix;
      fA : float;
      fB : float;
      fC : float;
      fD : float;
   begin

      if Math.Quaternions.fGet_Length(xFromQuaternion) = 0.0 then
         return Math.Matrices.xCreate_Identity; -- should raise exception here instead
      end if;

      fA := Math.Quaternions.fGet_W(xFromQuaternion);
      fB := Math.Quaternions.fGet_X(xFromQuaternion);
      fC := Math.Quaternions.fGet_Y(xFromQuaternion);
      fD := Math.Quaternions.fGet_Z(xFromQuaternion);

      tfMatrix(1,1) := 1.0-2.0*(fC*fC+fD*fD);
      tfMatrix(1,2) := 2.0*(fB*fC-fA*fD);
      tfMatrix(1,3) := 2.0*(fB*fD+fA*fC);

      tfMatrix(2,1) := 2.0*(fB*fC+fA*fD);
      tfMatrix(2,2) := 1.0-2.0*(fB*fB+fD*fD);
      tfMatrix(2,3) := 2.0*(fC*fD-fA*fB);

      tfMatrix(3,1) := 2.0*(fB*fD-fA*fC);
      tfMatrix(3,2) := 2.0*(fC*fD+fA*fB);
      tfMatrix(3,3) := 1.0-2.0*(fB*fB+fC*fC);

      return CMatrix'(tfMatrix => tfMatrix);
   end xCreate_From_Quaternion;



   function xCreate_Rotation_Around_X_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return CMatrix is
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;

   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Math.Elementary.Cos(fAngleInRadians);
      fSinAngle := Math.Elementary.Sin(fAngleInRadians);

      return CMatrix'(tfMatrix => ( (1.0, 0.0, 0.0),
                                (0.0, fCosAngle, -fSinAngle),
                                (0.0, fSinAngle, fCosAngle)));
   end xCreate_Rotation_Around_X_Axis;

   function xCreate(tfMatrix : in TMatrix) return CMatrix
   is
   begin
      return CMatrix'(tfMatrix => tfMatrix);
   end xCreate;



   function xCreate_Rotation_Around_Y_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return CMatrix is
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;

   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Math.Elementary.Cos(fAngleInRadians);
      fSinAngle := Math.Elementary.Sin(fAngleInRadians);


      return CMatrix'(tfMatrix => ( (fCosAngle, 0.0, fSinAngle),
                                (0.0, 1.0, 0.0),
                                (-fSinAngle, 0.0, fCosAngle)));
   end xCreate_Rotation_Around_Y_Axis;



   function xCreate_Rotation_Around_Z_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return CMatrix is
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;

   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Math.Elementary.Cos(fAngleInRadians);
      fSinAngle := Math.Elementary.Sin(fAngleInRadians);

      return CMatrix'(tfMatrix => ( (fCosAngle, -fSinAngle, 0.0),
                                (fSinAngle, fCosAngle, 0.0),
                                (0.0, 0.0, 1.0)));
   end xCreate_Rotation_Around_Z_Axis;



   function xCreate_Identity return CMatrix is
   begin
     return CMatrix'(tfMatrix => ((1.0,0.0,0.0),(0.0,1.0,0.0),(0.0,0.0,1.0)));
   end xCreate_Identity;

   function "=" (xLeftOperandMatrix : in CMatrix; xRightOperandMatrix : in CMatrix) return boolean is
   begin
      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            if abs(xLeftOperandMatrix.tfMatrix(i,j) - xRightOperandMatrix.tfMatrix(i,j)) > fMATRIX_PRECISION then
               return false;
            end if;

         end loop;

      end loop;

      return true;
   end "=";



   function "*" (xLeftOperandMatrix : in CMatrix; xRightOperandMatrix : in CMatrix) return CMatrix is
      tfMatrix : TMatrix;

   begin
      tfMatrix := (( (xLeftOperandMatrix.tfMatrix(1,1) * xRightOperandMatrix.tfMatrix(1,1)) +
                   (xLeftOperandMatrix.tfMatrix(1,2) * xRightOperandMatrix.tfMatrix(2,1)) +
                   (xLeftOperandMatrix.tfMatrix(1,3) * xRightOperandMatrix.tfMatrix(3,1)),

                   (xLeftOperandMatrix.tfMatrix(1,1) * xRightOperandMatrix.tfMatrix(1,2)) +
                   (xLeftOperandMatrix.tfMatrix(1,2) * xRightOperandMatrix.tfMatrix(2,2)) +
                   (xLeftOperandMatrix.tfMatrix(1,3) * xRightOperandMatrix.tfMatrix(3,2)),

                   (xLeftOperandMatrix.tfMatrix(1,1) * xRightOperandMatrix.tfMatrix(1,3)) +
                   (xLeftOperandMatrix.tfMatrix(1,2) * xRightOperandMatrix.tfMatrix(2,3)) +
                   (xLeftOperandMatrix.tfMatrix(1,3) * xRightOperandMatrix.tfMatrix(3,3))),

                   ( (xLeftOperandMatrix.tfMatrix(2,1) * xRightOperandMatrix.tfMatrix(1,1)) +
                   (xLeftOperandMatrix.tfMatrix(2,2) * xRightOperandMatrix.tfMatrix(2,1)) +
                   (xLeftOperandMatrix.tfMatrix(2,3) * xRightOperandMatrix.tfMatrix(3,1)),

                   (xLeftOperandMatrix.tfMatrix(2,1) * xRightOperandMatrix.tfMatrix(1,2)) +
                   (xLeftOperandMatrix.tfMatrix(2,2) * xRightOperandMatrix.tfMatrix(2,2)) +
                   (xLeftOperandMatrix.tfMatrix(2,3) * xRightOperandMatrix.tfMatrix(3,2)),

                   (xLeftOperandMatrix.tfMatrix(2,1) * xRightOperandMatrix.tfMatrix(1,3)) +
                   (xLeftOperandMatrix.tfMatrix(2,2) * xRightOperandMatrix.tfMatrix(2,3)) +
                   (xLeftOperandMatrix.tfMatrix(2,3) * xRightOperandMatrix.tfMatrix(3,3))),

                  ( (xLeftOperandMatrix.tfMatrix(3,1) * xRightOperandMatrix.tfMatrix(1,1)) +
                   (xLeftOperandMatrix.tfMatrix(3,2) * xRightOperandMatrix.tfMatrix(2,1)) +
                   (xLeftOperandMatrix.tfMatrix(3,3) * xRightOperandMatrix.tfMatrix(3,1)),

                   (xLeftOperandMatrix.tfMatrix(3,1) * xRightOperandMatrix.tfMatrix(1,2)) +
                   (xLeftOperandMatrix.tfMatrix(3,2) * xRightOperandMatrix.tfMatrix(2,2)) +
                   (xLeftOperandMatrix.tfMatrix(3,3) * xRightOperandMatrix.tfMatrix(3,2)),

                   (xLeftOperandMatrix.tfMatrix(3,1) * xRightOperandMatrix.tfMatrix(1,3)) +
                   (xLeftOperandMatrix.tfMatrix(3,2) * xRightOperandMatrix.tfMatrix(2,3)) +
                   (xLeftOperandMatrix.tfMatrix(3,3) * xRightOperandMatrix.tfMatrix(3,3)))

                  );
      return CMatrix'(tfMatrix => tfMatrix);
   end "*";



   function "*"
     (xLeftOperandMatrix : in CMatrix;
      xRightOperandVector : in Math.Vectors.CVector)
      return Math.Vectors.CVector
   is
      xProductVector : Math.Vectors.CVector;
   begin
      xProductVector := Math.Vectors.xCreate(fX =>
                                                 ( (xLeftOperandMatrix.tfMatrix(1,1) * Math.Vectors.fGet_X(xRightOperandVector)) +
                                                  (xLeftOperandMatrix.tfMatrix(1,2) * Math.Vectors.fGet_Y(xRightOperandVector)) +
                                                  (xLeftOperandMatrix.tfMatrix(1,3) * Math.Vectors.fGet_Z(xRightOperandVector)) ),

                                               fY =>
                                                 ( (xLeftOperandMatrix.tfMatrix(2,1) * Math.Vectors.fGet_X(xRightOperandVector)) +
                                                  (xLeftOperandMatrix.tfMatrix(2,2) * Math.Vectors.fGet_Y(xRightOperandVector)) +
                                                  (xLeftOperandMatrix.tfMatrix(2,3) * Math.Vectors.fGet_Z(xRightOperandVector)) ),

                                               fZ =>
                                                 ( (xLeftOperandMatrix.tfMatrix(3,1) * Math.Vectors.fGet_X(xRightOperandVector)) +
                                                  (xLeftOperandMatrix.tfMatrix(3,2) * Math.Vectors.fGet_Y(xRightOperandVector)) +
                                                  (xLeftOperandMatrix.tfMatrix(3,3) * Math.Vectors.fGet_Z(xRightOperandVector)) ));
      return xProductVector;
   end "*";


   function "*" (xLeftOperandMatrix : in CMatrix; xRightOperandPlane : in Math.Planes.CPlane) return Math.Planes.CPlane
   is
      xNewPlane : Math.Planes.CPlane;

   begin
      xNewPlane := Math.Planes.xCreate(xNormalVector      => Math.Vectors.CVector(xLeftOperandMatrix * Math.Planes.xGet_Normal_Vector(xRightOperandPlane)),
                                         fDistanceFromOrigin => Math.Planes.fGet_Distance_From_Origin(xRightOperandPlane));
      return xNewPlane;
   end "*";



   procedure Swap_Values_In_Extended_Matrix(fValue1 : in out float; fValue2 : in out float) is
      fTemp : float;
   begin
      fTemp := fValue1;
      fValue1 := fValue2;
      fValue2 := fTemp;
   end Swap_Values_In_Extended_Matrix;

   procedure Swap_Rows_In_Extended_Matrix(tfExtendedMatrix : in out TExtendedMatrix; iRow1 : in integer; iRow2 : in integer) is
   begin
      for col in 1 .. 6
      loop
         Swap_Values_In_Extended_Matrix(fValue1 => tfExtendedMatrix(iRow1,col),
                                        fValue2 => tfExtendedMatrix(iRow2,col));
      end loop;

   end Swap_Rows_In_Extended_Matrix;

   procedure Scale_Row_In_Extended_Matrix(tfExtendedMatrix : in out TExtendedMatrix; iStartingColumn : in integer) is
      iY : integer := iStartingColumn;

   begin
      for iX in reverse iStartingColumn .. 6
      loop
         tfExtendedMatrix(iY, iX) := tfExtendedMatrix(iY, iX) / tfExtendedMatrix(iY, iStartingColumn);
      end loop;

   end Scale_Row_In_Extended_Matrix;

   procedure Remove_Component_In_Following_Rows(tfExtendedMatrix : in out TExtendedMatrix; iRow : in integer) is
   begin
      for iY in iRow+1 .. 3
      loop
         for iX in reverse iRow .. 6
         loop
            tfExtendedMatrix(iY, iX) := tfExtendedMatrix(iY, iX) - (tfExtendedMatrix(iRow, iX) * tfExtendedMatrix(iY, iRow));
         end loop;

      end loop;

   end Remove_Component_In_Following_Rows;


   procedure Remove_Component_In_Leading_Rows(tfExtendedMatrix : in out TExtendedMatrix; iRow : in integer) is
   begin
      for iY in reverse 1 .. (iRow-1)
      loop
         for iX in reverse iRow .. 6
         loop
            tfExtendedMatrix(iY, iX) := tfExtendedMatrix(iY, iX) - (tfExtendedMatrix(iRow, iX) * tfExtendedMatrix(iY, iRow));
         end loop;

      end loop;

   end Remove_Component_In_Leading_Rows;

   function Find_Row_With_Highest_Component(tfExtendedMatrix : in TExtendedMatrix; iColumn : in integer) return integer is
      iMaxValueComponent : integer := iColumn;

   begin
      for iRow in iColumn+1 .. 3
      loop
         if abs(tfExtendedMatrix(iRow, iColumn)) > abs(tfExtendedMatrix(iMaxValueComponent, iColumn)) then
            iMaxValueComponent := iRow;
         end if;

      end loop;

      return iMaxValueComponent;
   end Find_Row_With_Highest_Component;

   function bMatrix_Has_No_Inverse(fValue : in float) return boolean is
   begin
      if abs(fValue) > 0.0 then
         return false;
      end if;

      return true;
   end bMatrix_Has_No_Inverse;


   procedure Perform_Gauss_Jordan_Elimination_On(tfExtendedMatrix : in out TExtendedMatrix) is
      iRowWithMaxComponent : integer;
      SingularMatrix : exception;
   begin

      for iRowAndColumn in 1 .. 3
      loop
         iRowWithMaxComponent := Find_Row_With_Highest_Component(tfExtendedMatrix => tfExtendedMatrix,
                                                                 iColumn          => iRowAndColumn);
         if bMatrix_Has_No_Inverse(tfExtendedMatrix(iRowWithMaxComponent, iRowAndColumn)) then
           raise SingularMatrix;
         end if;

         if iRowWithMaxComponent /= iRowAndColumn then
            Swap_Rows_In_Extended_Matrix(tfExtendedMatrix => tfExtendedMatrix,
                                         iRow1            => iRowAndColumn,
                                         iRow2            => iRowWithMaxComponent);
         end if;

         Scale_Row_In_Extended_Matrix(tfExtendedMatrix => tfExtendedMatrix,
                                      iStartingColumn  => iRowAndColumn);

         Remove_Component_In_Following_Rows(tfExtendedMatrix => tfExtendedMatrix,
                                            iRow             => iRowAndColumn);

         Remove_Component_In_Leading_Rows(tfExtendedMatrix => tfExtendedMatrix,
                                          iRow             => iRowAndColumn);

      end loop;

   exception
      when SingularMatrix =>
         for i in tfExtendedMatrix'Range(1) loop
            for j in tfExtendedMatrix'Range(2) loop
               tfExtendedMatrix(i,j) := 0.0;
            end loop;
            tfExtendedMatrix(i,i) := 1.0;
            tfExtendedMatrix(i,i*2) := 1.0;
         end loop;


   end Perform_Gauss_Jordan_Elimination_On;

   function tfGet_Inverse_Part_From(tfExtendedMatrix : in TExtendedMatrix) return TMatrix is
      tfInverse : TMatrix;

   begin
      for iY in 1 .. 3
      loop
         for iX in 1 .. 3
         loop
            tfInverse(iY, iX) := tfExtendedMatrix(iY, iX+3);
         end loop;

      end loop;

      return tfInverse;
   end tfGet_Inverse_Part_From;


   function tfCreate_Extended_Matrix_From(tfMatrix : in TMatrix) return TExtendedMatrix is
      tfExtendedMatrix : TExtendedMatrix;

   begin
      for iY in 1 .. 3
      loop
         for iX in 1 .. 3
         loop
            tfExtendedMatrix(iY, iX) := tfMatrix(iY, iX);
            tfExtendedMatrix(iY, iX+3) := 0.0;
         end loop;

         tfExtendedMatrix(iY,iY+3) := 1.0;
      end loop;

      return tfExtendedMatrix;
   end tfCreate_Extended_Matrix_From;

   function xGet_Inverse (this : in CMatrix) return CMatrix is
      tfExtendedMatrix : TExtendedMatrix;
   begin
      tfExtendedMatrix := tfCreate_Extended_Matrix_From(tfMatrix => this.tfMatrix);

      Perform_Gauss_Jordan_Elimination_On(tfExtendedMatrix => tfExtendedMatrix);

      return CMatrix'(tfMatrix => tfGet_Inverse_Part_From(tfExtendedMatrix => tfExtendedMatrix));

   end xGet_Inverse;


   ---------------------
   -- pxGet_Transpose --
   ---------------------

   function xGet_Transpose (this : in CMatrix) return CMatrix is
      tfTranspose : TMatrix;
   begin

      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            tfTranspose(i,j) := this.tfMatrix(j,i);
         end loop;

      end loop;

      return CMatrix'(tfMatrix => tfTranspose);
   end xGet_Transpose;


   function xGet_X_Vector (this : in CMatrix) return Math.Vectors.CVector is
      xXVector : Math.Vectors.CVector;
   begin
      xXVector := Math.Vectors.xCreate(fX => this.tfMatrix(1,1),
                                         fY => this.tfMatrix(2,1),
                                         fZ => this.tfMatrix(3,1));
      return xXVector;
   end xGet_X_Vector;

   function xGet_Y_Vector (this : in CMatrix) return Math.Vectors.CVector is
      xYVector : Math.Vectors.CVector;
   begin
      xYVector := Math.Vectors.xCreate(fX => this.tfMatrix(1,2),
                                         fY => this.tfMatrix(2,2),
                                         fZ => this.tfMatrix(3,2));
      return xYVector;
   end xGet_Y_Vector;

   function xGet_Z_Vector (this : in CMatrix) return Math.Vectors.CVector is
      xZVector : Math.Vectors.CVector;
   begin
      xZVector := Math.Vectors.xCreate(fX => this.tfMatrix(1,3),
                                         fY => this.tfMatrix(2,3),
                                         fZ => this.tfMatrix(3,3));
      return xZVector;
   end xGet_Z_Vector;


end Math.Matrices;
