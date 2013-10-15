package body Navigation.Thruster_Configurator is

   function pxCreate return pCThrusterConfigurator is
   begin
      return null;
   end pxCreate;



   function xGet_Final_Thruster_Power_Configuration(this : in CThrusterConfigurator) return float is
   begin
      return 0.0;
   end xGet_Final_Thruster_Power_Configuration;

   function iGet_Number_Of_Thrusters (this : in CThrusterConfigurator) return integer is
   begin
      return this.pxThrusterList.iGet_Count;
   end iGet_Number_Of_Thrusters;

   function tfGet_Thruster_Effects_Matrix (this : in CThrusterConfigurator) return Navigation.Thrusters.TThrusterEffectsMatrix is
   begin
      return this.pxThrusterList.txGet_Thruster_Effects_Matrix;
   end tfGet_Thruster_Effects_Matrix;


   function tfGet_Thruster_Values(this : in CThrusterConfigurator; tfComponentValues : in Navigation.Thrusters.TThrusterEffects) return Navigation.Thrusters.TThrusterValuesArray is
   begin

   end tfGet_Thruster_Values;



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
      if tfExtendedMatrix(iY, iY) /= 1.0 then
         raise Numeric_Error;
      end if;
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


   function tfCreate_Extended_Matrix(this : in CThrusterConfigurator) return TExtendedMatrix is
      tfExtendedMatrix : TExtendedMatrix(1 .. this.iGet_Number_Of_Thrusters, 1 .. this.iGet_Number_Of_Thrusters + 1);
      tfThrusterMatrix : TThrusterEffectsMatrix(1 .. this.iGet_Number_Of_Thrusters);
      iIterator : integer;
   begin
      tfThrusterMatrix := this.tfGet_Thruster_Effects_Matrix;
      for iY in tfThrusterMatrix'Range
      loop

         iIterator := 1;
         for iX in tfThrusterMatrix(iY)'Range
         loop
            tfExtendedMatrix(iY, iIterator) := ffThrusterMatrix(iY)(iX);
            iIterator := iIterator + 1;
         end loop;
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




end Navigation.Thruster_Configurator;
