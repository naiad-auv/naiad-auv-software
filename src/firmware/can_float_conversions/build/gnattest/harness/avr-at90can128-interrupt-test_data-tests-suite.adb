--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body AVR.AT90CAN128.INTERRUPT.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.AVR.AT90CAN128.INTERRUPT.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_enableInterrupt_fa4acb : aliased Runner_1.Test_Case;
   Case_2_1_Test_disableInterrupt_4d752d : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_enableInterrupt_fa4acb,
         "avr-at90can128-interrupt.ads:4:4:",
         Test_enableInterrupt_fa4acb'Access);
      Runner_1.Create
        (Case_2_1_Test_disableInterrupt_4d752d,
         "avr-at90can128-interrupt.ads:6:4:",
         Test_disableInterrupt_4d752d'Access);

      Result.Add_Test (Case_1_1_Test_enableInterrupt_fa4acb'Access);
      Result.Add_Test (Case_2_1_Test_disableInterrupt_4d752d'Access);

      return Result'Access;

   end Suite;

end AVR.AT90CAN128.INTERRUPT.Test_Data.Tests.Suite;
--  end read only
