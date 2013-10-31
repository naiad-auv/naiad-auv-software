--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Exception_Handling.CExceptionMsgs_Test_Data is

   Local_CExceptionMsgs : aliased GNATtest_Generated.GNATtest_Standard.Exception_Handling.CExceptionMsgs;
   procedure Set_Up (Gnattest_T : in out Test_CExceptionMsgs) is
   begin
      Gnattest_T.Fixture := Local_CExceptionMsgs'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CExceptionMsgs) is
   begin
      null;
   end Tear_Down;

end Exception_Handling.CExceptionMsgs_Test_Data;
