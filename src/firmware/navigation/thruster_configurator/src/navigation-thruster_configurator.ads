with Navigation.Thrusters;
with Math.Elementary;

package Navigation.Thruster_Configurator is

   type CThrusterConfigurator is tagged private;

   type TExtendedMatrix is array(1 .. 6, 1 .. 12) of float;
   type TMatrix is array(1 .. 6, 1 .. 6) of float;


   function xCreate return CThrusterConfigurator;

   function iGet_Number_Of_Thrusters (this : in CThrusterConfigurator) return Positive;
   function tfGet_Thruster_Effects_Matrix (this : in CThrusterConfigurator) return Navigation.Thrusters.TThrusterEffectsMatrix;

   function tfGet_Thruster_Values(this : in CThrusterConfigurator; tfComponentValues : in Navigation.Thrusters.TThrusterEffects) return Navigation.Thrusters.TThrusterValuesArray;

private

   procedure Remove_Component_In_Leading_Rows(tfExtendedMatrix : in out TExtendedMatrix; iRow : in integer);
   procedure Remove_Component_In_Following_Rows(tfExtendedMatrix : in out TExtendedMatrix; iRow : in integer);
   procedure Scale_Row_In_Extended_Matrix(tfExtendedMatrix : in out TExtendedMatrix; iStartingColumn : in integer);
   procedure Swap_Values_In_Extended_Matrix(fValue1 : in out float; fValue2 : in out float);
   procedure Swap_Rows_In_Extended_Matrix(tfExtendedMatrix : in out TExtendedMatrix; iRow1 : in integer; iRow2 : in integer);
   function bMatrix_Has_No_Inverse(fValue : in float) return boolean;
   function Find_Row_With_Highest_Component(tfExtendedMatrix : in TExtendedMatrix; iColumn : in integer) return integer;
   function tfCreate_Extended_Matrix(this : in CThrusterConfigurator) return TExtendedMatrix;
   procedure Insert_Component_Values_In_Extended_Matrix(tfExtendedMatrix : in out TExtendedMatrix; tfComponentValues : in Navigation.Thrusters.TThrusterEffects);
   procedure Perform_Gauss_Jordan_Elimination_On(tfExtendedMatrix : in out TExtendedMatrix);
   procedure Set_Inverse(this : in out CThrusterConfigurator);
   function tfGet_Inverse_Part_Of(tfExtendedMatrix : in TExtendedMatrix) return TMatrix;
   function tfMultiply_Values_With_Matrix(this : in CThrusterConfigurator; tfComponentValues : in Navigation.Thrusters.TThrusterEffects) return Navigation.Thrusters.TThrusterValuesArray;

   type CThrusterConfigurator is tagged
      record
         xThrusterList : Navigation.Thrusters.CThrusterList;
         tfInverseMatrixForThrusterConfiguration : TMatrix;
      end record;


end Navigation.Thruster_Configurator;
