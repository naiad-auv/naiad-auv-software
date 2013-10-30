--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Drift_Controller.CDriftController_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Drift_Controller.CDriftController_Test_Data.CDriftController_Tests is


--  begin read only
   procedure Test_xGet_Positional_Thruster_Control_Values (Gnattest_T : in out Test_CDriftController);
   procedure Test_xGet_Positional_Thruster_Control_Values_0afcd7 (Gnattest_T : in out Test_CDriftController) renames Test_xGet_Positional_Thruster_Control_Values;
--  id:2.1/0afcd76e8c35a33a/xGet_Positional_Thruster_Control_Values/1/0/
   procedure Test_xGet_Positional_Thruster_Control_Values (Gnattest_T : in out Test_CDriftController) is
   --  navigation-drift_controller.ads:22:4:xGet_Positional_Thruster_Control_Values
--  end read only

      pragma Unreferenced (Gnattest_T);

--       pxDriftController : Navigation.Drift_Controller.pCDriftController;
--
--        pxCurrentPos : math.Vectors.pCVector;
--        pxWantedPos : math.Vectors.pCVector;
--        pxCurrentOrientation : math.Matrices.pCMatrix;
--
--        xThrusterControlValues : Navigation.Thrusters.TThrusterEffects;

   begin

      AUnit.Assertions.Assert(Condition => False,
                              Message   => "Needs new implementation since inverse matrix is calculated in thruster config");

--        --X
--        pxCurrentPos := math.Vectors.xCreate(0.0,0.0,0.0).pxGet_Allocated_Copy;
--        pxWantedPos := math.Vectors.xCreate(1.0,0.0,0.0).pxGet_Allocated_Copy;
--        pxCurrentOrientation := math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;
--
--        pxDriftController := Navigation.Drift_Controller.pxCreate(pxCurrentAbsolutePosition    => pxCurrentPos,
--                                                                  pxWantedAbsolutePosition     => pxWantedPos,
--                                                                  pxCurrentAbsoluteOrientation => pxCurrentOrientation,
--                                                                 pxCurrentAbsoluteOrientationInverse => );
--
--        pxDriftController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
--                                                         xNewPIDScaling     => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));
--
--
--
--        pxDriftController.Update_Current_Errors;
--
--        pxCurrentPos.Copy_From(math.Vectors.pxCreate(0.1,0.0,0.0).all);
--        pxWantedPos.Copy_From(math.Vectors.pxCreate(0.1,1.0,0.0).all);
--
--        pxDriftController.Update_Current_Errors;
--
--        xThrusterControlValues := pxDriftController.xGet_Positional_Thruster_Control_Values(1.0);
--
--        AUnit.Assertions.Assert(Condition => xThrusterControlValues(thrusters.XPosition) > 0.0,
--                                Message   => "Xposition control values is not > 0.0");
--        AUnit.Assertions.Assert(Condition => abs(xThrusterControlValues(thrusters.YPosition)) = 0.0,
--                                Message   => "Yposition control values is not = 0.0");
--        AUnit.Assertions.Assert(Condition => xThrusterControlValues(thrusters.ZPosition) = 0.0,
--                                Message   => "Zposition control values is not 0.0");
--
--        Navigation.Drift_Controller.Free(pxDriftController);
--        math.Vectors.Free(pxWantedPos);
--        math.Vectors.Free(pxCurrentPos);
--        math.Matrices.Free(pxCurrentOrientation);
--
--        --Y
--
--        pxCurrentPos := math.Vectors.pxCreate(0.0,0.0,0.0);
--        pxWantedPos := math.Vectors.pxCreate(0.0,1.0,0.0);
--        pxCurrentOrientation := math.Matrices.xCreate_Identity.pxGet_Copy;
--
--        pxDriftController := Navigation.Drift_Controller.pxCreate(pxCurrentAbsolutePosition    => pxCurrentPos,
--                                                                  pxWantedAbsolutePosition     => pxWantedPos,
--                                                                  pxCurrentAbsoluteOrientation => pxCurrentOrientation);
--
--        pxDriftController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
--                                                         xNewPIDScaling     => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));
--
--
--
--        pxDriftController.Update_Current_Errors;
--
--        pxCurrentPos.Copy_From(math.Vectors.pxCreate(0.0,0.1,0.0).all);
--        pxWantedPos.Copy_From(math.Vectors.pxCreate(1.0,0.1,0.0).all);
--
--        pxDriftController.Update_Current_Errors;
--
--        xThrusterControlValues := pxDriftController.xGet_Positional_Thruster_Control_Values(1.0);
--
--        AUnit.Assertions.Assert(Condition => xThrusterControlValues(thrusters.XPosition) = 0.0,
--                                Message   => "Xposition control values is not 0.0");
--        AUnit.Assertions.Assert(Condition => abs(xThrusterControlValues(thrusters.YPosition)) > 0.0,
--                                Message   => "Yposition control values is not > 0.0");
--        AUnit.Assertions.Assert(Condition => xThrusterControlValues(thrusters.ZPosition) = 0.0,
--                                Message   => "Zposition control values is not 0.0");
--
--        Navigation.Drift_Controller.Free(pxDriftController);
--        math.Vectors.Free(pxWantedPos);
--        math.Vectors.Free(pxCurrentPos);
--        math.Matrices.Free(pxCurrentOrientation);
--
--        --Z
--        pxCurrentPos := math.Vectors.pxCreate(0.0,0.0,0.0);
--        pxWantedPos := math.Vectors.pxCreate(0.0,0.0,1.0);
--        pxCurrentOrientation := math.Matrices.xCreate_Identity.pxGet_Copy;
--
--        pxDriftController := Navigation.Drift_Controller.pxCreate(pxCurrentAbsolutePosition    => pxCurrentPos,
--                                                                  pxWantedAbsolutePosition     => pxWantedPos,
--                                                                  pxCurrentAbsoluteOrientation => pxCurrentOrientation);
--
--        pxDriftController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
--                                                         xNewPIDScaling     => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));
--
--
--
--        pxDriftController.Update_Current_Errors;
--
--        pxCurrentPos.Copy_From(math.Vectors.pxCreate(0.0,0.0,0.1).all);
--        pxWantedPos.Copy_From(math.Vectors.pxCreate(0.0,1.0,0.1).all);
--
--        pxDriftController.Update_Current_Errors;
--
--        xThrusterControlValues := pxDriftController.xGet_Positional_Thruster_Control_Values(1.0);
--
--        AUnit.Assertions.Assert(Condition => xThrusterControlValues(thrusters.XPosition) = 0.0,
--                                Message   => "Xposition control values is not 0.0");
--        AUnit.Assertions.Assert(Condition => abs(xThrusterControlValues(thrusters.YPosition)) = 0.0,
--                                Message   => "Yposition control values is not = 0.0");
--        AUnit.Assertions.Assert(Condition => xThrusterControlValues(thrusters.ZPosition) > 0.0,
--                                Message   => "Zposition control values is not > 0.0");
--
--        Navigation.Drift_Controller.Free(pxDriftController);
--        math.Vectors.Free(pxWantedPos);
--        math.Vectors.Free(pxCurrentPos);
--        math.Matrices.Free(pxCurrentOrientation);

