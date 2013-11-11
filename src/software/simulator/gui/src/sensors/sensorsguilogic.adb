with Gtk.Main;
with Glib.Main;
with Gtk.Combo_Box;
with Gtk.GEntry;

with Simulator.ViewModel;

package body SensorsGUILogic is

   xViewmodel : Simulator.ViewModel.pCViewModel := Simulator.ViewModel.pxCreate;

   procedure Update_Pid_Constants(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      sPidProportionalConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantP"));
      sPidIntegratingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantI"));
      sPidDerivatingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantD"));
   begin
      xViewmodel.Set_Value_Of_Selected_Pid(fProporitonalPart => Float'Value(sPidProportionalConstant.Get_Text),
                                           fIntegratingPart  => Float'Value(sPidIntegratingConstant.Get_Text),
                                           fDerivativePart   => Float'Value(sPidDerivatingConstant.Get_Text));
   end Update_Pid_Constants;

   procedure Init_Pid(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Simulator.ViewModel;
   begin
      xViewmodel.Set_Selected_Pid(X);
      Selected_Pid_Changed(pxObject);
   end Init_Pid;

   procedure Selected_Pid_Changed(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Simulator.ViewModel;

      xSelectedPID : Gtk.Combo_Box.Gtk_Combo_Box := Gtk.Combo_Box.Gtk_Combo_Box(Gtkada.Builder.Get_Widget(pxObject, "cmbPids"));

   begin

      case xSelectedPID.Get_Active is
         when 0 =>
            xViewmodel.Set_Selected_Pid(X);
         when 1 =>
            xViewmodel.Set_Selected_Pid(Y);
         when 2 =>
            xViewmodel.Set_Selected_Pid(Z);
         when 3 =>
            xViewmodel.Set_Selected_Pid(RotationX);
         When 4 =>
            xViewmodel.Set_Selected_Pid(RotationY);
         When 5 =>
            xViewmodel.Set_Selected_Pid(RotationZ);
         When 6 =>
            xViewmodel.Set_Selected_Pid(AllComponents);
         when others =>
            null;
      end case;

      Update_PID_Texts(pxObject);
   end Selected_Pid_Changed;

   procedure Update_PID_Texts(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      sPidProportionalConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantP"));
      sPidIntegratingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantI"));
      sPidDerivatingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantD"));
   begin

      sPidProportionalConstant.Set_Text(Float'Image(xViewModel.fGet_Selected_Pid_Scaling_Proprotional_Part));
      sPidIntegratingConstant.Set_Text(Float'Image(xViewModel.fGet_Selected_Pid_Scaling_Integrating_Part));
      sPidDerivatingConstant.Set_Text(Float'Image(xViewModel.fGet_Selected_Pid_Scaling_Derivative_Part));
   end Update_PID_Texts;

   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      pragma Unreferenced (pxObject);
   begin
      Gtk.Main.Main_Quit;
   end Quit;

end SensorsGUILogic;
