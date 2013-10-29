--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Drift_Controller.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Drift_Controller.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_e78edb (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/e78edb21744eace8/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  navigation-drift_controller.ads:15:4:Free
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
                                                                pxCurrentAbsoluteOrientationInverse =>  pxCurrentOrientation);

      Navigation.Drift_Controller.Free(pxDriftController);

      AUnit.Assertions.Assert(Condition => pxDriftController = null,
                              Message   => "pxDriftController is not deconstructed correctly");

--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_5047e3 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/5047e3a6d2da74e4/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-drift_controller.ads:17:4:pxCreate
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
                                                               pxCurrentAbsoluteOrientationInverse => pxCurrentOrientation);

      Aunit.Assertions.Assert(Condition => pxDriftController.pxWantedAbsolutePosition /= null,
                              Message   => "pxWantedAbsolutePosition is null after construction");

      Aunit.Assertions.Assert(Condition => pxDriftController.pxCurrentAbsolutePosition /= null,
                              Message   => "pxCurrentAbsolutePosition is null after construction");

      Aunit.Assertions.Assert(Condition => pxDriftController.pxLastAbsolutePosition /= null,
                              Message   => "pxLastAbsolutePosition is null after construction");

      Aunit.Assertions.Assert(Condition => pxDriftController.pxCurrentAbsoluteOrientation /= null,
                              Message   => "pxCurrentAbsoluteOrientation is null after construction");

      Aunit.Assertions.Assert(Condition => pxDriftController.pxXDriftMotionComponent /= null,
                              Message   => "pxXDriftMotionComponent is null after construction");

      Aunit.Assertions.Assert(Condition => pxDriftController.pxYDriftMotionComponent /= null,
                              Message   => "pxYDriftMotionComponent is null after construction");

      Aunit.Assertions.Assert(Condition => pxDriftController.pxZDriftMotionComponent /= null,
                              Message   => "pxZDriftMotionComponent is null after construction");

      Navigation.Drift_Controller.Free(pxDriftController);
      math.Vectors.Free(pxCurrentPos);
      math.Vectors.free(pxWantedPos);
      math.Matrices.Free(pxCurrentOrientation);

--  begin read only
   end Test_pxCreate;
--  end read only

end Navigation.Drift_Controller.Test_Data.Tests;
