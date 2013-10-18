with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
with Math.Angles;
with Ada.Text_IO;


package body Math.Matrices is


   function fGet_Determinant (this : in CMatrix) return float is
      pxXVector : Math.Vectors.pCVector;
      pxYVector : Math.Vectors.pCVector;
      pxZVector : Math.Vectors.pCVector;
      pxMatrix : pCMatrix;
   begin
      pxXVector := Math.Vectors.pxCreate(1.0,0.0,0.0);
      pxYVector := Math.Vectors.pxCreate(0.0,1.0,0.0);
      pxZVector := Math.Vectors.pxCreate(0.0,0.0,1.0);
      pxMatrix := Math.Matrices.pxCreate(this.tfMatrix);

      pxXVector := pxMatrix * pxXVector;
      pxYVector := pxMatrix * pxYVector;
      pxZVector := pxMatrix * pxZVector;

      return Math.Vectors.fDot_Product(pxXVector, Math.Vectors.pxCross_Product(pxYVector, pxZVector));
   end fGet_Determinant;

   procedure Copy_From(this : in out CMatrix; pxSourceMatrix : in pCMatrix) is
   begin
      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            this.tfMatrix(i,j) := pxSourceMatrix.tfMatrix(i,j);
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

   function pxCreate_From_Quaternion
     (pxFromQuaternion : in Math.Quaternions.pCQuaternion)
      return pCMatrix
   is
      tfMatrix : TMatrix;
      fA : float;
      fB : float;
      fC : float;
      fD : float;
   begin


      if 1.0 - pxFromQuaternion.fGet_Length_Squared > 0.0001 then
         raise Numeric_Error;
      end if;

      fA := pxFromQuaternion.fGet_W;
      fB := pxFromQuaternion.fGet_X;
      fC := pxFromQuaternion.fGet_Y;
      fD := pxFromQuaternion.fGet_Z;

