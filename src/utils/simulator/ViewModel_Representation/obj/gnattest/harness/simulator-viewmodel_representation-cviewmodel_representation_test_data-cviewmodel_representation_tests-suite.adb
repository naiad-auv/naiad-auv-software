--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.ViewModel_Representation.CViewModel_Representation_Test_Data.CViewModel_Representation_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel_Representation.CViewModel_Representation_Test_Data.CViewModel_Representation_Tests.Test_CViewModel_Representation);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_xGet_Submarine_Current_Position_0f045e : aliased Runner_1.Test_Case;
   Case_2_1_Test_xGet_Submarine_Wanted_Position_db19f2 : aliased Runner_1.Test_Case;
   Case_3_1_Test_xGet_Submarine_Current_Orientation_73c54b : aliased Runner_1.Test_Case;
   Case_4_1_Test_xGet_Submarine_Wanted_Orientation_5ce8e5 : aliased Runner_1.Test_Case;
   Case_5_1_Test_fGet_Pid_Errors_7cbe4b : aliased Runner_1.Test_Case;
   Case_6_1_Test_Restart_ec643c : aliased Runner_1.Test_Case;
   Case_7_1_Test_Update_05249c : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_xGet_Submarine_Current_Position_0f045e,
         "simulator-viewmodel_representation.ads:35:4:",
         Test_xGet_Submarine_Current_Position_0f045e'Access);
      Runner_1.Create
        (Case_2_1_Test_xGet_Submarine_Wanted_Position_db19f2,
         "simulator-viewmodel_representation.ads:36:4:",
         Test_xGet_Submarine_Wanted_Position_db19f2'Access);
      Runner_1.Create
        (Case_3_1_Test_xGet_Submarine_Current_Orientation_73c54b,
         "simulator-viewmodel_representation.ads:38:4:",
         Test_xGet_Submarine_Current_Orientation_73c54b'Access);
      Runner_1.Create
        (Case_4_1_Test_xGet_Submarine_Wanted_Orientation_5ce8e5,
         "simulator-viewmodel_representation.ads:39:4:",
         Test_xGet_Submarine_Wanted_Orientation_5ce8e5'Access);
      Runner_1.Create
        (Case_5_1_Test_fGet_Pid_Errors_7cbe4b,
         "simulator-viewmodel_representation.ads:41:4:",
         Test_fGet_Pid_Errors_7cbe4b'Access);
      Runner_1.Create
        (Case_6_1_Test_Restart_ec643c,
         "simulator-viewmodel_representation.ads:43:4:",
         Test_Restart_ec643c'Access);
      Runner_1.Create
        (Case_7_1_Test_Update_05249c,
         "simulator-viewmodel_representation.ads:44:4:",
         Test_Update_05249c'Access);

      Result.Add_Test (Case_1_1_Test_xGet_Submarine_Current_Position_0f045e'Access);
      Result.Add_Test (Case_2_1_Test_xGet_Submarine_Wanted_Position_db19f2'Access);
      Result.Add_Test (Case_3_1_Test_xGet_Submarine_Current_Orientation_73c54b'Access);
      Result.Add_Test (Case_4_1_Test_xGet_Submarine_Wanted_Orientation_5ce8e5'Access);
      Result.Add_Test (Case_5_1_Test_fGet_Pid_Errors_7cbe4b'Access);
      Result.Add_Test (Case_6_1_Test_Restart_ec643c'Access);
      Result.Add_Test (Case_7_1_Test_Update_05249c'Access);

      return Result'Access;

   end Suite;

end Simulator.ViewModel_Representation.CViewModel_Representation_Test_Data.CViewModel_Representation_Tests.Suite;
--  end read only
