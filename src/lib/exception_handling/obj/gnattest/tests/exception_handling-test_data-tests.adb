--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Exception_Handling.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Exception_Handling.Test_Data.Tests is


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_2bb988 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/2bb988758de9444c/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  exception_handling.ads:13:4:Free
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
   procedure Test_Unhandled_Exception (Gnattest_T : in out Test);
   procedure Test_Unhandled_Exception_a68186 (Gnattest_T : in out Test) renames Test_Unhandled_Exception;
--  id:2.1/a6818669fe9b73c9/Unhandled_Exception/1/0/
   procedure Test_Unhandled_Exception (Gnattest_T : in out Test) is
   --  exception_handling.ads:43:4:Unhandled_Exception
--  end read only

      pragma Unreferenced (Gnattest_T);

      procedure Handled(E : in Ada.Exceptions.Exception_Occurrence) is
      begin

         Unhandled_Exception(E => E);
      exception
         when UnhandledException =>
            null;
         when others =>
            AUnit.Assertions.Assert(Condition => False,
                                Message   => "Unhandled exception test failed.");

      end Handled;


   begin

      raise DivisionByZero;

   exception
      when E : others =>
         Handled(E => E);

--  begin read only
   end Test_Unhandled_Exception;
--  end read only


--  begin read only
   procedure Test_Handled_Exception (Gnattest_T : in out Test);
   procedure Test_Handled_Exception_0886be (Gnattest_T : in out Test) renames Test_Handled_Exception;
--  id:2.1/0886be9aa09d518b/Handled_Exception/1/0/
   procedure Test_Handled_Exception (Gnattest_T : in out Test) is
   --  exception_handling.ads:47:4:Handled_Exception
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Handled_Exception;
--  end read only


--  begin read only
   procedure Test_Raise_Exception (Gnattest_T : in out Test);
   procedure Test_Raise_Exception_7b6e86 (Gnattest_T : in out Test) renames Test_Raise_Exception;
--  id:2.1/7b6e8694c019e09d/Raise_Exception/1/0/
   procedure Test_Raise_Exception (Gnattest_T : in out Test) is
   --  exception_handling.ads:49:4:Raise_Exception
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Raise_Exception;
--  end read only


--  begin read only
   procedure Test_Reraise_Exception (Gnattest_T : in out Test);
   procedure Test_Reraise_Exception_863da0 (Gnattest_T : in out Test) renames Test_Reraise_Exception;
--  id:2.1/863da0f4b77b8c59/Reraise_Exception/1/0/
   procedure Test_Reraise_Exception (Gnattest_T : in out Test) is
   --  exception_handling.ads:50:4:Reraise_Exception
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Reraise_Exception;
--  end read only


--  begin read only
   procedure Test_Save_Exception (Gnattest_T : in out Test);
   procedure Test_Save_Exception_b3eb72 (Gnattest_T : in out Test) renames Test_Save_Exception;
--  id:2.1/b3eb724ad068a700/Save_Exception/1/0/
   procedure Test_Save_Exception (Gnattest_T : in out Test) is
   --  exception_handling.ads:65:4:Save_Exception
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Save_Exception;
--  end read only

end Exception_Handling.Test_Data.Tests;
