--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body simulator.ViewModel_Wanted_Pos.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.simulator.ViewModel_Wanted_Pos.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_f1682d : aliased Runner_1.Test_Case;
   Case_2_1_Test_Free_e6852d : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_f1682d,
         "simulator-viewmodel_wanted_pos.ads:13:4:",
         Test_pxCreate_f1682d'Access);
      Runner_1.Create
        (Case_2_1_Test_Free_e6852d,
         "simulator-viewmodel_wanted_pos.ads:14:4:",
         Test_Free_e6852d'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_f1682d'Access);
      Result.Add_Test (Case_2_1_Test_Free_e6852d'Access);

      return Result'Access;

   end Suite;

end simulator.ViewModel_Wanted_Pos.Test_Data.Tests.Suite;
--  end read only
