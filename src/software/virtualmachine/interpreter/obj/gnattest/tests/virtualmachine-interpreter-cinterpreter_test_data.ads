--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package VirtualMachine.Interpreter.CInterpreter_Test_Data is

   type CInterpreter_Access is access all GNATtest_Generated.GNATtest_Standard.VirtualMachine.Interpreter.CInterpreter'Class;

--  begin read only
   type Test_CInterpreter is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CInterpreter_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CInterpreter);
   procedure Tear_Down (Gnattest_T : in out Test_CInterpreter);

end VirtualMachine.Interpreter.CInterpreter_Test_Data;
