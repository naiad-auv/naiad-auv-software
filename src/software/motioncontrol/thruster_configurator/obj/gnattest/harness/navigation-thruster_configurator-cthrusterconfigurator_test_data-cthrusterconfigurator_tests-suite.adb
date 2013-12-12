--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Thruster_Configurator.CThrusterConfigurator_Test_Data.CThrusterConfigurator_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Thruster_Configurator.CThrusterConfigurator_Test_Data.CThrusterConfigurator_Tests.Test_CThrusterConfigurator);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_iGet_Number_Of_Thrusters_d77f18 : aliased Runner_1.Test_Case;
   Case_2_1_Test_tfGet_Thruster_Effects_Matrix_972577 : aliased Runner_1.Test_Case;
   Case_3_1_Test_tfGet_Thruster_Values_fd2a06 : aliased Runner_1.Test_Case;
   Case_4_1_Test_tfCreate_Extended_Matrix_b5b96a : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_iGet_Number_Of_Thrusters_d77f18,
         "navigation-thruster_configurator.ads:22:4:",
         Test_iGet_Number_Of_Thrusters_d77f18'Access);
      Runner_1.Create
        (Case_2_1_Test_tfGet_Thruster_Effects_Matrix_972577,
         "navigation-thruster_configurator.ads:23:4:",
         Test_tfGet_Thruster_Effects_Matrix_972577'Access);
      Runner_1.Create
        (Case_3_1_Test_tfGet_Thruster_Values_fd2a06,
         "navigation-thruster_configurator.ads:25:4:",
         Test_tfGet_Thruster_Values_fd2a06'Access);
      Runner_1.Create
        (Case_4_1_Test_tfCreate_Extended_Matrix_b5b96a,
         "navigation-thruster_configurator.ads:37:4:",
         Test_tfCreate_Extended_Matrix_b5b96a'Access);

      Result.Add_Test (Case_1_1_Test_iGet_Number_Of_Thrusters_d77f18'Access);
      Result.Add_Test (Case_2_1_Test_tfGet_Thruster_Effects_Matrix_972577'Access);
      Result.Add_Test (Case_3_1_Test_tfGet_Thruster_Values_fd2a06'Access);
      Result.Add_Test (Case_4_1_Test_tfCreate_Extended_Matrix_b5b96a'Access);

      return Result'Access;

   end Suite;

end Navigation.Thruster_Configurator.CThrusterConfigurator_Test_Data.CThrusterConfigurator_Tests.Suite;
--  end read only
