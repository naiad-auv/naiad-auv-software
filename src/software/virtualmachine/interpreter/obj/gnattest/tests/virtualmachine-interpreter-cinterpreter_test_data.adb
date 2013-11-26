--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body VirtualMachine.Interpreter.CInterpreter_Test_Data is

   Local_CInterpreter : aliased GNATtest_Generated.GNATtest_Standard.VirtualMachine.Interpreter.CInterpreter;
   procedure Set_Up (Gnattest_T : in out Test_CInterpreter) is
   begin
      Gnattest_T.Fixture := Local_CInterpreter'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CInterpreter) is
   begin
      null;
   end Tear_Down;

end VirtualMachine.Interpreter.CInterpreter_Test_Data;
