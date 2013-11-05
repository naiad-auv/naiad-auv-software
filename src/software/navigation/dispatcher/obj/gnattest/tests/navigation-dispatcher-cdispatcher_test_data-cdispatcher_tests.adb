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
   procedure Test_tfGet_Thruster_Values_dcfce3 (Gnattest_T : in out Test_CDispatcher) renames Test_tfGet_Thruster_Values;
--  id:2.1/dcfce3c0d7daa49a/tfGet_Thruster_Values/1/0/
   procedure Test_tfGet_Thruster_Values (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:26:4:tfGet_Thruster_Values
--  end read only

      pragma Unreferenced (Gnattest_T);
      
      use Navigation.Thrusters;
      
      pxDispatcher : pCDispatcher;
      pxVector : Math.Vectors.pCVector;
      tfThrusterValues : Navigation.Thrusters.TThrusterValuesArray;
      tfZeroValues : Navigation.Thrusters.TThrusterValuesArray := (others => 0.0);
      bLol : boolean := false;
   begin

      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxVector := Math.Vectors.xCreate(fX => 10.0,
                                        fY => 0.0,
                                        fZ => 0.0).pxGet_Allocated_Copy;
      pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => pxVector.all);
      Math.Vectors.Free(pxVectorToDeallocate => pxVector);

      
      pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.AllComponents,
                                                  xNewPIDSCalings    => Navigation.PID_Controller.TPIDComponentScalings'(fProportionalScale => 1.0, fIntegralScale => 1.0, fDerivativeScale => 1.0));
      tfThrusterValues := pxDispatcher.tfGet_Thruster_Values(fDeltaTime => 0.25);
      

      AUnit.Assertions.Assert        (Condition => tfThrusterValues(1) < 0.0,
                                      Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 1. Value: " & float'Image(tfThrusterValues(1)) & ". Expected: > 0.0.");
      AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(2)) = 0.0,
                                      Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 2. Value: " & float'Image(tfThrusterValues(2)) & ". Expected: 0.0.");
      AUnit.Assertions.Assert        (Condition => tfThrusterValues(3) > 0.0,
                                      Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 3. Value: " & float'Image(tfThrusterValues(3)) & ". Expected: > 0.0.");
      AUnit.Assertions.Assert        (Condition => tfThrusterValues(1) = -tfThrusterValues(3),
                                      Message => "CDispatcher.tfGet_Thruster_Values failed, thruster 1 and 3 not opposite");
      AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(4)) = 0.0,
                                      Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 4. Value: " & float'Image(tfThrusterValues(4)) & ". Expected: 0.0.");
      AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(5)) = 0.0,
                                      Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 5. Value: " & float'Image(tfThrusterValues(5)) & ". Expected: 0.0.");
      AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(6)) = 0.0,
                                      Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 6. Value: " & float'Image(tfThrusterValues(6)) & ". Expected: 0.0.");

