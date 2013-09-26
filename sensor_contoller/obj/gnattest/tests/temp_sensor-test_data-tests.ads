--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with Gnattest_Generated;

package Temp_Sensor.Test_Data.Tests is

   type Test is new GNATtest_Generated.GNATtest_Standard.Temp_Sensor.Test_Data.Test
   with null record;

   procedure Test_get_temp_int_136006 (Gnattest_T : in out Test);
   --  temp_sensor.ads:26:4:get_temp_int

   procedure Test_get_temp_str_0ab178 (Gnattest_T : in out Test);
   --  temp_sensor.ads:31:4:get_temp_str

   procedure Test_reset_pulse_33a1ec (Gnattest_T : in out Test);
   --  temp_sensor.ads:37:4:reset_pulse

   procedure Test_write_byte_8045aa (Gnattest_T : in out Test);
   --  temp_sensor.ads:39:4:write_byte

   procedure Test_read_byte_733fac (Gnattest_T : in out Test);
   --  temp_sensor.ads:41:4:read_byte

   procedure Test_wait_us_3bed2d (Gnattest_T : in out Test);
   --  temp_sensor.ads:43:4:wait_us

end Temp_Sensor.Test_Data.Tests;
--  end read only
