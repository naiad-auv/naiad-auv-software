--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Thruster_Configurator.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Thruster_Configurator.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_fca0c0 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/fca0c069de8fb228/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:13:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_bfc2d4 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/bfc2d418a36b7dea/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:20:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Navigation.Thrusters;

      pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThrusterConfigurator;

   begin

      pxThrusterConfigurator := Navigation.Thruster_Configurator.pxCreate;

      AUnit.Assertions.Assert(Condition => pxThrusterConfigurator /= null,
                              Message   => "pxThrusterConfigurator is null after construction");

      AUnit.Assertions.Assert(Condition => pxThrusterConfigurator.pxThrusterList /= null,
                              Message   => "pxThrusterList is null after construction");
      Navigation.Thruster_Configurator.Free(pxThrusterConfiguratorToDeallocate => pxThrusterConfigurator);

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Remove_Component_In_Leading_Rows (Gnattest_T : in out Test);
   procedure Test_Remove_Component_In_Leading_Rows_54f89d (Gnattest_T : in out Test) renames Test_Remove_Component_In_Leading_Rows;
--  id:2.1/54f89ddbb8251b89/Remove_Component_In_Leading_Rows/1/0/
   procedure Test_Remove_Component_In_Leading_Rows (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:29:4:Remove_Component_In_Leading_Rows
--  end read only

      pragma Unreferenced (Gnattest_T);

      xfExtendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..6, 1..7) := (others => (others => 1.0));
   begin

      Navigation.Thruster_Configurator.Remove_Component_In_Leading_Rows(tfExtendedMatrix => xfExtendedMatrix,iRow => 3);

      AUnit.Assertions.Assert(Condition => abs(xfExtendedMatrix(2,3)) < 0.0001,
                              Message   => "(3,2) didnt get set to 0.0");
      AUnit.Assertions.Assert(Condition => abs(xfExtendedMatrix(1,3)) < 0.0001,
                              Message   => "(3,1) didnt get set to 0.0");


--  begin read only
   end Test_Remove_Component_In_Leading_Rows;
--  end read only


--  begin read only
   procedure Test_Remove_Component_In_Following_Rows (Gnattest_T : in out Test);
   procedure Test_Remove_Component_In_Following_Rows_aa8b1c (Gnattest_T : in out Test) renames Test_Remove_Component_In_Following_Rows;
--  id:2.1/aa8b1c90afdcfb23/Remove_Component_In_Following_Rows/1/0/
   procedure Test_Remove_Component_In_Following_Rows (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:30:4:Remove_Component_In_Following_Rows
--  end read only

      pragma Unreferenced (Gnattest_T);

      xfExtendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..6, 1..7) := (others => (others => 1.0));
   begin

      Navigation.Thruster_Configurator.Remove_Component_In_Following_Rows(tfExtendedMatrix => xfExtendedMatrix,iRow => 3);

      AUnit.Assertions.Assert(Condition => abs(xfExtendedMatrix(4,3)) < 0.0001,
                              Message   => "(4,3) didnt get set to 0.0");
      AUnit.Assertions.Assert(Condition => abs(xfExtendedMatrix(5,3)) < 0.0001,
                              Message   => "(5,3) didnt get set to 0.0");
      AUnit.Assertions.Assert(Condition => abs(xfExtendedMatrix(6,3)) < 0.0001,
                              Message   => "(6,3) didnt get set to 0.0");

--  begin read only
   end Test_Remove_Component_In_Following_Rows;
--  end read only


--  begin read only
   procedure Test_Scale_Row_In_Extended_Matrix (Gnattest_T : in out Test);
   procedure Test_Scale_Row_In_Extended_Matrix_fd23ee (Gnattest_T : in out Test) renames Test_Scale_Row_In_Extended_Matrix;
--  id:2.1/fd23ee6cd6bcde9e/Scale_Row_In_Extended_Matrix/1/0/
   procedure Test_Scale_Row_In_Extended_Matrix (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:31:4:Scale_Row_In_Extended_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

 	xfExtendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..6, 1..7) := (others => (others => 3.0));
   begin

      	Navigation.Thruster_Configurator.Remove_Component_In_Following_Rows(tfExtendedMatrix => xfExtendedMatrix,iRow => 3);

      Navigation.Thruster_Configurator.Scale_Row_In_Extended_Matrix(xfExtendedMatrix, 3);

            AUnit.Assertions.Assert(Condition => abs(xfExtendedMatrix(3,3) - 1.0) < 0.0001,
                              Message   => "(3,3) didnt get set to scaled 1.0");


--  begin read only
   end Test_Scale_Row_In_Extended_Matrix;
--  end read only


--  begin read only
   procedure Test_Swap_Values_In_Extended_Matrix (Gnattest_T : in out Test);
   procedure Test_Swap_Values_In_Extended_Matrix_d790ab (Gnattest_T : in out Test) renames Test_Swap_Values_In_Extended_Matrix;
