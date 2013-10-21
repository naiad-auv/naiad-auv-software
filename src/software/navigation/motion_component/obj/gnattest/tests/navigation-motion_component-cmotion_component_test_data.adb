--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Navigation.Motion_Component.CMotion_Component_Test_Data is

   Local_CMotion_Component : aliased GNATtest_Generated.GNATtest_Standard.Navigation.Motion_Component.CMotionComponent;
   procedure Set_Up (Gnattest_T : in out Test_CMotion_Component) is
   begin
      Gnattest_T.Fixture := Local_CMotion_Component'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CMotion_Component) is
   begin
      null;
   end Tear_Down;

end Navigation.Motion_Component.CMotion_Component_Test_Data;