--  begin read only
   end Test_xGet_Positional_Thruster_Control_Values;
--  end read only


--  begin read only
   procedure Test_Update_Current_Errors (Gnattest_T : in out Test_CDriftController);
   procedure Test_Update_Current_Errors_a4d64d (Gnattest_T : in out Test_CDriftController) renames Test_Update_Current_Errors;
--  id:2.1/a4d64d73d258bef8/Update_Current_Errors/1/0/
   procedure Test_Update_Current_Errors (Gnattest_T : in out Test_CDriftController) is
   --  navigation-drift_controller.ads:27:4:Update_Current_Errors
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null;

      --todo needs mocking
--  begin read only
   end Test_Update_Current_Errors;
--  end read only


--  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CDriftController);
   procedure Test_Set_New_PID_Component_Scalings_f2c0ab (Gnattest_T : in out Test_CDriftController) renames Test_Set_New_PID_Component_Scalings;
--  id:2.1/f2c0ab1f654d5493/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_CDriftController) is
   --  navigation-drift_controller.ads:31:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null;
      --TODO needs mocking

--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only


--  begin read only
   procedure Test_Finalize (Gnattest_T : in out Test_CDriftController);
   procedure Test_Finalize_1d29f1 (Gnattest_T : in out Test_CDriftController) renames Test_Finalize;
--  id:2.1/1d29f15228a8f8f4/Finalize/1/0/
   procedure Test_Finalize (Gnattest_T : in out Test_CDriftController) is
   --  navigation-drift_controller.ads:53:4:Finalize
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDriftController : Navigation.Drift_Controller.pCDriftController;

      pxCurrentPos : math.Vectors.pCVector;
      pxWantedPos : math.Vectors.pCVector;
      pxCurrentOrientation : math.Matrices.pCMatrix;

   begin

      pxCurrentPos := math.Vectors.xCreate(0.0,0.0,0.0).pxGet_Allocated_Copy;
      pxWantedPos := math.Vectors.xCreate(0.0,0.0,0.0).pxGet_Allocated_Copy;
      pxCurrentOrientation := math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;

      pxDriftController := Navigation.Drift_Controller.pxCreate(pxCurrentAbsolutePosition    => pxCurrentPos,
                                                                pxWantedAbsolutePosition     => pxWantedPos,
                                                                pxCurrentAbsoluteOrientation => pxCurrentOrientation,
                                                                pxCurrentAbsoluteOrientationInverse => pxCurrentOrientation
                                                               );

      pxDriftController.Finalize;

      AUnit.Assertions.Assert(Condition => pxDriftController /= null,
                              Message   => "pxDriftcontroller is null after finalization");

      AUnit.Assertions.Assert(Condition => pxDriftController.pxLastAbsolutePosition = null,
                              Message   => "pxLastAbsolutePosition is not null after finalization");

      AUnit.Assertions.Assert(Condition => pxDriftController.pxXDriftMotionComponent = null,
                              Message   => "pxXDriftMotionComponent is not null after finalization");

      AUnit.Assertions.Assert(Condition => pxDriftController.pxYDriftMotionComponent = null,
                              Message   => "pxYDriftMotionComponent is not null after finalization");

      AUnit.Assertions.Assert(Condition => pxDriftController.pxZDriftMotionComponent = null,
                              Message   => "pxZDriftMotionComponent is not null after finalization");

--  begin read only
   end Test_Finalize;
--  end read only

end Navigation.Drift_Controller.CDriftController_Test_Data.CDriftController_Tests;
