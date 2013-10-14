--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Pressure_Sensor.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Pressure_Sensor.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Init_40ca0e : aliased Runner_1.Test_Case;
   Case_2_1_Test_u16GetPressure_a48520 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Init_40ca0e,
         "pressure_sensor.ads:21:4:",
         Test_Init_40ca0e'Access);
      Runner_1.Create
        (Case_2_1_Test_u16GetPressure_a48520,
         "pressure_sensor.ads:23:4:",
         Test_u16GetPressure_a48520'Access);

      Result.Add_Test (Case_1_1_Test_Init_40ca0e'Access);
      Result.Add_Test (Case_2_1_Test_u16GetPressure_a48520'Access);

      return Result'Access;

   end Suite;

end Pressure_Sensor.Test_Data.Tests.Suite;
--  end read only
