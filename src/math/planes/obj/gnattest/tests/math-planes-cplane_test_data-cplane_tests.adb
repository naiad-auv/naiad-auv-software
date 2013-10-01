--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Planes.CPlane_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Planes.CPlane_Test_Data.CPlane_Tests is


--  begin read only
   procedure Test_fGet_AX (Gnattest_T : in out Test_CPlane);
   procedure Test_fGet_AX_139328 (Gnattest_T : in out Test_CPlane) renames Test_fGet_AX;
--  id:2.1/139328ac2ae8cca7/fGet_AX/1/0/
   procedure Test_fGet_AX (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:11:4:fGet_AX
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestPlane : pCPlane;
      pxTestNormal : Math.Vectors.pCVector;
      fExpectedAX : float := 0.980581;
   begin


      pxTestNormal := Math.Vectors.pxCreate(fX => 5.0,
                                            fY => 0.0,
                                            fZ => -1.0);
      pxTestPlane := Math.Planes.pxCreate(pxNormalVector      => pxTestNormal,
                                          fDistanceFromOrigin => 0.0);

      AUnit.Assertions.Assert(Condition => abs(pxTestPlane.fGet_AX - fExpectedAX) < 0.001,
                              Message   => "CPlane.fGet_AX failed, wrong AX value. Value: " & float'Image(pxTestPlane.fGet_AX) & ". Expected: " & float'Image(fExpectedAX) & ".");

--  begin read only
   end Test_fGet_AX;
--  end read only


--  begin read only
   procedure Test_fGet_BY (Gnattest_T : in out Test_CPlane);
   procedure Test_fGet_BY_5ee6e2 (Gnattest_T : in out Test_CPlane) renames Test_fGet_BY;
--  id:2.1/5ee6e227e9042da9/fGet_BY/1/0/
   procedure Test_fGet_BY (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:12:4:fGet_BY
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestPlane : pCPlane;
      pxTestNormal : Math.Vectors.pCVector;
      fExpectedBY : float := 0.0;
   begin


      pxTestNormal := Math.Vectors.pxCreate(fX => 5.0,
                                            fY => 0.0,
                                            fZ => -1.0);
      pxTestPlane := Math.Planes.pxCreate(pxNormalVector      => pxTestNormal,
                                          fDistanceFromOrigin => 0.0);

      AUnit.Assertions.Assert(Condition => abs(pxTestPlane.fGet_BY - fExpectedBY) < 0.001,
                              Message   => "CPlane.fGet_BY failed, wrong BY value. Value: " & float'Image(pxTestPlane.fGet_BY) & ". Expected: " & float'Image(fExpectedBY) & ".");

--  begin read only
   end Test_fGet_BY;
--  end read only


--  begin read only
   procedure Test_fGet_CZ (Gnattest_T : in out Test_CPlane);
   procedure Test_fGet_CZ_fc3177 (Gnattest_T : in out Test_CPlane) renames Test_fGet_CZ;
--  id:2.1/fc31771bb682fd12/fGet_CZ/1/0/
   procedure Test_fGet_CZ (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:13:4:fGet_CZ
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestPlane : pCPlane;
      pxTestNormal : Math.Vectors.pCVector;
      fExpectedCZ : float := -0.196116;
   begin


      pxTestNormal := Math.Vectors.pxCreate(fX => 5.0,
                                            fY => 0.0,
                                            fZ => -1.0);
      pxTestPlane := Math.Planes.pxCreate(pxNormalVector      => pxTestNormal,
                                          fDistanceFromOrigin => 0.0);

      AUnit.Assertions.Assert(Condition => abs(pxTestPlane.fGet_CZ - fExpectedCZ) < 0.001,
                              Message   => "CPlane.fGet_AX failed, wrong CZ value. Value: " & float'Image(pxTestPlane.fGet_CZ) & ". Expected: " & float'Image(fExpectedCZ) & ".");

--  begin read only
   end Test_fGet_CZ;
--  end read only


--  begin read only
   procedure Test_fGet_D (Gnattest_T : in out Test_CPlane);
   procedure Test_fGet_D_984437 (Gnattest_T : in out Test_CPlane) renames Test_fGet_D;
--  id:2.1/9844377972e8579e/fGet_D/1/0/
   procedure Test_fGet_D (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:14:4:fGet_D
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

      AUnit.Assertions.Assert(Condition => abs(pxTestPlane.fGet_D - fExpectedD) < 0.001,
                              Message   => "CPlane.fGet_AX failed, wrong D value. Value: " & float'Image(pxTestPlane.fGet_D) & ". Expected: " & float'Image(fExpectedD) & ".");

--  begin read only
   end Test_fGet_D;
--  end read only


--  begin read only
   procedure Test_pxGet_Normal_Vector (Gnattest_T : in out Test_CPlane);
   procedure Test_pxGet_Normal_Vector_4c7399 (Gnattest_T : in out Test_CPlane) renames Test_pxGet_Normal_Vector;
--  id:2.1/4c7399a6c0ba5408/pxGet_Normal_Vector/1/0/
   procedure Test_pxGet_Normal_Vector (Gnattest_T : in out Test_CPlane) is
   --  math-planes.ads:18:4:pxGet_Normal_Vector
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
                              Message   => "CPlane.fGet_Normal_Vector failed.");


--  begin read only
   end Test_pxGet_Normal_Vector;
--  end read only

end Math.Planes.CPlane_Test_Data.CPlane_Tests;
