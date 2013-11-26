with Gtkada.Builder;
with Simulator.Model;
with Simulator.Viewmodel_Pid_Constants;

package PIDConfigurationGUILogic is


   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Update_Pid_Constants(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Init_Pid(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Selected_Pid_Changed(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

  xViewmodel : Simulator.Viewmodel_Pid_Constants.pCViewmodel_Pid_Constants;

private


   procedure Update_PID_Texts(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

end PIDConfigurationGUILogic;
