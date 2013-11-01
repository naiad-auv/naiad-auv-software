--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Orientational_Controller.COrientationalController_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests is


--  begin read only
   procedure Test_xGet_Orientational_Thruster_Control_Values (Gnattest_T : in out Test_COrientationalController);
   procedure Test_xGet_Orientational_Thruster_Control_Values_ec7316 (Gnattest_T : in out Test_COrientationalController) renames Test_xGet_Orientational_Thruster_Control_Values;
--  id:2.1/ec7316121441667a/xGet_Orientational_Thruster_Control_Values/1/0/
   procedure Test_xGet_Orientational_Thruster_Control_Values (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:29:4:xGet_Orientational_Thruster_Control_Values
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Navigation.Motion_Component;
      use Math.Matrices;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;

      xThrusterControlValues : Navigation.Thrusters.TThrusterEffects;
      bAtleasteOneControlValue : boolean := false;

      pxCurrentOrientation : Math.Matrices.pCMatrix := Math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;
      pxWantedOrientation : Math.Matrices.pCMatrix := Math.Matrices.CMatrix(Math.Matrices.xCreate_Rotation_Around_X_Axis(50.0) * Math.Matrices.xCreate_Rotation_Around_Y_Axis(50.0) * Math.Matrices.xCreate_Rotation_Around_Z_Axis(50.0)).pxGet_Allocated_Copy;

      pxCurrentOrientationInverse : Math.Matrices.pCMatrix := pxCurrentOrientation.xGet_Inverse.pxGet_Allocated_Copy;
   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate(pxCurrentAbsoluteOrientation        => pxCurrentOrientation,
                                                                                pxWantedAbsoluteOrientation         => pxWantedOrientation,
                                                                                pxCurrentAbsoluteOrientationInverse => pxCurrentOrientationInverse);


      pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
                                                               xNewPIDScaling => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));


      pxOrientationalController.Update_Current_Errors;

      pxOrientationalController.Update_Current_Errors;

      xThrusterControlValues := pxOrientationalController.xGet_Orientational_Thruster_Control_Values(1.0);

      for i in xThrusterControlValues'Range loop
         if xThrusterControlValues(i) /= 0.0 then
            bAtleasteOneControlValue := true;
            exit;
         end if;
      end loop;

      AUnit.Assertions.Assert(Condition => bAtleasteOneControlValue,
                              Message   => "No control constatnts, this is not good");

      Navigation.Orientational_Controller.Free(pxOrientationalControllerToDeallocate => pxOrientationalController);
      Math.Matrices.Free(pxMatrixToDeallocate => pxCurrentOrientation);
      Math.Matrices.Free(pxMatrixToDeallocate => pxWantedOrientation);

--  begin read only
   end Test_xGet_Orientational_Thruster_Control_Values;
--  end read only


