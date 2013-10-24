--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Planes.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Planes.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_ef4fa7 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/ef4fa732366cbfbb/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  math-planes.ads:9:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestPlane : pCPlane;
      pxTestNormal : Math.Vectors.pCVector;
      fExpectedAX : float := 0.980581;
      fExpectedBY : float := 0.0;
      fExpectedCZ : float := -0.196116;
      fExpectedD : float := 0.0;

   begin

      pxTestNormal := Math.Vectors.pxCreate(fX => 5.0,
                                            fY => 0.0,
                                            fZ => -1.0);
      pxTestPlane := Math.Planes.pxCreate(pxNormalVector      => pxTestNormal,
                                          fDistanceFromOrigin => 0.0);



      AUnit.Assertions.Assert(Condition => pxTestNormal.xGet_Normalized = pxTestPlane.xGet_Normal_Vector,
                              Message   => "CPlane.pxCreate failed, normal vector is wrong.");
      AUnit.Assertions.Assert(Condition => pxTestPlane.fGet_Distance_From_Origin = fExpectedD,
                              Message   => "CPlane.pxCreate failed, wrong distance from origin.");
--        AUnit.Assertions.Assert(Condition => abs(pxTestPlane.fCZ - fExpectedCZ) < 0.001,
--                                Message   => "CPlane.pxCreate failed, wrong CZ value. Value: " & float'Image(pxTestPlane.fCZ) & ". Expected: " & float'Image(fExpectedCZ) & ".");
--        AUnit.Assertions.Assert(Condition => abs(pxTestPlane.fD - fExpectedD) < 0.001,
--                                Message   => "CPlane.pxCreate failed, wrong D value. Value: " & float'Image(pxTestPlane.fD) & ". Expected: " & float'Image(fExpectedD) & ".");

      Math.Vectors.Free(pxVectorToDeallocate => pxTestNormal);
      Math.Planes.Free(pxPlaneToDeallocate => pxTestPlane);
--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_fAngle_Between_In_Degrees (Gnattest_T : in out Test);
   procedure Test_fAngle_Between_In_Degrees_4fe9d1 (Gnattest_T : in out Test) renames Test_fAngle_Between_In_Degrees;
--  id:2.1/4fe9d1bd22e7e480/fAngle_Between_In_Degrees/1/0/
   procedure Test_fAngle_Between_In_Degrees (Gnattest_T : in out Test) is
   --  math-planes.ads:14:4:fAngle_Between_In_Degrees
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftPlane : pCPlane;
      pxRightPlane : pCPlane;
      pxXVector : Math.Vectors.pCVector;
      pxYVector : Math.Vectors.pCVector;
   begin

      pxXVector := Math.Vectors.pxCreate(fX => 1.0,
                                         fY => 0.0,
                                         fZ => 0.0);
      pxYVector := Math.Vectors.pxCreate(fX => 0.0,
                                         fY => 1.0,
                                         fZ => 0.0);

      pxLeftPlane := Math.Planes.pxCreate(pxNormalVector      => pxXVector,
                                          fDistanceFromOrigin => 0.0);
      pxRightPlane := Math.Planes.pxCreate(pxNormalVector      => pxYVector,
                                          fDistanceFromOrigin => 0.0);
      AUnit.Assertions.Assert(Condition => Math.Planes.fAngle_Between_In_Degrees(pxLeftOperandPlane  => pxLeftPlane,
                                                                      pxRightOperandPlane => pxRightPlane) = 90.0,
                              Message   => "CPlane.fAngle_Between_In_Degrees failed.");

      Math.Vectors.Free(pxVectorToDeallocate => pxXVector);
      Math.Vectors.Free(pxVectorToDeallocate => pxYVector);
      Math.Planes.Free(pxPlaneToDeallocate => pxLeftPlane);
      Math.Planes.Free(pxPlaneToDeallocate => pxRightPlane);


--  begin read only
   end Test_fAngle_Between_In_Degrees;
--  end read only


--  begin read only
   procedure Test_pxGet_Intersection_Vector_Between (Gnattest_T : in out Test);
   procedure Test_pxGet_Intersection_Vector_Between_ae083a (Gnattest_T : in out Test) renames Test_pxGet_Intersection_Vector_Between;
--  id:2.1/ae083a1283dac6b1/pxGet_Intersection_Vector_Between/1/0/
   procedure Test_pxGet_Intersection_Vector_Between (Gnattest_T : in out Test) is
   --  math-planes.ads:16:4:pxGet_Intersection_Vector_Between
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftPlane, pxRightPlane : pCPlane;
      pxLeftNormal, pxRightNormal : Math.Vectors.pCVector;
      pxExpectedIntersection : Math.Vectors.pCVector;
      pxIntersection : Math.Vectors.pCVector;
   begin

      pxLeftNormal := Math.Vectors.pxCreate(fX => 1.0,
                                            fY => 0.0,
                                            fZ => 0.0);
      pxRightNormal := Math.Vectors.pxCreate(fX => 0.0,
                                             fY => 1.0,
                                             fZ => 0.0);
      pxLeftPlane := Math.Planes.pxCreate(pxNormalVector      => pxLeftNormal,
                                          fDistanceFromOrigin => 0.0);
      pxRightPlane := Math.Planes.pxCreate(pxNormalVector      => pxRightNormal,
                                           fDistanceFromOrigin => 0.0);
      pxExpectedIntersection := Math.Vectors.pxCreate(fX => 0.0,
                                                      fY => 0.0,
                                                      fZ => 1.0);
      pxIntersection := Math.Planes.xGet_Intersection_Vector_Between(pxLeftOperandPlane  => pxLeftPlane,
                                                                      pxRightOperandPlane => pxRightPlane).pxGet_Copy;
      AUnit.Assertions.Assert(Condition => pxIntersection.all = pxExpectedIntersection.all,
                              Message   => "CPlane.pxGet_Intersection_Vector_Between failed.");

      Math.Vectors.Free(pxVectorToDeallocate => pxLeftNormal);
      Math.Vectors.Free(pxVectorToDeallocate => pxRightNormal);
      Math.Vectors.Free(pxVectorToDeallocate => pxExpectedIntersection);
      Math.Vectors.Free(pxVectorToDeallocate => pxIntersection);
      Math.Planes.Free(pxPlaneToDeallocate => pxLeftPlane);
      Math.Planes.Free(pxPlaneToDeallocate => pxRightPlane);


--  begin read only
   end Test_pxGet_Intersection_Vector_Between;
--  end read only



end Math.Planes.Test_Data.Tests;
