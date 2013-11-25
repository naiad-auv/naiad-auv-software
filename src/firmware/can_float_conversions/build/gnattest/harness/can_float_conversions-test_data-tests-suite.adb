--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Can_Float_Conversions.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Can_Float_Conversions.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Orientation_To_Message_77271c : aliased Runner_1.Test_Case;
   Case_2_1_Test_Message_To_Orientation_c23cdc : aliased Runner_1.Test_Case;
   Case_3_1_Test_Acceleration_To_Message_eaa5d2 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Message_To_Acceleration_1ee59d : aliased Runner_1.Test_Case;
   Case_5_1_Test_GyroReading_To_Message_aec609 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Message_To_GyroReading_19064a : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Orientation_To_Message_77271c,
         "can_float_conversions.ads:18:4:",
         Test_Orientation_To_Message_77271c'Access);
      Runner_1.Create
        (Case_2_1_Test_Message_To_Orientation_c23cdc,
         "can_float_conversions.ads:19:4:",
         Test_Message_To_Orientation_c23cdc'Access);
      Runner_1.Create
        (Case_3_1_Test_Acceleration_To_Message_eaa5d2,
         "can_float_conversions.ads:22:4:",
         Test_Acceleration_To_Message_eaa5d2'Access);
      Runner_1.Create
        (Case_4_1_Test_Message_To_Acceleration_1ee59d,
         "can_float_conversions.ads:23:4:",
         Test_Message_To_Acceleration_1ee59d'Access);
      Runner_1.Create
        (Case_5_1_Test_GyroReading_To_Message_aec609,
         "can_float_conversions.ads:26:4:",
         Test_GyroReading_To_Message_aec609'Access);
      Runner_1.Create
        (Case_6_1_Test_Message_To_GyroReading_19064a,
         "can_float_conversions.ads:27:4:",
         Test_Message_To_GyroReading_19064a'Access);

      Result.Add_Test (Case_1_1_Test_Orientation_To_Message_77271c'Access);
      Result.Add_Test (Case_2_1_Test_Message_To_Orientation_c23cdc'Access);
      Result.Add_Test (Case_3_1_Test_Acceleration_To_Message_eaa5d2'Access);
      Result.Add_Test (Case_4_1_Test_Message_To_Acceleration_1ee59d'Access);
      Result.Add_Test (Case_5_1_Test_GyroReading_To_Message_aec609'Access);
      Result.Add_Test (Case_6_1_Test_Message_To_GyroReading_19064a'Access);

      return Result'Access;

   end Suite;

end Can_Float_Conversions.Test_Data.Tests.Suite;
--  end read only
