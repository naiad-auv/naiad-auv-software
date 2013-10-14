with AUnit.Test_Fixtures;

package Navigation.PID_Controller.Test_Data is
   --  begin read only
   type Test is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with null record;

   procedure Set_Up (Gnattest_T : in out Test);
   procedure Tear_Down (Gnattest_T : in out Test);

end Navigation.PID_Controller.Test_Data;
