--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Dispatcher.CDispatcher_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests is


--  begin read only
   procedure Test_tfGet_Thruster_Values (Gnattest_T : in out Test_CDispatcher);
   procedure Test_tfGet_Thruster_Values_503b8a (Gnattest_T : in out Test_CDispatcher) renames Test_tfGet_Thruster_Values;
--  id:2.1/503b8a91c50e9201/tfGet_Thruster_Values/1/0/
   procedure Test_tfGet_Thruster_Values (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:18:4:tfGet_Thruster_Values
--  end read only

      pragma Unreferenced (Gnattest_T);
      
      use Navigation.Thrusters;
      
      pxDispatcher : pCDispatcher;
      tfThrusterValues : Navigation.Thrusters.TThrusterValuesArray(1 .. 6);
      tfZeroValues : Navigation.Thrusters.TThrusterValuesArray(1 .. 6) := (others => 0.0);
      bLol : boolean := false;
   begin

      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxDispatcher.Update_Current_Absolute_Position(pxNewCurrentAbsolutePosition => Math.Vectors.pxCreate(fX => 4.0,
                                                                                                         fY => 2.0,
                                                                                                         fZ => -6.0));
      pxDispatcher.Update_Wanted_Absolute_Position(pxNewWantedAbsolutePosition => Math.Vectors.pxCreate(fX => -3.0,
                                                                                                       fY => 6.0,
                                                                                                       fZ => 2.0));
      pxDispatcher.Update_Current_Absolute_Orientation(pxNewCurrentAbsoluteOrientation => Math.Matrices.pxCreate_Rotation_Around_X_Axis(tfAngleInDegrees => Math.Angles.TAngle(45.0)));
      pxDispatcher.Update_Wanted_Absolute_Orientation(pxNewWantedAbsoluteOrientation => Math.Matrices.pxCreate_Rotation_Around_Y_Axis(tfAngleInDegrees => Math.Angles.TAngle(45.0)));
      
      pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.AllComponents,
                                                  xNewPIDSCalings    => Navigation.PID_Controller.TPIDComponentScalings'(fProportionalScale => 1.0, fIntegralScale => 1.0, fDerivativeScale => 1.0));
      tfThrusterValues := pxDispatcher.tfGet_Thruster_Values(fDeltaTime => 1000.0);
      
      for i in tfZeroValues'Range
      loop
         if abs(tfThrusterValues(i)) > 0.0001 then
            bLol := true;
            exit;
         end if;         
      end loop;
            
      AUnit.Assertions.Assert        (Condition => bLol,
                                      Message => "CDispatcher.tfGet_Thruster_Values failed, no values assigned.");

--  begin read only
   end Test_tfGet_Thruster_Values;
--  end read only


--  begin read only
   procedure Test_Set_New_Component_PID_Scalings (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Set_New_Component_PID_Scalings_444661 (Gnattest_T : in out Test_CDispatcher) renames Test_Set_New_Component_PID_Scalings;
--  id:2.1/44466181038eca33/Set_New_Component_PID_Scalings/1/0/
   procedure Test_Set_New_Component_PID_Scalings (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:21:4:Set_New_Component_PID_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert        (Condition => True,
                                      Message => "TODO: Needs mocking");
      

      -- TODO: MOCK
        

--  begin read only
   end Test_Set_New_Component_PID_Scalings;
--  end read only


--  begin read only
   procedure Test_Update_Current_Absolute_Position (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Update_Current_Absolute_Position_32eb63 (Gnattest_T : in out Test_CDispatcher) renames Test_Update_Current_Absolute_Position;
--  id:2.1/32eb630e3d453a49/Update_Current_Absolute_Position/1/0/
   procedure Test_Update_Current_Absolute_Position (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:23:4:Update_Current_Absolute_Position
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      use Math.Vectors;
      
      pxPosition : Math.Vectors.pCVector;
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxPosition := Math.Vectors.pxCreate(fX => 1.4,
                                          fY => 7.4,
                                          fZ => 2.3);
      pxDispatcher.Update_Current_Absolute_Position(pxNewCurrentAbsolutePosition => pxPosition);

      AUnit.Assertions.Assert        (Condition => pxPosition.all'Address /= pxDispatcher.pxCurrentAbsolutePosition.all'Address,
                                      Message => "CDispatcher.Update_Current_Absolute_Position failed, addresses the same.");
      AUnit.Assertions.Assert        (Condition => pxPosition = pxDispatcher.pxCurrentAbsolutePosition,
                                      Message => "CDispatcher.Update_Current_Absolute_Position failed, vectors have different values.");
--  begin read only
   end Test_Update_Current_Absolute_Position;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Absolute_Position (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Update_Wanted_Absolute_Position_9393d4 (Gnattest_T : in out Test_CDispatcher) renames Test_Update_Wanted_Absolute_Position;
--  id:2.1/9393d44db18ed734/Update_Wanted_Absolute_Position/1/0/
   procedure Test_Update_Wanted_Absolute_Position (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:24:4:Update_Wanted_Absolute_Position
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      use Math.Vectors;
      
      pxPosition : Math.Vectors.pCVector;
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxPosition := Math.Vectors.pxCreate(fX => 1.4,
                                          fY => 7.4,
                                          fZ => 2.3);
      pxDispatcher.Update_Wanted_Absolute_Position(pxNewWantedAbsolutePosition => pxPosition);

      AUnit.Assertions.Assert        (Condition => pxPosition.all'Address /= pxDispatcher.pxWantedAbsolutePosition.all'Address,
                                      Message => "CDispatcher.Update_Wanted_Absolute_Position failed, addresses the same.");
      AUnit.Assertions.Assert        (Condition => pxPosition = pxDispatcher.pxWantedAbsolutePosition,
                                      Message => "CDispatcher.Update_Wanted_Absolute_Position failed, vectors have different values.");

--  begin read only
   end Test_Update_Wanted_Absolute_Position;
--  end read only


--  begin read only
   procedure Test_Update_Current_Absolute_Orientation (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Update_Current_Absolute_Orientation_80028a (Gnattest_T : in out Test_CDispatcher) renames Test_Update_Current_Absolute_Orientation;
--  id:2.1/80028ab6f920f9d9/Update_Current_Absolute_Orientation/1/0/
   procedure Test_Update_Current_Absolute_Orientation (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:26:4:Update_Current_Absolute_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      use Math.Matrices;
      
      pxOrientation : Math.Matrices.pCMatrix;
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxOrientation := Math.Matrices.pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(45.0));
      
      pxDispatcher.Update_Current_Absolute_Orientation(pxNewCurrentAbsoluteOrientation => pxOrientation);

      AUnit.Assertions.Assert        (Condition => pxOrientation.all'Address /= pxDispatcher.pxCurrentAbsoluteOrientation.all'Address,
                                      Message => "CDispatcher.Update_Current_Absolute_Orientation failed, addresses the same.");
      AUnit.Assertions.Assert        (Condition => pxOrientation = pxDispatcher.pxCurrentAbsoluteOrientation,
                                      Message => "CDispatcher.Update_Current_Absolute_Orientation failed, matrices have different values.");

--  begin read only
   end Test_Update_Current_Absolute_Orientation;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Absolute_Orientation (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Update_Wanted_Absolute_Orientation_69507e (Gnattest_T : in out Test_CDispatcher) renames Test_Update_Wanted_Absolute_Orientation;
--  id:2.1/69507ee66e5d9e7a/Update_Wanted_Absolute_Orientation/1/0/
   procedure Test_Update_Wanted_Absolute_Orientation (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:27:4:Update_Wanted_Absolute_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      use Math.Matrices;
      
      pxOrientation : Math.Matrices.pCMatrix;
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxOrientation := Math.Matrices.pxCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(45.0));
      
      pxDispatcher.Update_Wanted_Absolute_Orientation(pxNewWantedAbsoluteOrientation => pxOrientation);

      AUnit.Assertions.Assert        (Condition => pxOrientation.all'Address /= pxDispatcher.pxWantedAbsoluteOrientation.all'Address,
                                      Message => "CDispatcher.Update_Wanted_Absolute_Orientation failed, addresses the same.");
      AUnit.Assertions.Assert        (Condition => pxOrientation = pxDispatcher.pxWantedAbsoluteOrientation,
                                      Message => "CDispatcher.Update_Wanted_Absolute_Orientation failed, matrices have different values.");


--  begin read only
   end Test_Update_Wanted_Absolute_Orientation;
--  end read only


end Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests;
