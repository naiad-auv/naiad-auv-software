--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Navigation.Vectors.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Navigation.Vectors.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_0ae964 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/0ae964291fd49d36/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:9:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : Navigation.Vectors.pCVector;
   begin

      pxTestVector := Navigation.Vectors.pxCreate(fX => 10.0,
                                                fY => -10.0,
                                                fZ => 0.0);
      AUnit.Assertions.Assert(Condition => pxTestVector.fX = 10.0,
                              Message   => "CVector.pxCreate failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxTestVector.fY = -10.0,
                              Message   => "CVector.pxCreate failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxTestVector.fZ = 0.0,
                              Message   => "CVector.pxCreate failed, fZ got the wrong value");

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Plus (Gnattest_T : in out Test);
   procedure Test_Plus_0cf714 (Gnattest_T : in out Test) renames Test_Plus;
--  id:2.1/0cf714da63c07c72/Plus/1/0/
   procedure Test_Plus (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:16:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxSumVector : Navigation.Vectors.pCVector;
      pxLeftOperandVector, pxRightOperandVector : Navigation.Vectors.pCVector;
   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      pxRightOperandVector := Navigation.Vectors.pxCreate(fX => 3.0,
                                                   fY => 10.0,
                                                   fZ => 7.0);
      pxSumVector := pxLeftOperandVector + pxRightOperandVector;

      AUnit.Assertions.Assert(Condition => pxSumVector.fX = 5.0,
                              Message   => "CVector.+(binary) failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxSumVector.fY = 15.0,
                              Message   => "CVector.+(binary) failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxSumVector.fZ = 11.0,
                              Message   => "CVector.+(binary) failed, fZ got the wrong value");


--  begin read only
   end Test_Plus;
--  end read only


--  begin read only
   procedure Test_Minus (Gnattest_T : in out Test);
   procedure Test_Minus_d2af0b (Gnattest_T : in out Test) renames Test_Minus;
--  id:2.1/d2af0b30e5b3456d/Minus/1/0/
   procedure Test_Minus (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:17:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxDifferenceVector : Navigation.Vectors.pCVector;
      pxLeftOperandVector, pxRightOperandVector : Navigation.Vectors.pCVector;

   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      pxRightOperandVector := Navigation.Vectors.pxCreate(fX => 3.0,
                                                   fY => 10.0,
                                                   fZ => 7.0);
      pxDifferenceVector := pxLeftOperandVector - pxRightOperandVector;

      AUnit.Assertions.Assert(Condition => pxDifferenceVector.fX = -1.0,
                              Message   => "CVector.-(binary) failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxDifferenceVector.fY = -5.0,
                              Message   => "CVector.-(binary) failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxDifferenceVector.fZ = -3.0,
                              Message   => "CVector.-(binary) failed, fZ got the wrong value");

--  begin read only
   end Test_Minus;
--  end read only


--  begin read only
   procedure Test_Unary_Minus (Gnattest_T : in out Test);
   procedure Test_Unary_Minus_838d50 (Gnattest_T : in out Test) renames Test_Unary_Minus;
--  id:2.1/838d50e91f9a2c3d/Unary_Minus/1/0/
   procedure Test_Unary_Minus (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:18:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxNegatedVector : Navigation.Vectors.pCVector;
      pxOperandVector : Navigation.Vectors.pCVector;

   begin

      pxOperandVector := Navigation.Vectors.pxCreate(fX => 2.0,
                                                     fY => 5.0,
                                                     fZ => 8.0);
      pxNegatedVector := -pxOperandVector;

      AUnit.Assertions.Assert(Condition => pxNegatedVector.fX = -2.0,
                              Message   => "CVector.-(unary) failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxNegatedVector.fY = -5.0,
                              Message   => "CVector.-(unary) failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxNegatedVector.fZ = -8.0,
                              Message   => "CVector.-(unary) failed, fZ got the wrong value");




--  begin read only
   end Test_Unary_Minus;
--  end read only


--  begin read only
   procedure Test_1_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_906224 (Gnattest_T : in out Test) renames Test_1_Multiply;
--  id:2.1/906224a3854ac3c4/Multiply/1/0/
   procedure Test_1_Multiply (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:19:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxProductVector : Navigation.Vectors.pCVector;
      pxLeftOperandVector, pxRightOperandVector : Navigation.Vectors.pCVector;
   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      pxRightOperandVector := Navigation.Vectors.pxCreate(fX => 3.0,
                                                   fY => 10.0,
                                                   fZ => 7.0);
      pxProductVector := pxLeftOperandVector * pxRightOperandVector;

      AUnit.Assertions.Assert(Condition => pxProductVector.fX = 6.0,
                              Message   => "CVector.*(binary CVector * CVector) failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxProductVector.fY = 50.0,
                              Message   => "CVector.*(binary CVector * CVector) failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxProductVector.fZ = 28.0,
                              Message   => "CVector.*(binary CVector * CVector) failed, fZ got the wrong value");


--  begin read only
   end Test_1_Multiply;
--  end read only


--  begin read only
   procedure Test_2_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_0b54f9 (Gnattest_T : in out Test) renames Test_2_Multiply;
--  id:2.1/0b54f9f4c4e10bb8/Multiply/0/0/
   procedure Test_2_Multiply (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:20:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxScaledVector : Navigation.Vectors.pCVector;
      pxLeftOperandVector : Navigation.Vectors.pCVector;
      fRightOperand : float;
   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      fRightOperand := 5.0;

      pxScaledVector := pxLeftOperandVector * fRightOperand;

      AUnit.Assertions.Assert(Condition => pxScaledVector.fX = 10.0,
                              Message   => "CVector.*(binary CVector * float) failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxScaledVector.fY = 25.0,
                              Message   => "CVector.*(binary CVector * float) failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxScaledVector.fZ = 20.0,
                              Message   => "CVector.*(binary CVector * float) failed, fZ got the wrong value");


--  begin read only
   end Test_2_Multiply;
--  end read only


--  begin read only
   procedure Test_3_Multiply (Gnattest_T : in out Test);
   procedure Test_Multiply_5e8bae (Gnattest_T : in out Test) renames Test_3_Multiply;
--  id:2.1/5e8baec6c5958f12/Multiply/0/0/
   procedure Test_3_Multiply (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:21:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxScaledVector : Navigation.Vectors.pCVector;
      pxRightOperandVector : Navigation.Vectors.pCVector;
      fLeftOperand : float;
   begin

      pxRightOperandVector := Navigation.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      fLeftOperand := 5.0;

      pxScaledVector := fLeftOperand * pxRightOperandVector;

      AUnit.Assertions.Assert(Condition => pxScaledVector.fX = 10.0,
                              Message   => "CVector.*(binary float * CVector) failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxScaledVector.fY = 25.0,
                              Message   => "CVector.*(binary float * CVector) failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxScaledVector.fZ = 20.0,
                              Message   => "CVector.*(binary float * CVector) failed, fZ got the wrong value");



--  begin read only
   end Test_3_Multiply;
--  end read only


--  begin read only
   procedure Test_1_Devide (Gnattest_T : in out Test);
   procedure Test_Devide_b09bc3 (Gnattest_T : in out Test) renames Test_1_Devide;
--  id:2.1/b09bc328c4b030a3/Devide/1/0/
   procedure Test_1_Devide (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:22:4:"/"
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxDividedVector : Navigation.Vectors.pCVector;
      pxLeftOperandVector : Navigation.Vectors.pCVector;
      fRightOperand : float;

   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 2.0,
                                                  fY => 5.0,
                                                  fZ => 4.0);
      fRightOperand := 2.0;

      pxDividedVector := pxLeftOperandVector / fRightOperand;

      AUnit.Assertions.Assert(Condition => pxDividedVector.fX = 1.0,
                              Message   => "CVector./(binary CVector / float) failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxDividedVector.fY = 2.5,
                              Message   => "CVector./(binary CVector / float) failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxDividedVector.fZ = 2.0,
                              Message   => "CVector./(binary CVector / float) failed, fZ got the wrong value");

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
   procedure Test_Equal_92745f (Gnattest_T : in out Test) renames Test_Equal;
--  id:2.1/92745f148db99b09/Equal/1/0/
   procedure Test_Equal (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:23:4:"="
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftOperandVector : pCVector;
      pxRightOperandVector : pCVector;
   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 89.2,
                                                         fY => -2154.2,
                                                         fZ => 49.0);
      pxRightOperandVector := pxLeftOperandVector.pxGet_Copy;

      AUnit.Assertions.Assert(Condition => pxLeftOperandVector = pxRightOperandVector,
                           Message   =>"CVector.=(binary CVector = CVector) failed.");


--  begin read only
   end Test_Equal;
--  end read only


--  begin read only
   procedure Test_fDot_Product (Gnattest_T : in out Test);
   procedure Test_fDot_Product_2d1e6d (Gnattest_T : in out Test) renames Test_fDot_Product;
--  id:2.1/2d1e6dd13597fdab/fDot_Product/1/0/
   procedure Test_fDot_Product (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:26:4:fDot_Product
--  end read only

      pragma Unreferenced (Gnattest_T);
      fDotProduct : float;
      pxLeftOperandVector : Navigation.Vectors.pCVector;
      pxRightOperandVector : Navigation.Vectors.pCVector;

   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 5.0,
                                                  fY => 2.0,
                                                  fZ => 3.0);
      pxRightOperandVector := Navigation.Vectors.pxCreate(fX => 2.0,
                                                   fY => 7.0,
                                                   fZ => 3.0);
      fDotProduct := Navigation.Vectors.fDot_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                                     pxRightOperandVector => pxRightOperandVector);



      AUnit.Assertions.Assert(Condition => fDotProduct = 33.0,
                              Message   => "Vectors.fDot_Product failed, wrong result in first test");

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 5.0,
                                                  fY => 0.0,
                                                  fZ => 0.0);
      pxRightOperandVector := Navigation.Vectors.pxCreate(fX => 0.0,
                                                   fY => 5.0,
                                                   fZ => 0.0);
      fDotProduct := Navigation.Vectors.fDot_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                                     pxRightOperandVector => pxRightOperandVector);

      AUnit.Assertions.Assert(Condition => fDotProduct = 0.0,
                              Message   => "Vectors.fDot_Product failed, wrong result in second test");

--  begin read only
   end Test_fDot_Product;
--  end read only


--  begin read only
   procedure Test_pxCross_Product (Gnattest_T : in out Test);
   procedure Test_pxCross_Product_ae978c (Gnattest_T : in out Test) renames Test_pxCross_Product;
--  id:2.1/ae978c261f63dfea/pxCross_Product/1/0/
   procedure Test_pxCross_Product (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:27:4:pxCross_Product
--  end read only

      pragma Unreferenced (Gnattest_T);


      pxCrossProductVector : pCVector;
      pxLeftOperandVector : pCVector;
      pxRightOperandVector : pCVector;

   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 1.0,
                                                         fY => 5.0,
                                                         fZ => 2.0);
      pxRightOperandVector := Navigation.Vectors.pxCreate(fX => 4.0,
                                                          fY => 5.2,
                                                          fZ => -10.0);


      pxCrossProductVector := Navigation.Vectors.pxCross_Product(pxLeftOperandVector  => pxLeftOperandVector,
                                                                 pxRightOperandVector => pxRightOperandVector);
      --(1.0,5.0,2.0) cross (4.0,5.2,-10.0)
      -- (-60.4, 18., -14.8)
      AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fX - (-60.4)) < 0.001,
                              Message   => "Vectors.pxCross_Product failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fY - 18.0) < 0.001,
                              Message   => "Vectors.pxCross_Product failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => abs(pxCrossProductVector.fZ - (-14.8)) < 0.001,
                              Message   => "Vectors.pxCross_Product failed, fZ got the wrong value");
--  begin read only
   end Test_pxCross_Product;
--  end read only


--  begin read only
   procedure Test_fAngle_Between (Gnattest_T : in out Test);
   procedure Test_fAngle_Between_625e97 (Gnattest_T : in out Test) renames Test_fAngle_Between;
--  id:2.1/625e97068c952d1b/fAngle_Between/1/0/
   procedure Test_fAngle_Between (Gnattest_T : in out Test) is
   --  navigation-vectors.ads:28:4:fAngle_Between
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxLeftOperandVector : pCVector;
      pxRightOperandVector : pCVector;
      fAngleBetweenVectors : float;
   begin

      pxLeftOperandVector := Navigation.Vectors.pxCreate(fX => 5.0,
                                                         fY => 0.0,
                                                         fZ => 0.0);
      pxRightOperandVector := Navigation.Vectors.pxCreate(fX => 0.0,
                                                          fY => 5.0,
                                                          fZ => 0.0);
      fAngleBetweenVectors := Navigation.Vectors.fAngle_Between(pxLeftOperandVector  => pxLeftOperandVector,
                                                                pxRightOperandVector => pxRightOperandVector);

      AUnit.Assertions.Assert(Condition => abs(fAngleBetweenVectors - (Ada.Numerics.Pi / 2.0)) < 0.001,
                              Message => "Vectors.fAngle_Between failed");

--  begin read only
   end Test_fAngle_Between;
--  end read only

end Navigation.Vectors.Test_Data.Tests;