--        Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);
--        
--        pxDispatcher := Navigation.Dispatcher.pxCreate;
--        pxVector := Math.Vectors.pxCreate(fX => 0.0,
--                                          fY => 10.0,
--                                          fZ => 0.0);
--        pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => pxVector.all);
--        Math.Vectors.Free(pxVectorToDeallocate => pxVector);
--  
--        pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.AllComponents,
--                                                    xNewPIDSCalings    => Navigation.PID_Controller.TPIDComponentScalings'(fProportionalScale => 1.0, fIntegralScale => 1.0, fDerivativeScale => 1.0));
--        tfThrusterValues := pxDispatcher.tfGet_Thruster_Values(fDeltaTime => 0.25);
--        
--  
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(1) = tfThrusterValues(3),
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, thruster 1 and 3 not equal.");
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(1) > 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 1 and 3. Value: " & float'Image(tfThrusterValues(1)) & ". Expected: > 0.0.");
--        AUnit.Assertions.Assert        (Condition => -tfThrusterValues(2) = tfThrusterValues(1) + tfThrusterValues(3),
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 2. Value: " & float'Image(tfThrusterValues(2)) & ". Expected: " & float'Image(tfThrusterValues(1) + tfThrusterValues(3)));
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(4)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 4. Value: " & float'Image(tfThrusterValues(3)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(5)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 5. Value: " & float'Image(tfThrusterValues(5)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(6)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 6. Value: " & float'Image(tfThrusterValues(6)) & ". Expected: 0.0.");
--  
--        Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);      
--        
--        pxDispatcher := Navigation.Dispatcher.pxCreate;
--        pxVector := Math.Vectors.pxCreate(fX => 0.0,
--                                          fY => 0.0,
--                                          fZ => 10.0);
--        pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => pxVector.all);
--        Math.Vectors.Free(pxVectorToDeallocate => pxVector);
--  
--        pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.AllComponents,
--                                                    xNewPIDSCalings    => Navigation.PID_Controller.TPIDComponentScalings'(fProportionalScale => 1.0, fIntegralScale => 1.0, fDerivativeScale => 1.0));
--        tfThrusterValues := pxDispatcher.tfGet_Thruster_Values(fDeltaTime => 0.25);
--        
--  
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(1)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 1. Value: " & float'Image(tfThrusterValues(1)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(2)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 2. Value: " & float'Image(tfThrusterValues(2)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(3)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 3. Value: " & float'Image(tfThrusterValues(3)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(4) - tfThrusterValues(5)) < 0.00001,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, thruster 4 and 5 not equal. 4: " & float'Image(tfThrusterValues(4)-tfThrusterValues(5)) & " 5: " & float'image(tfThrusterValues(5)));
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(4) > 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 4 and 6. Value: " & float'Image(tfThrusterValues(1)) & ". Expected: > 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(5) - tfThrusterValues(6)) < 0.00001,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, thruster 5 and 6 not equal.");
--  
--        Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);          
--   
--        pxDispatcher := Navigation.Dispatcher.pxCreate;
--  
--  
--        pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => Math.Matrices.xCreate_Rotation_Around_X_Axis(tfAngleInDegrees => Math.Angles.TAngle(45.0)));
--        
--        pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.AllComponents,
--                                                    xNewPIDSCalings    => Navigation.PID_Controller.TPIDComponentScalings'(fProportionalScale => 1.0, fIntegralScale => 1.0, fDerivativeScale => 1.0));
--        tfThrusterValues := pxDispatcher.tfGet_Thruster_Values(fDeltaTime => 0.25);
--        
--  
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(4) > 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 4. Value: " & float'Image(tfThrusterValues(4)) & ". Expected: > 0.0.");
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(4) = -tfThrusterValues(6),
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, 4 not opposite of 6. Value: " & float'Image(-tfThrusterValues(6)) & ". Expected: " & float'Image(-tfThrusterValues(6)));
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(6) < 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 6. Value: " & float'Image(tfThrusterValues(6)) & ". Expected: < 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(1)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 1. Value: " & float'Image(tfThrusterValues(1)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(2)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 2. Value: " & float'Image(tfThrusterValues(2)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(3)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 3. Value: " & float'Image(tfThrusterValues(3)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(5)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 5. Value: " & float'Image(tfThrusterValues(5)) & ". Expected: 0.0.");
--  
--        Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);
--        pxDispatcher := Navigation.Dispatcher.pxCreate;
--        
--        pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => Math.Matrices.xCreate_Rotation_Around_Y_Axis(tfAngleInDegrees => Math.Angles.TAngle(45.0)));
--        
--        pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.AllComponents,
--                                                    xNewPIDSCalings    => Navigation.PID_Controller.TPIDComponentScalings'(fProportionalScale => 1.0, fIntegralScale => 1.0, fDerivativeScale => 1.0));
--        tfThrusterValues := pxDispatcher.tfGet_Thruster_Values(fDeltaTime => 0.25);
--        
--  
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(4) < 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 4. Value: " & float'Image(tfThrusterValues(4)) & ". Expected: < 0.0.");
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(4) = tfThrusterValues(6),
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, 4 not equal to 6. Value: " & float'Image(tfThrusterValues(6)) & ". Expected: " & float'Image(tfThrusterValues(4)));
--        AUnit.Assertions.Assert        (Condition => -tfThrusterValues(5) = tfThrusterValues(4) + tfThrusterValues(6) ,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 5. Value: " & float'Image(tfThrusterValues(5)) & ". Expected: " & float'Image(tfThrusterValues(4) + tfThrusterValues(6)));
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(1)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 1. Value: " & float'Image(tfThrusterValues(1)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(2)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 2. Value: " & float'Image(tfThrusterValues(2)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(3)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 3. Value: " & float'Image(tfThrusterValues(3)) & ". Expected: 0.0.");
--  
--        Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);
--              
--         
--            pxDispatcher := Navigation.Dispatcher.pxCreate;
--        
--        pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => Math.Matrices.xCreate_Rotation_Around_Z_Axis(tfAngleInDegrees => Math.Angles.TAngle(45.0)));
--        
--        pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.AllComponents,
--                                                    xNewPIDSCalings    => Navigation.PID_Controller.TPIDComponentScalings'(fProportionalScale => 1.0, fIntegralScale => 1.0, fDerivativeScale => 1.0));
--        tfThrusterValues := pxDispatcher.tfGet_Thruster_Values(fDeltaTime => 0.25);
--  
--        
--  
--        AUnit.Assertions.Assert        (Condition => tfThrusterValues(1) > 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 1. Value: " & float'Image(tfThrusterValues(1)) & ". Expected: > 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(1) - tfThrusterValues(2)) < 0.00001,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, 1 not equal to 2. Value: " & float'Image(tfThrusterValues(2)) & ". Expected: " & float'Image(tfThrusterValues(1)));
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(2) - tfThrusterValues(3)) < 0.00001,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, 2 not equal to 3. Value: " & float'Image(tfThrusterValues(3)) & ". Expected: " & float'Image(tfThrusterValues(2)));
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(4)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 4. Value: " & float'Image(tfThrusterValues(4)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(5)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 5. Value: " & float'Image(tfThrusterValues(5)) & ". Expected: 0.0.");
--        AUnit.Assertions.Assert        (Condition => abs(tfThrusterValues(6)) = 0.0,
--                                        Message => "CDispatcher.tfGet_Thruster_Values failed, wrong value from thruster 6. Value: " & float'Image(tfThrusterValues(6)) & ". Expected: 0.0.");
--  
--        Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);
--              
--        
   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
       
