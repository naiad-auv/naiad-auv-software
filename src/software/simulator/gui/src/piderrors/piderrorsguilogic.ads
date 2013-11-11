with Gtkada.Builder;
with Simulator.Model;
with Simulator.ViewModel_Pid_Errors;

package PIDErrorsGUILogic is

   xModel : Simulator.Model.pCModel;
   xViewModel : Simulator.ViewModel_Pid_Errors.pCViewModel_Pid_Errors;

   procedure Draw_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

end PIDErrorsGUILogic;
