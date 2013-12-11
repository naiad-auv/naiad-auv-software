--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Navigation.Dispatcher.CDispatcher_Test_Data is

   type CDispatcher_Access is access all GNATtest_Generated.GNATtest_Standard.Navigation.Dispatcher.CDispatcher'Class;

--  begin read only
   type Test_CDispatcher is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : CDispatcher_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_CDispatcher);
   procedure Tear_Down (Gnattest_T : in out Test_CDispatcher);

end Navigation.Dispatcher.CDispatcher_Test_Data;
