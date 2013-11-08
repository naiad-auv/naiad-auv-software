--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Model.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with simulator.submarine; use Simulator.submarine;
with simulator.Motion_Control_Wrapper; use Simulator.Motion_Control_Wrapper;

package body Simulator.Model.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_67429f (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/67429f7e0327fc61/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  simulator-model.ads:20:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := Simulator.Model.pxCreate;
      Aunit.Assertions.Assert(Condition => pxModel /= null,
                              Message   => "Simulator.Model.pxCreate Failed, pxModel pointer equals null");
      Aunit.Assertions.Assert(Condition => pxModel.pxSubmarine /= null,
                              Message   => "Simulator.Model.pxCreate Failed, pxSubmarine pointer equals null");
      Aunit.Assertions.Assert(Condition => pxModel.pxMotionControlWrapper /= null,
                              Message   => "Simulator.Model.pxCreate Failed, pxMotionControlWrapper pointer equals null");


--  begin read only
   end Test_pxCreate;
--  end read only

end Simulator.Model.Test_Data.Tests;
