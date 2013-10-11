--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Salinity_Sensor.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Salinity_Sensor.Test_Data.Tests is


--  begin read only
   procedure Test_Initate_Salinity_Sensor (Gnattest_T : in out Test);
   procedure Test_Initate_Salinity_Sensor_e03f6d (Gnattest_T : in out Test) renames Test_Initate_Salinity_Sensor;
--  id:2.1/e03f6da09dcbe566/Initate_Salinity_Sensor/1/0/
   procedure Test_Initate_Salinity_Sensor (Gnattest_T : in out Test) is
   --  salinity_sensor.ads:26:4:Initate_Salinity_Sensor
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Initate_Salinity_Sensor;
--  end read only


--  begin read only
   procedure Test_Get_Salinity (Gnattest_T : in out Test);
   procedure Test_Get_Salinity_58ad41 (Gnattest_T : in out Test) renames Test_Get_Salinity;
--  id:2.1/58ad41648ec64de3/Get_Salinity/1/0/
   procedure Test_Get_Salinity (Gnattest_T : in out Test) is
   --  salinity_sensor.ads:32:4:Get_Salinity
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Get_Salinity = 254, --254 is the value given if no measurement has been done
         "Get_Salinity gave incorrect value.");

--  begin read only
   end Test_Get_Salinity;
--  end read only


--  begin read only
   procedure Test_Set_Temperature (Gnattest_T : in out Test);
   procedure Test_Set_Temperature_3aacef (Gnattest_T : in out Test) renames Test_Set_Temperature;
--  id:2.1/3aacef9e0f828b05/Set_Temperature/1/0/
   procedure Test_Set_Temperature (Gnattest_T : in out Test) is
   --  salinity_sensor.ads:36:4:Set_Temperature
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Set_Temperature;
--  end read only


--  begin read only
   procedure Test_Put (Gnattest_T : in out Test);
   procedure Test_Put_33f5c9 (Gnattest_T : in out Test) renames Test_Put;
--  id:2.1/33f5c9e6deb822d0/Put/1/0/
   procedure Test_Put (Gnattest_T : in out Test) is
   --  salinity_sensor.ads:44:4:Put
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Put;
--  end read only


--  begin read only
   procedure Test_Write (Gnattest_T : in out Test);
   procedure Test_Write_1a5fb8 (Gnattest_T : in out Test) renames Test_Write;
--  id:2.1/1a5fb87a1fbe395d/Write/1/0/
   procedure Test_Write (Gnattest_T : in out Test) is
   --  salinity_sensor.ads:53:4:Write
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Write;
--  end read only


--  begin read only
   procedure Test_Get_Char (Gnattest_T : in out Test);
   procedure Test_Get_Char_06e8ff (Gnattest_T : in out Test) renames Test_Get_Char;
--  id:2.1/06e8ffde561c0d78/Get_Char/1/0/
   procedure Test_Get_Char (Gnattest_T : in out Test) is
   --  salinity_sensor.ads:62:4:Get_Char
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Char;
--  end read only


--  begin read only
   procedure Test_Message_Received (Gnattest_T : in out Test);
   procedure Test_Message_Received_39abee (Gnattest_T : in out Test) renames Test_Message_Received;
--  id:2.1/39abeefca2cc9fbb/Message_Received/1/0/
   procedure Test_Message_Received (Gnattest_T : in out Test) is
   --  salinity_sensor.ads:65:4:Message_Received
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Message_Received;
--  end read only

end Salinity_Sensor.Test_Data.Tests;
