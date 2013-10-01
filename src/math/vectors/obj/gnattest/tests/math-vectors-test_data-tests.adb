--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Vectors.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Vectors.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_a64900 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/a64900a3c16593be/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  math-vectors.ads:12:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : Math.Vectors.pCVector;
   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 10.0,
                                                fY => -10.0,
                                                fZ => 0.0);
      AUnit.Assertions.Assert(Condition => pxTestVector.fX = 10.0,
                              Message   => "CVector.pxCreate failed, fX got the wrong value, expected 10.0, actual: "  & float'Image(pxTestVector.fX));
      AUnit.Assertions.Assert(Condition => pxTestVector.fY = -10.0,
                              Message   => "CVector.pxCreate failed, fY got the wrong value, expected -10.0, actual: " & float'Image(pxTestVector.fY));
      AUnit.Assertions.Assert(Condition => pxTestVector.fZ = 0.0,
                              Message   => "CVector.pxCreate failed, fZ got the wrong value, expected 0.0, actual: " & float'Image(pxTestVector.fZ));

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Plus (Gnattest_T : in out Test);
   procedure Test_Plus_9b1a3c (Gnattest_T : in out Test) renames Test_Plus;
--  id:2.1/9b1a3ccd5271e006/Plus/1/0/
   procedure Test_Plus (Gnattest_T : in out Test) is
   --  math-vectors.ads:19:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxSumVector : Math.Vectors.pCVector;
      pxLeftOperandVector, pxRightOperandVector : Math.Vectors.pCVector;

      sumAddress, leftAddress, rightAddress : Address;
   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      pxRightOperandVector := Math.Vectors.pxCreate(fX => 3.0,
                                                   fY => 10.0,
                                                   fZ => 7.0);
      pxSumVector := pxLeftOperandVector + pxRightOperandVector;

      AUnit.Assertions.Assert(Condition => pxSumVector.fX = 5.0,
                              Message   => "CVector.+(binary) failed, fX got the wrong value, expected 10.0, actual: " & float'Image(pxSumVector.fX));
      AUnit.Assertions.Assert(Condition => pxSumVector.fY = 15.0,
                              Message   => "CVector.+(binary) failed, fY got the wrong value, expected 15.0, actual: " & float'Image(pxSumVector.fY));
      AUnit.Assertions.Assert(Condition => pxSumVector.fZ = 11.0,
                              Message   => "CVector.+(binary) failed, fZ got the wrong value, expected 11.0, actual: " & float'Image(pxSumVector.fZ));

      sumAddress := pxSumVector'Address;
      leftAddress := pxLeftOperandVector'Address;
      rightAddress := pxRightOperandVector'Address;

      AUnit.Assertions.Assert(Condition => (sumAddress /= leftAddress) and then (sumAddress /= rightAddress),
                              Message => "CVector.+(binary) failed, sumvector is shallow copy of one operand");


--  begin read only
   end Test_Plus;
--  end read only


--  begin read only
   procedure Test_Minus (Gnattest_T : in out Test);
   procedure Test_Minus_dba7dd (Gnattest_T : in out Test) renames Test_Minus;
--  id:2.1/dba7dd0c3df9cf0c/Minus/1/0/
   procedure Test_Minus (Gnattest_T : in out Test) is
   --  math-vectors.ads:20:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDifferenceVector : Math.Vectors.pCVector;
      pxLeftOperandVector, pxRightOperandVector : Math.Vectors.pCVector;

      diffAddress, leftAddress, rightAddress : Address;
   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      pxRightOperandVector := Math.Vectors.pxCreate(fX => 3.0,
                                                   fY => 10.0,
                                                   fZ => 7.0);
      pxDifferenceVector := pxLeftOperandVector - pxRightOperandVector;

      AUnit.Assertions.Assert(Condition => pxDifferenceVector.fX = -1.0,
                              Message   => "CVector.-(binary) failed, fX got the wrong value, expected -1.0, actual: " & float'Image(pxDifferenceVector.fX));
      AUnit.Assertions.Assert(Condition => pxDifferenceVector.fY = -5.0,
                              Message   => "CVector.-(binary) failed, fY got the wrong value, expected -5.0, actual: " & float'Image(pxDifferenceVector.fY));
      AUnit.Assertions.Assert(Condition => pxDifferenceVector.fZ = -3.0,
                              Message   => "CVector.-(binary) failed, fZ got the wrong value, expected -3.0, actual: " & float'Image(pxDifferenceVector.fZ));

      diffAddress := pxDifferenceVector'Address;
      leftAddress := pxLeftOperandVector'Address;
      rightAddress := pxRightOperandVector'Address;

      AUnit.Assertions.Assert(Condition => (diffAddress /= leftAddress) and then (diffAddress /= rightAddress),
                              Message => "CVector.-(binary) failed, diffVector is shallow copy of one operand");

--  begin read only
   end Test_Minus;
--  end read only


--  begin read only
   procedure Test_Unary_Minus (Gnattest_T : in out Test);
   procedure Test_Unary_Minus_f38580 (Gnattest_T : in out Test) renames Test_Unary_Minus;
--  id:2.1/f385801e321ae3a3/Unary_Minus/1/0/
   procedure Test_Unary_Minus (Gnattest_T : in out Test) is
   --  math-vectors.ads:21:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxNegatedVector : Math.Vectors.pCVector;
      pxOperandVector : Math.Vectors.pCVector;

      negatedAddress, operandAddress : Address;
   begin

      pxOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                     fY => 5.0,
                                                     fZ => 8.0);
      pxNegatedVector := -pxOperandVector;

      AUnit.Assertions.Assert(Condition => pxNegatedVector.fX = -2.0,
                              Message   => "CVector.-(unary) failed, fX got the wrong value, expected -2.0, actual: " & float'Image(pxNegatedVector.fX));
      AUnit.Assertions.Assert(Condition => pxNegatedVector.fY = -5.0,
                              Message   => "CVector.-(unary) failed, fY got the wrong value, expected -5.0, actual: " & float'Image(pxNegatedVector.fY));
      AUnit.Assertions.Assert(Condition => pxNegatedVector.fZ = -8.0,
                              Message   => "CVector.-(unary) failed, fZ got the wrong value, expected -8.0, actual: " & float'Image(pxNegatedVector.fZ));


      negatedAddress := pxNegatedVector'Address;
      operandAddress := pxOperandVector'Address;

      AUnit.Assertions.Assert(Condition => (negatedAddress /= operandAddress),
                              Message => "CVector.-(unary) failed, negatedVector is shallow copy of the operand");


--  begin read only
   end Test_Unary_Minus;
--  end read only


--  begin read only
   procedure Test_1_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_7d0b9c (Gnattest_T : in out Test) renames Test_1_Multiply;
--  id:2.1/7d0b9c6e2effe1ba/Multiply/1/0/
   procedure Test_1_Multiply (Gnattest_T : in out Test) is
   --  math-vectors.ads:22:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxProductVector : Math.Vectors.pCVector;
      pxLeftOperandVector, pxRightOperandVector : Math.Vectors.pCVector;

      prodAddress, leftAddress, rightAddress : Address;
   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      pxRightOperandVector := Math.Vectors.pxCreate(fX => 3.0,
                                                   fY => 10.0,
                                                   fZ => 7.0);
      pxProductVector := pxLeftOperandVector * pxRightOperandVector;

      AUnit.Assertions.Assert(Condition => pxProductVector.fX = 6.0,
                              Message   => "CVector.*(binary CVector * CVector) failed, fX got the wrong value, expected 6.0, actual: " & float'Image(pxProductVector.fX));
      AUnit.Assertions.Assert(Condition => pxProductVector.fY = 50.0,
                              Message   => "CVector.*(binary CVector * CVector) failed, fY got the wrong value, expected 50.0, actual: " & float'Image(pxProductVector.fY));
      AUnit.Assertions.Assert(Condition => pxProductVector.fZ = 28.0,
                              Message   => "CVector.*(binary CVector * CVector) failed, fZ got the wrong value, expected 28.0, actual: " & float'Image(pxProductVector.fZ));

      prodAddress := pxProductVector'Address;
      leftAddress := pxLeftOperandVector'Address;
      rightAddress := pxRightOperandVector'Address;

      AUnit.Assertions.Assert(Condition => (prodAddress /= leftAddress) and then (prodAddress /= rightAddress),
                              Message => "CVector.*(binary CVector * CVector) failed, prodVector is shallow copy of one operand");


--  begin read only
   end Test_1_Multiply;
--  end read only


--  begin read only
   procedure Test_2_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_a251df (Gnattest_T : in out Test) renames Test_2_Multiply;
--  id:2.1/a251df6a4b8b003f/Multiply/0/0/
   procedure Test_2_Multiply (Gnattest_T : in out Test) is
   --  math-vectors.ads:23:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxScaledVector : Math.Vectors.pCVector;
      pxLeftOperandVector : Math.Vectors.pCVector;
      fRightOperand : float;

      prodAddress, leftAddress : Address;
   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      fRightOperand := 5.0;

      pxScaledVector := pxLeftOperandVector * fRightOperand;

      AUnit.Assertions.Assert(Condition => pxScaledVector.fX = 10.0,
                              Message   => "CVector.*(binary CVector * float) failed, fX got the wrong value, expected 10.0, actual: " & float'Image(pxScaledVector.fX));
      AUnit.Assertions.Assert(Condition => pxScaledVector.fY = 25.0,
                              Message   => "CVector.*(binary CVector * float) failed, fY got the wrong value, expected 25.0, actual: " & float'Image(pxScaledVector.fY));
      AUnit.Assertions.Assert(Condition => pxScaledVector.fZ = 20.0,
                              Message   => "CVector.*(binary CVector * float) failed, fZ got the wrong value, expected 20.0, actual: " & float'Image(pxScaledVector.fZ));

      prodAddress := pxScaledVector'Address;
      leftAddress := pxLeftOperandVector'Address;

      AUnit.Assertions.Assert(Condition => (prodAddress /= leftAddress),
                              Message => "CVector.*(binary CVector * float) failed, prodVector is shallow copy of the operand");


--  begin read only
   end Test_2_Multiply;
--  end read only


--  begin read only
   procedure Test_3_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_0ee37b (Gnattest_T : in out Test) renames Test_3_Multiply;
--  id:2.1/0ee37b12b5882ab2/Multiply/0/0/
   procedure Test_3_Multiply (Gnattest_T : in out Test) is
   --  math-vectors.ads:24:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxScaledVector : Math.Vectors.pCVector;
      pxRightOperandVector : Math.Vectors.pCVector;
      fLeftOperand : float;

      prodAddress, rightAddress : Address;
   begin

      pxRightOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      fLeftOperand := 5.0;

      pxScaledVector := fLeftOperand * pxRightOperandVector;

      AUnit.Assertions.Assert(Condition => pxScaledVector.fX = 10.0,
                              Message   => "CVector.*(binary float * CVector) failed, fX got the wrong value, expected 10.0, actual: " & float'Image(pxScaledVector.fX));
      AUnit.Assertions.Assert(Condition => pxScaledVector.fY = 25.0,
                              Message   => "CVector.*(binary float * CVector) failed, fY got the wrong value, expected 25.0, actual: " & float'Image(pxScaledVector.fY));
      AUnit.Assertions.Assert(Condition => pxScaledVector.fZ = 20.0,
                              Message   => "CVector.*(binary float * CVector) failed, fZ got the wrong value, expected 20.0, actual: " & float'Image(pxScaledVector.fZ));


      prodAddress := pxScaledVector'Address;
      rightAddress := pxRightOperandVector'Address;

      AUnit.Assertions.Assert(Condition => (prodAddress /= rightAddress),
                              Message => "CVector.*(binary float * CVector) failed, prodVector is shallow copy of the operand");


--  begin read only
   end Test_3_Multiply;
--  end read only


--  begin read only
   procedure Test_1_Devide (Gnattest_T : in out Test);
   procedure Test_Devide_a9a506 (Gnattest_T : in out Test) renames Test_1_Devide;
--  id:2.1/a9a506fe1d5877dc/Devide/1/0/
   procedure Test_1_Devide (Gnattest_T : in out Test) is
   --  math-vectors.ads:25:4:"/"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDividedVector : Math.Vectors.pCVector;
      pxLeftOperandVector : Math.Vectors.pCVector;
      fRightOperand : float;

      dividedAddress, leftAddress : Address;
   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      fRightOperand := 2.0;

      pxDividedVector := pxLeftOperandVector / fRightOperand;

      AUnit.Assertions.Assert(Condition => pxDividedVector.fX = 1.0,
                              Message   => "CVector./(binary CVector / float) failed, fX got the wrong value, expected 1.0, actual: " & float'Image(pxDividedVector.fX));
      AUnit.Assertions.Assert(Condition => pxDividedVector.fY = 2.5,
                              Message   => "CVector./(binary CVector / float) failed, fY got the wrong value, expected 2.5, actual: " & float'Image(pxDividedVector.fY));
      AUnit.Assertions.Assert(Condition => pxDividedVector.fZ = 2.0,
                              Message   => "CVector./(binary CVector / float) failed, fZ got the wrong value, expected 2.0, actual: " & float'Image(pxDividedVector.fZ));

      dividedAddress := pxDividedVector'Address;
      leftAddress := pxLeftOperandVector'Address;

      AUnit.Assertions.Assert(Condition => (dividedAddress /= leftAddress),
                              Message => "CVector./(binary CVector / float) failed, dividedVector is shallow copy of the operand");


      -- test exceptions
      fRightOperand := 0.0;
      pxDividedVector := pxLeftOperandVector / fRightOperand;
      AUnit.Assertions.Assert(Condition => False,
                              Message   => "CVector./(binary CVector / float) division by zero failed, should have raised exception");
   exception
      when Numeric_Error =>
         null; -- Test passed
      when E : others =>
         AUnit.Assertions.Assert(Condition => False,
                           Message   =>"CVector./(binary CVector / float) division by zero failed, wrong exception raised: " & Ada.Exceptions.Exception_Name (E) & ". Expected: NUMERIC_ERROR.");



--  begin read only
   end Test_1_Devide;
--  end read only


--  begin read only
   procedure Test_Equal (Gnattest_T : in out Test);
   procedure Test_Equal_bc9ae7 (Gnattest_T : in out Test) renames Test_Equal;
--  id:2.1/bc9ae786a2ef6ab5/Equal/1/0/
   procedure Test_Equal (Gnattest_T : in out Test) is
   --  math-vectors.ads:26:4:"="
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftOperandVector : pCVector;
      pxRightOperandVector : pCVector;
   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 89.2,
                                                         fY => -2154.2,
                                                         fZ => 49.0);
      pxRightOperandVector := pxLeftOperandVector.pxGet_Copy;

      AUnit.Assertions.Assert(Condition => pxLeftOperandVector = pxRightOperandVector,
                           Message   =>"CVector.=(binary CVector = CVector) failed. expected equal, actual not equal");


--  begin read only
   end Test_Equal;
--  end read only


--  begin read only
   procedure Test_fDot_Product (Gnattest_T : in out Test);
   procedure Test_fDot_Product_c7f274 (Gnattest_T : in out Test) renames Test_fDot_Product;
--  id:2.1/c7f2740134530e93/fDot_Product/1/0/
   procedure Test_fDot_Product (Gnattest_T : in out Test) is
   --  math-vectors.ads:29:4:fDot_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

      fDotProduct : float;
      pxLeftOperandVector : Math.Vectors.pCVector;
      pxRightOperandVector : Math.Vectors.pCVector;

   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 5.0,
                                                  fY => 2.0,
                                                  fZ => 3.0);
      pxRightOperandVector := Math.Vectors.pxCreate(fX => 2.0,
                                                   fY => 7.0,
                                                   fZ => 3.0);
      fDotProduct := Math.Vectors.fDot_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                                     pxRightOperandVector => pxRightOperandVector);



      AUnit.Assertions.Assert(Condition => fDotProduct = 33.0,
                              Message   => "Vectors.fDot_Product failed, wrong result in first test, expected 33.0 actual: " & float'Image(fDotProduct));

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 5.0,
                                                  fY => 0.0,
                                                  fZ => 0.0);
      pxRightOperandVector := Math.Vectors.pxCreate(fX => 0.0,
                                                   fY => 5.0,
                                                   fZ => 0.0);
      fDotProduct := Math.Vectors.fDot_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                                     pxRightOperandVector => pxRightOperandVector);

      AUnit.Assertions.Assert(Condition => fDotProduct = 0.0,
                              Message   => "Vectors.fDot_Product failed, wrong result in second test, expected 0.0, actual: " & float'Image(fDotProduct));

--  begin read only
   end Test_fDot_Product;
--  end read only


--  begin read only
   procedure Test_pxCross_Product (Gnattest_T : in out Test);
   procedure Test_pxCross_Product_66fc3c (Gnattest_T : in out Test) renames Test_pxCross_Product;
--  id:2.1/66fc3c56b607d747/pxCross_Product/1/0/
   procedure Test_pxCross_Product (Gnattest_T : in out Test) is
   --  math-vectors.ads:30:4:pxCross_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxCrossProductVector : pCVector;
      pxLeftOperandVector : pCVector;
      pxRightOperandVector : pCVector;

      crossAddress, leftAddress, rightAddress : Address;

   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 1.0,
                                                         fY => 5.0,
                                                         fZ => 2.0);
      pxRightOperandVector := Math.Vectors.pxCreate(fX => 4.0,
                                                          fY => 5.2,
                                                          fZ => -10.0);


      pxCrossProductVector := Math.Vectors.pxCross_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                                                 pxRightOperandVector => pxRightOperandVector);
      --(1.0,5.0,2.0) cross (4.0,5.2,-10.0)
      -- (-60.4, 18., -14.8)
      AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fX - (-60.4)) < 0.001,
                              Message   => "Vectors.pxCross_Product failed, fX got the wrong value, expected -60.4, actual: " & float'Image(pxCrossProductVector.fX));
      AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fY - 18.0) < 0.001,
                              Message   => "Vectors.pxCross_Product failed, fY got the wrong value, expected -18.0, actual: " & float'Image(pxCrossProductVector.fY));
      AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fZ - (-14.8)) < 0.001,
                              Message   => "Vectors.pxCross_Product failed, fZ got the wrong value, expected -14.8, actual: " & float'Image(pxCrossProductVector.fZ));


      crossAddress := pxCrossProductVector'Address;
      leftAddress := pxLeftOperandVector'Address;
      rightAddress := pxRightOperandVector'Address;


      AUnit.Assertions.Assert(Condition => (crossAddress /= leftAddress) and then (crossAddress /= rightAddress),
                              Message => "Vectors.pxCross_Product failed, crossAddress is shallow copy of one operand");


--  begin read only
   end Test_pxCross_Product;
--  end read only


--  begin read only
   procedure Test_fAngle_Between (Gnattest_T : in out Test);
   procedure Test_fAngle_Between_4e296f (Gnattest_T : in out Test) renames Test_fAngle_Between;
--  id:2.1/4e296f2b5c0cd330/fAngle_Between/1/0/
   procedure Test_fAngle_Between (Gnattest_T : in out Test) is
   --  math-vectors.ads:31:4:fAngle_Between
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftOperandVector : pCVector;
      pxRightOperandVector : pCVector;
      fAngleBetweenVectors : float;
   begin

      pxLeftOperandVector := Math.Vectors.pxCreate(fX => 5.0,
                                                         fY => 0.0,
                                                         fZ => 0.0);
      pxRightOperandVector := Math.Vectors.pxCreate(fX => 0.0,
                                                          fY => 5.0,
                                                          fZ => 0.0);
      fAngleBetweenVectors := Math.Vectors.fAngle_Between(pxLeftOperandVector  => pxLeftOperandVector,
                                                                pxRightOperandVector => pxRightOperandVector);

      AUnit.Assertions.Assert(Condition => abs(fAngleBetweenVectors - (Ada.Numerics.Pi / 2.0)) < 0.001,
                              Message => "Vectors.fAngle_Between failed expected PI/2, actual :" & float'Image(fAngleBetweenVectors));
--  begin read only
   end Test_fAngle_Between;
--  end read only

end Math.Vectors.Test_Data.Tests;
