--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Planes.CPlane_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Planes.CPlane_Test_Data.CPlane_Tests is


--  begin read only
   procedure Test_1_xCreate (Gnattest_T : in out Test_CPlane);
   procedure Test_xCreate_4dc581 (Gnattest_T : in out Test_CPlane) renames Test_1_xCreate;
--  id:2.1/4dc58160bc1c3c8e/xCreate/1/0/
   procedure Test_1_xCreate (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:18:4:xCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null;
      
--  begin read only
   end Test_1_xCreate;
--  end read only


--  begin read only
   procedure Test_2_xCreate (Gnattest_T : in out Test_CPlane);
   procedure Test_xCreate_d3d096 (Gnattest_T : in out Test_CPlane) renames Test_2_xCreate;
--  id:2.1/d3d096d9dfbe5351/xCreate/0/0/
   procedure Test_2_xCreate (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:19:4:xCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null;
      
--  begin read only
   end Test_2_xCreate;
--  end read only


--  begin read only
   procedure Test_pxGet_Allocated_Copy (Gnattest_T : in out Test_CPlane);
   procedure Test_pxGet_Allocated_Copy_123053 (Gnattest_T : in out Test_CPlane) renames Test_pxGet_Allocated_Copy;
--  id:2.1/1230534ef8ef4675/pxGet_Allocated_Copy/1/0/
   procedure Test_pxGet_Allocated_Copy (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:25:4:pxGet_Allocated_Copy
--  end read only

      pragma Unreferenced (Gnattest_T);
      use System;
      
      xPlane : Math.Planes.CPlane;
      pxPlaneOne : Math.Planes.pCPlane;
      pxPlaneTwo : Math.Planes.pCPlane;

   begin

      xPlane := Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 1.0,
                                                                                    fY => 45.0,
                                                                                    fZ => -21.0),
                                        fDistanceFromOrigin => 12.3);
      pxPlaneOne := xPlane.pxGet_Allocated_Copy;
      pxPlaneTwo := xPlane.pxGet_Allocated_Copy;
      

      AUnit.Assertions.Assert(Condition => pxPlaneOne.all = pxPlaneTwo.all,
                              Message   => "CPlane.pxGet_Allocated_Copy failed, plane one not equal to plane two.");
      AUnit.Assertions.Assert(Condition => pxPlaneOne.all = xPlane,
                              Message   => "CPlane.pxGet_Allocated_Copy failed, plane one not equal to original plane.");
      AUnit.Assertions.Assert(Condition => pxPlaneOne.all'Address /= pxPlaneTwo.all'Address,
                              Message   => "CPlane.pxGet_Allocated_Copy failed, allocated copies have same address.");

      
         Math.Planes.Free(pxPlaneToDeallocate => pxPlaneOne);
         Math.Planes.Free(pxPlaneToDeallocate => pxPlaneTwo);      

--  begin read only
   end Test_pxGet_Allocated_Copy;
--  end read only


--  begin read only
   procedure Test_xGet_Normal_Vector (Gnattest_T : in out Test_CPlane);
   procedure Test_xGet_Normal_Vector_a98d33 (Gnattest_T : in out Test_CPlane) renames Test_xGet_Normal_Vector;
--  id:2.1/a98d33c1d1be01d1/xGet_Normal_Vector/1/0/
   procedure Test_xGet_Normal_Vector (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:29:4:xGet_Normal_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestPlane : pCPlane;
      pxTestNormal : Math.Vectors.pCVector;
      use Math.Vectors;

--      fExpectedAX : float := 0.980581;
--      fExpectedBY : float := 0.0;
--      fExpectedCZ : float := -0.196116;

   begin

      pxTestNormal := Math.Vectors.xCreate(fX => 5.0,
                                            fY => 0.0,
                                            fZ => -1.0).pxGet_Allocated_Copy;
      pxTestPlane := Math.Planes.xCreate(pxNormalVector      => pxTestNormal,
                                          fDistanceFromOrigin => 0.0).pxGet_Allocated_Copy;
      pxTestNormal.Copy_From(xSourceVector => pxTestNormal.xGet_Normalized);

      AUnit.Assertions.Assert(Condition => pxTestNormal.all = pxTestPlane.xGet_Normal_Vector,
                              Message   => "CPlane.xGet_Normal_Vector failed. Value: " & float'image(pxTestPlane.xGet_Normal_Vector.fGet_X) & float'image(pxTestPlane.xGet_Normal_Vector.fGet_Y) & float'image(pxTestPlane.xGet_Normal_Vector.fGet_Z) & ". Expected: " & float'image(pxTestNormal.fGet_X) & float'image(pxTestNormal.fGet_Y) & float'image(pxTestNormal.fGet_Z) );

      Math.Vectors.Free(pxVectorToDeallocate => pxTestNormal);
      Math.Planes.Free(pxPlaneToDeallocate => pxTestPlane);
--  begin read only
   end Test_xGet_Normal_Vector;
--  end read only


--  begin read only
   procedure Test_fGet_Distance_From_Origin (Gnattest_T : in out Test_CPlane);
   procedure Test_fGet_Distance_From_Origin_1b1e67 (Gnattest_T : in out Test_CPlane) renames Test_fGet_Distance_From_Origin;
--  id:2.1/1b1e6780f65bcbcd/fGet_Distance_From_Origin/1/0/
   procedure Test_fGet_Distance_From_Origin (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:33:4:fGet_Distance_From_Origin
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestPlane : pCPlane;
      pxTestNormal : Math.Vectors.pCVector;
      fExpectedD : float := 2.0;
   begin


      pxTestNormal := Math.Vectors.xCreate(fX => 5.0,
                                            fY => 0.0,
                                            fZ => -1.0).pxGet_Allocated_Copy;
      pxTestPlane := Math.Planes.xCreate(pxNormalVector      => pxTestNormal,
                                          fDistanceFromOrigin => fExpectedD).pxGet_Allocated_Copy;

      AUnit.Assertions.Assert(Condition => pxTestPlane.fGet_Distance_From_Origin = fExpectedD,
                              Message   => "CPlane.fGet_Distance_From_Origin failed.");

      Math.Vectors.Free(pxVectorToDeallocate => pxTestNormal);
      Math.Planes.Free(pxPlaneToDeallocate => pxTestPlane);

--  begin read only
   end Test_fGet_Distance_From_Origin;
--  end read only


--  begin read only
   procedure Test_1_fAngle_Between_In_Degrees (Gnattest_T : in out Test_CPlane);
   procedure Test_fAngle_Between_In_Degrees_c567f3 (Gnattest_T : in out Test_CPlane) renames Test_1_fAngle_Between_In_Degrees;
--  id:2.1/c567f314dc9946e3/fAngle_Between_In_Degrees/1/0/
   procedure Test_1_fAngle_Between_In_Degrees (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:38:4:fAngle_Between_In_Degrees
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin
      null;

--  begin read only
   end Test_1_fAngle_Between_In_Degrees;
--  end read only


--  begin read only
   procedure Test_2_fAngle_Between_In_Degrees (Gnattest_T : in out Test_CPlane);
   procedure Test_fAngle_Between_In_Degrees_3326a2 (Gnattest_T : in out Test_CPlane) renames Test_2_fAngle_Between_In_Degrees;
--  id:2.1/3326a28abb4662d5/fAngle_Between_In_Degrees/0/0/
   procedure Test_2_fAngle_Between_In_Degrees (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:39:4:fAngle_Between_In_Degrees
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null;

--  begin read only
   end Test_2_fAngle_Between_In_Degrees;
--  end read only


--  begin read only
   procedure Test_3_fAngle_Between_In_Degrees (Gnattest_T : in out Test_CPlane);
   procedure Test_fAngle_Between_In_Degrees_39c39e (Gnattest_T : in out Test_CPlane) renames Test_3_fAngle_Between_In_Degrees;
--  id:2.1/39c39e8c68cafd06/fAngle_Between_In_Degrees/0/0/
   procedure Test_3_fAngle_Between_In_Degrees (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:41:4:fAngle_Between_In_Degrees
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxPlaneOne : Math.Planes.pCPlane;
      pxPlaneTwo : Math.Planes.pCPlane;

   begin

      pxPlaneOne := Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 1.0,
                                                                                    fY => 0.0,
                                                                                    fZ => 0.0),
                                        fDistanceFromOrigin => 0.0).pxGet_Allocated_Copy;
      pxPlaneTwo := Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 0.0,
                                                                                    fY => -2.0,
                                                                                    fZ => 0.0),
                                        fDistanceFromOrigin => -4.0).pxGet_Allocated_Copy;
      

      AUnit.Assertions.Assert(Condition => Math.Planes.fAngle_Between_In_Degrees(pxPlaneOne, pxPlaneTwo) = 90.0,
                              Message   => "Planes.fAngle_Between_In_Degrees failed, planes should be perpendicular.");

      
         Math.Planes.Free(pxPlaneToDeallocate => pxPlaneOne);
         Math.Planes.Free(pxPlaneToDeallocate => pxPlaneTwo);      
--  begin read only
   end Test_3_fAngle_Between_In_Degrees;
--  end read only


--  begin read only
   procedure Test_1_xGet_Intersection_Vector_Between (Gnattest_T : in out Test_CPlane);
   procedure Test_xGet_Intersection_Vector_Between_fcb85d (Gnattest_T : in out Test_CPlane) renames Test_1_xGet_Intersection_Vector_Between;
--  id:2.1/fcb85daa3aefe6ae/xGet_Intersection_Vector_Between/1/0/
   procedure Test_1_xGet_Intersection_Vector_Between (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:46:4:xGet_Intersection_Vector_Between
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null;

--  begin read only
   end Test_1_xGet_Intersection_Vector_Between;
--  end read only


--  begin read only
   procedure Test_2_xGet_Intersection_Vector_Between (Gnattest_T : in out Test_CPlane);
   procedure Test_xGet_Intersection_Vector_Between_a801a4 (Gnattest_T : in out Test_CPlane) renames Test_2_xGet_Intersection_Vector_Between;
--  id:2.1/a801a487092a6ff0/xGet_Intersection_Vector_Between/0/0/
   procedure Test_2_xGet_Intersection_Vector_Between (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:47:4:xGet_Intersection_Vector_Between
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null;

--  begin read only
   end Test_2_xGet_Intersection_Vector_Between;
--  end read only


--  begin read only
   procedure Test_3_xGet_Intersection_Vector_Between (Gnattest_T : in out Test_CPlane);
   procedure Test_xGet_Intersection_Vector_Between_1e6db6 (Gnattest_T : in out Test_CPlane) renames Test_3_xGet_Intersection_Vector_Between;
--  id:2.1/1e6db6b01382acef/xGet_Intersection_Vector_Between/0/0/
   procedure Test_3_xGet_Intersection_Vector_Between (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:49:4:xGet_Intersection_Vector_Between
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxPlaneOne : Math.Planes.pCPlane;
      pxPlaneTwo : Math.Planes.pCPlane;
      xIntersect : Math.Vectors.CVector;
   begin
      
      pxPlaneOne := Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 1.0,
                                                                                    fY => 0.0,
                                                                                    fZ => 0.0),
                                        fDistanceFromOrigin => 5.0).pxGet_Allocated_Copy;
      pxPlaneTwo := Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 1.0,
                                                                                    fY => 0.0,
                                                                                    fZ => 0.0),
                                        fDistanceFromOrigin => 5.0).pxGet_Allocated_Copy;
      
      
      xIntersect := Math.Planes.xGet_Intersection_Vector_Between(pxPlaneOne, pxPlaneTwo);
          
      AUnit.Assertions.Assert(Condition => xIntersect.fGet_X = 0.0,
                              Message   => "Planes.xGet_Intersection_Vector_Between failed, vector not in both planes.");
      AUnit.Assertions.Assert(Condition => abs(xIntersect.fGet_Y) > 0.0 or abs(xIntersect.fGet_Z) > 0.0,
                              Message   => "Planes.xGet_Intersection_Vector_Between failed, vector is zero.");    
      
      pxPlaneOne.Copy_From(xSourcePlane => Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 3.0,
                                                                                    fY => 0.0,
                                                                                    fZ => 0.0),
                                                               fDistanceFromOrigin => 5.0));
      pxPlaneTwo.Copy_From(xSourcePlane => Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 0.0,
                                                                                    fY => 4.0,
                                                                                    fZ => 0.0),
                                        fDistanceFromOrigin => 10.0));      
      
      xIntersect := Math.Planes.xGet_Intersection_Vector_Between(pxPlaneOne.all, pxPlaneTwo);

      AUnit.Assertions.Assert(Condition => Math.Angles.fRadians_To_Degrees(Math.Vectors.fAngle_Between_In_Radians(xIntersect, pxPlaneOne.xGet_Normal_Vector)) = 90.0,
                              Message   => "Planes.xGet_Intersection_Vector_Between failed, intersection vector is not perpendicular to plane one's normal");
      AUnit.Assertions.Assert(Condition => Math.Angles.fRadians_To_Degrees(Math.Vectors.fAngle_Between_In_Radians(xIntersect, pxPlaneTwo.xGet_Normal_Vector)) = 90.0,
                              Message   => "Planes.xGet_Intersection_Vector_Between failed, intersection vector is not perpendicular to plane two's normal");
      
      
      
      pxPlaneOne.Copy_From(xSourcePlane => Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 0.0,
                                                                                    fY => 0.0,
                                                                                    fZ => 4.0),
                                                               fDistanceFromOrigin => 5.0));
      pxPlaneTwo.Copy_From(xSourcePlane => Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 0.0,
                                                                                    fY => 0.0,
                                                                                    fZ => 10.0),
                                        fDistanceFromOrigin => 10.0));      
      
      xIntersect := Math.Planes.xGet_Intersection_Vector_Between(pxPlaneOne, pxPlaneTwo.all);

      AUnit.Assertions.Assert(Condition => False,
                              Message   => "Planes.xGet_Intersection_Vector_Between failed, should've raised exception.");

   exception
      when Exception_Handling.NoIntersectionBetweenPlanes =>
         Math.Planes.Free(pxPlaneToDeallocate => pxPlaneOne);
         Math.Planes.Free(pxPlaneToDeallocate => pxPlaneTwo);
         null; -- test passed
      when E : others =>
         AUnit.Assertions.Assert(Condition => False,
                                 Message   => "Planes.xGet_Intersection_Vector_Between failed, wrong exception raised. Raised: " & Ada.Exceptions.Exception_Name(E));
         Math.Planes.Free(pxPlaneToDeallocate => pxPlaneOne);
         Math.Planes.Free(pxPlaneToDeallocate => pxPlaneTwo);
         
         
      
            


