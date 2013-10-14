--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Planes.CPlane_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Planes.CPlane_Test_Data.CPlane_Tests is


--  begin read only
   procedure Test_pxGet_Normal_Vector (Gnattest_T : in out Test_CPlane);
   procedure Test_pxGet_Normal_Vector_4c7399 (Gnattest_T : in out Test_CPlane) renames Test_pxGet_Normal_Vector;
--  id:2.1/4c7399a6c0ba5408/pxGet_Normal_Vector/1/0/
   procedure Test_pxGet_Normal_Vector (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:11:4:pxGet_Normal_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestPlane : pCPlane;
      pxTestNormal : Math.Vectors.pCVector;
--      fExpectedAX : float := 0.980581;
--      fExpectedBY : float := 0.0;
--      fExpectedCZ : float := -0.196116;

   begin

      pxTestNormal := Math.Vectors.pxCreate(fX => 5.0,
                                            fY => 0.0,
                                            fZ => -1.0);
      pxTestPlane := Math.Planes.pxCreate(pxNormalVector      => pxTestNormal,
                                          fDistanceFromOrigin => 0.0);
      pxTestNormal := pxTestNormal.pxGet_Normalized;

      AUnit.Assertions.Assert(Condition => pxTestNormal = pxTestPlane.pxGet_Normal_Vector,
                              Message   => "CPlane.pxGet_Normal_Vector failed.");


--  begin read only
   end Test_pxGet_Normal_Vector;
--  end read only


--  begin read only
   procedure Test_fGet_Distance_From_Origin (Gnattest_T : in out Test_CPlane);
   procedure Test_fGet_Distance_From_Origin_1b1e67 (Gnattest_T : in out Test_CPlane) renames Test_fGet_Distance_From_Origin;
--  id:2.1/1b1e6780f65bcbcd/fGet_Distance_From_Origin/1/0/
   procedure Test_fGet_Distance_From_Origin (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:12:4:fGet_Distance_From_Origin
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestPlane : pCPlane;
      pxTestNormal : Math.Vectors.pCVector;
      fExpectedD : float := 0.0;
   begin


      pxTestNormal := Math.Vectors.pxCreate(fX => 5.0,
                                            fY => 0.0,
                                            fZ => -1.0);
      pxTestPlane := Math.Planes.pxCreate(pxNormalVector      => pxTestNormal,
                                          fDistanceFromOrigin => 0.0);

      AUnit.Assertions.Assert(Condition => pxTestPlane.fGet_Distance_From_Origin = pxTestPlane.fDistanceFromOrigin,
                              Message   => "CPlane.fGet_Distance_From_Origin failed.");

--  begin read only
   end Test_fGet_Distance_From_Origin;
--  end read only


end Math.Planes.CPlane_Test_Data.CPlane_Tests;
