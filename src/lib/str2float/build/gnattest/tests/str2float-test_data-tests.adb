--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Str2Float.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Str2Float.Test_Data.Tests is


   --  begin read only
   procedure Test_fStr2Float (Gnattest_T : in out Test);
   procedure Test_fStr2Float_d61c41 (Gnattest_T : in out Test) renames Test_fStr2Float;
   --  id:2.1/d61c417c8a90feeb/fStr2Float/1/0/
   procedure Test_fStr2Float (Gnattest_T : in out Test) is
      --  str2float.ads:13:4:fStr2Float
      --  end read only

      pragma Unreferenced (Gnattest_T);
      fAns : float;
   begin

      fAns := Str2Float.fStr2Float("+12.13");
      AUnit.Assertions.Assert
        (fAns = 12.13,
         "fStr2Float incorrect, test 1 fAns=" & fAns'img);

      fAns := Str2Float.fStr2Float("+1200.13");
      AUnit.Assertions.Assert
        (fAns = +1200.13,
         "fStr2Float incorrect, test 2 fAns=" & fAns'img);

      fAns := Str2Float.fStr2Float("+0012.13");
      AUnit.Assertions.Assert
        (fAns = 12.13,
         "fStr2Float incorrect, test 3 fAns=" & fAns'img);

      fAns := Str2Float.fStr2Float("+321.130");
      AUnit.Assertions.Assert
        (fAns = 321.13,
         "fStr2Float incorrect, test 4 fAns=" & fAns'img);

      fAns := Str2Float.fStr2Float("-432.130");
      AUnit.Assertions.Assert
        (fAns = -432.13,
         "fStr2Float incorrect, test 5 fAns=" & fAns'img);

      fAns := Str2Float.fStr2Float("-00432.130");
      AUnit.Assertions.Assert
        (fAns = -432.13,
         "fStr2Float incorrect, test 6 fAns=" & fAns'img);

      --  begin read only
   end Test_fStr2Float;
   --  end read only


   --  begin read only
   procedure Test_fChar2Float (Gnattest_T : in out Test);
   procedure Test_fChar2Float_74e704 (Gnattest_T : in out Test) renames Test_fChar2Float;
   --  id:2.1/74e7046e9fd973fe/fChar2Float/1/0/
   procedure Test_fChar2Float (Gnattest_T : in out Test) is
      --  str2float.ads:16:4:fChar2Float
      --  end read only

      pragma Unreferenced (Gnattest_T);

      fAns : float;
   begin

      fAns := Str2Float.fchar2Float('1');
      AUnit.Assertions.Assert
        (fAns = 1.0,
         "fchar2Float incorrect, test 1 fAns=" & fAns'img);

      fAns := Str2Float.fchar2Float('2');
      AUnit.Assertions.Assert
        (fAns = 2.0,
         "fchar2Float incorrect, test 2 fAns=" & fAns'img);

      fAns := Str2Float.fchar2Float('3');
      AUnit.Assertions.Assert
        (fAns = 3.0,
         "fchar2Float incorrect, test 3 fAns=" & fAns'img);

      fAns := Str2Float.fchar2Float('4');
      AUnit.Assertions.Assert
        (fAns = 4.0,
         "fchar2Float incorrect, test 4 fAns=" & fAns'img);

      --  begin read only
   end Test_fChar2Float;
   --  end read only

end Str2Float.Test_Data.Tests;
