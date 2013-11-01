--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Simulator.ViewModel.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Simulator.ViewModel.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_pxCreate_239ee6 : aliased Runner_1.Test_Case;
   Case_2_1_Test_pxCreate_08c30b : aliased Runner_1.Test_Case;
   Case_3_1_Test_fGet_Submarine_Current_X_Position_c211ec : aliased Runner_1.Test_Case;
   Case_4_1_Test_fGet_Submarine_Current_Y_Position_026d0d : aliased Runner_1.Test_Case;
   Case_5_1_Test_fGet_Submarine_Current_Z_Position_ad83b7 : aliased Runner_1.Test_Case;
   Case_6_1_Test_fGet_Submarine_Wanted_X_Position_b48d36 : aliased Runner_1.Test_Case;
   Case_7_1_Test_fGet_Submarine_Wanted_Y_Position_80e0c3 : aliased Runner_1.Test_Case;
   Case_8_1_Test_fGet_Submarine_Wanted_Z_Position_008ca6 : aliased Runner_1.Test_Case;
   Case_9_1_Test_fGet_Submarine_Current_X_Orientation_cb6c12 : aliased Runner_1.Test_Case;
   Case_10_1_Test_fGet_Submarine_Current_Y_Orientation_d44a7a : aliased Runner_1.Test_Case;
   Case_11_1_Test_fGet_Submarine_Current_Z_Orientation_d1246f : aliased Runner_1.Test_Case;
   Case_12_1_Test_fGet_Submarine_Wanted_X_Orientation_3ec139 : aliased Runner_1.Test_Case;
   Case_13_1_Test_fGet_Submarine_Wanted_Y_Orientation_814e6f : aliased Runner_1.Test_Case;
   Case_14_1_Test_fGet_Submarine_Wanted_Z_Orientation_536b2a : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_pxCreate_239ee6,
         "simulator-viewmodel.ads:13:4:",
         Test_pxCreate_239ee6'Access);
      Runner_1.Create
        (Case_2_1_Test_pxCreate_08c30b,
         "simulator-viewmodel.ads:14:4:",
         Test_pxCreate_08c30b'Access);
      Runner_1.Create
        (Case_3_1_Test_fGet_Submarine_Current_X_Position_c211ec,
         "simulator-viewmodel.ads:16:4:",
         Test_fGet_Submarine_Current_X_Position_c211ec'Access);
      Runner_1.Create
        (Case_4_1_Test_fGet_Submarine_Current_Y_Position_026d0d,
         "simulator-viewmodel.ads:17:4:",
         Test_fGet_Submarine_Current_Y_Position_026d0d'Access);
      Runner_1.Create
        (Case_5_1_Test_fGet_Submarine_Current_Z_Position_ad83b7,
         "simulator-viewmodel.ads:18:4:",
         Test_fGet_Submarine_Current_Z_Position_ad83b7'Access);
      Runner_1.Create
        (Case_6_1_Test_fGet_Submarine_Wanted_X_Position_b48d36,
         "simulator-viewmodel.ads:20:4:",
         Test_fGet_Submarine_Wanted_X_Position_b48d36'Access);
      Runner_1.Create
        (Case_7_1_Test_fGet_Submarine_Wanted_Y_Position_80e0c3,
         "simulator-viewmodel.ads:21:4:",
         Test_fGet_Submarine_Wanted_Y_Position_80e0c3'Access);
      Runner_1.Create
        (Case_8_1_Test_fGet_Submarine_Wanted_Z_Position_008ca6,
         "simulator-viewmodel.ads:22:4:",
         Test_fGet_Submarine_Wanted_Z_Position_008ca6'Access);
      Runner_1.Create
        (Case_9_1_Test_fGet_Submarine_Current_X_Orientation_cb6c12,
         "simulator-viewmodel.ads:24:4:",
         Test_fGet_Submarine_Current_X_Orientation_cb6c12'Access);
      Runner_1.Create
        (Case_10_1_Test_fGet_Submarine_Current_Y_Orientation_d44a7a,
         "simulator-viewmodel.ads:25:4:",
         Test_fGet_Submarine_Current_Y_Orientation_d44a7a'Access);
      Runner_1.Create
        (Case_11_1_Test_fGet_Submarine_Current_Z_Orientation_d1246f,
         "simulator-viewmodel.ads:26:4:",
         Test_fGet_Submarine_Current_Z_Orientation_d1246f'Access);
      Runner_1.Create
        (Case_12_1_Test_fGet_Submarine_Wanted_X_Orientation_3ec139,
         "simulator-viewmodel.ads:28:4:",
         Test_fGet_Submarine_Wanted_X_Orientation_3ec139'Access);
      Runner_1.Create
        (Case_13_1_Test_fGet_Submarine_Wanted_Y_Orientation_814e6f,
         "simulator-viewmodel.ads:29:4:",
         Test_fGet_Submarine_Wanted_Y_Orientation_814e6f'Access);
      Runner_1.Create
        (Case_14_1_Test_fGet_Submarine_Wanted_Z_Orientation_536b2a,
         "simulator-viewmodel.ads:30:4:",
         Test_fGet_Submarine_Wanted_Z_Orientation_536b2a'Access);

      Result.Add_Test (Case_1_1_Test_pxCreate_239ee6'Access);
      Result.Add_Test (Case_2_1_Test_pxCreate_08c30b'Access);
      Result.Add_Test (Case_3_1_Test_fGet_Submarine_Current_X_Position_c211ec'Access);
      Result.Add_Test (Case_4_1_Test_fGet_Submarine_Current_Y_Position_026d0d'Access);
      Result.Add_Test (Case_5_1_Test_fGet_Submarine_Current_Z_Position_ad83b7'Access);
      Result.Add_Test (Case_6_1_Test_fGet_Submarine_Wanted_X_Position_b48d36'Access);
      Result.Add_Test (Case_7_1_Test_fGet_Submarine_Wanted_Y_Position_80e0c3'Access);
      Result.Add_Test (Case_8_1_Test_fGet_Submarine_Wanted_Z_Position_008ca6'Access);
      Result.Add_Test (Case_9_1_Test_fGet_Submarine_Current_X_Orientation_cb6c12'Access);
      Result.Add_Test (Case_10_1_Test_fGet_Submarine_Current_Y_Orientation_d44a7a'Access);
      Result.Add_Test (Case_11_1_Test_fGet_Submarine_Current_Z_Orientation_d1246f'Access);
      Result.Add_Test (Case_12_1_Test_fGet_Submarine_Wanted_X_Orientation_3ec139'Access);
      Result.Add_Test (Case_13_1_Test_fGet_Submarine_Wanted_Y_Orientation_814e6f'Access);
      Result.Add_Test (Case_14_1_Test_fGet_Submarine_Wanted_Z_Orientation_536b2a'Access);

      return Result'Access;

   end Suite;

end Simulator.ViewModel.Test_Data.Tests.Suite;
--  end read only
