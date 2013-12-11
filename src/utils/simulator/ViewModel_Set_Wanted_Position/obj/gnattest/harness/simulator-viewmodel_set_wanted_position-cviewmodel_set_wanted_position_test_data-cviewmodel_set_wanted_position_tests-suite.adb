--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position_Test_Data.CViewmodel_Set_Wanted_Position_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position_Test_Data.CViewmodel_Set_Wanted_Position_Tests.Test_CViewmodel_Set_Wanted_Position);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Set_Wanted_Position_And_Orientation_070c60 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Set_Wanted_Position_And_Orientation_070c60,
         "simulator-viewmodel_set_wanted_position.ads:17:4:",
         Test_Set_Wanted_Position_And_Orientation_070c60'Access);

      Result.Add_Test (Case_1_1_Test_Set_Wanted_Position_And_Orientation_070c60'Access);

      return Result'Access;

   end Suite;

end simulator.Viewmodel_Set_Wanted_Position.CViewmodel_Set_Wanted_Position_Test_Data.CViewmodel_Set_Wanted_Position_Tests.Suite;
--  end read only