--  begin read only
   end Test_3_xGet_Intersection_Vector_Between;
--  end read only


--  begin read only
   procedure Test_Copy_From (Gnattest_T : in out Test_CPlane);
   procedure Test_Copy_From_aaf146 (Gnattest_T : in out Test_CPlane) renames Test_Copy_From;
--  id:2.1/aaf14650204a5d27/Copy_From/1/0/
   procedure Test_Copy_From (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:56:4:Copy_From
--  end read only

      pragma Unreferenced (Gnattest_T);
      use System;
      
      xPlaneOriginal : Math.Planes.CPlane;
      xPlaneCopy : Math.Planes.CPlane;

   begin

      xPlaneOriginal := Math.Planes.xCreate(xNormalVector       => Math.Vectors.xCreate(fX => 1.0,
                                                                                        fY => 0.0,
                                                                                        fZ => 0.0),
                                            fDistanceFromOrigin => 5.0);
      xPlaneCopy.Copy_From(xSourcePlane => xPlaneOriginal);

      AUnit.Assertions.Assert(Condition => xPlaneOriginal = xPlaneCopy,
                              Message   => "CPlane.Copy_From failed, planes not equal after copy.");
      AUnit.Assertions.Assert(Condition => xPlaneOriginal'Address /= xPlaneCopy'Address,
                              Message   => "CPlane.Copy_From failed, addresses are equal.");
      

--  begin read only
   end Test_Copy_From;
--  end read only




end Math.Planes.CPlane_Test_Data.CPlane_Tests;