--  begin read only
   procedure Test_Update_Current_Errors (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Update_Current_Errors_a4d64d (Gnattest_T : in out Test_COrientationalController) renames Test_Update_Current_Errors;
--  id:2.1/a4d64d73d258bef8/Update_Current_Errors/1/0/
   procedure Test_Update_Current_Errors (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:35:4:Update_Current_Errors
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --TODO, unable to test before mocking is possible
      null;

--  begin read only
   end Test_Update_Current_Errors;
--  end read only


--  begin read only
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Set_New_PID_Component_Scalings_f2c0ab (Gnattest_T : in out Test_COrientationalController) renames Test_Set_New_PID_Component_Scalings;
--  id:2.1/f2c0ab1f654d5493/Set_New_PID_Component_Scalings/1/0/
   procedure Test_Set_New_PID_Component_Scalings (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:39:4:Set_New_PID_Component_Scalings
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      null;

      --TODO, unable to test before mocking is possible

--  begin read only
   end Test_Set_New_PID_Component_Scalings;
--  end read only


--  begin read only
   procedure Test_Update_Current_Planal_Error (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Update_Current_Planal_Error_64978d (Gnattest_T : in out Test_COrientationalController) renames Test_Update_Current_Planal_Error;
--  id:2.1/64978dad4cb51c01/Update_Current_Planal_Error/1/0/
   procedure Test_Update_Current_Planal_Error (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:47:4:Update_Current_Planal_Error
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --TODO, unable to test before mocking is possible
      null;


--  begin read only
   end Test_Update_Current_Planal_Error;
--  end read only


--  begin read only
   procedure Test_Update_Current_Directional_Error (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Update_Current_Directional_Error_eb91a0 (Gnattest_T : in out Test_COrientationalController) renames Test_Update_Current_Directional_Error;
--  id:2.1/eb91a0974a3795af/Update_Current_Directional_Error/1/0/
   procedure Test_Update_Current_Directional_Error (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:48:4:Update_Current_Directional_Error
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      --TODO, unable to test before mocking is possible,
      null;

--  begin read only
   end Test_Update_Current_Directional_Error;
--  end read only


--  begin read only
   procedure Test_xGet_Planal_Thruster_Control_Value (Gnattest_T : in out Test_COrientationalController);
   procedure Test_xGet_Planal_Thruster_Control_Value_e4eedc (Gnattest_T : in out Test_COrientationalController) renames Test_xGet_Planal_Thruster_Control_Value;
--  id:2.1/e4eedcc59db4c0e9/xGet_Planal_Thruster_Control_Value/1/0/
   procedure Test_xGet_Planal_Thruster_Control_Value (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:53:4:xGet_Planal_Thruster_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Navigation.Motion_Component;
      use Math.Matrices;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;

      xThrusterControlValues : Navigation.Thrusters.TThrusterEffects;

      bAtleasteOneControlValue : boolean := false;

      pxCurrentOrientation : Math.Matrices.pCMatrix := Math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;
      pxWantedOrientation : Math.Matrices.pCMatrix := Math.Matrices.CMatrix(Math.Matrices.xCreate_Rotation_Around_X_Axis(50.0) * Math.Matrices.xCreate_Rotation_Around_Y_Axis(50.0) * Math.Matrices.xCreate_Rotation_Around_Z_Axis(50.0)).pxGet_Allocated_Copy;

      pxCurrentOrientationInverse : Math.Matrices.pCMatrix := pxCurrentOrientation.xGet_Inverse.pxGet_Allocated_Copy;
   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate(pxCurrentAbsoluteOrientation        => pxCurrentOrientation,
                                                                                pxWantedAbsoluteOrientation         => pxWantedOrientation,
                                                                                pxCurrentAbsoluteOrientationInverse => pxCurrentOrientationInverse);


      pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
                                                               xNewPIDScaling => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));

      pxOrientationalController.Update_Current_Errors;

      xThrusterControlValues := pxOrientationalController.xGet_Planal_Thruster_Control_Value(1.0);


      for i in xThrusterControlValues'Range loop
         if xThrusterControlValues(i) /= 0.0 then
            bAtleasteOneControlValue := true;
            exit;
         end if;
      end loop;

      AUnit.Assertions.Assert(Condition => bAtleasteOneControlValue,
                              Message   => "No control constatnts, this is not good");

      Navigation.Orientational_Controller.Free(pxOrientationalControllerToDeallocate => pxOrientationalController);
      Math.Matrices.Free(pxMatrixToDeallocate => pxCurrentOrientation);
      Math.Matrices.Free(pxMatrixToDeallocate => pxWantedOrientation);

--  begin read only
   end Test_xGet_Planal_Thruster_Control_Value;
--  end read only


--  begin read only
   procedure Test_xGet_Directional_Thruster_Control_Value (Gnattest_T : in out Test_COrientationalController);
   procedure Test_xGet_Directional_Thruster_Control_Value_538346 (Gnattest_T : in out Test_COrientationalController) renames Test_xGet_Directional_Thruster_Control_Value;
--  id:2.1/5383464085f7554b/xGet_Directional_Thruster_Control_Value/1/0/
   procedure Test_xGet_Directional_Thruster_Control_Value (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:54:4:xGet_Directional_Thruster_Control_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

      use Navigation.Motion_Component;
      use Math.Matrices;

      pxOrientationalController : Navigation.Orientational_Controller.pCOrientationalController;

      xThrusterControlValues : Navigation.Thrusters.TThrusterEffects;
      bAtleasteOneControlValue : boolean := false;

      pxCurrentOrientation : Math.Matrices.pCMatrix := Math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;
      pxWantedOrientation : Math.Matrices.pCMatrix := Math.Matrices.CMatrix(Math.Matrices.xCreate_Rotation_Around_X_Axis(50.0) * Math.Matrices.xCreate_Rotation_Around_Y_Axis(50.0) * Math.Matrices.xCreate_Rotation_Around_Z_Axis(50.0)).pxGet_Allocated_Copy;

   begin

      pxOrientationalController := Navigation.Orientational_Controller.pxCreate(pxCurrentOrientation, pxWantedOrientation);


      pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => Navigation.Motion_Component.AllComponents,
                                                               xNewPIDScaling => Navigation.PID_Controller.TPIDComponentScalings'(1.0,1.0,1.0));



      pxOrientationalController.Update_Current_Errors;

      xThrusterControlValues := pxOrientationalController.xGet_Directional_Thruster_Control_Value(1.0);

      for i in xThrusterControlValues'Range loop
         if xThrusterControlValues(i) /= 0.0 then
            bAtleasteOneControlValue := true;
            exit;
         end if;
      end loop;

      AUnit.Assertions.Assert(Condition => bAtleasteOneControlValue,
                              Message   => "No control constatnts, this is not good");

      Navigation.Orientational_Controller.Free(pxOrientationalControllerToDeallocate => pxOrientationalController);
      Math.Matrices.Free(pxMatrixToDeallocate => pxCurrentOrientation);
      Math.Matrices.Free(pxMatrixToDeallocate => pxWantedOrientation);

--  begin read only
   end Test_xGet_Directional_Thruster_Control_Value;
--  end read only


--  begin read only
   procedure Test_Finalize (Gnattest_T : in out Test_COrientationalController);
   procedure Test_Finalize_1d29f1 (Gnattest_T : in out Test_COrientationalController) renames Test_Finalize;
--  id:2.1/1d29f15228a8f8f4/Finalize/1/0/
   procedure Test_Finalize (Gnattest_T : in out Test_COrientationalController) is
   --  navigation-orientational_controller.ads:68:4:Finalize
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Finalize;
--  end read only

end Navigation.Orientational_Controller.COrientationalController_Test_Data.COrientationalController_Tests;
