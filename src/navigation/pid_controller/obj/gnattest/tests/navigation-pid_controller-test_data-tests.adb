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


   procedure Test_pxCreate_With_Scalings (Gnattest_T : in out Test) is
      pragma Unreferenced(Gnattest_T);
      pxObject : pCPID_Controller := null;
   begin
      pxObject := PID_Controller.pxCreate(PID_Controller.TPIDComponentScalings'(1.0,2.0,3.0));

      AUnit.Assertions.Assert(Condition => abs(pxObject.fDerivativeScale - 1.0) < 0.0001,
                              Message => "Derivative scale set incorrectly in constructor");
      AUnit.Assertions.Assert(Condition => abs(pxObject.fIntegralScale - 2.0) < 0.0001,
                              Message => "Integral scale set incorrectly in constructor");
      AUnit.Assertions.Assert(Condition => abs(pxObject.fProportionalScale - 3.0) < 0.0001,
                              Message => "Proportional scale set incorrectly in constructor");

   end Test_pxCreate_With_Scalings;


end Navigation.PID_Controller.Test_Data.Tests;
