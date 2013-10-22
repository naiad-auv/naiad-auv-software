--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into simulator.Motion_Control_Wrapper.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with ada.Text_IO; use ada.Text_IO;

package body simulator.Motion_Control_Wrapper.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate_Wrap_Dispatcher (Gnattest_T : in out Test);
   procedure Test_pxCreate_Wrap_Dispatcher_0b4a1b (Gnattest_T : in out Test) renames Test_pxCreate_Wrap_Dispatcher;
--  id:2.1/0b4a1b82cb4d965a/pxCreate_Wrap_Dispatcher/1/0/
   procedure Test_pxCreate_Wrap_Dispatcher (Gnattest_T : in out Test) is
   --  simulator-motion_control_wrapper.ads:13:4:pxCreate_Wrap_Dispatcher
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


--  begin read only
   procedure Test_Update_Values (Gnattest_T : in out Test);
   procedure Test_Update_Values_2c215f (Gnattest_T : in out Test) renames Test_Update_Values;
--  id:2.1/2c215feac4ad1ecd/Update_Values/1/0/
   procedure Test_Update_Values (Gnattest_T : in out Test) is
      use math.Matrices;
   --  simulator-motion_control_wrapper.ads:15:4:Update_Values
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher;
      tMotors : submarine.TMotorForce;

   begin
      pxWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      pxWrapDispatcher.Update_Wanted_Position(pxWantedPosition => math.Vectors.pxCreate(1.0,2.1,0.7),pxWantedOrientation => math.Matrices.pxCreate_Rotation_Around_X_Axis(15.7)*math.Matrices.pxCreate_Rotation_Around_Y_Axis(13.7));

      pxWrapDispatcher.Update_Values(pxNewCurrentAbsolutePosition => math.Vectors.pxCreate(1.0,2.1,0.7),
                                     pxNewCurrentOrientation      => math.Matrices.pxCreate_Rotation_Around_X_Axis(13.6),
                                     tfMotorValuesSubmarine       => tMotors,
                                     fDeltaTime                   => 0.01);


--  begin read only
   end Test_Update_Values;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Position (Gnattest_T : in out Test);
   procedure Test_Update_Wanted_Position_270ca9 (Gnattest_T : in out Test) renames Test_Update_Wanted_Position;
--  id:2.1/270ca9f6d516c1cb/Update_Wanted_Position/1/0/
   procedure Test_Update_Wanted_Position (Gnattest_T : in out Test) is
   --  simulator-motion_control_wrapper.ads:21:4:Update_Wanted_Position
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher;
   begin
      pxWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      pxWrapDispatcher.Update_Wanted_Position(pxWantedPosition => math.Vectors.pxCreate(1.0,2.1,0.7),pxWantedOrientation => math.Matrices.pxCreate_Rotation_Around_X_Axis(15.7));

--  begin read only
   end Test_Update_Wanted_Position;
--  end read only



end simulator.Motion_Control_Wrapper.Test_Data.Tests;
