--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data.CViewmodel_Pid_Constants_Tests is


--  begin read only
   procedure Test_fGet_Selected_Pid_Scaling_Proprotional_Part (Gnattest_T : in out Test_CViewmodel_Pid_Constants);
   procedure Test_fGet_Selected_Pid_Scaling_Proprotional_Part_6795e3 (Gnattest_T : in out Test_CViewmodel_Pid_Constants) renames Test_fGet_Selected_Pid_Scaling_Proprotional_Part;
--  id:2.1/6795e324024e37cf/fGet_Selected_Pid_Scaling_Proprotional_Part/1/0/
   procedure Test_fGet_Selected_Pid_Scaling_Proprotional_Part (Gnattest_T : in out Test_CViewmodel_Pid_Constants) is
   --  simulator-viewmodel_pid_constants.ads:15:4:fGet_Selected_Pid_Scaling_Proprotional_Part
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewmodel_Pid_Constants;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      for i in PositionX .. RotationZ loop
         pxViewModel.Set_Selected_Pid(i);
         pxViewModel.Set_Value_Of_Selected_Pid(3.0,2.0,1.0);
         Aunit.Assertions.Assert(Condition => pxViewModel.fGet_Selected_Pid_Scaling_Proprotional_Part=3.0,
                                 Message   => "Simulator.viewmodel_Pid_Constants.fget_SelectedPid_Scaling_Proportional_part failed");
      end loop;
--  begin read only
   end Test_fGet_Selected_Pid_Scaling_Proprotional_Part;
--  end read only


--  begin read only
   procedure Test_fGet_Selected_Pid_Scaling_Integrating_Part (Gnattest_T : in out Test_CViewmodel_Pid_Constants);
   procedure Test_fGet_Selected_Pid_Scaling_Integrating_Part_f46e16 (Gnattest_T : in out Test_CViewmodel_Pid_Constants) renames Test_fGet_Selected_Pid_Scaling_Integrating_Part;
--  id:2.1/f46e16ebcc5cafc4/fGet_Selected_Pid_Scaling_Integrating_Part/1/0/
   procedure Test_fGet_Selected_Pid_Scaling_Integrating_Part (Gnattest_T : in out Test_CViewmodel_Pid_Constants) is
   --  simulator-viewmodel_pid_constants.ads:16:4:fGet_Selected_Pid_Scaling_Integrating_Part
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewmodel_Pid_Constants;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      for i in PositionX .. RotationZ loop
         pxViewModel.Set_Selected_Pid(i);
         pxViewModel.Set_Value_Of_Selected_Pid(3.0,2.0,1.0);
         Aunit.Assertions.Assert(Condition => pxViewModel.fGet_Selected_Pid_Scaling_Integrating_Part=2.0,
                                 Message   => "Simulator.viewmodel_Pid_Constants.fget_SelectedPid_Scaling_Integrating_part failed");
      end loop;

--  begin read only
   end Test_fGet_Selected_Pid_Scaling_Integrating_Part;
--  end read only


--  begin read only
   procedure Test_fGet_Selected_Pid_Scaling_Derivative_Part (Gnattest_T : in out Test_CViewmodel_Pid_Constants);
   procedure Test_fGet_Selected_Pid_Scaling_Derivative_Part_41c024 (Gnattest_T : in out Test_CViewmodel_Pid_Constants) renames Test_fGet_Selected_Pid_Scaling_Derivative_Part;
--  id:2.1/41c024fcc1ca7b47/fGet_Selected_Pid_Scaling_Derivative_Part/1/0/
   procedure Test_fGet_Selected_Pid_Scaling_Derivative_Part (Gnattest_T : in out Test_CViewmodel_Pid_Constants) is
   --  simulator-viewmodel_pid_constants.ads:17:4:fGet_Selected_Pid_Scaling_Derivative_Part
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewmodel_Pid_Constants;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      for i in PositionX .. RotationZ loop
         pxViewModel.Set_Selected_Pid(i);
         pxViewModel.Set_Value_Of_Selected_Pid(3.0,2.0,1.0);
         Aunit.Assertions.Assert(Condition => pxViewModel.fGet_Selected_Pid_Scaling_Derivative_Part=1.0,
                                 Message   => "Simulator.viewmodel_Pid_Constants.fget_SelectedPid_Scaling_Derivative_part failed");
      end loop;
      --  begin read only
   end Test_fGet_Selected_Pid_Scaling_Derivative_Part;
--  end read only


--  begin read only
   procedure Test_Set_Selected_Pid (Gnattest_T : in out Test_CViewmodel_Pid_Constants);
   procedure Test_Set_Selected_Pid_809486 (Gnattest_T : in out Test_CViewmodel_Pid_Constants) renames Test_Set_Selected_Pid;
--  id:2.1/80948671306597d6/Set_Selected_Pid/1/0/
   procedure Test_Set_Selected_Pid (Gnattest_T : in out Test_CViewmodel_Pid_Constants) is
   --  simulator-viewmodel_pid_constants.ads:19:4:Set_Selected_Pid
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewmodel_Pid_Constants;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      for i in PositionX .. RotationZ loop
         pxViewModel.Set_Selected_Pid(i);
         AUnit.Assertions.Assert(Condition => pxViewModel.eSelectedPid=i,
                                 Message   => "Simulator.ViewModel_Pid_Constants failed, faulty selected pid ");
      end loop;
   end Test_Set_Selected_Pid;
--  end read only


--  begin read only
   procedure Test_Set_Value_Of_Selected_Pid (Gnattest_T : in out Test_CViewmodel_Pid_Constants);
   procedure Test_Set_Value_Of_Selected_Pid_53edea (Gnattest_T : in out Test_CViewmodel_Pid_Constants) renames Test_Set_Value_Of_Selected_Pid;
--  id:2.1/53edeadd3a5a945a/Set_Value_Of_Selected_Pid/1/0/
   procedure Test_Set_Value_Of_Selected_Pid (Gnattest_T : in out Test_CViewmodel_Pid_Constants) is
   --  simulator-viewmodel_pid_constants.ads:20:4:Set_Value_Of_Selected_Pid
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxViewModel : pCViewmodel_Pid_Constants;
      pxModel : simulator.Model.pCModel;
   begin
      pxModel := simulator.Model.pxCreate(4);
      pxViewModel := pxCreate(pxModel);
      for i in PositionX .. RotationZ loop
         pxViewModel.Set_Selected_Pid(i);
         pxViewModel.Set_Value_Of_Selected_Pid(fProporitonalPart => 3.0,
                                               fIntegratingPart  => 2.0,
                                               fDerivativePart   => 1.0);
         AUnit.Assertions.Assert(Condition => pxViewModel.txPidScalings(i).fProportionalScale=3.0,
                                 Message   => "Simulator.ViewModel_Pid_Constants.Set_Value_Of_Selected_Pid failed, faulty proportion");
         AUnit.Assertions.Assert(Condition => pxViewModel.txPidScalings(i).fIntegralScale=2.0,
                                 Message   => "Simulator.ViewModel_Pid_Constants.Set_Value_Of_Selected_Pid failed, faulty integral ");
         AUnit.Assertions.Assert(Condition => pxViewModel.txPidScalings(i).fDerivativeScale=1.0,
                                 Message   => "Simulator.ViewModel_Pid_Constants.Set_Value_Of_Selected_Pid failed, faulty derivative ");
      end loop;


--  begin read only
   end Test_Set_Value_Of_Selected_Pid;
--  end read only

end Simulator.Viewmodel_Pid_Constants.CViewmodel_Pid_Constants_Test_Data.CViewmodel_Pid_Constants_Tests;
