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
   Case_3_1_Test_Vector_To_Message_7572aa : aliased Runner_1.Test_Case;
   Case_4_1_Test_Message_To_Vector_d1620e : aliased Runner_1.Test_Case;
   Case_5_1_Test_GyroReading_To_Message_a54dc5 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Message_To_GyroReading_9c2114 : aliased Runner_1.Test_Case;
   Case_7_1_Test_PID_Scalings_To_Message_99b448 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Message_To_PID_Scalings_839a1d : aliased Runner_1.Test_Case;
   Case_9_1_Test_i21_Get_Integer_2ffcf0 : aliased Runner_1.Test_Case;
   Case_10_1_Test_i16_Get_Integer_3215f1 : aliased Runner_1.Test_Case;
   Case_11_1_Test_fMod_e22caf : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Orientation_To_Message_f946a5,
         "can_float_conversions.ads:22:4:",
         Test_Orientation_To_Message_f946a5'Access);
      Runner_1.Create
        (Case_2_1_Test_Message_To_Orientation_ed8395,
         "can_float_conversions.ads:23:4:",
         Test_Message_To_Orientation_ed8395'Access);
      Runner_1.Create
        (Case_3_1_Test_Vector_To_Message_7572aa,
         "can_float_conversions.ads:26:4:",
         Test_Vector_To_Message_7572aa'Access);
      Runner_1.Create
        (Case_4_1_Test_Message_To_Vector_d1620e,
         "can_float_conversions.ads:29:4:",
         Test_Message_To_Vector_d1620e'Access);
      Runner_1.Create
        (Case_5_1_Test_GyroReading_To_Message_a54dc5,
         "can_float_conversions.ads:37:4:",
         Test_GyroReading_To_Message_a54dc5'Access);
      Runner_1.Create
        (Case_6_1_Test_Message_To_GyroReading_9c2114,
         "can_float_conversions.ads:38:4:",
         Test_Message_To_GyroReading_9c2114'Access);
      Runner_1.Create
        (Case_7_1_Test_PID_Scalings_To_Message_99b448,
         "can_float_conversions.ads:42:4:",
         Test_PID_Scalings_To_Message_99b448'Access);
      Runner_1.Create
        (Case_8_1_Test_Message_To_PID_Scalings_839a1d,
         "can_float_conversions.ads:46:4:",
         Test_Message_To_PID_Scalings_839a1d'Access);
      Runner_1.Create
        (Case_9_1_Test_i21_Get_Integer_2ffcf0,
         "can_float_conversions.ads:119:4:",
         Test_i21_Get_Integer_2ffcf0'Access);
      Runner_1.Create
        (Case_10_1_Test_i16_Get_Integer_3215f1,
         "can_float_conversions.ads:120:4:",
         Test_i16_Get_Integer_3215f1'Access);
      Runner_1.Create
        (Case_11_1_Test_fMod_e22caf,
         "can_float_conversions.ads:121:4:",
         Test_fMod_e22caf'Access);

      Result.Add_Test (Case_1_1_Test_Orientation_To_Message_f946a5'Access);
      Result.Add_Test (Case_2_1_Test_Message_To_Orientation_ed8395'Access);
      Result.Add_Test (Case_3_1_Test_Vector_To_Message_7572aa'Access);
      Result.Add_Test (Case_4_1_Test_Message_To_Vector_d1620e'Access);
      Result.Add_Test (Case_5_1_Test_GyroReading_To_Message_a54dc5'Access);
      Result.Add_Test (Case_6_1_Test_Message_To_GyroReading_9c2114'Access);
      Result.Add_Test (Case_7_1_Test_PID_Scalings_To_Message_99b448'Access);
      Result.Add_Test (Case_8_1_Test_Message_To_PID_Scalings_839a1d'Access);
      Result.Add_Test (Case_9_1_Test_i21_Get_Integer_2ffcf0'Access);
      Result.Add_Test (Case_10_1_Test_i16_Get_Integer_3215f1'Access);
      Result.Add_Test (Case_11_1_Test_fMod_e22caf'Access);

      return Result'Access;

   end Suite;

end Can_Float_Conversions.Test_Data.Tests.Suite;
--  end read only
