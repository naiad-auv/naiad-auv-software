with Gtkada.Builder;

package Callbacks is

   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Draw_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Restart_Simulation(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Update_Wanted_Position(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Update_Pid_Constants(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Init_Pid(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Selected_Pid_Changed(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

end Callbacks;
