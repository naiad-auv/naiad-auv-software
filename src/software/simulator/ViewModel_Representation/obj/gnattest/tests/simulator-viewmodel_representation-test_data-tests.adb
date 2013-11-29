--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.ViewModel_Representation.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Simulator.ViewModel_Representation.Test_Data.Tests is

--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_7f4ae3 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/7f4ae3aa9fb0940d/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  simulator-viewmodel_representation.ads:31:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Representation;
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
   procedure Test_Free_8544de (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/8544defd6609c400/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  simulator-viewmodel_representation.ads:33:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Representation;
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

end Simulator.ViewModel_Representation.Test_Data.Tests;
