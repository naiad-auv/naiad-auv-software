--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Vectors.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Vectors.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_ab2bd0 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/ab2bd0f315f8e8bc/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  math-vectors.ads:23:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Free;
--  end read only


--  begin read only
   procedure Test_1_fDot_Product (Gnattest_T : in out Test);
   procedure Test_fDot_Product_c7f274 (Gnattest_T : in out Test) renames Test_1_fDot_Product;
--  id:2.1/c7f2740134530e93/fDot_Product/1/0/
   procedure Test_1_fDot_Product (Gnattest_T : in out Test) is
   --  math-vectors.ads:102:4:fDot_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

      fDotProduct : float;
      pxLeftOperandVector : Math.Vectors.pCVector;
      pxRightOperandVector : Math.Vectors.pCVector;

   begin

      pxLeftOperandVector := Math.Vectors.xCreate(fX => 5.0,
                                                  fY => 2.0,
                                                  fZ => 3.0).pxGet_Allocated_Copy;
      pxRightOperandVector := Math.Vectors.xCreate(fX => 2.0,
                                                   fY => 7.0,
                                                   fZ => 3.0).pxGet_Allocated_Copy;
      fDotProduct := Math.Vectors.fDot_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                                     pxRightOperandVector => pxRightOperandVector);



      AUnit.Assertions.Assert(Condition => fDotProduct = 33.0,
                              Message   => "Vectors.fDot_Product failed, wrong result in first test, expected 33.0 actual: " & float'Image(fDotProduct));

      Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
      Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);
      pxLeftOperandVector := Math.Vectors.xCreate(fX => 5.0,
                                                  fY => 0.0,
                                                  fZ => 0.0).pxGet_Allocated_Copy;
      pxRightOperandVector := Math.Vectors.xCreate(fX => 0.0,
                                                   fY => 5.0,
                                                   fZ => 0.0).pxGet_Allocated_Copy;
      fDotProduct := Math.Vectors.fDot_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                                     pxRightOperandVector => pxRightOperandVector);

      AUnit.Assertions.Assert(Condition => fDotProduct = 0.0,
                              Message   => "Vectors.fDot_Product failed, wrong result in second test, expected 0.0, actual: " & float'Image(fDotProduct));

      Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
      Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);

--  begin read only
   end Test_1_fDot_Product;
--  end read only


--  begin read only
   procedure Test_1_fAngle_Between_In_Radians (Gnattest_T : in out Test);
   procedure Test_fAngle_Between_In_Radians_bc2ea1 (Gnattest_T : in out Test) renames Test_1_fAngle_Between_In_Radians;
--  id:2.1/bc2ea109e66f4b4e/fAngle_Between_In_Radians/1/0/
   procedure Test_1_fAngle_Between_In_Radians (Gnattest_T : in out Test) is
   --  math-vectors.ads:118:4:fAngle_Between_In_Radians
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftOperandVector : pCVector;
      pxRightOperandVector : pCVector;
      fAngleBetweenVectors : float;
   begin

      pxLeftOperandVector := Math.Vectors.xCreate(fX => 5.0,
                                                         fY => 0.0,
                                                         fZ => 0.0).pxGet_Allocated_Copy;
      pxRightOperandVector := Math.Vectors.xCreate(fX => 0.0,
                                                          fY => 5.0,
                                                          fZ => 0.0).pxGet_Allocated_Copy;
      fAngleBetweenVectors := Math.Vectors.fAngle_Between_In_Radians(pxLeftOperandVector  => pxLeftOperandVector,
                                                                pxRightOperandVector => pxRightOperandVector);

      AUnit.Assertions.Assert(Condition => abs(fAngleBetweenVectors - (Ada.Numerics.Pi / 2.0)) < 0.001,
                              Message => "Vectors.fAngle_Between_In_Radians failed expected PI/2, actual :" & float'Image(fAngleBetweenVectors));
      Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
      Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);

--  begin read only
   end Test_1_fAngle_Between_In_Radians;
--  end read only


