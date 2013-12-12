--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data.CViewModel_Wanted_Pos_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data.CViewModel_Wanted_Pos_Tests.Test_CViewModel_Wanted_Pos);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Set_Wanted_Position_And_Orientation_b04f45 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Set_Wanted_Position_And_Orientation_b04f45,
         "simulator-viewmodel_wanted_pos.ads:16:4:",
         Test_Set_Wanted_Position_And_Orientation_b04f45'Access);

      Result.Add_Test (Case_1_1_Test_Set_Wanted_Position_And_Orientation_b04f45'Access);

      return Result'Access;

   end Suite;

end simulator.ViewModel_Wanted_Pos.CViewModel_Wanted_Pos_Test_Data.CViewModel_Wanted_Pos_Tests.Suite;
--  end read only
