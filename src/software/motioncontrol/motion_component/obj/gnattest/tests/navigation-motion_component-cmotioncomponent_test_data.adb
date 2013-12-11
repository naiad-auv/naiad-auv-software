--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.Motion_Component.CMotionComponent_Test_Data is

   Local_CMotionComponent : aliased GNATtest_Generated.GNATtest_Standard.Navigation.Motion_Component.CMotionComponent;
   procedure Set_Up (Gnattest_T : in out Test_CMotionComponent) is
   begin
      Gnattest_T.Fixture := Local_CMotionComponent'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CMotionComponent) is
   begin
      null;
   end Tear_Down;

end Navigation.Motion_Component.CMotionComponent_Test_Data;
