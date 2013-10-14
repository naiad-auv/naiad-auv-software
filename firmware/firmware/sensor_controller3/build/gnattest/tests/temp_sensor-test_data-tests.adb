--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Temp_Sensor.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Temp_Sensor.Test_Data.Tests is


--  begin read only
   procedure Test_Init (Gnattest_T : in out Test);
   procedure Test_Init_40ca0e (Gnattest_T : in out Test) renames Test_Init;
--  id:2.1/40ca0ec478974011/Init/1/0/
   procedure Test_Init (Gnattest_T : in out Test) is
   --  temp_sensor.ads:25:4:Init
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Init;
--  end read only


--  begin read only
   procedure Test_i16Get_Temp_Int (Gnattest_T : in out Test);
   procedure Test_i16Get_Temp_Int_275b32 (Gnattest_T : in out Test) renames Test_i16Get_Temp_Int;
--  id:2.1/275b32744794e8c7/i16Get_Temp_Int/1/0/
   procedure Test_i16Get_Temp_Int (Gnattest_T : in out Test) is
   --  temp_sensor.ads:28:4:i16Get_Temp_Int
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_i16Get_Temp_Int;
--  end read only


--  begin read only
   procedure Test_i16ToStr (Gnattest_T : in out Test);
   procedure Test_i16ToStr_57e7f6 (Gnattest_T : in out Test) renames Test_i16ToStr;
--  id:2.1/57e7f629a542ea38/i16ToStr/1/0/
   procedure Test_i16ToStr (Gnattest_T : in out Test) is
   --  temp_sensor.ads:30:4:i16ToStr
--  end read only

      use Interfaces;
      pragma Unreferenced (Gnattest_T);
      str : String(1..10);
      i16Input : Interfaces.Integer_16;
   begin

      i16Input := 125*16;
      Temp_Sensor.i16ToStr(i16Input, str);
      AUnit.Assertions.Assert
        (str(1) = '1' and str(2) = '2' and str(3) = '5' and str(4) = '.' and str(5) = '0',
         str);
        -- "Incorrect i16 to str conversion of temperature, 1st case.");

      i16Input := 0;
      Temp_Sensor.i16ToStr(i16Input, str);
      AUnit.Assertions.Assert
        (str(1) = '0' and str(2) = '.' and str(3) = '0',
str);
     --    "Incorrect i16 to str conversion of temperature, 2nd case.");

      i16Input := -8; --  = -0.5*16
      Temp_Sensor.i16ToStr(i16Input, str);
      AUnit.Assertions.Assert
        (str(1) = '-' and str(2) = '0' and str(3) = '.' and str(4) = '5',
         str);
     --    "Incorrect i16 to str conversion of temperature, 3rd case.");

--  begin read only
   end Test_i16ToStr;
--  end read only


--  begin read only
   procedure Test_i16From_Bytes (Gnattest_T : in out Test);
   procedure Test_i16From_Bytes_544d1c (Gnattest_T : in out Test) renames Test_i16From_Bytes;
--  id:2.1/544d1c10bf80582f/i16From_Bytes/1/0/
   procedure Test_i16From_Bytes (Gnattest_T : in out Test) is
   --  temp_sensor.ads:34:4:i16From_Bytes
--  end read only

      use Interfaces;
      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (i16From_Bytes(0, 0) = Interfaces.Integer_16(0),
         "i16From_Bytes failed, case 1.");

      AUnit.Assertions.Assert
        (i16From_Bytes(10, 1) = Interfaces.Integer_16(266),
         "i16From_Bytes failed, case 2.");

      AUnit.Assertions.Assert
        (i16From_Bytes(248, 255) = Interfaces.Integer_16(-8),
         "i16From_Bytes failed, case 3.");

--  begin read only
   end Test_i16From_Bytes;
--  end read only


--  begin read only
   procedure Test_bReset_Pulse (Gnattest_T : in out Test);
   procedure Test_bReset_Pulse_434632 (Gnattest_T : in out Test) renames Test_bReset_Pulse;
--  id:2.1/4346324808f9f7d3/bReset_Pulse/1/0/
   procedure Test_bReset_Pulse (Gnattest_T : in out Test) is
   --  temp_sensor.ads:39:4:bReset_Pulse
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_bReset_Pulse;
--  end read only


--  begin read only
   procedure Test_Write_Byte (Gnattest_T : in out Test);
   procedure Test_Write_Byte_8045aa (Gnattest_T : in out Test) renames Test_Write_Byte;
--  id:2.1/8045aa83b2d391ad/Write_Byte/1/0/
   procedure Test_Write_Byte (Gnattest_T : in out Test) is
   --  temp_sensor.ads:41:4:Write_Byte
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Write_Byte;
--  end read only


--  begin read only
   procedure Test_u8Read_Byte (Gnattest_T : in out Test);
   procedure Test_u8Read_Byte_67fda5 (Gnattest_T : in out Test) renames Test_u8Read_Byte;
--  id:2.1/67fda566818501c2/u8Read_Byte/1/0/
   procedure Test_u8Read_Byte (Gnattest_T : in out Test) is
   --  temp_sensor.ads:43:4:u8Read_Byte
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_u8Read_Byte;
--  end read only


--  begin read only
   procedure Test_Wait_Us (Gnattest_T : in out Test);
   procedure Test_Wait_Us_3bed2d (Gnattest_T : in out Test) renames Test_Wait_Us;
--  id:2.1/3bed2d03eea17830/Wait_Us/1/0/
   procedure Test_Wait_Us (Gnattest_T : in out Test) is
   --  temp_sensor.ads:45:4:Wait_Us
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Wait_Us;
--  end read only

end Temp_Sensor.Test_Data.Tests;