--      1-2*(fC*fC+fD*fD), 2*(fB*fC-fA*fD),   2*(fB*fD+fA*fC),
--  	2*(fB*fC+fA*fD),   1-2*(fB*fB+fD*fD), 2*(fC*fD-fA*fB),
--  	2*(fB*fD-fA*fC),   2*(fC*fD+fA*fB),   1-2*(fB*fB+fC*fC));

      tfMatrix(1,1) := 1.0-2.0*(fC*fC+fD*fD);
      tfMatrix(1,2) := 2.0*(fB*fC-fA*fD);
      tfMatrix(1,3) := 2.0*(fB*fD+fA*fC);

      tfMatrix(2,1) := 2.0*(fB*fC+fA*fD);
      tfMatrix(2,2) := 1.0-2.0*(fB*fB+fD*fD);
      tfMatrix(2,3) := 2.0*(fC*fD-fA*fB);

      tfMatrix(3,1) := 2.0*(fB*fD-fA*fC);
      tfMatrix(3,2) := 2.0*(fC*fD+fA*fB);
      tfMatrix(3,3) := 1.0-2.0*(fB*fB+fC*fC);

      return Math.Matrices.pxCreate(tfMatrix);
   end pxCreate_From_Quaternion;

   -------------------------------------
   -- pxCreate_Rotation_Around_X_Axis --
   -------------------------------------

   function pxCreate_Rotation_Around_X_Axis
     (tfAngleInDegrees : in Math.Angles.TAngle)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;
   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos(fAngleInRadians);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin(fAngleInRadians);

      pxNewMatrix := new CMatrix;

      pxNewMatrix.tfMatrix := ( (1.0, 0.0, 0.0),
                                (0.0, fCosAngle, -fSinAngle),
                                (0.0, fSinAngle, fCosAngle));
      return pxNewMatrix;
   end pxCreate_Rotation_Around_X_Axis;


   function pxCreate
     (tfMatrix : in TMatrix)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
   begin
      pxNewMatrix := new CMatrix;
      pxNewMatrix.tfMatrix := tfMatrix;
      return pxNewMatrix;
   end pxCreate;


   -------------------------------------
   -- pxCreate_Rotation_Around_Y_Axis --
   -------------------------------------

   function pxCreate_Rotation_Around_Y_Axis
     (tfAngleInDegrees : in Math.Angles.TAngle)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;
   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos(fAngleInRadians);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin(fAngleInRadians);

      pxNewMatrix := new CMatrix;

      pxNewMatrix.tfMatrix := ( (fCosAngle, 0.0, fSinAngle),
                                (0.0, 1.0, 0.0),
                                (-fSinAngle, 0.0, fCosAngle));
      return pxNewMatrix;
   end pxCreate_Rotation_Around_Y_Axis;


   -------------------------------------
   -- pxCreate_Rotation_Around_Z_Axis --
   -------------------------------------

   function pxCreate_Rotation_Around_Z_Axis
     (tfAngleInDegrees : in Math.Angles.TAngle)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
      fCosAngle : float;
      fSinAngle : float;
      fAngleInRadians : float;
   begin
      fAngleInRadians := Math.Angles.fDegrees_To_Radians(Math.Angles.fTAngle_To_FAngle(tfAngleInDegrees));
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos(fAngleInRadians);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin(fAngleInRadians);

      pxNewMatrix := new CMatrix;

      pxNewMatrix.tfMatrix := ( (fCosAngle, -fSinAngle, 0.0),
                                (fSinAngle, fCosAngle, 0.0),
                                (0.0, 0.0, 1.0));
      return pxNewMatrix;
   end pxCreate_Rotation_Around_Z_Axis;



   -----------------------
   -- pxCreate_Identity --
   -----------------------

   function pxCreate_Identity return pCMatrix is
      pxNewMatrix : pCMatrix;
   begin
      pxNewMatrix := new CMatrix;
      pxNewMatrix.tfMatrix := ((1.0,0.0,0.0),(0.0,1.0,0.0),(0.0,0.0,1.0));
      return pxNewMatrix;
   end pxCreate_Identity;




   function "=" (pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pCMatrix) return boolean is

      function CheckIfBothNull(pxLeftOperandMatrix : in pCMatrix; pxRightOperandMatrix : in pcMatrix) return boolean is
         f : float;
      begin
         f := pxRightOperandMatrix.tfMatrix(1,1);
         return false;
      exception
            when CONSTRAINT_ERROR =>
            begin
               f :=  pxLeftOperandMatrix.tfMatrix(1,1);
               return false;
            exception
               when CONSTRAINT_ERROR =>
                  return true;
            end;
      end;

   begin

      if CheckIfBothNull(pxLeftOperandMatrix, pxRightOperandMatrix) then
         return true;
      end if;


      for iY in 1 .. 3
      loop
         for iX in 1 .. 3
         loop
            if abs(pxLeftOperandMatrix.tfMatrix(iY, iX) - pxRightOperandMatrix.tfMatrix(iY, iX)) > 0.000001 then
               return false;
            end if;
         end loop;
      end loop;
      return true;

   exception
      when CONSTRAINT_ERROR =>
         return false;

   end "=";



   ---------
   -- "*" --
   ---------

   function "*"
     (pxLeftOperandMatrix : in pCMatrix;
      pxRightOperandMatrix : in pCMatrix)
      return pCMatrix
   is
      tfMatrix : TMatrix;
   begin
      tfMatrix := (( (pxLeftOperandMatrix.tfMatrix(1,1) * pxRightOperandMatrix.tfMatrix(1,1)) +
                   (pxLeftOperandMatrix.tfMatrix(1,2) * pxRightOperandMatrix.tfMatrix(2,1)) +
                   (pxLeftOperandMatrix.tfMatrix(1,3) * pxRightOperandMatrix.tfMatrix(3,1)),

                   (pxLeftOperandMatrix.tfMatrix(1,1) * pxRightOperandMatrix.tfMatrix(1,2)) +
                   (pxLeftOperandMatrix.tfMatrix(1,2) * pxRightOperandMatrix.tfMatrix(2,2)) +
                   (pxLeftOperandMatrix.tfMatrix(1,3) * pxRightOperandMatrix.tfMatrix(3,2)),

                   (pxLeftOperandMatrix.tfMatrix(1,1) * pxRightOperandMatrix.tfMatrix(1,3)) +
                   (pxLeftOperandMatrix.tfMatrix(1,2) * pxRightOperandMatrix.tfMatrix(2,3)) +
                   (pxLeftOperandMatrix.tfMatrix(1,3) * pxRightOperandMatrix.tfMatrix(3,3))),

                   ( (pxLeftOperandMatrix.tfMatrix(2,1) * pxRightOperandMatrix.tfMatrix(1,1)) +
                   (pxLeftOperandMatrix.tfMatrix(2,2) * pxRightOperandMatrix.tfMatrix(2,1)) +
                   (pxLeftOperandMatrix.tfMatrix(2,3) * pxRightOperandMatrix.tfMatrix(3,1)),

                   (pxLeftOperandMatrix.tfMatrix(2,1) * pxRightOperandMatrix.tfMatrix(1,2)) +
                   (pxLeftOperandMatrix.tfMatrix(2,2) * pxRightOperandMatrix.tfMatrix(2,2)) +
                   (pxLeftOperandMatrix.tfMatrix(2,3) * pxRightOperandMatrix.tfMatrix(3,2)),

                   (pxLeftOperandMatrix.tfMatrix(2,1) * pxRightOperandMatrix.tfMatrix(1,3)) +
                   (pxLeftOperandMatrix.tfMatrix(2,2) * pxRightOperandMatrix.tfMatrix(2,3)) +
                   (pxLeftOperandMatrix.tfMatrix(2,3) * pxRightOperandMatrix.tfMatrix(3,3))),

                  ( (pxLeftOperandMatrix.tfMatrix(3,1) * pxRightOperandMatrix.tfMatrix(1,1)) +
                   (pxLeftOperandMatrix.tfMatrix(3,2) * pxRightOperandMatrix.tfMatrix(2,1)) +
                   (pxLeftOperandMatrix.tfMatrix(3,3) * pxRightOperandMatrix.tfMatrix(3,1)),

                   (pxLeftOperandMatrix.tfMatrix(3,1) * pxRightOperandMatrix.tfMatrix(1,2)) +
                   (pxLeftOperandMatrix.tfMatrix(3,2) * pxRightOperandMatrix.tfMatrix(2,2)) +
                   (pxLeftOperandMatrix.tfMatrix(3,3) * pxRightOperandMatrix.tfMatrix(3,2)),

                   (pxLeftOperandMatrix.tfMatrix(3,1) * pxRightOperandMatrix.tfMatrix(1,3)) +
                   (pxLeftOperandMatrix.tfMatrix(3,2) * pxRightOperandMatrix.tfMatrix(2,3)) +
                   (pxLeftOperandMatrix.tfMatrix(3,3) * pxRightOperandMatrix.tfMatrix(3,3)))

                  );
      return Math.Matrices.pxCreate(tfMatrix => tfMatrix);
   end "*";

   ---------
   -- "*" --
   ---------

   function "*"
     (pxLeftOperandMatrix : in pCMatrix;
      pxRightOperandVector : in Math.Vectors.pCVector)
      return Math.Vectors.pCVector
   is
      pxProductVector : Math.Vectors.pCVector;
   begin
      pxProductVector := Math.Vectors.pxCreate(fX =>
                                                 ( (pxLeftOperandMatrix.tfMatrix(1,1) * pxRightOperandVector.fGet_X) +
                                                  (pxLeftOperandMatrix.tfMatrix(1,2) * pxRightOperandVector.fGet_Y) +
                                                  (pxLeftOperandMatrix.tfMatrix(1,3) * pxRightOperandVector.fGet_Z) ),

                                               fY =>
                                                 ( (pxLeftOperandMatrix.tfMatrix(2,1) * pxRightOperandVector.fGet_X) +
                                                  (pxLeftOperandMatrix.tfMatrix(2,2) * pxRightOperandVector.fGet_Y) +
                                                  (pxLeftOperandMatrix.tfMatrix(2,3) * pxRightOperandVector.fGet_Z) ),

                                               fZ =>
                                                 ( (pxLeftOperandMatrix.tfMatrix(3,1) * pxRightOperandVector.fGet_X) +
                                                  (pxLeftOperandMatrix.tfMatrix(3,2) * pxRightOperandVector.fGet_Y) +
                                                  (pxLeftOperandMatrix.tfMatrix(3,3) * pxRightOperandVector.fGet_Z) ));

      return pxProductVector;
   end "*";


   ---------
   -- "*" --
   ---------

   function "*"
     (pxLeftOperandMatrix : in pCMatrix;
      pxRightOperandPlane : in Math.Planes.pCPlane)
      return Math.Planes.pCPlane
   is
      pxNewNormal : Math.Vectors.pCVector;
   begin
      pxNewNormal := pxLeftOperandMatrix * pxRightOperandPlane.pxGet_Normal_Vector;
      return Math.Planes.pxCreate(pxNormalVector      => pxNewNormal,
                                  fDistanceFromOrigin => pxRightOperandPlane.fGet_Distance_From_Origin);
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
            raise Numeric_Error;
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


   function pxGet_Inverse (this : in CMatrix) return pCMatrix is
      tfExtendedMatrix : TExtendedMatrix;
   begin
      tfExtendedMatrix := tfCreate_Extended_Matrix_From(tfMatrix => this.tfMatrix);

      Perform_Gauss_Jordan_Elimination_On(tfExtendedMatrix => tfExtendedMatrix);

      return Math.Matrices.pxCreate(tfMatrix => tfGet_Inverse_Part_From(tfExtendedMatrix => tfExtendedMatrix));
   end pxGet_Inverse;

   ----------------
   -- pxGet_Copy --
   ----------------

   function pxGet_Copy (this : in CMatrix) return pCMatrix is
   begin
      return Math.Matrices.pxCreate(tfMatrix => this.tfMatrix);
   end pxGet_Copy;

   ---------------------
   -- pxGet_Transpose --
   ---------------------

   function pxGet_Transpose (this : in CMatrix) return pCMatrix is
      tfTranspose : TMatrix;
   begin


      for i in 1 .. 3
      loop
         for j in 1 .. 3
         loop
            tfTranspose(i,j) := this.tfMatrix(j,i);
         end loop;
      end loop;

      return Math.Matrices.pxCreate(tfTranspose);
   end pxGet_Transpose;


   function pxGet_X_Vector (this : in CMatrix) return Math.Vectors.pCVector is
      pxXVector : Math.Vectors.pCVector;
   begin
      pxXVector := Math.Vectors.pxCreate(fX => this.tfMatrix(1,1),
                                         fY => this.tfMatrix(1,2),
                                         fZ => this.tfMatrix(1,3));
      return pxXVector;
   end pxGet_X_Vector;

   function pxGet_Y_Vector (this : in CMatrix) return Math.Vectors.pCVector is
      pxYVector : Math.Vectors.pCVector;
   begin
      pxYVector := Math.Vectors.pxCreate(fX => this.tfMatrix(2,1),
                                         fY => this.tfMatrix(2,2),
                                         fZ => this.tfMatrix(2,3));
      return pxYVector;
   end pxGet_Y_Vector;

   function pxGet_Z_Vector (this : in CMatrix) return Math.Vectors.pCVector is
      pxZVector : Math.Vectors.pCVector;
   begin
      pxZVector := Math.Vectors.pxCreate(fX => this.tfMatrix(3,1),
                                         fY => this.tfMatrix(3,2),
                                         fZ => this.tfMatrix(3,3));
      return pxZVector;
   end pxGet_Z_Vector;
end Math.Matrices;