--  begin read only
   end Test_tfGet_Thruster_Values;
--  end read only


--  begin read only
   procedure Test_Set_New_Component_PID_Scalings (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Set_New_Component_PID_Scalings_893439 (Gnattest_T : in out Test_CDispatcher) renames Test_Set_New_Component_PID_Scalings;
--  id:2.1/893439b054cc7bcb/Set_New_Component_PID_Scalings/1/0/
   procedure Test_Set_New_Component_PID_Scalings (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:32:4:Set_New_Component_PID_Scalings
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
   procedure Test_Update_Current_Absolute_Position_ee3e86 (Gnattest_T : in out Test_CDispatcher) renames Test_Update_Current_Absolute_Position;
--  id:2.1/ee3e86668c6adb8c/Update_Current_Absolute_Position/1/0/
   procedure Test_Update_Current_Absolute_Position (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:38:4:Update_Current_Absolute_Position
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      use Math.Vectors;
      
      pxPosition : Math.Vectors.pCVector;
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxPosition := Math.Vectors.xCreate(fX => 1.4,
                                          fY => 7.4,
                                          fZ => 2.3).pxGet_Allocated_Copy;
      pxDispatcher.Update_Current_Absolute_Position(xNewCurrentAbsolutePosition => pxPosition.all);

      AUnit.Assertions.Assert        (Condition => pxPosition.all'Address /= pxDispatcher.pxCurrentAbsolutePosition.all'Address,
                                      Message => "CDispatcher.Update_Current_Absolute_Position failed, addresses the same.");
      AUnit.Assertions.Assert        (Condition => pxPosition.all = pxDispatcher.pxCurrentAbsolutePosition.all,
                                      Message => "CDispatcher.Update_Current_Absolute_Position failed, vectors have different values.");
      Math.Vectors.Free(pxVectorToDeallocate => pxPosition);
      Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);
--  begin read only
   end Test_Update_Current_Absolute_Position;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Absolute_Position (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Update_Wanted_Absolute_Position_93298b (Gnattest_T : in out Test_CDispatcher) renames Test_Update_Wanted_Absolute_Position;
--  id:2.1/93298b2961698444/Update_Wanted_Absolute_Position/1/0/
   procedure Test_Update_Wanted_Absolute_Position (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:44:4:Update_Wanted_Absolute_Position
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      use Math.Vectors;
      
      pxPosition : Math.Vectors.pCVector;
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxPosition := Math.Vectors.xCreate(fX => 1.4,
                                          fY => 7.4,
                                          fZ => 2.3).pxGet_Allocated_Copy;
      pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => pxPosition.all);

      AUnit.Assertions.Assert        (Condition => pxPosition.all'Address /= pxDispatcher.pxWantedAbsolutePosition.all'Address,
                                      Message => "CDispatcher.Update_Wanted_Absolute_Position failed, addresses the same.");
      AUnit.Assertions.Assert        (Condition => pxPosition.all = pxDispatcher.pxWantedAbsolutePosition.all,
                                      Message => "CDispatcher.Update_Wanted_Absolute_Position failed, vectors have different values.");
      Math.Vectors.Free(pxVectorToDeallocate => pxPosition);
      Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);
--  begin read only
   end Test_Update_Wanted_Absolute_Position;
--  end read only


--  begin read only
   procedure Test_Update_Current_Absolute_Orientation (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Update_Current_Absolute_Orientation_f15b9b (Gnattest_T : in out Test_CDispatcher) renames Test_Update_Current_Absolute_Orientation;
--  id:2.1/f15b9be4d738a731/Update_Current_Absolute_Orientation/1/0/
   procedure Test_Update_Current_Absolute_Orientation (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:49:4:Update_Current_Absolute_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      use Math.Matrices;
      
      pxOrientation : Math.Matrices.pCMatrix;
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxOrientation := Math.Matrices.xCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(45.0)).pxGet_Allocated_Copy;
      
      pxDispatcher.Update_Current_Absolute_Orientation(xNewCurrentAbsoluteOrientation => pxOrientation.all);

      AUnit.Assertions.Assert        (Condition => pxOrientation.all'Address /= pxDispatcher.pxCurrentAbsoluteOrientation.all'Address,
                                      Message => "CDispatcher.Update_Current_Absolute_Orientation failed, addresses the same.");
      AUnit.Assertions.Assert        (Condition => pxOrientation.all = pxDispatcher.pxCurrentAbsoluteOrientation.all,
                                      Message => "CDispatcher.Update_Current_Absolute_Orientation failed, matrices have different values.");
      Math.Matrices.Free(pxMatrixToDeallocate => pxOrientation);
      Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);
--  begin read only
   end Test_Update_Current_Absolute_Orientation;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Absolute_Orientation (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Update_Wanted_Absolute_Orientation_3e0717 (Gnattest_T : in out Test_CDispatcher) renames Test_Update_Wanted_Absolute_Orientation;
--  id:2.1/3e071723ed61198d/Update_Wanted_Absolute_Orientation/1/0/
   procedure Test_Update_Wanted_Absolute_Orientation (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:54:4:Update_Wanted_Absolute_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      use Math.Matrices;
      
      pxOrientation : Math.Matrices.pCMatrix;
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;
      pxOrientation := Math.Matrices.xCreate_Rotation_Around_X_Axis(Math.Angles.TAngle(45.0)).pxGet_Allocated_Copy;
      
      pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => pxOrientation.all);

      AUnit.Assertions.Assert        (Condition => pxOrientation.all'Address /= pxDispatcher.pxWantedAbsoluteOrientation.all'Address,
                                      Message => "CDispatcher.Update_Wanted_Absolute_Orientation failed, addresses the same.");
      AUnit.Assertions.Assert        (Condition => pxOrientation.all = pxDispatcher.pxWantedAbsoluteOrientation.all,
                                      Message => "CDispatcher.Update_Wanted_Absolute_Orientation failed, matrices have different values.");

      Math.Matrices.Free(pxMatrixToDeallocate => pxOrientation);
      Navigation.Dispatcher.Free(pxDispatcherToDeallocate => pxDispatcher);
--  begin read only
   end Test_Update_Wanted_Absolute_Orientation;
--  end read only


--  begin read only
   procedure Test_Finalize (Gnattest_T : in out Test_CDispatcher);
   procedure Test_Finalize_1d29f1 (Gnattest_T : in out Test_CDispatcher) renames Test_Finalize;
--  id:2.1/1d29f15228a8f8f4/Finalize/1/0/
   procedure Test_Finalize (Gnattest_T : in out Test_CDispatcher) is
   --  navigation-dispatcher.ads:83:4:Finalize
   --  end read only
   
      use Math.Matrices;
      use Math.Vectors;
      use Navigation.Thruster_Configurator;
      use Navigation.Drift_Controller;
      use Navigation.Positional_Controller;
      use Navigation.Orientational_Controller;

      pragma Unreferenced (Gnattest_T);
     
      pxDispatcher : pCDispatcher;
   begin
      
      pxDispatcher := Navigation.Dispatcher.pxCreate;

      AUnit.Assertions.Assert(Condition => pxDispatcher /= null,
                              Message   => "pxDispatcher is null after construction");
      
      pxDispatcher.Finalize;
      
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxThrusterConfigurator = null,
                              Message   => "pxThrusterConfigurator is not null after finalization");
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxOrientationalController = null,
                              Message   => "pxOrientationalController is not null after finalization");
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxPositionalController = null,
                              Message   => "pxPositionalController is not null after finalization");
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxDriftController = null,
                              Message   => "pxDriftController is not null after finalization");
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxCurrentAbsolutePosition = null,
                              Message   => "pxCurrentAbsolutePosition is not null after finalization");
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxWantedAbsolutePosition = null,
                              Message   => "pxCurrentAbsolutePosition is not null after finalization");
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxCurrentAbsoluteOrientation = null,
                              Message   => "pxCurrentAbsoluteOrientation is not null after finalization");
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxWantedAbsoluteOrientation = null,
                              Message   => "pxWantedAbsoluteOrientation is not null after finalization");
      AUnit.Assertions.Assert(Condition => pxDispatcher.pxCurrentAbsoluteOrientationInverse = null,
                              Message   => "pxCurrentAbsoluteOrientationInverse is not null after finalization");

--  begin read only
   end Test_Finalize;
--  end read only

end Navigation.Dispatcher.CDispatcher_Test_Data.CDispatcher_Tests;
