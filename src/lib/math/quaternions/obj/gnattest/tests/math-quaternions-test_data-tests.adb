--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Quaternions.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Quaternions.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_01a444 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/01a444368f13390c/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  math-quaternions.ads:15:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);
      
      pxNewQuaternion : pCQuaternion;
      fExpectedXValue : float := 3.0;
      fExpectedYValue : float := 4.0;
      fExpectedZValue : float := -5.0;
      fExpectedWValue : float := 10.0;
   begin

      pxNewQuaternion := Math.Quaternions.CQuaternion'(fX => fExpectedXValue,
                                                   fY => fExpectedYValue,
                                                   fZ => fExpectedZValue,
                                                   fW => fExpectedWValue).pxGet_Allocated_Copy;
      
      AUnit.Assertions.Assert(Condition => pxNewQuaternion /= null,
                              Message   => "quaternion pointer null before free");
      
      Math.Quaternions.Free(pxQuaternionToDeallocate => pxNewQuaternion);
      
      AUnit.Assertions.Assert(Condition => pxNewQuaternion = null,
                              Message   => "quaternion pointer not null after free");

--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_1_fGet_Dot_Product (Gnattest_T : in out Test);
   procedure Test_fGet_Dot_Product_be0506 (Gnattest_T : in out Test) renames Test_1_fGet_Dot_Product;
--  id:2.1/be0506155b2e61ac/fGet_Dot_Product/1/0/
   procedure Test_1_fGet_Dot_Product (Gnattest_T : in out Test) is
   --  math-quaternions.ads:44:4:fGet_Dot_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftOperandQuaternion : pCQuaternion;
      pxRightOperandQuaternion : pCQuaternion;
      fDotProduct : float;
   begin

      --(,,,) dot (12.0,,,)
      pxLeftOperandQuaternion := Math.Quaternions.CQuaternion'(fX => 4.3,
                                                           fY => 7.3,
                                                           fZ => -12.3,
                                                           fW => 63.0).pxGet_Allocated_Copy;
      pxRightOperandQuaternion := Math.Quaternions.CQuaternion'(fX => 12.0,
                                                            fY => 76.3,
                                                            fZ => 12.3,
                                                            fW => -15.0).pxGet_Allocated_Copy;
      fDotProduct := Math.Quaternions.fGet_Dot_Product(pxLeftOperandQuaternion  => pxLeftOperandQuaternion,
                                                       pxRightOperandQuaternion => pxRightOperandQuaternion);

      AUnit.Assertions.Assert(Condition => abs(fDotProduct - (-487.7)) < 0.001,
                              Message   => "CQuaternion.fGet_Dot_Product failed, wrong value. Value: " & float'Image(fDotProduct) & ". Expected: " & float'Image(-487.7) & ".");

      Math.Quaternions.Free(pxQuaternionToDeallocate => pxLeftOperandQuaternion);
      Math.Quaternions.Free(pxQuaternionToDeallocate => pxRightOperandQuaternion);      



--  begin read only
   end Test_1_fGet_Dot_Product;
--  end read only


