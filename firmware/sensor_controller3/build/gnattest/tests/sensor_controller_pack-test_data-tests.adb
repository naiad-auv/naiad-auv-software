--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Sensor_Controller_pack.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with AVR.AT90CAN128.CAN;
with Interfaces;

package body Sensor_Controller_pack.Test_Data.Tests is


--  begin read only
   procedure Test_u8Readings_To_Bytes (Gnattest_T : in out Test);
   procedure Test_u8Readings_To_Bytes_cdd481 (Gnattest_T : in out Test) renames Test_u8Readings_To_Bytes;
--  id:2.1/cdd4810a027ff56b/u8Readings_To_Bytes/1/0/
   procedure Test_u8Readings_To_Bytes (Gnattest_T : in out Test) is
   --  sensor_controller_pack.ads:31:4:u8Readings_To_Bytes
--  end read only
      use Interfaces;
      use AVR.AT90CAN128.CAN;

      pragma Unreferenced (Gnattest_T);
      i16Temp 		: Interfaces.Integer_16;
      u16Pressure 	: Interfaces.Unsigned_16;
      u8Salinity	: Interfaces.Unsigned_8;
      u8Bytes 		: Byte8;
   begin

      i16Temp := 16#07D0#;
      u16Pressure := 3 * 256 + 100;
      u8Salinity := 42;
      u8Bytes := u8Readings_To_Bytes(i16Temp, u16Pressure, u8Salinity);

      AUnit.Assertions.Assert
        ((u8Bytes(1) = Unsigned_8(16#7#)) and (u8Bytes(2) = Unsigned_8(16#D0#)),
         "u8Readings_To_Bytes failed, temperature, case 1");
      AUnit.Assertions.Assert
        ((u8Bytes(3) = Unsigned_8(3)) and (u8Bytes(4) = Unsigned_8(100)),
         "u8Readings_To_Bytes failed, pressure, case 1");
      AUnit.Assertions.Assert
        (u8Bytes(5) = Unsigned_8(42),
         "u8Readings_To_Bytes failed, salinity, case 1");

      i16Temp := 8;
      u16Pressure := 1 * 256 + 1;
      u8Salinity := 10;
      u8Bytes := u8Readings_To_Bytes(i16Temp, u16Pressure, u8Salinity);

      AUnit.Assertions.Assert
        ((u8Bytes(1) = Unsigned_8(0)) and (u8Bytes(2) = Unsigned_8(8)),
         "u8Readings_To_Bytes failed, temperature, case 2");
      AUnit.Assertions.Assert
        ((u8Bytes(3) = Unsigned_8(1)) and (u8Bytes(4) = Unsigned_8(1)),
         "u8Readings_To_Bytes failed, pressure, case 2");
      AUnit.Assertions.Assert
        (u8Bytes(5) = Unsigned_8(10),
        "u8Readings_To_Bytes failed, salinity, case 2");

      i16Temp := -8;
      u16Pressure := 2 * 256 + 29;
      u8Salinity := 11;
      u8Bytes := u8Readings_To_Bytes(i16Temp, u16Pressure, u8Salinity);

      AUnit.Assertions.Assert
        ((u8Bytes(1) = Unsigned_8(255)) and (u8Bytes(2) = Unsigned_8(2#1111_1000#)),
         "u8Readings_To_Bytes failed, temperature, case 3");
      AUnit.Assertions.Assert
        ((u8Bytes(3) = Unsigned_8(2)) and (u8Bytes(4) = Unsigned_8(29)),
         "u8Readings_To_Bytes failed, pressure, case 3");
      AUnit.Assertions.Assert
        (u8Bytes(5) = Unsigned_8(11),
         "u8Readings_To_Bytes failed, salinity, case 3");

--  begin read only
   end Test_u8Readings_To_Bytes;
--  end read only


--  begin read only
   procedure Test_Handle_Can (Gnattest_T : in out Test);
   procedure Test_Handle_Can_c26b7f (Gnattest_T : in out Test) renames Test_Handle_Can;
--  id:2.1/c26b7f8f2bd1a7ef/Handle_Can/1/0/
   procedure Test_Handle_Can (Gnattest_T : in out Test) is
   --  sensor_controller_pack.ads:37:4:Handle_Can
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Handle_Can;
--  end read only


--  begin read only
   procedure Test_Handle_Sensors (Gnattest_T : in out Test);
   procedure Test_Handle_Sensors_4cc811 (Gnattest_T : in out Test) renames Test_Handle_Sensors;
--  id:2.1/4cc811b03aa17fdb/Handle_Sensors/1/0/
   procedure Test_Handle_Sensors (Gnattest_T : in out Test) is
   --  sensor_controller_pack.ads:40:4:Handle_Sensors
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Handle_Sensors;
--  end read only


--  begin read only
   procedure Test_Init (Gnattest_T : in out Test);
   procedure Test_Init_bf9922 (Gnattest_T : in out Test) renames Test_Init;
--  id:2.1/bf992215ed679bf0/Init/1/0/
   procedure Test_Init (Gnattest_T : in out Test) is
   --  sensor_controller_pack.ads:42:4:Init
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Init;
--  end read only

end Sensor_Controller_pack.Test_Data.Tests;
