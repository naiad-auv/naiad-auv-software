--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Sensor_Controller_pack.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Sensor_Controller_pack.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_u8Readings_To_Bytes_cdd481 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Handle_Can_c26b7f : aliased Runner_1.Test_Case;
   Case_3_1_Test_Handle_Sensors_4cc811 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Init_bf9922 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_u8Readings_To_Bytes_cdd481,
         "sensor_controller_pack.ads:30:4:",
         Test_u8Readings_To_Bytes_cdd481'Access);
      Runner_1.Create
        (Case_2_1_Test_Handle_Can_c26b7f,
         "sensor_controller_pack.ads:36:4:",
         Test_Handle_Can_c26b7f'Access);
      Runner_1.Create
        (Case_3_1_Test_Handle_Sensors_4cc811,
         "sensor_controller_pack.ads:39:4:",
         Test_Handle_Sensors_4cc811'Access);
      Runner_1.Create
        (Case_4_1_Test_Init_bf9922,
         "sensor_controller_pack.ads:41:4:",
         Test_Init_bf9922'Access);

      Result.Add_Test (Case_1_1_Test_u8Readings_To_Bytes_cdd481'Access);
      Result.Add_Test (Case_2_1_Test_Handle_Can_c26b7f'Access);
      Result.Add_Test (Case_3_1_Test_Handle_Sensors_4cc811'Access);
      Result.Add_Test (Case_4_1_Test_Init_bf9922'Access);

      return Result'Access;

   end Suite;

end Sensor_Controller_pack.Test_Data.Tests.Suite;
--  end read only
