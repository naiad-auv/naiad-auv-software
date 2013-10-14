--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into AVR.AT90CAN128.CALENDAR.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body AVR.AT90CAN128.CALENDAR.Test_Data.Tests is


--  begin read only
   procedure Test_Clock (Gnattest_T : in out Test);
   procedure Test_Clock_4df497 (Gnattest_T : in out Test) renames Test_Clock;
--  id:2.1/4df497c0b2e89774/Clock/1/0/
   procedure Test_Clock (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:8:4:Clock
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Clock;
--  end read only


--  begin read only
   procedure Test_1_Plus (Gnattest_T : in out Test);
   procedure Test_Plus_9d85b3 (Gnattest_T : in out Test) renames Test_1_Plus;
--  id:2.1/9d85b35d5a3d01d8/Plus/1/0/
   procedure Test_1_Plus (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:10:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_Plus;
--  end read only


--  begin read only
   procedure Test_2_Plus (Gnattest_T : in out Test);
   procedure Test_Plus_97af1f (Gnattest_T : in out Test) renames Test_2_Plus;
--  id:2.1/97af1feea32f41b2/Plus/0/0/
   procedure Test_2_Plus (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:15:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_Plus;
--  end read only


--  begin read only
   procedure Test_1_Minus (Gnattest_T : in out Test);
   procedure Test_Minus_991b1b (Gnattest_T : in out Test) renames Test_1_Minus;
--  id:2.1/991b1b310c196c3d/Minus/1/0/
   procedure Test_1_Minus (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:20:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_Minus;
--  end read only


--  begin read only
   procedure Test_2_Minus (Gnattest_T : in out Test);
   procedure Test_Minus_5e3f7b (Gnattest_T : in out Test) renames Test_2_Minus;
--  id:2.1/5e3f7bd67d2192ae/Minus/0/0/
   procedure Test_2_Minus (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:25:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_Minus;
--  end read only


--  begin read only
   procedure Test_Less_Than (Gnattest_T : in out Test);
   procedure Test_Less_Than_a830ad (Gnattest_T : in out Test) renames Test_Less_Than;
--  id:2.1/a830adb816e23081/Less_Than/1/0/
   procedure Test_Less_Than (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:30:4:"<"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Less_Than;
--  end read only


--  begin read only
   procedure Test_Less_Than_Or_Equal (Gnattest_T : in out Test);
   procedure Test_Less_Than_Or_Equal_fda296 (Gnattest_T : in out Test) renames Test_Less_Than_Or_Equal;
--  id:2.1/fda296fd8eca1c18/Less_Than_Or_Equal/1/0/
   procedure Test_Less_Than_Or_Equal (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:34:4:"<="
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Less_Than_Or_Equal;
--  end read only


--  begin read only
   procedure Test_Greater_Than (Gnattest_T : in out Test);
   procedure Test_Greater_Than_782ae9 (Gnattest_T : in out Test) renames Test_Greater_Than;
--  id:2.1/782ae987a5c454df/Greater_Than/1/0/
   procedure Test_Greater_Than (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:38:4:">"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Greater_Than;
--  end read only


--  begin read only
   procedure Test_Greater_Than_Or_Equal (Gnattest_T : in out Test);
   procedure Test_Greater_Than_Or_Equal_1f6514 (Gnattest_T : in out Test) renames Test_Greater_Than_Or_Equal;
--  id:2.1/1f6514117acaa48e/Greater_Than_Or_Equal/1/0/
   procedure Test_Greater_Than_Or_Equal (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:42:4:">="
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Greater_Than_Or_Equal;
--  end read only


--  begin read only
   procedure Test_Delay_ms (Gnattest_T : in out Test);
   procedure Test_Delay_ms_bb00d9 (Gnattest_T : in out Test) renames Test_Delay_ms;
--  id:2.1/bb00d922a2da4f92/Delay_ms/1/0/
   procedure Test_Delay_ms (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:46:4:Delay_ms
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Delay_ms;
--  end read only


--  begin read only
   procedure Test_Delay_Until (Gnattest_T : in out Test);
   procedure Test_Delay_Until_bbd367 (Gnattest_T : in out Test) renames Test_Delay_Until;
--  id:2.1/bbd367a7f05a604c/Delay_Until/1/0/
   procedure Test_Delay_Until (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:49:4:Delay_Until
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Delay_Until;
--  end read only


--  begin read only
   procedure Test_Init (Gnattest_T : in out Test);
   procedure Test_Init_bf9922 (Gnattest_T : in out Test) renames Test_Init;
--  id:2.1/bf992215ed679bf0/Init/1/0/
   procedure Test_Init (Gnattest_T : in out Test) is
   --  avr-at90can128-calendar.ads:52:4:Init
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Init;
--  end read only

end AVR.AT90CAN128.CALENDAR.Test_Data.Tests;
