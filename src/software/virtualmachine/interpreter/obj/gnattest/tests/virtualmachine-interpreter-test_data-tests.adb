--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into VirtualMachine.Interpreter.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body VirtualMachine.Interpreter.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_437421 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/4374219ff23b7a07/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  virtualmachine-interpreter.ads:19:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Free;
--  end read only

end VirtualMachine.Interpreter.Test_Data.Tests;
