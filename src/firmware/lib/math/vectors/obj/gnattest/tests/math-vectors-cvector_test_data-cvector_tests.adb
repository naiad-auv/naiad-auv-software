--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Math.Vectors.CVector_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Math.Vectors.CVector_Test_Data.CVector_Tests is


--  begin read only
   procedure Test_xCreate (Gnattest_T : in out Test_CVector);
   procedure Test_xCreate_5ea676 (Gnattest_T : in out Test_CVector) renames Test_xCreate;
--  id:2.1/5ea67646a93ffd1c/xCreate/1/0/
   procedure Test_xCreate (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:25:4:xCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xCreate;
--  end read only


--  begin read only
   procedure Test_pxGet_Allocated_Copy (Gnattest_T : in out Test_CVector);
   procedure Test_pxGet_Allocated_Copy_4c64f2 (Gnattest_T : in out Test_CVector) renames Test_pxGet_Allocated_Copy;
--  id:2.1/4c64f217379c6ac8/pxGet_Allocated_Copy/1/0/
   procedure Test_pxGet_Allocated_Copy (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:31:4:pxGet_Allocated_Copy
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_pxGet_Allocated_Copy;
--  end read only


--  begin read only
   procedure Test_xGet_Normalized (Gnattest_T : in out Test_CVector);
   procedure Test_xGet_Normalized_14213d (Gnattest_T : in out Test_CVector) renames Test_xGet_Normalized;
--  id:2.1/14213d9f53d7e62e/xGet_Normalized/1/0/
   procedure Test_xGet_Normalized (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:35:4:xGet_Normalized
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_xGet_Normalized;
--  end read only


--  begin read only
   procedure Test_fLength_Squared (Gnattest_T : in out Test_CVector);
   procedure Test_fLength_Squared_cce6ee (Gnattest_T : in out Test_CVector) renames Test_fLength_Squared;
--  id:2.1/cce6ee4164d3103e/fLength_Squared/1/0/
   procedure Test_fLength_Squared (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:40:4:fLength_Squared
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : Math.Vectors.pCVector;

    begin

      pxTestVector := Math.Vectors.xCreate(fX => 10.0,
                                                  fY => 5.0,
                                                  fZ => 2.0).pxGet_Allocated_Copy;
      AUnit.Assertions.Assert(Condition => pxTestVector.fLength_Squared = 129.0,
                              Message   => "CVector.fLength_Squared failed, expected 129.0, actual: " & float'Image(pxTestVector.fLength_Squared));
      Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--  begin read only
   end Test_fLength_Squared;
--  end read only


--  begin read only
   procedure Test_fLength (Gnattest_T : in out Test_CVector);
   procedure Test_fLength_7b67f3 (Gnattest_T : in out Test_CVector) renames Test_fLength;
--  id:2.1/7b67f3ae3f80f9b4/fLength/1/0/
   procedure Test_fLength (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:44:4:fLength
--  end read only

      pragma Unreferenced (Gnattest_T);

     pxTestVector : pCVector;
   begin

      pxTestVector := Math.Vectors.xCreate(fX => 5.0,
                                                  fY => 2.0,
                                                  fZ => -6.0).pxGet_Allocated_Copy;

      AUnit.Assertions.Assert(Condition => abs(pxTestVector.fLength - 8.06226) < 0.0001,
                              Message   => "CVector.fLength failed, expected 8.06226, actual: " & float'Image(pxTestVector.fLength));
      Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);

--  begin read only
   end Test_fLength;
--  end read only


--  begin read only
   procedure Test_1_Plus (Gnattest_T : in out Test_CVector);
   procedure Test_Plus_51e10a (Gnattest_T : in out Test_CVector) renames Test_1_Plus;
--  id:2.1/51e10a00af4cbd6f/Plus/1/0/
   procedure Test_1_Plus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:48:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_Plus;
--  end read only


--  begin read only
   procedure Test_2_Plus (Gnattest_T : in out Test_CVector);
   procedure Test_Plus_b6b9a0 (Gnattest_T : in out Test_CVector) renames Test_2_Plus;
--  id:2.1/b6b9a09858beb266/Plus/0/0/
   procedure Test_2_Plus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:49:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_Plus;
--  end read only


--  begin read only
   procedure Test_3_Plus (Gnattest_T : in out Test_CVector);
   procedure Test_Plus_e43ef4 (Gnattest_T : in out Test_CVector) renames Test_3_Plus;
--  id:2.1/e43ef48aba818faf/Plus/0/0/
   procedure Test_3_Plus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:50:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_3_Plus;
--  end read only


--  begin read only
   procedure Test_4_Plus (Gnattest_T : in out Test_CVector);
   procedure Test_Plus_0d824e (Gnattest_T : in out Test_CVector) renames Test_4_Plus;
--  id:2.1/0d824ed2cbbf0ecd/Plus/0/0/
   procedure Test_4_Plus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:51:4:"+"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_4_Plus;
--  end read only


--  begin read only
   procedure Test_1_Minus (Gnattest_T : in out Test_CVector);
   procedure Test_Minus_87b860 (Gnattest_T : in out Test_CVector) renames Test_1_Minus;
--  id:2.1/87b86062ce292ef8/Minus/1/0/
   procedure Test_1_Minus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:56:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_Minus;
--  end read only


--  begin read only
   procedure Test_2_Minus (Gnattest_T : in out Test_CVector);
   procedure Test_Minus_09f099 (Gnattest_T : in out Test_CVector) renames Test_2_Minus;
--  id:2.1/09f09942112ca51b/Minus/0/0/
   procedure Test_2_Minus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:57:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_Minus;
--  end read only


--  begin read only
   procedure Test_3_Minus (Gnattest_T : in out Test_CVector);
   procedure Test_Minus_6b4ef3 (Gnattest_T : in out Test_CVector) renames Test_3_Minus;
--  id:2.1/6b4ef3effc3f315a/Minus/0/0/
   procedure Test_3_Minus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:58:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_3_Minus;
--  end read only


--  begin read only
   procedure Test_4_Minus (Gnattest_T : in out Test_CVector);
   procedure Test_Minus_d66643 (Gnattest_T : in out Test_CVector) renames Test_4_Minus;
--  id:2.1/d666432f05167b5a/Minus/0/0/
   procedure Test_4_Minus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:59:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_4_Minus;
--  end read only


--  begin read only
   procedure Test_1_Unary_Minus (Gnattest_T : in out Test_CVector);
   procedure Test_Unary_Minus_96c932 (Gnattest_T : in out Test_CVector) renames Test_1_Unary_Minus;
--  id:2.1/96c9320775833d15/Unary_Minus/1/0/
   procedure Test_1_Unary_Minus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:64:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_Unary_Minus;
--  end read only


--  begin read only
   procedure Test_2_Unary_Minus (Gnattest_T : in out Test_CVector);
   procedure Test_Unary_Minus_4214f5 (Gnattest_T : in out Test_CVector) renames Test_2_Unary_Minus;
--  id:2.1/4214f51ddbdc647f/Unary_Minus/0/0/
   procedure Test_2_Unary_Minus (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:65:4:"-"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_Unary_Minus;
--  end read only


--  begin read only
   procedure Test_1_Multiply (Gnattest_T : in out Test_CVector);
   procedure Test_Multiply_62fffc (Gnattest_T : in out Test_CVector) renames Test_1_Multiply;
--  id:2.1/62fffcc1b58aa30d/Multiply/1/0/
   procedure Test_1_Multiply (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:69:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_Multiply;
--  end read only


--  begin read only
   procedure Test_2_Multiply (Gnattest_T : in out Test_CVector);
   procedure Test_Multiply_a6311b (Gnattest_T : in out Test_CVector) renames Test_2_Multiply;
--  id:2.1/a6311bf8080b74b2/Multiply/0/0/
   procedure Test_2_Multiply (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:70:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_Multiply;
--  end read only


--  begin read only
   procedure Test_3_Multiply (Gnattest_T : in out Test_CVector);
   procedure Test_Multiply_14ad38 (Gnattest_T : in out Test_CVector) renames Test_3_Multiply;
--  id:2.1/14ad383dfe4f11ee/Multiply/0/0/
   procedure Test_3_Multiply (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:71:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_3_Multiply;
--  end read only


--  begin read only
   procedure Test_4_Multiply (Gnattest_T : in out Test_CVector);
   procedure Test_Multiply_504c4a (Gnattest_T : in out Test_CVector) renames Test_4_Multiply;
--  id:2.1/504c4a3ef6fa5828/Multiply/0/0/
   procedure Test_4_Multiply (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:72:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_4_Multiply;
--  end read only


--  begin read only
   procedure Test_5_Multiply (Gnattest_T : in out Test_CVector);
   procedure Test_Multiply_976bd0 (Gnattest_T : in out Test_CVector) renames Test_5_Multiply;
--  id:2.1/976bd0e5789aed55/Multiply/0/0/
   procedure Test_5_Multiply (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:77:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_5_Multiply;
--  end read only


--  begin read only
   procedure Test_6_Multiply (Gnattest_T : in out Test_CVector);
   procedure Test_Multiply_184a33 (Gnattest_T : in out Test_CVector) renames Test_6_Multiply;
--  id:2.1/184a3310f52535fa/Multiply/0/0/
   procedure Test_6_Multiply (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:78:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_6_Multiply;
--  end read only


--  begin read only
   procedure Test_7_Multiply (Gnattest_T : in out Test_CVector);
   procedure Test_Multiply_283644 (Gnattest_T : in out Test_CVector) renames Test_7_Multiply;
--  id:2.1/2836444f8e4ce882/Multiply/0/0/
   procedure Test_7_Multiply (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:83:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_7_Multiply;
--  end read only


--  begin read only
   procedure Test_8_Multiply (Gnattest_T : in out Test_CVector);
   procedure Test_Multiply_c8ca54 (Gnattest_T : in out Test_CVector) renames Test_8_Multiply;
--  id:2.1/c8ca54ee050f524a/Multiply/0/0/
   procedure Test_8_Multiply (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:84:4:"*"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_8_Multiply;
--  end read only


--  begin read only
   procedure Test_1_Devide (Gnattest_T : in out Test_CVector);
   procedure Test_Devide_8fd9db (Gnattest_T : in out Test_CVector) renames Test_1_Devide;
--  id:2.1/8fd9db4bd62ed41b/Devide/1/0/
   procedure Test_1_Devide (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:89:4:"/"
--  end read only

      pragma Unreferenced (Gnattest_T);

      use System;
      pxDividedVector : Math.Vectors.pCVector;
      pxLeftOperandVector : Math.Vectors.pCVector;
      fRightOperand : float;


   begin

      pxLeftOperandVector := Math.Vectors.xCreate(fX => 2.0, fY => 5.0,fZ => 4.0).pxGet_Allocated_Copy;
      fRightOperand := 2.0;

      pxDividedVector := CVector(pxLeftOperandVector / fRightOperand).pxGet_Allocated_Copy;

      AUnit.Assertions.Assert(Condition => pxDividedVector.fX = 1.0,
                              Message   => "CVector./(binary CVector / float) failed, fX got the wrong value, expected 1.0, actual: " & float'Image(pxDividedVector.fX));
      AUnit.Assertions.Assert(Condition => pxDividedVector.fY = 2.5,
                              Message   => "CVector./(binary CVector / float) failed, fY got the wrong value, expected 2.5, actual: " & float'Image(pxDividedVector.fY));
      AUnit.Assertions.Assert(Condition => pxDividedVector.fZ = 2.0,
                              Message   => "CVector./(binary CVector / float) failed, fZ got the wrong value, expected 2.0, actual: " & float'Image(pxDividedVector.fZ));

      Aunit.Assertions.Assert(Condition => pxDividedVector.all'Address /= pxLeftOperandVector.all'Address,
                              Message => ("CVector./(binary CVector / float) failed, dividedVector is a shallow copy of one operand"));


      -- test exceptions
      fRightOperand := 0.0;
      Math.Vectors.Free(pxVectorToDeallocate => pxDividedVector);
      pxDividedVector := CVector(pxLeftOperandVector / fRightOperand).pxGet_Allocated_Copy;
      AUnit.Assertions.Assert(Condition => False,
                              Message   => "CVector./(binary CVector / float) division by zero failed, should have raised exception");
--           Math.Vectors.Free(pxVectorToDeallocate => pxDividedVector);
--           Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
   exception
      when Exception_Handling.DivisionByZero =>
--           Math.Vectors.Free(pxVectorToDeallocate => pxDividedVector);
--           Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
         null; -- Test passed
      when E : others =>
--           Math.Vectors.Free(pxVectorToDeallocate => pxDividedVector);
--           Math.Vectors.Free(pxVectorToDeallocate => pxLeftOperandVector);
         AUnit.Assertions.Assert(Condition => False,
                           Message   =>"CVector./(binary CVector / float) division by zero failed, wrong exception raised: " & Ada.Exceptions.Exception_Name (E) & ". Expected: NUMERIC_ERROR.");


--  begin read only
   end Test_1_Devide;
--  end read only


--  begin read only
   procedure Test_2_Devide (Gnattest_T : in out Test_CVector);
   procedure Test_Devide_946f2b (Gnattest_T : in out Test_CVector) renames Test_2_Devide;
--  id:2.1/946f2b1e08028d44/Devide/0/0/
   procedure Test_2_Devide (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:90:4:"/"
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_Devide;
--  end read only


--  begin read only
   procedure Test_Equal (Gnattest_T : in out Test_CVector);
   procedure Test_Equal_ce792d (Gnattest_T : in out Test_CVector) renames Test_Equal;
--  id:2.1/ce792d28dec34019/Equal/1/0/
   procedure Test_Equal (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:96:4:"="
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Equal;
--  end read only


--  begin read only
   procedure Test_1_fDot_Product (Gnattest_T : in out Test_CVector);
   procedure Test_fDot_Product_6a329e (Gnattest_T : in out Test_CVector) renames Test_1_fDot_Product;
--  id:2.1/6a329ea1408221ac/fDot_Product/1/0/
   procedure Test_1_fDot_Product (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:103:4:fDot_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_fDot_Product;
--  end read only


--  begin read only
   procedure Test_2_fDot_Product (Gnattest_T : in out Test_CVector);
   procedure Test_fDot_Product_728331 (Gnattest_T : in out Test_CVector) renames Test_2_fDot_Product;
--  id:2.1/728331a21312b45e/fDot_Product/0/0/
   procedure Test_2_fDot_Product (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:104:4:fDot_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_fDot_Product;
--  end read only


--  begin read only
   procedure Test_3_fDot_Product (Gnattest_T : in out Test_CVector);
   procedure Test_fDot_Product_62e6f0 (Gnattest_T : in out Test_CVector) renames Test_3_fDot_Product;
--  id:2.1/62e6f0402dc51520/fDot_Product/0/0/
   procedure Test_3_fDot_Product (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:105:4:fDot_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_3_fDot_Product;
--  end read only


--  begin read only
   procedure Test_1_xCross_Product (Gnattest_T : in out Test_CVector);
   procedure Test_xCross_Product_f2c850 (Gnattest_T : in out Test_CVector) renames Test_1_xCross_Product;
--  id:2.1/f2c850fa6c8b0bed/xCross_Product/1/0/
   procedure Test_1_xCross_Product (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:110:4:xCross_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_xCross_Product;
--  end read only


--  begin read only
   procedure Test_2_xCross_Product (Gnattest_T : in out Test_CVector);
   procedure Test_xCross_Product_a21ba1 (Gnattest_T : in out Test_CVector) renames Test_2_xCross_Product;
--  id:2.1/a21ba167b0eabf9a/xCross_Product/0/0/
   procedure Test_2_xCross_Product (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:111:4:xCross_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_xCross_Product;
--  end read only


--  begin read only
   procedure Test_3_xCross_Product (Gnattest_T : in out Test_CVector);
   procedure Test_xCross_Product_4a89e6 (Gnattest_T : in out Test_CVector) renames Test_3_xCross_Product;
--  id:2.1/4a89e649612484ac/xCross_Product/0/0/
   procedure Test_3_xCross_Product (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:112:4:xCross_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_3_xCross_Product;
--  end read only


--  begin read only
   procedure Test_4_xCross_Product (Gnattest_T : in out Test_CVector);
   procedure Test_xCross_Product_e27059 (Gnattest_T : in out Test_CVector) renames Test_4_xCross_Product;
--  id:2.1/e270593299ae452a/xCross_Product/0/0/
   procedure Test_4_xCross_Product (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:113:4:xCross_Product
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_4_xCross_Product;
--  end read only


--  begin read only
   procedure Test_1_fAngle_Between_In_Radians (Gnattest_T : in out Test_CVector);
   procedure Test_fAngle_Between_In_Radians_a919f4 (Gnattest_T : in out Test_CVector) renames Test_1_fAngle_Between_In_Radians;
--  id:2.1/a919f4c72a3e2044/fAngle_Between_In_Radians/1/0/
   procedure Test_1_fAngle_Between_In_Radians (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:119:4:fAngle_Between_In_Radians
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_1_fAngle_Between_In_Radians;
--  end read only


--  begin read only
   procedure Test_2_fAngle_Between_In_Radians (Gnattest_T : in out Test_CVector);
   procedure Test_fAngle_Between_In_Radians_2b1950 (Gnattest_T : in out Test_CVector) renames Test_2_fAngle_Between_In_Radians;
--  id:2.1/2b1950fc1895984b/fAngle_Between_In_Radians/0/0/
   procedure Test_2_fAngle_Between_In_Radians (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:120:4:fAngle_Between_In_Radians
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_2_fAngle_Between_In_Radians;
--  end read only


--  begin read only
   procedure Test_3_fAngle_Between_In_Radians (Gnattest_T : in out Test_CVector);
   procedure Test_fAngle_Between_In_Radians_f55230 (Gnattest_T : in out Test_CVector) renames Test_3_fAngle_Between_In_Radians;
--  id:2.1/f55230fb58989de0/fAngle_Between_In_Radians/0/0/
   procedure Test_3_fAngle_Between_In_Radians (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:121:4:fAngle_Between_In_Radians
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_3_fAngle_Between_In_Radians;
--  end read only


--  begin read only
   procedure Test_fGet_X (Gnattest_T : in out Test_CVector);
   procedure Test_fGet_X_2bcacb (Gnattest_T : in out Test_CVector) renames Test_fGet_X;
--  id:2.1/2bcacbb17d7f7a8a/fGet_X/1/0/
   procedure Test_fGet_X (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:127:4:fGet_X
--  end read only

      pragma Unreferenced (Gnattest_T);

     pxTestVector : pCVector;
   begin

      pxTestVector := Math.Vectors.xCreate(fX => 23.5,
                                                  fY => 0.0,
                                                  fZ => 0.0).pxGet_Allocated_Copy;

      AUnit.Assertions.Assert(Condition => pxTestVector.fGet_X = 23.5,
                              Message   => "CVector.fGet_X failed, expected 23.5 actual: " & float'Image(pxTestVector.fX));
      Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);

--  begin read only
   end Test_fGet_X;
--  end read only


--  begin read only
   procedure Test_fGet_Y (Gnattest_T : in out Test_CVector);
   procedure Test_fGet_Y_5c8b74 (Gnattest_T : in out Test_CVector) renames Test_fGet_Y;
--  id:2.1/5c8b745c6398c08a/fGet_Y/1/0/
   procedure Test_fGet_Y (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:131:4:fGet_Y
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : pCVector;
   begin

      pxTestVector := Math.Vectors.xCreate(fX => 0.0,
                                                  fY => 23.5,
                                                  fZ => 0.0).pxGet_Allocated_Copy;

      AUnit.Assertions.Assert(Condition => pxTestVector.fGet_Y = 23.5,
                              Message   => "CVector.fGet_Y failed, expected 23.5, actual: " & float'Image(pxTestVector.fY));
      Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);

--  begin read only
   end Test_fGet_Y;
--  end read only


--  begin read only
   procedure Test_fGet_Z (Gnattest_T : in out Test_CVector);
   procedure Test_fGet_Z_6025cf (Gnattest_T : in out Test_CVector) renames Test_fGet_Z;
--  id:2.1/6025cfe92d752a4a/fGet_Z/1/0/
   procedure Test_fGet_Z (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:135:4:fGet_Z
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxTestVector : pCVector;
   begin

      pxTestVector := Math.Vectors.xCreate(fX => 0.0,
                                                  fY => 0.0,
                                                  fZ => 23.5).pxGet_Allocated_Copy;

      AUnit.Assertions.Assert(Condition => pxTestVector.fGet_Z = 23.5,
                              Message   => "CVector.fGet_Z failed, expected 23.5, actual: " & float'Image(pxTestVector.fZ));
      Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);

--  begin read only
   end Test_fGet_Z;
--  end read only


--  begin read only
   procedure Test_Copy_From (Gnattest_T : in out Test_CVector);
   procedure Test_Copy_From_784dc0 (Gnattest_T : in out Test_CVector) renames Test_Copy_From;
--  id:2.1/784dc0ec7dcfc20d/Copy_From/1/0/
   procedure Test_Copy_From (Gnattest_T : in out Test_CVector) is
   --  math-vectors.ads:139:4:Copy_From
--  end read only

      pragma Unreferenced (Gnattest_T);
      use System;

      pxOriginalVector : pCVector;
      pxCopyVector : pCVector;
      pxPointerCopyVector : pCVector;

   begin

      pxOriginalVector := Math.Vectors.xCreate(fX => 4.0,
                                                fY => 3.0,
                                                fZ => -124.0).pxGet_Allocated_Copy;
      pxCopyVector := Math.Vectors.xCreate(fX => 233.0,
                                            fY => -214.0,
                                            fZ => 4.5).pxGet_Allocated_Copy;
      pxPointerCopyVector := pxCopyVector;

      pxCopyVector.Copy_From(pxOriginalVector.all);


      AUnit.Assertions.Assert(Condition => pxPointerCopyVector.all = pxOriginalVector.all,
                              Message   => "CVector.Copy_From failed, vectors are different.");
      AUnit.Assertions.Assert(Condition => pxPointerCopyVector.all'Address = pxCopyVector.all'Address,
                              Message   => "CVector.Copy_From failed, pointers address is not the same as copy vectors address.");

      Math.Vectors.Free(pxVectorToDeallocate => pxOriginalVector);
      Math.Vectors.Free(pxVectorToDeallocate => pxCopyVector);

--  begin read only
   end Test_Copy_From;
--  end read only


--  begin read only
   --  procedure Test_pxGet_Copy (Gnattest_T : in out Test);
   --  procedure Test_pxGet_Copy_4fdcfb (Gnattest_T : in out Test) renames Test_pxGet_Copy;
--  id:2.1/4fdcfbc63674ebe3/pxGet_Copy/0/1/
   --  procedure Test_pxGet_Copy (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--        use System;
--  
--        pxTestVector : pCVector;
--        pxCopiedVector : pCVector;
--  
--     begin
--  
--        pxTestVector := Math.Vectors.xCreate(fX => 5.2,
--                                                    fY => -2.6,
--                                                    fZ => 8.2).pxGet_Allocated_Copy;
--        pxCopiedVector := pxTestVector.pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => pxCopiedVector.fX = 5.2,
--                                Message   => "CVector.pxGetCopy failed, fX got the wrong value");
--        AUnit.Assertions.Assert(Condition => pxCopiedVector.fY = -2.6,
--                                Message   => "CVector.pxGetCopy failed, fY got the wrong value");
--        AUnit.Assertions.Assert(Condition => pxCopiedVector.fZ = 8.2,
--                                Message   => "CVector.pxGetCopy failed, fZ got the wrong value");
--  
--  
--        AUnit.Assertions.Assert(Condition => pxTestVector.all'Address /= pxCopiedVector.all'Address,
--                                Message => "CVector.pxGetCopy failed, pointers has the same address, not a deep copy");
--  
--        Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--        Math.Vectors.Free(pxVectorToDeallocate => pxCopiedVector);
--  
--  
--  begin read only
   --  end Test_pxGet_Copy;
--  end read only


--  begin read only
   --  procedure Test_pxGet_Normalized (Gnattest_T : in out Test);
   --  procedure Test_pxGet_Normalized_a00a60 (Gnattest_T : in out Test) renames Test_pxGet_Normalized;
--  id:2.1/a00a60382fe44b5d/pxGet_Normalized/0/1/
   --  procedure Test_pxGet_Normalized (Gnattest_T : in out Test) is
--  end read only
--  
--        pragma Unreferenced (Gnattest_T);
--  
--  
--        use System;
--        pxTestVector : pCVector;
--        pxNormalizedVector : pCVector;
--  
--     begin
--  
--  
--        pxTestVector := Math.Vectors.xCreate(fX => 14.2,
--                                                    fY => -64.2,
--                                                    fZ => 0.2).pxGet_Allocated_Copy;
--        pxNormalizedVector := pxTestVector.xGet_Normalized.pxGet_Allocated_Copy;
--        AUnit.Assertions.Assert(Condition => abs(pxNormalizedVector.fLength - 1.0) < 0.0001,
--                                Message   => "CVector.pxGet_Normalized failed");
--  
--  
--  
--        AUnit.Assertions.Assert(Condition => pxTestVector.all'Address /= pxNormalizedVector.all'Address,
--                                Message => "CVector.pxGet_Normalized failed, testVector and normalizedVector has the same address");
--  
--        -- test exceptions
--        Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--        pxTestVector := Math.Vectors.xCreate(fX => 0.0,
--                                              fY => 0.0,
--                                              fZ => 0.0).pxGet_Allocated_Copy;
--        Math.Vectors.Free(pxVectorToDeallocate => pxNormalizedVector);
--        pxNormalizedVector := pxTestVector.xGet_Normalized.pxGet_Allocated_Copy;
--  
--        AUnit.Assertions.Assert(Condition => False,
--                                Message   => "CVector.pxGet_Normalized division by zero failed, should have raised exception");
--  --        Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--  --        Math.Vectors.Free(pxVectorToDeallocate => pxNormalizedVector);
--     exception
--        when Exception_Handling.DivisionByZero =>
--  --           Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--  --           Math.Vectors.Free(pxVectorToDeallocate => pxNormalizedVector);
--           null;
--  
--        when E : others =>
--  --           Math.Vectors.Free(pxVectorToDeallocate => pxTestVector);
--  --           Math.Vectors.Free(pxVectorToDeallocate => pxNormalizedVector);
--           AUnit.Assertions.Assert(Condition => False,
--                                   Message   =>"CVector.pxGet_Normalized division by zero failed, wrong exception raised: " & Ada.Exceptions.Exception_Name (E) & ". Expected: NUMERIC_ERROR.");
--  
--  begin read only
   --  end Test_pxGet_Normalized;
--  end read only

end Math.Vectors.CVector_Test_Data.CVector_Tests;
