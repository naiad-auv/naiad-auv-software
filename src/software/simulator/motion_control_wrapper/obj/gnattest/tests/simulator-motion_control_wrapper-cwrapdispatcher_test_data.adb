--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body simulator.Motion_Control_Wrapper.CWrapDispatcher_Test_Data is

   Local_CWrapDispatcher : aliased GNATtest_Generated.GNATtest_Standard.simulator.Motion_Control_Wrapper.CWrapDispatcher;
   procedure Set_Up (Gnattest_T : in out Test_CWrapDispatcher) is
   begin
      Gnattest_T.Fixture := Local_CWrapDispatcher'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CWrapDispatcher) is
   begin
      null;
   end Tear_Down;

end simulator.Motion_Control_Wrapper.CWrapDispatcher_Test_Data;
