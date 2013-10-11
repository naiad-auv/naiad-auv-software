--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Valve_Generic.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Valve_Generic.Test_Data.Tests is


--  begin read only
   procedure Test_Actuate_For_Duration (Gnattest_T : in out Test);
   procedure Test_Actuate_For_Duration_cc96e0 (Gnattest_T : in out Test) renames Test_Actuate_For_Duration;
--  id:2.1/cc96e0cc040611bd/Actuate_For_Duration/1/0/
   procedure Test_Actuate_For_Duration (Gnattest_T : in out Test) is
   --  valve_generic.ads:11:4:Actuate_For_Duration
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Actuate_For_Duration;
--  end read only


--  begin read only
   procedure Test_Actuate (Gnattest_T : in out Test);
   procedure Test_Actuate_0892f0 (Gnattest_T : in out Test) renames Test_Actuate;
--  id:2.1/0892f0a232fa9855/Actuate/1/0/
   procedure Test_Actuate (Gnattest_T : in out Test) is
   --  valve_generic.ads:12:4:Actuate
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Actuate;
--  end read only

end Valve_Generic.Test_Data.Tests;
