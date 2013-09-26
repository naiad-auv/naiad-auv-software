--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Temp_Sensor.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Temp_Sensor.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_get_temp_int_136006 : aliased Runner_1.Test_Case;
   Case_2_1_Test_get_temp_str_0ab178 : aliased Runner_1.Test_Case;
   Case_3_1_Test_reset_pulse_33a1ec : aliased Runner_1.Test_Case;
   Case_4_1_Test_write_byte_8045aa : aliased Runner_1.Test_Case;
   Case_5_1_Test_read_byte_733fac : aliased Runner_1.Test_Case;
   Case_6_1_Test_wait_us_3bed2d : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_get_temp_int_136006,
         "temp_sensor.ads:26:4:",
         Test_get_temp_int_136006'Access);
      Runner_1.Create
        (Case_2_1_Test_get_temp_str_0ab178,
         "temp_sensor.ads:31:4:",
         Test_get_temp_str_0ab178'Access);
      Runner_1.Create
        (Case_3_1_Test_reset_pulse_33a1ec,
         "temp_sensor.ads:37:4:",
         Test_reset_pulse_33a1ec'Access);
      Runner_1.Create
        (Case_4_1_Test_write_byte_8045aa,
         "temp_sensor.ads:39:4:",
         Test_write_byte_8045aa'Access);
      Runner_1.Create
        (Case_5_1_Test_read_byte_733fac,
         "temp_sensor.ads:41:4:",
         Test_read_byte_733fac'Access);
      Runner_1.Create
        (Case_6_1_Test_wait_us_3bed2d,
         "temp_sensor.ads:43:4:",
         Test_wait_us_3bed2d'Access);

      Result.Add_Test (Case_1_1_Test_get_temp_int_136006'Access);
      Result.Add_Test (Case_2_1_Test_get_temp_str_0ab178'Access);
      Result.Add_Test (Case_3_1_Test_reset_pulse_33a1ec'Access);
      Result.Add_Test (Case_4_1_Test_write_byte_8045aa'Access);
      Result.Add_Test (Case_5_1_Test_read_byte_733fac'Access);
      Result.Add_Test (Case_6_1_Test_wait_us_3bed2d'Access);

      return Result'Access;

   end Suite;

end Temp_Sensor.Test_Data.Tests.Suite;
--  end read only
