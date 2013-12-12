--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Can_Float_Conversions.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Can_Float_Conversions.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Orientation_To_Message_f946a5 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Message_To_Orientation_ed8395 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Acceleration_To_Message_d21584 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Message_To_Acceleration_a49ed1 : aliased Runner_1.Test_Case;
   Case_5_1_Test_GyroReading_To_Message_a54dc5 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Message_To_GyroReading_9c2114 : aliased Runner_1.Test_Case;
   Case_7_1_Test_i21_Get_Integer_2ffcf0 : aliased Runner_1.Test_Case;
   Case_8_1_Test_fMod_e22caf : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Orientation_To_Message_f946a5,
         "can_float_conversions.ads:20:4:",
         Test_Orientation_To_Message_f946a5'Access);
      Runner_1.Create
        (Case_2_1_Test_Message_To_Orientation_ed8395,
         "can_float_conversions.ads:21:4:",
         Test_Message_To_Orientation_ed8395'Access);
      Runner_1.Create
        (Case_3_1_Test_Acceleration_To_Message_d21584,
         "can_float_conversions.ads:24:4:",
         Test_Acceleration_To_Message_d21584'Access);
      Runner_1.Create
        (Case_4_1_Test_Message_To_Acceleration_a49ed1,
         "can_float_conversions.ads:27:4:",
         Test_Message_To_Acceleration_a49ed1'Access);
      Runner_1.Create
        (Case_5_1_Test_GyroReading_To_Message_a54dc5,
         "can_float_conversions.ads:32:4:",
         Test_GyroReading_To_Message_a54dc5'Access);
      Runner_1.Create
        (Case_6_1_Test_Message_To_GyroReading_9c2114,
         "can_float_conversions.ads:33:4:",
         Test_Message_To_GyroReading_9c2114'Access);
      Runner_1.Create
        (Case_7_1_Test_i21_Get_Integer_2ffcf0,
         "can_float_conversions.ads:81:4:",
         Test_i21_Get_Integer_2ffcf0'Access);
      Runner_1.Create
        (Case_8_1_Test_fMod_e22caf,
         "can_float_conversions.ads:82:4:",
         Test_fMod_e22caf'Access);

      Result.Add_Test (Case_1_1_Test_Orientation_To_Message_f946a5'Access);
      Result.Add_Test (Case_2_1_Test_Message_To_Orientation_ed8395'Access);
      Result.Add_Test (Case_3_1_Test_Acceleration_To_Message_d21584'Access);
      Result.Add_Test (Case_4_1_Test_Message_To_Acceleration_a49ed1'Access);
      Result.Add_Test (Case_5_1_Test_GyroReading_To_Message_a54dc5'Access);
      Result.Add_Test (Case_6_1_Test_Message_To_GyroReading_9c2114'Access);
      Result.Add_Test (Case_7_1_Test_i21_Get_Integer_2ffcf0'Access);
      Result.Add_Test (Case_8_1_Test_fMod_e22caf'Access);

      return Result'Access;

   end Suite;

end Can_Float_Conversions.Test_Data.Tests.Suite;
--  end read only
