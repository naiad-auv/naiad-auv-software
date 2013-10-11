--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Temp_Sensor.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Temp_Sensor.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_i16Get_Temp_Int_275b32 : aliased Runner_1.Test_Case;
   Case_2_1_Test_i16ToStr_64400a : aliased Runner_1.Test_Case;
   Case_3_1_Test_i16From_Bytes_544d1c : aliased Runner_1.Test_Case;
   Case_4_1_Test_bReset_Pulse_434632 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Write_Byte_8045aa : aliased Runner_1.Test_Case;
   Case_6_1_Test_u8Read_Byte_67fda5 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Wait_Us_3bed2d : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_i16Get_Temp_Int_275b32,
         "temp_sensor.ads:27:4:",
         Test_i16Get_Temp_Int_275b32'Access);
      Runner_1.Create
        (Case_2_1_Test_i16ToStr_64400a,
         "temp_sensor.ads:29:4:",
         Test_i16ToStr_64400a'Access);
      Runner_1.Create
        (Case_3_1_Test_i16From_Bytes_544d1c,
         "temp_sensor.ads:39:4:",
         Test_i16From_Bytes_544d1c'Access);
      Runner_1.Create
        (Case_4_1_Test_bReset_Pulse_434632,
         "temp_sensor.ads:44:4:",
         Test_bReset_Pulse_434632'Access);
      Runner_1.Create
        (Case_5_1_Test_Write_Byte_8045aa,
         "temp_sensor.ads:46:4:",
         Test_Write_Byte_8045aa'Access);
      Runner_1.Create
        (Case_6_1_Test_u8Read_Byte_67fda5,
         "temp_sensor.ads:48:4:",
         Test_u8Read_Byte_67fda5'Access);
      Runner_1.Create
        (Case_7_1_Test_Wait_Us_3bed2d,
         "temp_sensor.ads:50:4:",
         Test_Wait_Us_3bed2d'Access);

      Result.Add_Test (Case_1_1_Test_i16Get_Temp_Int_275b32'Access);
      Result.Add_Test (Case_2_1_Test_i16ToStr_64400a'Access);
      Result.Add_Test (Case_3_1_Test_i16From_Bytes_544d1c'Access);
      Result.Add_Test (Case_4_1_Test_bReset_Pulse_434632'Access);
      Result.Add_Test (Case_5_1_Test_Write_Byte_8045aa'Access);
      Result.Add_Test (Case_6_1_Test_u8Read_Byte_67fda5'Access);
      Result.Add_Test (Case_7_1_Test_Wait_Us_3bed2d'Access);

      return Result'Access;

   end Suite;

end Temp_Sensor.Test_Data.Tests.Suite;
--  end read only
