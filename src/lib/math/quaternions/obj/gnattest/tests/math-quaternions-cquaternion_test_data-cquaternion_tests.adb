--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Quaternions.CQuaternion_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Quaternions.CQuaternion_Test_Data.CQuaternion_Tests is


--  begin read only
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CQuaternion);
   procedure Test_pxGet_Copy_d4ad30 (Gnattest_T : in out Test_CQuaternion) renames Test_pxGet_Copy;
--  id:2.1/d4ad3014ebf1a501/pxGet_Copy/1/0/
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:12:4:pxGet_Copy
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestQuaternion : pCQuaternion;
      pxCopiedQuaternion : pCQuaternion;
      fExpectedXValue : float := 3.0;
      fExpectedYValue : float := 4.0;
      fExpectedZValue : float := -5.0;
      fExpectedWValue : float := 10.0;
   begin

      pxTestQuaternion := Math.Quaternions.pxCreate(fX => fExpectedXValue,
                                                    fY => fExpectedYValue,
                                                    fZ => fExpectedZValue,
                                                    fW => fExpectedWValue);
      pxCopiedQuaternion := pxTestQuaternion.pxGet_Copy;

      AUnit.Assertions.Assert(Condition => pxCopiedQuaternion'Address /= pxTestQuaternion'Address,
                              Message   => "CQuaternion.pxGet_Copy failed, pointer to copy is the same as pointer to original.");

      AUnit.Assertions.Assert(Condition => pxCopiedQuaternion.fX = fExpectedXValue,
                              Message   => "CQuaternion.pxGet_Copy failed, fX got the wrong value. Value:" & float'Image(pxCopiedQuaternion.fX) & ". Expected:" & float'Image(fExpectedXValue) & ".");
      AUnit.Assertions.Assert(Condition => pxCopiedQuaternion.fY = fExpectedYValue,
                              Message   => "CQuaternion.pxGet_Copy failed, fY got the wrong value. Value:" & float'Image(pxCopiedQuaternion.fY) & ". Expected:" & float'Image(fExpectedYValue) & ".");
      AUnit.Assertions.Assert(Condition => pxCopiedQuaternion.fZ = fExpectedZValue,
                              Message   => "CQuaternion.pxGet_Copy failed, fZ got the wrong value. Value:" & float'Image(pxCopiedQuaternion.fZ) & ". Expected:" & float'Image(fExpectedZValue) & ".");
      AUnit.Assertions.Assert(Condition => pxCopiedQuaternion.fW = fExpectedWValue,
                              Message   => "CQuaternion.pxGet_Copy failed, fW got the wrong value. Value:" & float'Image(pxCopiedQuaternion.fW) & ". Expected:" & float'Image(fExpectedWValue) & ".");
--  begin read only
   end Test_pxGet_Copy;
--  end read only


--  begin read only
   procedure Test_pxGet_Normalized (Gnattest_T : in out Test_CQuaternion);
   procedure Test_pxGet_Normalized_be75a2 (Gnattest_T : in out Test_CQuaternion) renames Test_pxGet_Normalized;
