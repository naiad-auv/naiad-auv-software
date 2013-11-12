with Gtk.Main;
with Glib.Main;
with Gtk.Combo_Box;
with Gtk.GEntry;

with Simulator.Viewmodel_Pid_Constants;
with Ada.Text_IO;

package body PIDConfigurationGUILogic is


   procedure Update_Pid_Constants(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      sPidProportionalConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantP"));
      sPidIntegratingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantI"));
      sPidDerivatingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantD"));
   begin
      xViewmodel.Set_Value_Of_Selected_Pid(fProporitonalPart => Float'Value(sPidProportionalConstant.Get_Text),
                                           fIntegratingPart  => Float'Value(sPidIntegratingConstant.Get_Text),
                                           fDerivativePart   => Float'Value(sPidDerivatingConstant.Get_Text));

      Ada.Text_IO.Put_Line("Updated PID Constants");
   end Update_Pid_Constants;

   procedure Init_Pid(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Simulator.Viewmodel_Pid_Constants;
   begin
      xViewmodel.Set_Selected_Pid(X);
      Selected_Pid_Changed(pxObject);
   end Init_Pid;

   procedure Selected_Pid_Changed(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Simulator.Viewmodel_Pid_Constants;

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
         when 7 =>
            xViewModel.Set_Selected_Pid(AllRotation);
         when 8 =>
            xViewModel.Set_Selected_Pid(AllPosition);
         when others =>
            Ada.Text_IO.Put_Line("Unknown pid component passed");
            xViewModel.Set_Selected_Pid(Unknown);
      end case;

      Update_PID_Texts(pxObject);

      Ada.Text_IO.Put_Line("Selected PID changed");
   end Selected_Pid_Changed;

   procedure Update_PID_Texts(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      sPidProportionalConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantP"));
      sPidIntegratingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantI"));
      sPidDerivatingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantD"));
   begin

      sPidProportionalConstant.Set_Text(Float'Image(xViewModel.fGet_Selected_Pid_Scaling_Proprotional_Part));
      sPidIntegratingConstant.Set_Text(Float'Image(xViewModel.fGet_Selected_Pid_Scaling_Integrating_Part));
      sPidDerivatingConstant.Set_Text(Float'Image(xViewModel.fGet_Selected_Pid_Scaling_Derivative_Part));

   exception
      when E : others =>
         sPidProportionalConstant.Set_Text(Float'Image(0.0));
         sPidIntegratingConstant.Set_Text(Float'Image(0.0));
         sPidDerivatingConstant.Set_Text(Float'Image(0.0));
   end Update_PID_Texts;

   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      pragma Unreferenced (pxObject);
   begin
      Gtk.Main.Main_Quit;
   end Quit;

end PIDConfigurationGUILogic;
