--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.ViewModel_Actuators.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with simulator.Model;use Simulator.Model;

package body Simulator.ViewModel_Actuators.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_bb45cc (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/bb45cc3a3e28f678/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  simulator-viewmodel_actuators.ads:10:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel;
      pxViewModel : pCViewModel_Actuators;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      Aunit.Assertions.Assert(Condition => pxViewModel /= null,
                              Message   => "Simulator.ViewModel_Actuators.pxCreate failed, didn't create viewmodel");
      Aunit.Assertions.Assert(Condition => pxModel = pxViewModel.pxModel,
                                    Message   => "Simulator.ViewModel_Actuators.pxCreate failed, didn't create viewmodel");
--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_5525d2 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/5525d2496a700866/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  simulator-viewmodel_actuators.ads:11:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxModel : simulator.Model.pCModel;
      pxViewModel : pCViewModel_Actuators;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      free(pxViewModel);
      Aunit.Assertions.Assert(Condition => pxViewModel = null,
                              Message   => "Simulator.ViewModel_Actuators.free failed, didn't free viewmodel");

--  begin read only
   end Test_Free;
--  end read only

end Simulator.ViewModel_Actuators.Test_Data.Tests;
