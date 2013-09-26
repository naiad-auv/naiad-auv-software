--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Temp_Sensor.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Temp_Sensor.Test_Data.Tests is


--  begin read only
   procedure Test_get_temp_int (Gnattest_T : in out Test);
   procedure Test_get_temp_int_136006 (Gnattest_T : in out Test) renames Test_get_temp_int;
--  id:2.1/136006c4ce4781a6/get_temp_int/1/0/
   procedure Test_get_temp_int (Gnattest_T : in out Test) is
   --  temp_sensor.ads:26:4:get_temp_int
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_get_temp_int;
--  end read only


--  begin read only
   procedure Test_get_temp_str (Gnattest_T : in out Test);
   procedure Test_get_temp_str_0ab178 (Gnattest_T : in out Test) renames Test_get_temp_str;
--  id:2.1/0ab1788b84fe9876/get_temp_str/1/0/
   procedure Test_get_temp_str (Gnattest_T : in out Test) is
   --  temp_sensor.ads:31:4:get_temp_str
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (get_temp_str(0) = "+135.0",
         "Test_get_temp_str failed.");

--  begin read only
   end Test_get_temp_str;
--  end read only


--  begin read only
   procedure Test_reset_pulse (Gnattest_T : in out Test);
   procedure Test_reset_pulse_33a1ec (Gnattest_T : in out Test) renames Test_reset_pulse;
--  id:2.1/33a1ec453a140fdf/reset_pulse/1/0/
   procedure Test_reset_pulse (Gnattest_T : in out Test) is
   --  temp_sensor.ads:37:4:reset_pulse
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_reset_pulse;
--  end read only


--  begin read only
   procedure Test_write_byte (Gnattest_T : in out Test);
   procedure Test_write_byte_8045aa (Gnattest_T : in out Test) renames Test_write_byte;
--  id:2.1/8045aa83b2d391ad/write_byte/1/0/
   procedure Test_write_byte (Gnattest_T : in out Test) is
   --  temp_sensor.ads:39:4:write_byte
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_write_byte;
--  end read only


--  begin read only
   procedure Test_read_byte (Gnattest_T : in out Test);
   procedure Test_read_byte_733fac (Gnattest_T : in out Test) renames Test_read_byte;
--  id:2.1/733fac874b4a7a29/read_byte/1/0/
   procedure Test_read_byte (Gnattest_T : in out Test) is
   --  temp_sensor.ads:41:4:read_byte
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_read_byte;
--  end read only


--  begin read only
   procedure Test_wait_us (Gnattest_T : in out Test);
   procedure Test_wait_us_3bed2d (Gnattest_T : in out Test) renames Test_wait_us;
--  id:2.1/3bed2d03eea17830/wait_us/1/0/
   procedure Test_wait_us (Gnattest_T : in out Test) is
   --  temp_sensor.ads:43:4:wait_us
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_wait_us;
--  end read only

end Temp_Sensor.Test_Data.Tests;
