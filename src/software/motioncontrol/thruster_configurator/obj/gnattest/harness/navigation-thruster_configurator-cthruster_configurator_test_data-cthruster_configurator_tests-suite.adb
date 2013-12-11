--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Thruster_Configurator.CThruster_Configurator_Test_Data.CThruster_Configurator_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Thruster_Configurator.CThruster_Configurator_Test_Data.CThruster_Configurator_Tests.Test_CThruster_Configurator);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Configure_Thruster_Effects_ecc793 : aliased Runner_1.Test_Case;
   Case_2_1_Test_xGet_Final_Thruster_Power_Configuration_1555a5 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Configure_Thruster_Effects_ecc793,
         "navigation-thruster_configurator.ads:22:4:",
         Test_Configure_Thruster_Effects_ecc793'Access);
      Runner_1.Create
        (Case_2_1_Test_xGet_Final_Thruster_Power_Configuration_1555a5,
         "navigation-thruster_configurator.ads:24:4:",
         Test_xGet_Final_Thruster_Power_Configuration_1555a5'Access);

      Result.Add_Test (Case_1_1_Test_Configure_Thruster_Effects_ecc793'Access);
      Result.Add_Test (Case_2_1_Test_xGet_Final_Thruster_Power_Configuration_1555a5'Access);

      return Result'Access;

   end Suite;

end Navigation.Thruster_Configurator.CThruster_Configurator_Test_Data.CThruster_Configurator_Tests.Suite;
--  end read only
