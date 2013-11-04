--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into simulator.Motion_Control_Wrapper.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body simulator.Motion_Control_Wrapper.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate_Wrap_Dispatcher (Gnattest_T : in out Test);
   procedure Test_pxCreate_Wrap_Dispatcher_0b4a1b (Gnattest_T : in out Test) renames Test_pxCreate_Wrap_Dispatcher;
--  id:2.1/0b4a1b82cb4d965a/pxCreate_Wrap_Dispatcher/1/0/
   procedure Test_pxCreate_Wrap_Dispatcher (Gnattest_T : in out Test) is
   --  simulator-motion_control_wrapper.ads:19:4:pxCreate_Wrap_Dispatcher
--  end read only

      use Navigation.Dispatcher;

      pragma Unreferenced (Gnattest_T);
      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher;

   begin
      pxWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      AUnit.Assertions.Assert(pxWrapDispatcher /= null,
                              "pxCreate_Wrap_Dispatcher failed, wrapper pointer not created");
      AUnit.Assertions.Assert(pxWrapDispatcher.pxDispatcher /= null,
                              "pxCreate_Wrap_Dispatcher failed, Dispatcher pointer not created");


--  begin read only
   end Test_pxCreate_Wrap_Dispatcher;
--  end read only



end simulator.Motion_Control_Wrapper.Test_Data.Tests;
