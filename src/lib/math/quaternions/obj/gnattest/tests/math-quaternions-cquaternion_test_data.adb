--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Math.Quaternions.CQuaternion_Test_Data is

   Local_CQuaternion : aliased GNATtest_Generated.GNATtest_Standard.Math.Quaternions.CQuaternion;
   procedure Set_Up (Gnattest_T : in out Test_CQuaternion) is
   begin
      Gnattest_T.Fixture := Local_CQuaternion'Access;
   end Set_Up;
   procedure Tear_Down (Gnattest_T : in out Test_CQuaternion) is
   begin
      null;
   end Tear_Down;

end Math.Quaternions.CQuaternion_Test_Data;