--  begin read only
   --  procedure Test_Multiply (Gnattest_T : in out Test);
   --  procedure Test_Multiply_0ee37b (Gnattest_T : in out Test) renames Test_Multiply;
--  id:2.1/0ee37b12b5882ab2/Multiply/0/1/
   --  procedure Test_Multiply (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use System;
--  
--        pxScaledVector : Math.Vectors.pCVector;
--        pxRightOperandVector : Math.Vectors.pCVector;
--        fLeftOperand : float;
--  
--  
--     begin
--  
--        pxRightOperandVector := Math.Vectors.xCreate(fX => 2.0,
--                                                    fY => 5.0,
--                                                    fZ => 4.0).pxGet_Allocated_Copy;
--        fLeftOperand := 5.0;
--  
--        pxScaledVector := CVector(fLeftOperand * pxRightOperandVector).pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxScaledVector.fX = 10.0,
--                                Message   => "CVector.*(binary float * CVector) failed, fX got the wrong value, expected 10.0, actual: " & float'Image(pxScaledVector.fX));
--        AUnit.Assertions.Assert(Condition => pxScaledVector.fY = 25.0,
--                                Message   => "CVector.*(binary float * CVector) failed, fY got the wrong value, expected 25.0, actual: " & float'Image(pxScaledVector.fY));
--        AUnit.Assertions.Assert(Condition => pxScaledVector.fZ = 20.0,
--                                Message   => "CVector.*(binary float * CVector) failed, fZ got the wrong value, expected 20.0, actual: " & float'Image(pxScaledVector.fZ));
--  
--        AUnit.Assertions.Assert(Condition => (pxScaledVector.all'Address /= pxRightOperandVector.all'Address),
--                                Message => "CVector.*(binary float * CVector) failed, prodVector is shallow copy of the operand");
--  
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxScaledVector);
--  
--  begin read only
   --  end Test_Multiply;
--  end read only


--  begin read only
   --  procedure Test_pxCross_Product (Gnattest_T : in out Test);
   --  procedure Test_pxCross_Product_66fc3c (Gnattest_T : in out Test) renames Test_pxCross_Product;
--  id:2.1/66fc3c56b607d747/pxCross_Product/1/1/
   --  procedure Test_pxCross_Product (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use System;
--  
--        pxCrossProductVector : pCVector;
--        pxLeftOperandVector : pCVector;
--        pxRightOperandVector : pCVector;
--        xCross : CVector;
--  
--     begin
--  
--        pxLeftOperandVector := Math.Vectors.xCreate(fX => 1.0,
--                                                           fY => 5.0,
--                                                           fZ => 2.0).pxGet_Allocated_Copy;
--        pxRightOperandVector := Math.Vectors.xCreate(fX => 4.0,
--                                                            fY => 5.2,
--                                                            fZ => -10.0).pxGet_Allocated_Copy;
--  
--  
--        xCross := Math.Vectors.xCross_Product(pxLeftOperandVector,
--                                              pxRightOperandVector);
--          pxCrossProductVector := xCross.pxGet_Allocated_Copy;
--  --        --(1.0,5.0,2.0) cross (4.0,5.2,-10.0)
--  --        -- (-60.4, 18., -14.8)
--  --        AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fX - (-60.4)) < 0.001,
--  --                                Message   => "Vectors.pxCross_Product failed, fX got the wrong value, expected -60.4, actual: " & float'Image(pxCrossProductVector.fX));
--  --        AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fY - 18.0) < 0.001,
--  --                                Message   => "Vectors.pxCross_Product failed, fY got the wrong value, expected -18.0, actual: " & float'Image(pxCrossProductVector.fY));
--  --        AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fZ - (-14.8)) < 0.001,
--  --                                Message   => "Vectors.pxCross_Product failed, fZ got the wrong value, expected -14.8, actual: " & float'Image(pxCrossProductVector.fZ));
--  --
--  --
--  --        AUnit.Assertions.Assert(Condition => (pxCrossProductVector.all'Address /= pxLeftOperandVector.all'Address) and then (pxCrossProductVector.all'Address /= pxRightOperandVector.all'Address),
--  --                                Message => "Vectors.pxCross_Product failed, crossAddress is shallow copy of one operand");
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);
--  --      Math.Vectors.Free(pxVectorToDeallocate => pxCrossProductVector);
--  begin read only
   --  end Test_pxCross_Product;
