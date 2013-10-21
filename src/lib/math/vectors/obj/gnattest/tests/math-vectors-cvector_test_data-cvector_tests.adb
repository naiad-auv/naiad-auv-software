--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Vectors.CVector_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Vectors.CVector_Test_Data.CVector_Tests is


--  begin read only
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CVector);
   procedure Test_pxGet_Copy_4fdcfb (Gnattest_T : in out Test_CVector) renames Test_pxGet_Copy;
--  id:2.1/4fdcfbc63674ebe3/pxGet_Copy/1/0/
   procedure Test_pxGet_Copy (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:13:4:pxGet_Copy
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;

      pxTestVector : pCVector;
      pxCopiedVector : pCVector;

   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 5.2,
                                                  fY => -2.6,
                                                  fZ => 8.2);
      pxCopiedVector := pxTestVector.pxGet_Copy;

      AUnit.Assertions.Assert(Condition => pxCopiedVector.fX = 5.2,
                              Message   => "CVector.pxGetCopy failed, fX got the wrong value");
      AUnit.Assertions.Assert(Condition => pxCopiedVector.fY = -2.6,
                              Message   => "CVector.pxGetCopy failed, fY got the wrong value");
      AUnit.Assertions.Assert(Condition => pxCopiedVector.fZ = 8.2,
                              Message   => "CVector.pxGetCopy failed, fZ got the wrong value");


--        AUnit.Assertions.Assert(Condition => pxTestVector.all'Address /= pxCopiedVector.all'Address,
--                                Message => "CVector.pxGetCopy failed, pointers has the same address, not a deep copy");

--  begin read only
   end Test_pxGet_Copy;
--  end read only


--  begin read only
   procedure Test_pxGet_Normalized (Gnattest_T : in out Test_CVector);
   procedure Test_pxGet_Normalized_a00a60 (Gnattest_T : in out Test_CVector) renames Test_pxGet_Normalized;
