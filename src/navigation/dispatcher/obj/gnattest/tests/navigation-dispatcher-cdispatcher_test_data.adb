--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.Dispatcher.CDispatcher_Test_Data is

   Local_CDispatcher : aliased GNATtest_Generated.GNATtest_Standard.Navigation.Dispatcher.CDispatcher;
   procedure Set_Up (Gnattest_T : in out Test_CDispatcher) is
   begin
      Gnattest_T.Fixture := Local_CDispatcher'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CDispatcher) is
   begin
      null;
   end Tear_Down;

end Navigation.Dispatcher.CDispatcher_Test_Data;
