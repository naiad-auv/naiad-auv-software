--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into AVR.AT90CAN128.INTERRUPT.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body AVR.AT90CAN128.INTERRUPT.Test_Data.Tests is


--  begin read only
   procedure Test_enableInterrupt (Gnattest_T : in out Test);
   procedure Test_enableInterrupt_fa4acb (Gnattest_T : in out Test) renames Test_enableInterrupt;
--  id:2.1/fa4acbb9a8cd2e19/enableInterrupt/1/0/
   procedure Test_enableInterrupt (Gnattest_T : in out Test) is
   --  avr-at90can128-interrupt.ads:4:4:enableInterrupt
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_enableInterrupt;
--  end read only


--  begin read only
   procedure Test_disableInterrupt (Gnattest_T : in out Test);
   procedure Test_disableInterrupt_4d752d (Gnattest_T : in out Test) renames Test_disableInterrupt;
--  id:2.1/4d752dfee12df080/disableInterrupt/1/0/
   procedure Test_disableInterrupt (Gnattest_T : in out Test) is
   --  avr-at90can128-interrupt.ads:6:4:disableInterrupt
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_disableInterrupt;
--  end read only

end AVR.AT90CAN128.INTERRUPT.Test_Data.Tests;
