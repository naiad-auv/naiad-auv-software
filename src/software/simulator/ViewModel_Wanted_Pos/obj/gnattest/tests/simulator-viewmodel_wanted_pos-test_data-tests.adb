--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into simulator.ViewModel_Wanted_Pos.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Math.Vectors; use Math.Vectors;
with math.Matrices; use math.Matrices;

package body simulator.ViewModel_Wanted_Pos.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_f1682d (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/f1682d1e76d8c12f/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  simulator-viewmodel_wanted_pos.ads:13:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);

      pxViewModel : pCViewmodel_Wanted_Pos;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      AUnit.Assertions.Assert(Condition => pxViewModel=null,
                              Message   => "Simulator.Viewmodel_Set_Wanted_Position.pxCreate failed, pointer should have been null");
      pxViewModel := pxCreate(pxModel);
      AUnit.Assertions.Assert(Condition => pxViewModel/=null,
                              Message   => "Simulator.Viewmodel_Set_Wanted_Position.pxCreate failed, pointer shouldn't been null");


--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_e6852d (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/e6852d5985c78fef/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  simulator-viewmodel_wanted_pos.ads:14:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);


      pxViewModel : pCViewmodel_Wanted_Pos;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      AUnit.Assertions.Assert(Condition => pxViewModel/=null,
                              Message   => "Simulator.Viewmodel_Set_Wanted_Position.Free failed, pointer shouldn't been null");
      Free(pxViewModel);
      AUnit.Assertions.Assert(Condition => pxViewModel=null,
                              Message   => "Simulator.Viewmodel_Set_Wanted_Position.Free failed, pointer should be null");


--  begin read only
   end Test_Free;
--  end read only

end simulator.ViewModel_Wanted_Pos.Test_Data.Tests;
