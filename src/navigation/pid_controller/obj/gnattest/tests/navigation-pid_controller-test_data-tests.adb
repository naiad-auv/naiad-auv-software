--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.PID_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System; use System;

package body Navigation.PID_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_582cf8 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/582cf80046f02586/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-pid_controller.ads:10:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxObject : pCPID_Controller := null;

   begin

      pxObject := PID_Controller.pxCreate;

      AUnit.Assertions.Assert(Condition => (pxObject /= null),
                              Message => "PID_Controller.pxCreate does not return an instance to an object");

      null;

--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.PID_Controller.Test_Data.Tests;
