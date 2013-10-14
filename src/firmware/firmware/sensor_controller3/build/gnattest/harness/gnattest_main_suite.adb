--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with ADC.Test_Data.Tests.Suite;
with AVR.AT90CAN128.CAN.Test_Data.Tests.Suite;
with AVR.AT90CAN128.CLOCK.Test_Data.Tests.Suite;
with Digital_IO.Test_Data.Tests.Suite;
with Pressure_Sensor.Test_Data.Tests.Suite;
with Salinity_Sensor.Test_Data.Tests.Suite;
with Sensor_Controller_pack.Test_Data.Tests.Suite;
with Temp_Sensor.Test_Data.Tests.Suite;

package body Gnattest_Main_Suite is

   Result : aliased AUnit.Test_Suites.Test_Suite;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Result.Add_Test (ADC.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (AVR.AT90CAN128.CAN.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (AVR.AT90CAN128.CLOCK.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Digital_IO.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Pressure_Sensor.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Salinity_Sensor.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Sensor_Controller_pack.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Temp_Sensor.Test_Data.Tests.Suite.Suite);

      return Result'Access;

   end Suite;

end Gnattest_Main_Suite;
--  end read only
