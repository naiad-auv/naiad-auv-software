--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.ViewModel_Pid_Errors.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Simulator.Model; use Simulator.Model;
with Simulator.Pid_Errors; use Simulator.Pid_Errors;

package body Simulator.ViewModel_Pid_Errors.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_e4c99a (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/e4c99aefdb2ab631/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  simulator-viewmodel_pid_errors.ads:24:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      AUnit.Assertions.Assert(Condition => null/=pxViewModel,
                              Message   => "Simulator.ViewModel_Pid_Errors.pxCreate failed, View model is not created");
      AUnit.Assertions.Assert(Condition => pxModel=pxViewModel.pxModel,
                              Message   => "Simulator.ViewModel_Pid_Errors.pxCreate failed, References to models does not match");
--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_2cce0a (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/2cce0af5a9d80e4b/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is
   --  simulator-viewmodel_pid_errors.ads:32:4:Free
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewModel_Pid_Errors;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      free(pxViewModel);
      AUnit.Assertions.Assert(Condition => null=pxViewModel,
                              Message   => "Simulator.ViewModel_Pid_Errors.free failed, View model is not freed");


   end Test_Free;
--  end read only

end Simulator.ViewModel_Pid_Errors.Test_Data.Tests;
