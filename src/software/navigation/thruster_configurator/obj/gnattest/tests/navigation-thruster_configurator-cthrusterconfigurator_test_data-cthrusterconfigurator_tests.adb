--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Thruster_Configurator.CThrusterConfigurator_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Thruster_Configurator.CThrusterConfigurator_Test_Data.CThrusterConfigurator_Tests is


--  begin read only
   procedure Test_iGet_Number_Of_Thrusters (Gnattest_T : in out Test_CThrusterConfigurator);
   procedure Test_iGet_Number_Of_Thrusters_d77f18 (Gnattest_T : in out Test_CThrusterConfigurator) renames Test_iGet_Number_Of_Thrusters;
--  id:2.1/d77f18df25a8a493/iGet_Number_Of_Thrusters/1/0/
   procedure Test_iGet_Number_Of_Thrusters (Gnattest_T : in out Test_CThrusterConfigurator) is
   --  navigation-thruster_configurator.ads:22:4:iGet_Number_Of_Thrusters
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThrusterConfigurator;

   begin

      pxThrusterConfigurator := Navigation.Thruster_Configurator.pxCreate;

      AUnit.Assertions.Assert(Condition => pxThrusterConfigurator.iGet_Number_Of_Thrusters = 6,
                              Message   => "Wrong number of thrusters returned");
      Navigation.Thruster_Configurator.Free(pxThrusterConfiguratorToDeallocate => pxThrusterConfigurator);
--  begin read only
   end Test_iGet_Number_Of_Thrusters;
--  end read only


--  begin read only
   procedure Test_tfGet_Thruster_Effects_Matrix (Gnattest_T : in out Test_CThrusterConfigurator);
   procedure Test_tfGet_Thruster_Effects_Matrix_972577 (Gnattest_T : in out Test_CThrusterConfigurator) renames Test_tfGet_Thruster_Effects_Matrix;
--  id:2.1/9725779a9fcce1b2/tfGet_Thruster_Effects_Matrix/1/0/
   procedure Test_tfGet_Thruster_Effects_Matrix (Gnattest_T : in out Test_CThrusterConfigurator) is
   --  navigation-thruster_configurator.ads:23:4:tfGet_Thruster_Effects_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThrusterConfigurator;
     --xThrusterEffectsMatrix : Navigation.Thrusters.TThrusterEffectsMatrix(1..6);
   begin

      pxThrusterConfigurator := Navigation.Thruster_Configurator.pxCreate;

  --    xThrusterEffectsMatrix := pxThrusterConfigurator.tfGet_Thruster_Effects_Matrix;

      --TODO hur fan ska jag testa detta

--  begin read only
   end Test_tfGet_Thruster_Effects_Matrix;
--  end read only


--  begin read only
   procedure Test_tfGet_Thruster_Values (Gnattest_T : in out Test_CThrusterConfigurator);
   procedure Test_tfGet_Thruster_Values_fd2a06 (Gnattest_T : in out Test_CThrusterConfigurator) renames Test_tfGet_Thruster_Values;
--  id:2.1/fd2a061725e8db0d/tfGet_Thruster_Values/1/0/
   procedure Test_tfGet_Thruster_Values (Gnattest_T : in out Test_CThrusterConfigurator) is
   --  navigation-thruster_configurator.ads:25:4:tfGet_Thruster_Values
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThrusterConfigurator;
      xThrusterValues : Navigation.Thrusters.TThrusterValuesArray(1..6);
      xComponentValues : Navigation.Thrusters.TThrusterEffects := (others => 1.0);

      allComponentsEqual : boolean := true;
      allZero : boolean := true;
   begin

      pxThrusterConfigurator := Navigation.Thruster_Configurator.pxCreate;

      xThrusterValues := pxThrusterConfigurator.tfGet_Thruster_Values(xComponentValues);

        for i in xThrusterValues'Range loop
          if xComponentValues(Navigation.Thrusters.EThrusterEffectsComponents'Val(i - 1)) /= xThrusterValues(Integer(i)) then
             allComponentsEqual := false;
           end if;
        end loop;

      for i in xThrusterValues'Range loop
         if abs(xThrusterValues(i)) > 0.00001 then
            allZero := false;
         end if;
      end loop;

      AUnit.Assertions.Assert(Condition => not allComponentsEqual,
                              Message   => "All components are equal");
      AUnit.Assertions.Assert(Condition => not allZero,
                              Message   => "All components are zero");
      Navigation.Thruster_Configurator.Free(pxThrusterConfiguratorToDeallocate => pxThrusterConfigurator);
--  begin read only
   end Test_tfGet_Thruster_Values;
--  end read only


--  begin read only
   procedure Test_tfCreate_Extended_Matrix (Gnattest_T : in out Test_CThrusterConfigurator);
   procedure Test_tfCreate_Extended_Matrix_b5b96a (Gnattest_T : in out Test_CThrusterConfigurator) renames Test_tfCreate_Extended_Matrix;
--  id:2.1/b5b96a17803e5ede/tfCreate_Extended_Matrix/1/0/
   procedure Test_tfCreate_Extended_Matrix (Gnattest_T : in out Test_CThrusterConfigurator) is
   --  navigation-thruster_configurator.ads:37:4:tfCreate_Extended_Matrix
--  end read only

      pragma Unreferenced (Gnattest_T);

   pxThrusterConfigurator : Navigation.Thruster_Configurator.pCThrusterConfigurator;
      extendedMatrix : Navigation.Thruster_Configurator.TExtendedMatrix(1..6, 1..7);
   begin

      pxThrusterConfigurator := Navigation.Thruster_Configurator.pxCreate;

      extendedMatrix := pxThrusterConfigurator.tfCreate_Extended_Matrix;

      --Vettefan hur jag ska testa detta

--  begin read only
   end Test_tfCreate_Extended_Matrix;
--  end read only

end Navigation.Thruster_Configurator.CThrusterConfigurator_Test_Data.CThrusterConfigurator_Tests;