--  end read only


--  begin read only
   --  procedure Test_Multiply (Gnattest_T : in out Test);
   --  procedure Test_Multiply_7d0b9c (Gnattest_T : in out Test) renames Test_Multiply;
--  id:2.1/7d0b9c6e2effe1ba/Multiply/1/1/
   --  procedure Test_Multiply (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use System;
--  
--        pxProductVector : Math.Vectors.pCVector;
--        pxLeftOperandVector, pxRightOperandVector : Math.Vectors.pCVector;
--  
--     begin
--  
--        pxLeftOperandVector := Math.Vectors.xCreate(fX => 2.0,
--                                                    fY => 5.0,
--                                                    fZ => 4.0).pxGet_Allocated_Copy;
--        pxRightOperandVector := Math.Vectors.xCreate(fX => 3.0,
--                                                     fY => 10.0,
--                                                     fZ => 7.0).pxGet_Allocated_Copy;
--        pxProductVector := CVector(pxLeftOperandVector * pxRightOperandVector).pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxProductVector.fX = 6.0,
--                                Message   => "CVector.*(binary CVector * CVector) failed, fX got the wrong value, expected 6.0, actual: " & float'Image(pxProductVector.fX));
--        AUnit.Assertions.Assert(Condition => pxProductVector.fY = 50.0,
--                                Message   => "CVector.*(binary CVector * CVector) failed, fY got the wrong value, expected 50.0, actual: " & float'Image(pxProductVector.fY));
--        AUnit.Assertions.Assert(Condition => pxProductVector.fZ = 28.0,
--                                Message   => "CVector.*(binary CVector * CVector) failed, fZ got the wrong value, expected 28.0, actual: " & float'Image(pxProductVector.fZ));
--  
--        AUnit.Assertions.Assert(Condition => (pxProductVector.all'Address /= pxLeftOperandVector.all'Address) and then (pxProductVector.all'Address /= pxRightOperandVector.all'Address),
--                                Message => "CVector.*(binary CVector * CVector) failed, prodVector is shallow copy of one operand");
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxProductVector);
--  
--  begin read only
   --  end Test_Multiply;
--  end read only


--  begin read only
   --  procedure Test_Plus (Gnattest_T : in out Test);
   --  procedure Test_Plus_9b1a3c (Gnattest_T : in out Test) renames Test_Plus;
--  id:2.1/9b1a3ccd5271e006/Plus/1/1/
   --  procedure Test_Plus (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use System;
--        pxSumVector : Math.Vectors.pCVector;
--        pxLeftOperandVector, pxRightOperandVector : Math.Vectors.pCVector;
--  
--     begin
--  
--        pxLeftOperandVector := Math.Vectors.xCreate(fX => 2.0,
--                                                    fY => 5.0,
--                                                    fZ => 4.0).pxGet_Allocated_Copy;
--        pxRightOperandVector := Math.Vectors.xCreate(fX => 3.0,
--                                                     fY => 10.0,
--                                                     fZ => 7.0).pxGet_Allocated_Copy;
--        pxSumVector := CVector(pxLeftOperandVector + pxRightOperandVector).pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxSumVector.fX = 5.0,
--                                Message   => "CVector.+(binary) failed, fX got the wrong value, expected 10.0, actual: " & float'Image(pxSumVector.fX));
--        AUnit.Assertions.Assert(Condition => pxSumVector.fY = 15.0,
--                                Message   => "CVector.+(binary) failed, fY got the wrong value, expected 15.0, actual: " & float'Image(pxSumVector.fY));
--        AUnit.Assertions.Assert(Condition => pxSumVector.fZ = 11.0,
--                                Message   => "CVector.+(binary) failed, fZ got the wrong value, expected 11.0, actual: " & float'Image(pxSumVector.fZ));
--  
--        AUnit.Assertions.Assert(Condition => (pxSumVector.all'Address /= pxLeftOperandVector.all'Address) and then (pxSumVector.all'Address /= pxRightOperandVector.all'Address),
--                                Message => "CVector.+(binary) failed, sumvector is shallow copy of one operand");
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxSumVector);
--  
--  begin read only
   --  end Test_Plus;
--  end read only


--  begin read only
   --  procedure Test_Multiply (Gnattest_T : in out Test);
   --  procedure Test_Multiply_a251df (Gnattest_T : in out Test) renames Test_Multiply;
--  id:2.1/a251df6a4b8b003f/Multiply/0/1/
   --  procedure Test_Multiply (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--        use System;
--  
--        pxScaledVector : Math.Vectors.pCVector;
--        pxLeftOperandVector : Math.Vectors.pCVector;
--        fRightOperand : float;
--  
--  
--     begin
--  
--        pxLeftOperandVector := Math.Vectors.xCreate(fX => 2.0,
--                                                    fY => 5.0,
--                                                    fZ => 4.0).pxGet_Allocated_Copy;
--        fRightOperand := 5.0;
--  
--        pxScaledVector := CVector(pxLeftOperandVector * fRightOperand).pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxScaledVector.fX = 10.0,
--                                Message   => "CVector.*(binary CVector * float) failed, fX got the wrong value, expected 10.0, actual: " & float'Image(pxScaledVector.fX));
--        AUnit.Assertions.Assert(Condition => pxScaledVector.fY = 25.0,
--                                Message   => "CVector.*(binary CVector * float) failed, fY got the wrong value, expected 25.0, actual: " & float'Image(pxScaledVector.fY));
--        AUnit.Assertions.Assert(Condition => pxScaledVector.fZ = 20.0,
--                                Message   => "CVector.*(binary CVector * float) failed, fZ got the wrong value, expected 20.0, actual: " & float'Image(pxScaledVector.fZ));
--  
--        AUnit.Assertions.Assert(Condition => (pxScaledVector.all'Address /= pxLeftOperandVector.all'Address),
--                                Message => "CVector.*(binary CVector * float) failed, prodVector is shallow copy of the operand");
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxScaledVector);
--  
--  begin read only
   --  end Test_Multiply;
--  end read only


--  begin read only
   --  procedure Test_pxCreate (Gnattest_T : in out Test);
   --  procedure Test_pxCreate_a64900 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/a64900a3c16593be/pxCreate/1/1/
   --  procedure Test_pxCreate (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxTestVector : Math.Vectors.pCVector;
--     begin
--  
--        pxTestVector := Math.Vectors.xCreate(fX => 10.0,
--                                                  fY => -10.0,
--                                                  fZ => 0.0).pxGet_Allocated_Copy;
--        AUnit.Assertions.Assert(Condition => pxTestVector.fX = 10.0,
--                                Message   => "CVector.pxCreate failed, fX got the wrong value, expected 10.0, actual: "  & float'Image(pxTestVector.fX));
--        AUnit.Assertions.Assert(Condition => pxTestVector.fY = -10.0,
--                                Message   => "CVector.pxCreate failed, fY got the wrong value, expected -10.0, actual: " & float'Image(pxTestVector.fY));
--        AUnit.Assertions.Assert(Condition => pxTestVector.fZ = 0.0,
--                                Message   => "CVector.pxCreate failed, fZ got the wrong value, expected 0.0, actual: " & float'Image(pxTestVector.fZ));
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--  
--  begin read only
   --  end Test_pxCreate;
--  end read only


--  begin read only
   --  procedure Test_Devide (Gnattest_T : in out Test);
   --  procedure Test_Devide_a9a506 (Gnattest_T : in out Test) renames Test_Devide;
--  id:2.1/a9a506fe1d5877dc/Devide/1/1/
   --  procedure Test_Devide (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use System;
--  
--        pxDividedVector : Math.Vectors.pCVector;
--        pxLeftOperandVector : Math.Vectors.pCVector;
--        fRightOperand : float;
--  
--     begin
--  
--        pxLeftOperandVector := Math.Vectors.xCreate(fX => 2.0,
--                                                    fY => 5.0,
--                                                    fZ => 4.0).pxGet_Allocated_Copy;
--        fRightOperand := 2.0;
--  
--        pxDividedVector := CVector(pxLeftOperandVector / fRightOperand).pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxDividedVector.fX = 1.0,
--                                Message   => "CVector./(binary CVector / float) failed, fX got the wrong value, expected 1.0, actual: " & float'Image(pxDividedVector.fX));
--        AUnit.Assertions.Assert(Condition => pxDividedVector.fY = 2.5,
--                                Message   => "CVector./(binary CVector / float) failed, fY got the wrong value, expected 2.5, actual: " & float'Image(pxDividedVector.fY));
--        AUnit.Assertions.Assert(Condition => pxDividedVector.fZ = 2.0,
--                                Message   => "CVector./(binary CVector / float) failed, fZ got the wrong value, expected 2.0, actual: " & float'Image(pxDividedVector.fZ));
--  
--  
--        AUnit.Assertions.Assert(Condition => (pxDividedVector.all'Address /= pxLeftOperandVector.all'Address),
--                                Message => "CVector./(binary CVector / float) failed, dividedVector is shallow copy of the operand");
--  
--  
--        -- test exceptions
--        fRightOperand := 0.0;
--        Math.Vectors.Free(pxVectorToDeallocate => pxDividedVector);
--        pxDividedVector := CVector(pxLeftOperandVector / fRightOperand).pxGet_Allocated_Copy;
--        AUnit.Assertions.Assert(Condition => False,
--                                Message   => "CVector./(binary CVector / float) division by zero failed, should have raised exception");
--     exception
--        when Exception_Handling.DivisionByZero =>
--  --           Math.Vectors.Free(pxVectorToDeallocate => pxDividedVector);
--  --           Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
--           null; -- Test passed
--        when E : others =>
--           AUnit.Assertions.Assert(Condition => False,
--                             Message   =>"CVector./(binary CVector / float) division by zero failed, wrong exception raised: " & Ada.Exceptions.Exception_Name (E) & ". Expected: NUMERIC_ERROR.");
--  
--  
--  
--  begin read only
   --  end Test_Devide;
--  end read only


--  begin read only
   --  procedure Test_Equal (Gnattest_T : in out Test);
   --  procedure Test_Equal_bc9ae7 (Gnattest_T : in out Test) renames Test_Equal;
--  id:2.1/bc9ae786a2ef6ab5/Equal/1/1/
   --  procedure Test_Equal (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        pxLeftOperandVector : pCVector;
--        pxRightOperandVector : pCVector;
--     begin
--  
--        pxLeftOperandVector := Math.Vectors.xCreate(fX => 89.2,
--                                                           fY => -2154.2,
--                                                           fZ => 49.0).pxGet_Allocated_Copy;
--        pxRightOperandVector := pxLeftOperandVector.pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxLeftOperandVector.all = pxRightOperandVector.all,
--                                Message   =>"CVector.=(binary CVector = CVector) failed. expected equal, actual not equal");
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
--        pxLeftOperandVector := Math.Vectors.xCreate(fX => 89.2,
--                                                           fY => -2154.2,
--                                                           fZ => 48.0).pxGet_Allocated_Copy;
--        --Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);
--  
--  
--        AUnit.Assertions.Assert(Condition => pxLeftOperandVector.all /= pxRightOperandVector.all,
--                                Message   =>"CVector.=(binary CVector = CVector) failed. expected not equal, actual equal");
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);
--  
--  begin read only
   --  end Test_Equal;
--  end read only


--  begin read only
   --  procedure Test_Minus (Gnattest_T : in out Test);
   --  procedure Test_Minus_dba7dd (Gnattest_T : in out Test) renames Test_Minus;
--  id:2.1/dba7dd0c3df9cf0c/Minus/1/1/
   --  procedure Test_Minus (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use System;
--  
--        pxDifferenceVector : Math.Vectors.pCVector;
--        pxLeftOperandVector, pxRightOperandVector : Math.Vectors.pCVector;
--  
--     begin
--  
--        pxLeftOperandVector := Math.Vectors.xCreate(fX => 2.0,
--                                                    fY => 5.0,
--                                                    fZ => 4.0).pxGet_Allocated_Copy;
--        pxRightOperandVector := Math.Vectors.xCreate(fX => 3.0,
--                                                     fY => 10.0,
--                                                     fZ => 7.0).pxGet_Allocated_Copy;
--        pxDifferenceVector := CVector(pxLeftOperandVector - pxRightOperandVector).pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxDifferenceVector.fX = -1.0,
--                                Message   => "CVector.-(binary) failed, fX got the wrong value, expected -1.0, actual: " & float'Image(pxDifferenceVector.fX));
--        AUnit.Assertions.Assert(Condition => pxDifferenceVector.fY = -5.0,
--                                Message   => "CVector.-(binary) failed, fY got the wrong value, expected -5.0, actual: " & float'Image(pxDifferenceVector.fY));
--        AUnit.Assertions.Assert(Condition => pxDifferenceVector.fZ = -3.0,
--                                Message   => "CVector.-(binary) failed, fZ got the wrong value, expected -3.0, actual: " & float'Image(pxDifferenceVector.fZ));
--  
--  
--        AUnit.Assertions.Assert(Condition => (pxDifferenceVector.all'Address /= pxLeftOperandVector.all'Address) and then (pxDifferenceVector.all'Address /= pxRightOperandVector.all'Address),
--                                Message => "CVector.-(binary) failed, diffVector is shallow copy of one operand");
--  
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxRightOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxDifferenceVector);
--  
--  begin read only
   --  end Test_Minus;
--  end read only


--  begin read only
   --  procedure Test_Unary_Minus (Gnattest_T : in out Test);
   --  procedure Test_Unary_Minus_f38580 (Gnattest_T : in out Test) renames Test_Unary_Minus;
--  id:2.1/f385801e321ae3a3/Unary_Minus/1/1/
   --  procedure Test_Unary_Minus (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--        use System;
--  
--        pxNegatedVector : Math.Vectors.pCVector;
--        pxOperandVector : Math.Vectors.pCVector;
--  
--     begin
--  
--        pxOperandVector := Math.Vectors.xCreate(fX => 2.0,
--                                                       fY => 5.0,
--                                                       fZ => 8.0).pxGet_Allocated_Copy;
--        pxNegatedVector := CVector(-pxOperandVector).pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxNegatedVector.fX = -2.0,
--                                Message   => "CVector.-(unary) failed, fX got the wrong value, expected -2.0, actual: " & float'Image(pxNegatedVector.fX));
--        AUnit.Assertions.Assert(Condition => pxNegatedVector.fY = -5.0,
--                                Message   => "CVector.-(unary) failed, fY got the wrong value, expected -5.0, actual: " & float'Image(pxNegatedVector.fY));
--        AUnit.Assertions.Assert(Condition => pxNegatedVector.fZ = -8.0,
--                                Message   => "CVector.-(unary) failed, fZ got the wrong value, expected -8.0, actual: " & float'Image(pxNegatedVector.fZ));
--  
--  
--  
--        AUnit.Assertions.Assert(Condition => (pxNegatedVector.all'Address /= pxOperandVector.all'Address),
--                                Message => "CVector.-(unary) failed, negatedVector is shallow copy of the operand");
--  
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxOperandVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxNegatedVector);
--  
--  begin read only
   --  end Test_Unary_Minus;
--  end read only

end Math.Vectors.Test_Data.Tests;
