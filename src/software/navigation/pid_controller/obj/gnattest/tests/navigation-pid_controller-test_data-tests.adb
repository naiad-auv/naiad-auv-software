--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.PID_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.PID_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_75413d (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/75413d97a11a2be6/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  navigation-pid_controller.ads:10:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);
  pxObject : pCPIDController := null;

      xPIDScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0,1.0,1.0);
   begin

      pxObject := PID_Controller.pxCreate(xPIDScalings);

      AUnit.Assertions.Assert(Condition => (pxObject /= null),
                              Message => "PID_Controller.pxCreate does not return an instance to an object");

      Navigation.PID_Controller.Free(pxObject);


      AUnit.Assertions.Assert(Condition => (pxObject = null),
                              Message => "PID_Controller.pxCreate is not null after deconstruction");

--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_23984a (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/23984a6146633bd8/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-pid_controller.ads:20:4:pxCreate
--  end read only

   pragma Unreferenced (Gnattest_T);

      pxObject : pCPIDController := null;

      xPIDScalings : Navigation.PID_Controller.TPIDComponentScalings := (1.0,1.0,1.0);
   begin

      pxObject := PID_Controller.pxCreate(xPIDScalings);

      AUnit.Assertions.Assert(Condition => (pxObject /= null),
                              Message => "PID_Controller.pxCreate does not return an instance to an object");

      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);
      null;

--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.PID_Controller.Test_Data.Tests;
