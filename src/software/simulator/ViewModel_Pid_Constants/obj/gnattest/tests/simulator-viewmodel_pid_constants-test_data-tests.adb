--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Viewmodel_Pid_Constants.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with simulator.Model; use Simulator.Model;

package body Simulator.Viewmodel_Pid_Constants.Test_Data.Tests is


--  begin read only
   procedure Test_pxCreate (Gnattest_T : in out Test);
   procedure Test_pxCreate_8f5b20 (Gnattest_T : in out Test) renames Test_pxCreate;
--  id:2.1/8f5b207416acd70f/pxCreate/1/0/
   procedure Test_pxCreate (Gnattest_T : in out Test) is
   --  simulator-viewmodel_pid_constants.ads:12:4:pxCreate
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewmodel_Pid_Constants;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
            AUnit.Assertions.Assert(Condition => pxViewModel/=null,
                              Message   => "Simulator.Viewmodel_Pid_Constants.pxCreate failed, Viewmodel not created");
      AUnit.Assertions.Assert(Condition => pxViewModel.pxModel=pxModel,
                              Message   => "Simulator.Viewmodel_Pid_Constants.pxCreate failed, faulty reference copy model");

--  begin read only
   end Test_pxCreate;
--  end read only


--  begin read only
   procedure Test_Free (Gnattest_T : in out Test);
   procedure Test_Free_cd6506 (Gnattest_T : in out Test) renames Test_Free;
--  id:2.1/cd650610f0717f24/Free/1/0/
   procedure Test_Free (Gnattest_T : in out Test) is

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewmodel_Pid_Constants;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      Free(pxViewModel);
      Aunit.Assertions.Assert(Condition => pxViewModel = null,
                              Message   => "Simulator.Viewmodel_Pid_Constants.Free failed, Pointer not set to null");

--  begin read only
   end Test_Free;
--  end read only

end Simulator.Viewmodel_Pid_Constants.Test_Data.Tests;