--  id:2.1/a00a60382fe44b5d/pxGet_Normalized/1/0/
   procedure Test_pxGet_Normalized (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:14:4:pxGet_Normalized
--  end read only

      pragma Unreferenced (Gnattest_T);


      use System;
      pxTestVector : pCVector;
      pxNormalizedVector : pCVector;

   begin


      pxTestVector := Math.Vectors.pxCreate(fX => 14.2,
                                                  fY => -64.2,
                                                  fZ => 0.2);
      pxNormalizedVector := pxTestVector.pxGet_Normalized;
      AUnit.Assertions.Assert(Condition => abs(pxNormalizedVector.fLength - 1.0) < 0.0001,
                              Message   => "CVector.pxGet_Normalized failed");



      AUnit.Assertions.Assert(Condition => pxTestVector.all'Address /= pxNormalizedVector.all'Address,
                              Message => "CVector.pxGet_Normalized failed, testVector and normalizedVector has the same address");

      -- test exceptions
      pxTestVector := Math.Vectors.pxCreate(fX => 0.0,
                                                  fY => 0.0,
                                                  fZ => 0.0);
      pxNormalizedVector := pxTestVector.pxGet_Normalized;
      AUnit.Assertions.Assert(Condition => False,
                              Message   => "CVector.pxGet_Normalized division by zero failed, should have raised exception");
   exception
      when Numeric_Error =>
         null; -- Test passed
      when E : others =>
         AUnit.Assertions.Assert(Condition => False,
                                 Message   =>"CVector.pxGet_Normalized division by zero failed, wrong exception raised: " & Ada.Exceptions.Exception_Name (E) & ". Expected: NUMERIC_ERROR.");

--  begin read only
   end Test_pxGet_Normalized;
--  end read only


--  begin read only
   procedure Test_fLength_Squared (Gnattest_T : in out Test_CVector);
   procedure Test_fLength_Squared_cce6ee (Gnattest_T : in out Test_CVector) renames Test_fLength_Squared;
--  id:2.1/cce6ee4164d3103e/fLength_Squared/1/0/
   procedure Test_fLength_Squared (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:16:4:fLength_Squared
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : Math.Vectors.pCVector;

    begin

      pxTestVector := Math.Vectors.pxCreate(fX => 10.0,
                                                  fY => 5.0,
                                                  fZ => 2.0);
      AUnit.Assertions.Assert(Condition => pxTestVector.fLength_Squared = 129.0,
                              Message   => "CVector.fLength_Squared failed, expected 129.0, actual: " & float'Image(pxTestVector.fLength_Squared));

--  begin read only
   end Test_fLength_Squared;
--  end read only


--  begin read only
   procedure Test_fLength (Gnattest_T : in out Test_CVector);
   procedure Test_fLength_7b67f3 (Gnattest_T : in out Test_CVector) renames Test_fLength;
--  id:2.1/7b67f3ae3f80f9b4/fLength/1/0/
   procedure Test_fLength (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:17:4:fLength
--  end read only

      pragma Unreferenced (Gnattest_T);

     pxTestVector : pCVector;
   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 5.0,
                                                  fY => 2.0,
                                                  fZ => -6.0);

      AUnit.Assertions.Assert(Condition => abs(pxTestVector.fLength - 8.06226) < 0.0001,
                              Message   => "CVector.fLength failed, expected 8.06226, actual: " & float'Image(pxTestVector.fLength));

--  begin read only
   end Test_fLength;
--  end read only


--  begin read only
   procedure Test_fGet_X (Gnattest_T : in out Test_CVector);
   procedure Test_fGet_X_2bcacb (Gnattest_T : in out Test_CVector) renames Test_fGet_X;
--  id:2.1/2bcacbb17d7f7a8a/fGet_X/1/0/
   procedure Test_fGet_X (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:34:4:fGet_X
--  end read only

      pragma Unreferenced (Gnattest_T);

     pxTestVector : pCVector;
   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 23.5,
                                                  fY => 0.0,
                                                  fZ => 0.0);

      AUnit.Assertions.Assert(Condition => pxTestVector.fGet_X = 23.5,
                              Message   => "CVector.fGet_X failed, expected 23.5 actual: " & float'Image(pxTestVector.fX));

--  begin read only
   end Test_fGet_X;
--  end read only


--  begin read only
   procedure Test_fGet_Y (Gnattest_T : in out Test_CVector);
   procedure Test_fGet_Y_5c8b74 (Gnattest_T : in out Test_CVector) renames Test_fGet_Y;
--  id:2.1/5c8b745c6398c08a/fGet_Y/1/0/
   procedure Test_fGet_Y (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:35:4:fGet_Y
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : pCVector;
   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 0.0,
                                                  fY => 23.5,
                                                  fZ => 0.0);

      AUnit.Assertions.Assert(Condition => pxTestVector.fGet_Y = 23.5,
                              Message   => "CVector.fGet_Y failed, expected 23.5, actual: " & float'Image(pxTestVector.fY));

--  begin read only
   end Test_fGet_Y;
--  end read only


--  begin read only
   procedure Test_fGet_Z (Gnattest_T : in out Test_CVector);
   procedure Test_fGet_Z_6025cf (Gnattest_T : in out Test_CVector) renames Test_fGet_Z;
--  id:2.1/6025cfe92d752a4a/fGet_Z/1/0/
   procedure Test_fGet_Z (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:36:4:fGet_Z
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : pCVector;
   begin

      pxTestVector := Math.Vectors.pxCreate(fX => 0.0,
                                                  fY => 0.0,
                                                  fZ => 23.5);

      AUnit.Assertions.Assert(Condition => pxTestVector.fGet_Z = 23.5,
                              Message   => "CVector.fGet_Z failed, expected 23.5, actual: " & float'Image(pxTestVector.fZ));

--  begin read only
   end Test_fGet_Z;
--  end read only


--  begin read only
   procedure Test_Copy_From (Gnattest_T : in out Test_CVector);
   procedure Test_Copy_From_535aa7 (Gnattest_T : in out Test_CVector) renames Test_Copy_From;
--  id:2.1/535aa7efaabab4a8/Copy_From/1/0/
   procedure Test_Copy_From (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:38:4:Copy_From
--  end read only

      pragma Unreferenced (Gnattest_T);
      use System;

      pxOriginalVector : pCVector;
      pxCopyVector : pCVector;
      pxPointerCopyVector : pCVector;

   begin

      pxOriginalVector := Math.Vectors.pxCreate(fX => 4.0,
                                                fY => 3.0,
                                                fZ => -124.0);
      pxCopyVector := Math.Vectors.pxCreate(fX => 233.0,
                                            fY => -214.0,
                                            fZ => 4.5);
      pxPointerCopyVector := pxCopyVector;

      pxCopyVector.Copy_From(pxOriginalVector);


      AUnit.Assertions.Assert(Condition => pxPointerCopyVector = pxOriginalVector,
                              Message   => "CVector.Copy_From failed, vectors are different.");
      AUnit.Assertions.Assert(Condition => pxPointerCopyVector.all'Address = pxCopyVector.all'Address,
                              Message   => "CVector.Copy_From failed, pointers address is not the same as copy vectors address.");


--  begin read only
   end Test_Copy_From;
--  end read only


--  begin read only
   procedure Test_1_Devide (Gnattest_T : in out Test_CVector);
   procedure Test_Devide_7a37a3 (Gnattest_T : in out Test_CVector) renames Test_1_Devide;
--  id:2.1/7a37a3bfda72490e/Devide/1/0/
   procedure Test_1_Devide (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:49:4:"/"
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      pxDividedVector : Math.Vectors.pCVector;
      xLeftOperandVector : Math.Vectors.pCVector;
      fRightOperand : float;


   begin

      xLeftOperandVector := Math.Vectors.pxCreate(fX => 2.0, fY => 5.0,fZ => 4.0);
      fRightOperand := 2.0;

      pxDividedVector := xLeftOperandVector / fRightOperand;

      AUnit.Assertions.Assert(Condition => pxDividedVector.fX = 1.0,
                              Message   => "CVector./(binary CVector / float) failed, fX got the wrong value, expected 1.0, actual: " & float'Image(pxDividedVector.fX));
      AUnit.Assertions.Assert(Condition => pxDividedVector.fY = 2.5,
                              Message   => "CVector./(binary CVector / float) failed, fY got the wrong value, expected 2.5, actual: " & float'Image(pxDividedVector.fY));
      AUnit.Assertions.Assert(Condition => pxDividedVector.fZ = 2.0,
                              Message   => "CVector./(binary CVector / float) failed, fZ got the wrong value, expected 2.0, actual: " & float'Image(pxDividedVector.fZ));

      Aunit.Assertions.Assert(Condition => pxDividedVector.all'Address /= xLeftOperandVector.all'Address,
                              Message => ("CVector./(binary CVector / float) failed, dividedVector is a shallow copy of one operand"));


      -- test exceptions
      fRightOperand := 0.0;
      pxDividedVector := xLeftOperandVector / fRightOperand;
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

end Math.Vectors.CVector_Test_Data.CVector_Tests;