--  id:2.1/be75a2cbb1bc553a/pxGet_Normalized/1/0/
   procedure Test_pxGet_Normalized (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:21:4:pxGet_Normalized
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestQuaternion : pCQuaternion;
      pxNormalizedQuaternion : pCQuaternion;
   begin

      pxTestQuaternion := Math.Quaternions.pxCreate(fX => 15.0,
                                                    fY => 2.0,
                                                    fZ => -15.3,
                                                    fW => 93.0);
      pxNormalizedQuaternion := pxTestQuaternion.pxGet_Normalized;

      AUnit.Assertions.Assert(Condition => pxTestQuaternion'Address /= pxNormalizedQuaternion'Address,
                              Message   => "CQuaternion.pxGet_Normalized failed, pointer to normalized quaternion is the same as pointer to original quaternion.");


      AUnit.Assertions.Assert(Condition => abs(pxNormalizedQuaternion.fGet_Length_Squared - 1.0) < 0.001,
                              Message   => "CQuaternion.pxGet_Normalized failed, length is wrong. Value: " & float'Image(pxNormalizedQuaternion.fGet_Length) & ". Expected: " & float'Image(1.0) & ".");
      AUnit.Assertions.Assert(Condition => abs(pxNormalizedQuaternion.fX - (pxTestQuaternion.fX / pxTestQuaternion.fGet_Length)) < 0.001,
                              Message   => "CQuaternion.pxGet_Normalized failed, fX got wrong value. Value: " & float'Image(pxNormalizedQuaternion.fX) & ". Expected: " & float'Image(pxTestQuaternion.fX / pxTestQuaternion.fGet_Length) & ".");
      AUnit.Assertions.Assert(Condition => abs(pxNormalizedQuaternion.fY - (pxTestQuaternion.fY / pxTestQuaternion.fGet_Length)) < 0.001,
                              Message   => "CQuaternion.pxGet_Normalized failed, fY got wrong value. Value: " & float'Image(pxNormalizedQuaternion.fY) & ". Expected: " & float'Image(pxTestQuaternion.fY / pxTestQuaternion.fGet_Length) & ".");
      AUnit.Assertions.Assert(Condition => abs(pxNormalizedQuaternion.fZ - (pxTestQuaternion.fZ / pxTestQuaternion.fGet_Length)) < 0.001,
                              Message   => "CQuaternion.pxGet_Normalized failed, fZ got wrong value. Value: " & float'Image(pxNormalizedQuaternion.fZ) & ". Expected: " & float'Image(pxTestQuaternion.fZ / pxTestQuaternion.fGet_Length) & ".");
      AUnit.Assertions.Assert(Condition => abs(pxNormalizedQuaternion.fW - (pxTestQuaternion.fW / pxTestQuaternion.fGet_Length)) < 0.001,
                              Message   => "CQuaternion.pxGet_Normalized failed, fW got wrong value. Value: " & float'Image(pxNormalizedQuaternion.fW) & ". Expected: " & float'Image(pxTestQuaternion.fW / pxTestQuaternion.fGet_Length) & ".");

     -- test exceptions
      pxTestQuaternion := Math.Quaternions.pxCreate(fX => 0.0,
                                                    fY => 0.0,
                                                    fZ => 0.0,
                                                    fW => 0.0);
      pxNormalizedQuaternion := pxTestQuaternion.pxGet_Normalized;
      AUnit.Assertions.Assert(Condition => False,
                              Message   => "CQuaternion.pxGet_Normalized division by zero failed, should have raised exception");
   exception
      when Numeric_Error =>
         null; -- Test passed
      when E : others =>
         AUnit.Assertions.Assert(Condition => False,
                           Message   =>"CQuaternion.pxGet_Normalized division by zero failed, wrong exception raised: " & Ada.Exceptions.Exception_Name (E) & ". Expected: NUMERIC_ERROR.");




--  begin read only
   end Test_pxGet_Normalized;
--  end read only


--  begin read only
   procedure Test_fGet_Length (Gnattest_T : in out Test_CQuaternion);
   procedure Test_fGet_Length_a40d15 (Gnattest_T : in out Test_CQuaternion) renames Test_fGet_Length;
--  id:2.1/a40d15467fa6b82e/fGet_Length/1/0/
   procedure Test_fGet_Length (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:23:4:fGet_Length
--  end read only

      pragma Unreferenced (Gnattest_T);
      --(4.3,7.3,-12.3,63.0)
      pxTestQuaternion : pCQuaternion;
   begin

      pxTestQuaternion := Math.Quaternions.pxCreate(fX => 4.3,
                                                    fY => 7.3,
                                                    fZ => -12.3,
                                                    fW => 63.0);

      AUnit.Assertions.Assert(Condition => abs(pxTestQuaternion.fGet_Length - 64.7462) < 0.001,
                              Message   => "CQuaternion.pxGet_Length failed, wrong value. Value: " & float'Image(pxTestQuaternion.fGet_Length) & ". Expected: " & float'Image(64.7462) & ".");

--  begin read only
   end Test_fGet_Length;
--  end read only


--  begin read only
   procedure Test_fGet_Length_Squared (Gnattest_T : in out Test_CQuaternion);
   procedure Test_fGet_Length_Squared_4d190d (Gnattest_T : in out Test_CQuaternion) renames Test_fGet_Length_Squared;
--  id:2.1/4d190d2d13e2b130/fGet_Length_Squared/1/0/
   procedure Test_fGet_Length_Squared (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:24:4:fGet_Length_Squared
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestQuaternion : pCQuaternion;
   begin

      pxTestQuaternion := Math.Quaternions.pxCreate(fX => 4.3,
                                                    fY => 7.3,
                                                    fZ => -12.3,
                                                    fW => 63.0);

      AUnit.Assertions.Assert(Condition => abs(pxTestQuaternion.fGet_Length_Squared - 4192.07041444) < 0.001,
                              Message   => "CQuaternion.pxGet_Length_Squared failed, wrong value. Value: " & float'Image(pxTestQuaternion.fGet_Length_Squared) & ". Expected: " & float'Image(4192.07041444) & ".");

--  begin read only
   end Test_fGet_Length_Squared;
--  end read only


--  begin read only
   procedure Test_fGet_X (Gnattest_T : in out Test_CQuaternion);
   procedure Test_fGet_X_42438b (Gnattest_T : in out Test_CQuaternion) renames Test_fGet_X;
--  id:2.1/42438b75dc7e62f2/fGet_X/1/0/
   procedure Test_fGet_X (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:25:4:fGet_X
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestQuaternion : pCQuaternion;
   begin


      pxTestQuaternion := Math.Quaternions.pxCreate(fX => 4.3,
                                                    fY => 7.3,
                                                    fZ => -12.3,
                                                    fW => 63.0);

      AUnit.Assertions.Assert(Condition => pxTestQuaternion.fGet_X = 4.3,
                              Message   => "CQuaternion.pxGet_X failed, wrong value. Value: " & float'Image(pxTestQuaternion.fGet_X) & ". Expected: " & float'Image(4.3) & ".");

--  begin read only
   end Test_fGet_X;
--  end read only


--  begin read only
   procedure Test_fGet_Y (Gnattest_T : in out Test_CQuaternion);
   procedure Test_fGet_Y_c7b5f1 (Gnattest_T : in out Test_CQuaternion) renames Test_fGet_Y;
--  id:2.1/c7b5f1b72b128413/fGet_Y/1/0/
   procedure Test_fGet_Y (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:26:4:fGet_Y
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestQuaternion : pCQuaternion;
   begin

      pxTestQuaternion := Math.Quaternions.pxCreate(fX => 4.3,
                                                    fY => 7.3,
                                                    fZ => -12.3,
                                                    fW => 63.0);

      AUnit.Assertions.Assert(Condition => pxTestQuaternion.fGet_Y = 7.3,
                              Message   => "CQuaternion.pxGet_Y failed, wrong value. Value: " & float'Image(pxTestQuaternion.fGet_Y) & ". Expected: " & float'Image(7.3) & ".");

--  begin read only
   end Test_fGet_Y;
--  end read only


--  begin read only
   procedure Test_fGet_Z (Gnattest_T : in out Test_CQuaternion);
   procedure Test_fGet_Z_dfd5d9 (Gnattest_T : in out Test_CQuaternion) renames Test_fGet_Z;
--  id:2.1/dfd5d94f2be36c5a/fGet_Z/1/0/
   procedure Test_fGet_Z (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:27:4:fGet_Z
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestQuaternion : pCQuaternion;
   begin

      pxTestQuaternion := Math.Quaternions.pxCreate(fX => 4.3,
                                                    fY => 7.3,
                                                    fZ => -12.3,
                                                    fW => 63.0);

      AUnit.Assertions.Assert(Condition => pxTestQuaternion.fGet_Z = -12.3,
                              Message   => "CQuaternion.pxGet_Z failed, wrong value. Value: " & float'Image(pxTestQuaternion.fGet_Z) & ". Expected: " & float'Image(-12.3) & ".");

--  begin read only
   end Test_fGet_Z;
--  end read only


--  begin read only
   procedure Test_fGet_W (Gnattest_T : in out Test_CQuaternion);
   procedure Test_fGet_W_90387e (Gnattest_T : in out Test_CQuaternion) renames Test_fGet_W;
--  id:2.1/90387ea4bd39b36b/fGet_W/1/0/
   procedure Test_fGet_W (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:28:4:fGet_W
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestQuaternion : pCQuaternion;
   begin

      pxTestQuaternion := Math.Quaternions.pxCreate(fX => 4.3,
                                                    fY => 7.3,
                                                    fZ => -12.3,
                                                    fW => 63.0);

      AUnit.Assertions.Assert(Condition => pxTestQuaternion.fGet_W = 63.0,
                              Message   => "CQuaternion.pxGet_W failed, wrong value. Value: " & float'Image(pxTestQuaternion.fGet_W) & ". Expected: " & float'Image(63.0) & ".");

--  begin read only
   end Test_fGet_W;
--  end read only


--  begin read only
   procedure Test_fGet_Axis_Vector (Gnattest_T : in out Test_CQuaternion);
   procedure Test_fGet_Axis_Vector_cd62fd (Gnattest_T : in out Test_CQuaternion) renames Test_fGet_Axis_Vector;
--  id:2.1/cd62fdaca3d8f8a6/fGet_Axis_Vector/1/0/
   procedure Test_fGet_Axis_Vector (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:29:4:fGet_Axis_Vector
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : Math.Vectors.pCVector;
      pxTestQuaternion : Math.Quaternions.pCQuaternion;
      pxAxisVector : Math.Vectors.pCVector;

   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 4.0,
                                            fY => 16.3,
                                            fZ => -23.0);
      pxTestQuaternion := Math.Quaternions.pxCreate(pxAxisVector    => pxTestVector,
                                                    fAngleInDegrees => 90.0);


      pxTestVector := pxTestVector.pxGet_Normalized;
      pxAxisVector := pxTestQuaternion.fGet_Axis_Vector;

      AUnit.Assertions.Assert(Condition => abs(pxAxisVector.fGet_X - pxTestVector.fGet_X) < 0.001,
                              Message   => "CQuaternion.pxGet_Axis_Vector failed, wrong X value. Value: " & float'Image(pxAxisVector.fGet_X) & ". Expected: " & float'Image(pxTestVector.fGet_X) & ".");
      AUnit.Assertions.Assert(Condition => abs(pxAxisVector.fGet_Y - pxTestVector.fGet_Y) < 0.001,
                              Message   => "CQuaternion.pxGet_Axis_Vector failed, wrong Y value. Value: " & float'Image(pxAxisVector.fGet_Y) & ". Expected: " & float'Image(pxTestVector.fGet_Y) & ".");
      AUnit.Assertions.Assert(Condition => abs(pxAxisVector.fGet_Z - pxTestVector.fGet_Z) < 0.001,
                              Message   => "CQuaternion.pxGet_Axis_Vector failed, wrong Z value. Value: " & float'Image(pxAxisVector.fGet_Z) & ". Expected: " & float'Image(pxTestVector.fGet_Z) & ".");

      pxTestQuaternion := Math.Quaternions.pxCreate(pxAxisVector    => pxTestVector,
                                                    fAngleInDegrees => 0.0);


      pxTestVector := Math.Vectors.pxCreate(fX => 1.0,
                                            fY => 0.0,
                                            fZ => 0.0);
      pxAxisVector := pxTestQuaternion.fGet_Axis_Vector;

      AUnit.Assertions.Assert(Condition => abs(pxAxisVector.fGet_X - pxTestVector.fGet_X) < 0.001,
                              Message   => "CQuaternion.pxGet_Axis_Vector failed, wrong X value. Value: " & float'Image(pxAxisVector.fGet_X) & ". Expected: " & float'Image(pxTestVector.fGet_X) & ".");
      AUnit.Assertions.Assert(Condition => abs(pxAxisVector.fGet_Y - pxTestVector.fGet_Y) < 0.001,
                              Message   => "CQuaternion.pxGet_Axis_Vector failed, wrong Y value. Value: " & float'Image(pxAxisVector.fGet_Y) & ". Expected: " & float'Image(pxTestVector.fGet_Y) & ".");
      AUnit.Assertions.Assert(Condition => abs(pxAxisVector.fGet_Z - pxTestVector.fGet_Z) < 0.001,
                              Message   => "CQuaternion.pxGet_Axis_Vector failed, wrong Z value. Value: " & float'Image(pxAxisVector.fGet_Z) & ". Expected: " & float'Image(pxTestVector.fGet_Z) & ".");

--  begin read only
   end Test_fGet_Axis_Vector;
--  end read only


--  begin read only
   procedure Test_fGet_Angle_In_Degrees (Gnattest_T : in out Test_CQuaternion);
   procedure Test_fGet_Angle_In_Degrees_ce63d3 (Gnattest_T : in out Test_CQuaternion) renames Test_fGet_Angle_In_Degrees;
--  id:2.1/ce63d3a8aac7255b/fGet_Angle_In_Degrees/1/0/
   procedure Test_fGet_Angle_In_Degrees (Gnattest_T : in out Test_CQuaternion) is
   --  math-quaternions.ads:30:4:fGet_Angle_In_Degrees
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestQuaternion : Math.Quaternions.pCQuaternion;
      fAngle : float;
   begin

      fAngle := 43.0;
      pxTestQuaternion := Math.Quaternions.pxCreate(pxAxisVector    => Math.Vectors.pxCreate(fX => 34.0,
                                                                                             fY => 12.0,
                                                                                             fZ => -345.2),
                                                    fAngleInDegrees => fAngle);
      AUnit.Assertions.Assert(Condition => abs(pxTestQuaternion.fGet_Angle_In_Degrees - fAngle) < 0.001,
                              Message   => "CQuaternion.pxGet_Angle_In_Degrees failed, wrong value. Value: " & float'Image(pxTestQuaternion.fGet_Angle_In_Degrees) & ". Expected: " & float'Image(fAngle) & ".");

--  begin read only
   end Test_fGet_Angle_In_Degrees;
--  end read only



end Math.Quaternions.CQuaternion_Test_Data.CQuaternion_Tests;
