--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.ViewModel_Representation.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel_Representation.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_7f4ae3 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Free_8544de : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_7f4ae3,
         "simulator-viewmodel_representation.ads:31:4:",
         Test_pxCreate_7f4ae3'Access);
      Runner_1.Create
        (Case_2_1_Test_Free_8544de,
         "simulator-viewmodel_representation.ads:33:4:",
         Test_Free_8544de'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_7f4ae3'Access);
      Result.Add_Test (Case_2_1_Test_Free_8544de'Access);

      return Result'Access;

   end Suite;

end Simulator.ViewModel_Representation.Test_Data.Tests.Suite;
--  end read only
