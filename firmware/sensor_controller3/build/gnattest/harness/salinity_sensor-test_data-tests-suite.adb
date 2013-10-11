--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Salinity_Sensor.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Salinity_Sensor.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Initate_Salinity_Sensor_e03f6d : aliased Runner_1.Test_Case;
   Case_2_1_Test_Get_Salinity_58ad41 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Set_Temperature_3aacef : aliased Runner_1.Test_Case;
   Case_4_1_Test_Message_Received_39abee : aliased Runner_1.Test_Case;
   Case_5_1_Test_Put_33f5c9 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Write_1a5fb8 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Get_Char_06e8ff : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Initate_Salinity_Sensor_e03f6d,
         "salinity_sensor.ads:24:4:",
         Test_Initate_Salinity_Sensor_e03f6d'Access);
      Runner_1.Create
        (Case_2_1_Test_Get_Salinity_58ad41,
         "salinity_sensor.ads:30:4:",
         Test_Get_Salinity_58ad41'Access);
      Runner_1.Create
        (Case_3_1_Test_Set_Temperature_3aacef,
         "salinity_sensor.ads:34:4:",
         Test_Set_Temperature_3aacef'Access);
      Runner_1.Create
        (Case_4_1_Test_Message_Received_39abee,
         "salinity_sensor.ads:39:4:",
         Test_Message_Received_39abee'Access);
      Runner_1.Create
        (Case_5_1_Test_Put_33f5c9,
         "salinity_sensor.ads:44:4:",
         Test_Put_33f5c9'Access);
      Runner_1.Create
        (Case_6_1_Test_Write_1a5fb8,
         "salinity_sensor.ads:53:4:",
         Test_Write_1a5fb8'Access);
      Runner_1.Create
        (Case_7_1_Test_Get_Char_06e8ff,
         "salinity_sensor.ads:62:4:",
         Test_Get_Char_06e8ff'Access);

      Result.Add_Test (Case_1_1_Test_Initate_Salinity_Sensor_e03f6d'Access);
      Result.Add_Test (Case_2_1_Test_Get_Salinity_58ad41'Access);
      Result.Add_Test (Case_3_1_Test_Set_Temperature_3aacef'Access);
      Result.Add_Test (Case_4_1_Test_Message_Received_39abee'Access);
      Result.Add_Test (Case_5_1_Test_Put_33f5c9'Access);
      Result.Add_Test (Case_6_1_Test_Write_1a5fb8'Access);
      Result.Add_Test (Case_7_1_Test_Get_Char_06e8ff'Access);

      return Result'Access;

   end Suite;

end Salinity_Sensor.Test_Data.Tests.Suite;
--  end read only