--  begin read only
   --  procedure Test_pxCreate (Gnattest_T : in out Test);
   --  procedure Test_pxCreate_937a51 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/937a5186dd726f3b/pxCreate/0/1/
   --  procedure Test_pxCreate (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxNewQuaternion : pCQuaternion;
--        pxTestVector : Math.Vectors.pCVector;
--        fAngle : float := 4.0;
--        fExpectedXValue : float := 1.0;
--        fExpectedYValue : float := 1.0;
--        fExpectedZValue : float := 0.0;
--     begin
--  
--        pxTestVector := Math.Vectors.xCreate(fX => fExpectedXValue,
--                                              fY => fExpectedYValue,
--                                              fZ => fExpectedZValue).pxGet_Allocated_Copy;
--        pxNewQuaternion := Math.Quaternions.xCreate(pxAxisVector    => pxTestVector,
--                                                     fAngleInDegrees => fAngle).pxGet_Allocated_Copy;
--  
--        pxTestVector.Copy_From(pxTestVector.xGet_Normalized);
--        fExpectedXValue := pxTestVector.fGet_X;
--        fExpectedYValue := pxTestVector.fGet_Y;
--        fExpectedZValue := pxTestVector.fGet_Z;
--  
--        pxTestVector.Copy_From(pxNewQuaternion.xGet_Axis_Vector);
--  
--        AUnit.Assertions.Assert(Condition => abs(pxTestVector.fGet_X - fExpectedXValue) < 0.001,
--                                Message   => "CQuaternion.pxCreate failed, fX got the wrong value.");
--        AUnit.Assertions.Assert(Condition => abs(pxTestVector.fGet_Y - fExpectedYValue) < 0.001,
--                                Message   => "CQuaternion.pxCreate failed, fY got the wrong value.");
--        AUnit.Assertions.Assert(Condition => abs(pxTestVector.fGet_Z - fExpectedZValue) < 0.001,
--                                Message   => "CQuaternion.pxCreate failed, fZ got the wrong value.");
--        AUnit.Assertions.Assert(Condition => abs(pxNewQuaternion.fGet_Angle_In_Degrees - fAngle) < 0.001,
--                                Message   => "CQuaternion.pxCreate failed, fW got the wrong value. Angle: " & float'Image(pxNewQuaternion.fGet_Angle_In_Degrees));
--        AUnit.Assertions.Assert(Condition => abs(pxNewQuaternion.fGet_Length_Squared - 1.0) < 0.0001,
--                                Message => "CQuaternion.pxCreate failed, constructed quaternion is not a unit quaternion.");
--        
--        Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--        Math.Quaternions.Free(pxQuaternionToDeallocate => pxNewQuaternion);
--  
--  begin read only
   --  end Test_pxCreate;
--  end read only


--  begin read only
   --  procedure Test_pxCreate (Gnattest_T : in out Test);
   --  procedure Test_pxCreate_944041 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/94404173a2d126d0/pxCreate/0/1/
   --  procedure Test_pxCreate (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxLeftOperandQuaternion : pCQuaternion;
--        pxRightOperandQuaternion : pCQuaternion;
--        fDotProduct : float;
--     begin
--  
--        --(,,,) dot (12.0,,,)
--        pxLeftOperandQuaternion := Math.Quaternions.CQuaternion'(fX => 4.3,
--                                                             fY => 7.3,
--                                                             fZ => -12.3,
--                                                             fW => 63.0).pxGet_Allocated_Copy;
--        pxRightOperandQuaternion := Math.Quaternions.CQuaternion'(fX => 12.0,
--                                                              fY => 76.3,
--                                                              fZ => 12.3,
--                                                              fW => -15.0).pxGet_Allocated_Copy;
--        fDotProduct := Math.Quaternions.fGet_Dot_Product(pxLeftOperandQuaternion.all, pxRightOperandQuaternion);
--  
--        AUnit.Assertions.Assert(Condition => abs(fDotProduct - (-487.7)) < 0.001,
--                                Message   => "CQuaternion.fGet_Dot_Product failed, wrong value. Value: " & float'Image(fDotProduct) & ". Expected: " & float'Image(-487.7) & ".");
--  
--        Math.Quaternions.Free(pxQuaternionToDeallocate => pxLeftOperandQuaternion);
--        Math.Quaternions.Free(pxQuaternionToDeallocate => pxRightOperandQuaternion);      
--  
--  
--  begin read only
   --  end Test_pxCreate;
--  end read only


--  begin read only
   --  procedure Test_pxCreate (Gnattest_T : in out Test);
   --  procedure Test_pxCreate_a90dd2 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/a90dd20a6e115ee9/pxCreate/1/1/
   --  procedure Test_pxCreate (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxNewQuaternion : pCQuaternion;
--        fExpectedXValue : float := 3.0;
--        fExpectedYValue : float := 4.0;
--        fExpectedZValue : float := -5.0;
--        fExpectedWValue : float := 10.0;
--     begin
--  
--        pxNewQuaternion := Math.Quaternions.CQuaternion'(fX => fExpectedXValue,
--                                                     fY => fExpectedYValue,
--                                                     fZ => fExpectedZValue,
--                                                     fW => fExpectedWValue).pxGet_Allocated_Copy;
--  
--  
--        AUnit.Assertions.Assert(Condition => pxNewQuaternion.fX = fExpectedXValue,
--                                Message   => "CQuaternion.pxCreate failed, fX got the wrong value. Value:" & float'Image(pxNewQuaternion.fX) & ". Expected:" & float'Image(fExpectedXValue) & ".");
--        AUnit.Assertions.Assert(Condition => pxNewQuaternion.fY = fExpectedYValue,
--                                Message   => "CQuaternion.pxCreate failed, fY got the wrong value. Value:" & float'Image(pxNewQuaternion.fY) & ". Expected:" & float'Image(fExpectedYValue) & ".");
--        AUnit.Assertions.Assert(Condition => pxNewQuaternion.fZ = fExpectedZValue,
--                                Message   => "CQuaternion.pxCreate failed, fZ got the wrong value. Value:" & float'Image(pxNewQuaternion.fZ) & ". Expected:" & float'Image(fExpectedZValue) & ".");
--        AUnit.Assertions.Assert(Condition => pxNewQuaternion.fW = fExpectedWValue,
--                                Message   => "CQuaternion.pxCreate failed, fW got the wrong value. Value:" & float'Image(pxNewQuaternion.fW) & ". Expected:" & float'Image(fExpectedWValue) & ".");
--  
--        Math.Quaternions.Free(pxQuaternionToDeallocate => pxNewQuaternion);
--        
--  begin read only
   --  end Test_pxCreate;
--  end read only

end Math.Quaternions.Test_Data.Tests;
