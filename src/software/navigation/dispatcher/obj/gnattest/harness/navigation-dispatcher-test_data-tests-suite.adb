--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Navigation.Dispatcher.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Navigation.Dispatcher.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Free_5d4c1b : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_63d5f9 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Scale_Thruster_Values_6606ca : aliased Runner_1.Test_Case;
   Case_4_1_Test_bThruster_Values_Need_Scaling_46c697 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Free_5d4c1b,
         "navigation-dispatcher.ads:20:4:",
         Test_Free_5d4c1b'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_63d5f9,
         "navigation-dispatcher.ads:23:4:",
         Test_pxCreate_63d5f9'Access);
      Runner_1.Create
        (Case_3_1_Test_Scale_Thruster_Values_6606ca,
         "navigation-dispatcher.ads:62:4:",
         Test_Scale_Thruster_Values_6606ca'Access);
      Runner_1.Create
        (Case_4_1_Test_bThruster_Values_Need_Scaling_46c697,
         "navigation-dispatcher.ads:63:4:",
         Test_bThruster_Values_Need_Scaling_46c697'Access);

      Result.Add_Test (Case_1_1_Test_Free_5d4c1b'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_63d5f9'Access);
      Result.Add_Test (Case_3_1_Test_Scale_Thruster_Values_6606ca'Access);
      Result.Add_Test (Case_4_1_Test_bThruster_Values_Need_Scaling_46c697'Access);

      return Result'Access;

   end Suite;

end Navigation.Dispatcher.Test_Data.Tests.Suite;
--  end read only
