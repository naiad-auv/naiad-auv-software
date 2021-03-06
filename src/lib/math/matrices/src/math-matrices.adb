with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
with Math.Angles;
with Ada.Text_IO;
with Exception_Handling;

package body Math.Matrices is


   function fGet_Determinant (this : in CMatrix) return float is
      xXVector : Math.Vectors.CVector;
      xYVector : Math.Vectors.CVector;
      xZVector : Math.Vectors.CVector;
      xMatrix : CMatrix;
      fDeterminant : float;
   begin
      xMatrix := Math.Matrices.xCreate_Identity;
      xXVector := xMatrix.xGet_X_Vector;
      xYVector := xMatrix.xGet_Y_Vector;
      xZVector := xMatrix.xGet_Z_Vector;
      xMatrix.Copy_From(xSourceMatrix => this);

      xXVector.Copy_From(xSourceVector => xMatrix * xXVector);
      xYVector.Copy_From(xSourceVector => xMatrix * xYVector);
      xZVector.Copy_From(xSourceVector => xMatrix * xZVector);

      fDeterminant := Math.Vectors.fDot_Product(xXVector, Math.Vectors.xCross_Product(xYVector, xZVector));

--        Math.Vectors.Free(pxVectorToDeallocate => pxXVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxYVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxZVector);
--        Math.Matrices.Free(pxMatrixToDeallocate => pxMatrix);

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

   ------------------------------
   -- pxCreate_From_Quaternion --
   ------------------------------
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

      if 1.0 - xFromQuaternion.fGet_Length_Squared > 0.0001 then
         Exception_Handling.Raise_Exception(E       => Exception_Handling.NotUnitQuaternion'Identity,
                                            Message => "Math.Matrices.xCreate_From_Quaternion (xFromQuaternion : in Math.Quaternions.CQuaternion) return CMatrix");
      end if;

      fA := xFromQuaternion.fGet_W;
      fB := xFromQuaternion.fGet_X;
      fC := xFromQuaternion.fGet_Y;
      fD := xFromQuaternion.fGet_Z;

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

   function xCreate_From_Quaternion (pxFromQuaternion : in Math.Quaternions.pCQuaternion) return CMatrix is
      use Math.Quaternions;
   begin
      if pxFromQuaternion /= null then
         return xCreate_From_Quaternion(xFromQuaternion => pxFromQuaternion.all);
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Matrices.xCreate_From_Quaternion (pxFromQuaternion : in Math.Quaternions.pCQuaternion) return CMatrix");
      return CMatrix'(tfMatrix => (others => (others => 0.0)));
   end xCreate_From_Quaternion;

   -------------------------------------
   -- pxCreate_Rotation_Around_X_Axis --
   -------------------------------------

   function xCreate_Rotation_Around_X_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return CMatrix is
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;

   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos(fAngleInRadians);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin(fAngleInRadians);

      return CMatrix'(tfMatrix => ( (1.0, 0.0, 0.0),
                                (0.0, fCosAngle, -fSinAngle),
                                (0.0, fSinAngle, fCosAngle)));
   end xCreate_Rotation_Around_X_Axis;

   function xCreate(tfMatrix : in TMatrix) return CMatrix
   is
   begin
      return CMatrix'(tfMatrix => tfMatrix);
   end xCreate;

   -------------------------------------
   -- pxCreate_Rotation_Around_Y_Axis --
   -------------------------------------

   function xCreate_Rotation_Around_Y_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return CMatrix is
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;

   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos(fAngleInRadians);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin(fAngleInRadians);


      return CMatrix'(tfMatrix => ( (fCosAngle, 0.0, fSinAngle),
                                (0.0, 1.0, 0.0),
                                (-fSinAngle, 0.0, fCosAngle)));
   end xCreate_Rotation_Around_Y_Axis;

   -------------------------------------
   -- pxCreate_Rotation_Around_Z_Axis --
   -------------------------------------

   function xCreate_Rotation_Around_Z_Axis (tfAngleInDegrees : in Math.Angles.TAngle) return CMatrix is
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;

   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos(fAngleInRadians);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin(fAngleInRadians);

      return CMatrix'(tfMatrix => ( (fCosAngle, -fSinAngle, 0.0),
                                (fSinAngle, fCosAngle, 0.0),
                                (0.0, 0.0, 1.0)));
   end xCreate_Rotation_Around_Z_Axis;

   -----------------------
   -- pxCreate_Identity --
   -----------------------

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

   ---------
   -- "*" --
   ---------

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

   function "*" (pxLeftOperandMatrix : in pCMatrix; xRightOperandMatrix : in CMatrix) return CMatrix is
   begin
      if pxLeftOperandMatrix /= null then
         return pxLeftOperandMatrix.all * xRightOperandMatrix;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => """*"" (pxLeftOperandMatrix : in pCMatrix; xRightOperandMatrix : in CMatrix) return CMatrix");
      return CMatrix'(tfMatrix => (others => (others => 0.0)));
   end "*";

   function "*" (xLeftOperandMatrix : in CMatrix; pxRightOperandMatrix : in pCMatrix) return CMatrix is
   begin
      if pxRightOperandMatrix /= null then
         return xLeftOperandMatrix * pxRightOperandMatrix.all;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => """*"" (xLeftOperandMatrix : in CMatrix; pxRightOperandMatrix : in pCMatrix) return CMatrix");
      return CMatrix'(tfMatrix => (others => (others => 0.0)));
   end "*";

   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pCMatrix) return CMatrix is
   begin
      if pxLeftOperandMatrix /= null and then pxRightOperandMatrix /= null then
         return pxLeftOperandMatrix.all * pxRightOperandMatrix.all;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => """*"" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pCMatrix) return CMatrix");
      return CMatrix'(tfMatrix => (others => (others => 0.0)));
   end "*";

   ---------
   -- "*" --
   ---------

   function "*"
     (xLeftOperandMatrix : in CMatrix;
      xRightOperandVector : in Math.Vectors.CVector)
      return Math.Vectors.CVector
   is
      xProductVector : Math.Vectors.CVector;
   begin
      xProductVector := Math.Vectors.xCreate(fX =>
                                                 ( (xLeftOperandMatrix.tfMatrix(1,1) * xRightOperandVector.fGet_X) +
                                                  (xLeftOperandMatrix.tfMatrix(1,2) * xRightOperandVector.fGet_Y) +
                                                  (xLeftOperandMatrix.tfMatrix(1,3) * xRightOperandVector.fGet_Z) ),

                                               fY =>
                                                 ( (xLeftOperandMatrix.tfMatrix(2,1) * xRightOperandVector.fGet_X) +
                                                  (xLeftOperandMatrix.tfMatrix(2,2) * xRightOperandVector.fGet_Y) +
                                                  (xLeftOperandMatrix.tfMatrix(2,3) * xRightOperandVector.fGet_Z) ),

                                               fZ =>
                                                 ( (xLeftOperandMatrix.tfMatrix(3,1) * xRightOperandVector.fGet_X) +
                                                  (xLeftOperandMatrix.tfMatrix(3,2) * xRightOperandVector.fGet_Y) +
                                                  (xLeftOperandMatrix.tfMatrix(3,3) * xRightOperandVector.fGet_Z) ));
      return xProductVector;
   end "*";

   function "*" (pxLeftOperandMatrix : in pCMatrix; xRightOperandVector : in Math.Vectors.CVector) return Math.Vectors.CVector is
   begin
      if pxLeftOperandMatrix /= null then
         return pxLeftOperandMatrix.all * xRightOperandVector;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => """*"" (pxLeftOperandMatrix : in pCMatrix; xRightOperandVector : in Math.Vectors.CVector) return Math.Vectors.CVector");
      return xRightOperandVector;
   end "*";

   function "*" (xLeftOperandMatrix : in CMatrix; pxRightOperandVector : in Math.Vectors.pCVector) return Math.Vectors.CVector is
      use Math.Vectors;

   begin
      if pxRightOperandVector /= null then
         return xLeftOperandMatrix * pxRightOperandVector.all;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => """*"" (xLeftOperandMatrix : in CMatrix; pxRightOperandVector : in Math.Vectors.pCVector) return Math.Vectors.CVector");
      return pxRightOperandVector.all;
   end "*";

   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandVector : in Math.Vectors.pCVector) return Math.Vectors.CVector is
      use Math.Vectors;

   begin
      if pxLeftOperandMatrix /= null and then pxRightOperandVector /= null then
         return pxLeftOperandMatrix.all * pxRightOperandVector.all;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => """*"" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandVector : in Math.Vectors.pCVector) return Math.Vectors.CVector");
      return pxRightOperandVector.all;
   end "*";


   ---------
   -- "*" --
   ---------

   function "*" (xLeftOperandMatrix : in CMatrix; xRightOperandPlane : in Math.Planes.CPlane) return Math.Planes.CPlane
   is
      xNewPlane : Math.Planes.CPlane;

   begin
      xNewPlane := Math.Planes.xCreate(xNormalVector      => Math.Vectors.CVector(xLeftOperandMatrix * xRightOperandPlane.xGet_Normal_Vector),
                                         fDistanceFromOrigin => xRightOperandPlane.fGet_Distance_From_Origin);
      return xNewPlane;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Math.Matrices.""*"" (xLeftOperandMatrix : in CMatrix; xRightOperandPlane : in Math.Planes.CPlane) return Math.Planes.CPlane");
      return xNewPlane;
   end "*";

   function "*" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandPlane : in Math.Planes.pCPlane) return Math.Planes.CPlane is
      use Math.Planes;

   begin
      if pxLeftOperandMatrix /= null and then pxRightOperandPlane /= null then
         return pxLeftOperandMatrix.all * pxRightOperandPlane.all;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Matrices.""*"" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandPlane : in Math.Planes.pCPlane) return Math.Planes.CPlane");
      return pxRightOperandPlane.all;
   end "*";

   function "*" (xLeftOperandMatrix : in CMatrix; pxRightOperandPlane : in Math.Planes.pCPlane) return Math.Planes.CPlane is
      use Math.Planes;

   begin
      if pxRightOperandPlane /= null then
         return xLeftOperandMatrix * pxRightOperandPlane.all;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Matrices.""*"" (xLeftOperandMatrix : in CMatrix; pxRightOperandPlane : in Math.Planes.pCPlane) return Math.Planes.CPlane");
      return pxRightOperandPlane.all;
   end "*";

   function "*" (pxLeftOperandMatrix : in pCMatrix; xRightOperandPlane : in Math.Planes.CPlane) return Math.Planes.CPlane is
   begin
      if pxLeftOperandMatrix /= null then
         return pxLeftOperandMatrix.all * xRightOperandPlane;
      end if;

      Exception_Handling.Raise_Exception(E       => Exception_Handling.NullPointer'Identity,
                                         Message => "Math.Matrices.""*"" (pxLeftOperandMatrix : in pCMatrix; xRightOperandPlane : in Math.Planes.CPlane) return Math.Planes.CPlane");
      return xRightOperandPlane;
   end "*";

   -------------------
   -- pxGet_Inverse --
   -------------------

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
   begin

      for iRowAndColumn in 1 .. 3
      loop
         iRowWithMaxComponent := Find_Row_With_Highest_Component(tfExtendedMatrix => tfExtendedMatrix,
                                                                 iColumn          => iRowAndColumn);
         if bMatrix_Has_No_Inverse(tfExtendedMatrix(iRowWithMaxComponent, iRowAndColumn)) then
            Exception_Handling.Raise_Exception(E       => Exception_Handling.SingularMatrix'Identity,
                                               Message => "Math.Matrices.Perform_Gauss_Jordan_Elimination_On(tfExtendedMatrix : in out TExtendedMatrix)");
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

   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "Math.Matrices.xGet_Inverse (this : in CMatrix) return CMatrix");
         return CMatrix'(tfMatrix => (others => (others => 0.0)));
   end xGet_Inverse;

   ----------------
   -- pxGet_Copy --
   ----------------

   function pxGet_Allocated_Copy (this : in CMatrix) return pCMatrix is
   begin
      return new CMatrix'(tfMatrix => this.tfMatrix);
   end pxGet_Allocated_Copy;

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

   procedure Free(pxMatrixToDeallocate : in out pCMatrix) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CMatrix, pCMatrix);
   begin
      Dealloc(pxMatrixToDeallocate);
   end Free;

end Math.Matrices;