--  id:2.1/d790ab373c6b2b67/Swap_Values_In_Extended_Matrix/1/0/
   procedure Test_Swap_Values_In_Extended_Matrix (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:32:4:Swap_Values_In_Extended_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      a : float := 1.0;
      b : float := 2.0;

   begin

      Navigation.Thruster_Configurator.Swap_Values_In_Extended_Matrix(a,b);

      AUnit.Assertions.Assert(Condition => abs(a - 2.0) < 0.0001,
                              Message   => "swap does not work");
      AUnit.Assertions.Assert(Condition => abs(b - 1.0) < 0.0001,
                              Message   => "swap does not work");

--  begin read only
   end Test_Swap_Values_In_Extended_Matrix;
--  end read only


--  begin read only
   procedure Test_Swap_Rows_In_Extended_Matrix (Gnattest_T : in out Test);
   procedure Test_Swap_Rows_In_Extended_Matrix_a9e2bf (Gnattest_T : in out Test) renames Test_Swap_Rows_In_Extended_Matrix;
--  id:2.1/a9e2bf8627567a6f/Swap_Rows_In_Extended_Matrix/1/0/
   procedure Test_Swap_Rows_In_Extended_Matrix (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:33:4:Swap_Rows_In_Extended_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

	xfExtendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..6, 1..7) := (others => (others => 3.0));
   begin

      for i in xfExtendedMatrix'Range(2)
      loop
      	xfExtendedMatrix(1,i) := 1.0;
      	xfExtendedMatrix(3,i) := 4.0;
      end loop;

      Navigation.Thruster_Configurator.Swap_Rows_In_Extended_Matrix(xfExtendedMatrix,1,3);

      for i in xfExtendedMatrix'Range(2)
      loop
         AUnit.Assertions.Assert(Condition => (abs(xfExtendedMatrix(1,i) - 4.0) < 0.00001) and (abs(xfExtendedMatrix(3,i) - 1.0) < 0.00001),
                                 Message   => "Row swapping does not work");
      end loop;


--  begin read only
   end Test_Swap_Rows_In_Extended_Matrix;
--  end read only


--  begin read only
   procedure Test_bMatrix_Has_No_Inverse (Gnattest_T : in out Test);
   procedure Test_bMatrix_Has_No_Inverse_8de23e (Gnattest_T : in out Test) renames Test_bMatrix_Has_No_Inverse;
--  id:2.1/8de23e19802d9aa9/bMatrix_Has_No_Inverse/1/0/
   procedure Test_bMatrix_Has_No_Inverse (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:34:4:bMatrix_Has_No_Inverse
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert(Condition => Navigation.Thruster_Configurator.bMatrix_Has_No_Inverse(0.0),
                              Message   => "ABO!");

--  begin read only
   end Test_bMatrix_Has_No_Inverse;
--  end read only


--  begin read only
   procedure Test_Find_Row_With_Highest_Component (Gnattest_T : in out Test);
   procedure Test_Find_Row_With_Highest_Component_f24b48 (Gnattest_T : in out Test) renames Test_Find_Row_With_Highest_Component;
--  id:2.1/f24b4888b4c28a71/Find_Row_With_Highest_Component/1/0/
   procedure Test_Find_Row_With_Highest_Component (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:35:4:Find_Row_With_Highest_Component
--  end read only

      pragma Unreferenced (Gnattest_T);

   	xfExtendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..6, 1..7) := (others => (others => 3.0));
   begin


      xfExtendedMatrix(4,3) := 20.0;

      Aunit.Assertions.Assert(Condition => Navigation.Thruster_Configurator.Find_Row_With_Highest_Component(xfExtendedMatrix, 3) = 4,
                              Message   => "Unable to find row with highest component");

--  begin read only
   end Test_Find_Row_With_Highest_Component;
--  end read only


--  begin read only
   procedure Test_Insert_Component_Values_In_Extended_Matrix (Gnattest_T : in out Test);
   procedure Test_Insert_Component_Values_In_Extended_Matrix_4b91cc (Gnattest_T : in out Test) renames Test_Insert_Component_Values_In_Extended_Matrix;
--  id:2.1/4b91ccd7fcb041bc/Insert_Component_Values_In_Extended_Matrix/1/0/
   procedure Test_Insert_Component_Values_In_Extended_Matrix (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:37:4:Insert_Component_Values_In_Extended_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      xfExtendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..6, 1..7) := (others => (others => 3.0));
      xThrusterEffects : Navigation.Thrusters.TThrusterEffects := (others => 1.0);
   begin

      Navigation.Thruster_Configurator.Insert_Component_Values_In_Extended_Matrix(xfExtendedMatrix,xThrusterEffects);

      for i in xfExtendedMatrix'Range(1)
      loop
         Aunit.Assertions.Assert(Condition => abs(xfExtendedMatrix(i, xfExtendedMatrix'Length(2)) - 1.0) < 0.00001,
                                 Message => "Unable to insert thruster effects in extended matrix");
      end loop;


--  begin read only
   end Test_Insert_Component_Values_In_Extended_Matrix;
--  end read only


--  begin read only
   procedure Test_Perform_Gauss_Jordan_Elimination_On (Gnattest_T : in out Test);
   procedure Test_Perform_Gauss_Jordan_Elimination_On_b05c93 (Gnattest_T : in out Test) renames Test_Perform_Gauss_Jordan_Elimination_On;
--  id:2.1/b05c934d559f5fd0/Perform_Gauss_Jordan_Elimination_On/1/0/
   procedure Test_Perform_Gauss_Jordan_Elimination_On (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:38:4:Perform_Gauss_Jordan_Elimination_On
--  end read only

      pragma Unreferenced (Gnattest_T);

      notZeroCount : integer := 0;

      xfExtendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..3, 1..3) := ((1.0,2.0,3.0),(0.0,1.0,4.0),(5.0,6.0,0.0));
   begin

      Navigation.Thruster_Configurator.Perform_Gauss_Jordan_Elimination_On(xfExtendedMatrix);

      AUnit.Assertions.Assert(Condition => xfExtendedMatrix(1,1) = 1.0,
                              Message   => "(1,1) /= 1.0");
      AUnit.Assertions.Assert(Condition => xfExtendedMatrix(2,2) = 1.0,
                              Message   => "(2,2) /= 1.0");
      AUnit.Assertions.Assert(Condition => xfExtendedMatrix(3,3) = 1.0,
                              Message   => "(3,3) /= 1.0");


      for i in xfExtendedMatrix'Range(1) loop
      	 for j in xfExtendedMatrix'Range(2) loop
            if(abs(xfExtendedMatrix(i,j)) > 0.00001)
            then
               notZeroCount := notZeroCount + 1;
            end if;
         end loop;
         AUnit.Assertions.Assert(Condition => notZeroCount =1,
                                 Message   => "more then 1 zero in a row");
         notZeroCount := 0;
      end loop;



--  begin read only
   end Test_Perform_Gauss_Jordan_Elimination_On;
--  end read only


--  begin read only
   procedure Test_tfGet_Inverse_Part_Of (Gnattest_T : in out Test);
   procedure Test_tfGet_Inverse_Part_Of_5b0d7e (Gnattest_T : in out Test) renames Test_tfGet_Inverse_Part_Of;
--  id:2.1/5b0d7e5ad6023dcd/tfGet_Inverse_Part_Of/1/0/
   procedure Test_tfGet_Inverse_Part_Of (Gnattest_T : in out Test) is
   --  navigation-thruster_configurator.ads:40:4:tfGet_Inverse_Part_Of
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_tfGet_Inverse_Part_Of;
--  end read only


--  begin read only
   --  procedure Test_tfGet_Results_Vector_From (Gnattest_T : in out Test_);
   --  procedure Test_tfGet_Results_Vector_From_7b9cdd (Gnattest_T : in out Test_) renames Test_tfGet_Results_Vector_From;
--  id:2.1/7b9cddf36c4a3eac/tfGet_Results_Vector_From/1/1/
   --  procedure Test_tfGet_Results_Vector_From (Gnattest_T : in out Test_) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThrusterConfigurator;
--  
--        xfExtendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..6, 1..7) := (others => (others => 0.0));
--        xThrusterValuesArray : Navigation.Thrusters.TThrusterValuesArray(1 .. 6);
--     begin
--  
--        pxThrusterConfigurator := Navigation.Thruster_Configurator.pxCreate;
--  
--        xfExtendedMatrix(1,7) := 10.0;
--        xfExtendedMatrix(2,7) := 20.0;
--        xfExtendedMatrix(3,7) := 30.0;
--        xfExtendedMatrix(4,7) := 40.0;
--        xfExtendedMatrix(5,7) := 50.0;
--        xfExtendedMatrix(6,7) := 60.0;
--  
--        xThrusterValuesArray := Navigation.Thruster_Configurator.tfGet_Results_Vector_From(xfExtendedMatrix);
--  
--        for i in 1 .. 6 loop
--           AUnit.Assertions.Assert(Condition => abs(xfExtendedMatrix(i, 7) - (float(i) * 10.0)) < 0.0001,
--                                   Message   => "thruster value for index (7, " & integer'Image(i) & ") expected: " & float'Image(float(i) * 10.0) & "actual " & float'Image(xfExtendedMatrix(i,7)));
--  
--        end loop;
--  
--        Navigation.Thruster_Configurator.Free(pxThrusterConfiguratorToDeallocate => pxThrusterConfigurator);
--  
--  begin read only
   --  end Test_tfGet_Results_Vector_From;
--  end read only

end Navigation.Thruster_Configurator.Test_Data.Tests;
