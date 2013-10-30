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

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

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

   begin

      pxObject := PID_Controller.pxCreate;

      AUnit.Assertions.Assert(Condition => (pxObject /= null),
                              Message => "PID_Controller.pxCreate does not return an instance to an object");

      Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);
      null;

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   --  procedure Test_pxCreate (Gnattest_T : in out Test);
   --  procedure Test_pxCreate_b51f41 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/b51f41e7835014fc/pxCreate/0/1/
   --  procedure Test_pxCreate (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxObject : pCPIDController := null;
--  
--     begin
--  
--        pxObject := PID_Controller.pxCreate(xPIDComponentScalings => Navigation.PID_Controller.TPIDComponentScalings'(1.0,2.0,3.0));
--  
--        AUnit.Assertions.Assert(Condition => (pxObject /= null),
--                                Message => "PID_Controller.pxCreate does not return an instance to an object");
--  
--  
--        AUnit.Assertions.Assert(Condition => pxObject.fGetProportionalScale = 1.0,
--                                Message   => "proportional scale is incorrect after construction");
--        AUnit.Assertions.Assert(Condition => pxObject.fGetIntergralScale = 2.0,
--                                Message   => "integral scale is incorrect after construction");
--        AUnit.Assertions.Assert(Condition => pxObject.fGetDerivativeScale = 3.0,
--                                Message   => "derivative scale is incorrect after construction");
--        Navigation.PID_Controller.Free(pxPIDControllerToDeallocate => pxObject);
--  
--  begin read only
   --  end Test_pxCreate;
--  end read only

end Navigation.PID_Controller.Test_Data.Tests;
