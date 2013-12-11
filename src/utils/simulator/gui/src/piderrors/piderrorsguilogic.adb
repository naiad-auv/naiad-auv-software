with Gtk.Main;
with Glib.Main;
with Gtk.Combo_Box;
with Gtk.GEntry;

with Gdk;
with Gdk.Window;
with Gdk.GC;
with Gdk.Color;
with Gdk.Font;
with Gtk.Widget;
with Gtk.Drawing_Area;
with Gdk.Drawable;
with Gtk.Label;
with Gtkada;

with Ada.Text_IO;
with motioncontrol.Motion_Component;
with Text_Handling;

package body PIDErrorsGUILogic is

   function bUpdate_Window(xBuilder : TBuilder) return boolean is
   begin
      Update_View_Model;
      Update_Error_Labels(xBuilder.xBuilder);

      return true;
   end bUpdate_Window;

   procedure Reset is
      use Simulator.ViewModel_Pid_Errors;
   begin
      if(xViewModel /= null) then
         xViewModel.Reset_Min_Max_Error_Buffers;
      end if;
   end Reset;

   procedure Update_Error_Labels(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is


      xXPositionLabel : Gtk.Label.Gtk_Label;
      xYPositionLabel : Gtk.Label.Gtk_Label;
      xZPositionLabel : Gtk.Label.Gtk_Label;
      xXRotationLabel : Gtk.Label.Gtk_Label;
      xYRotationLabel : Gtk.Label.Gtk_Label;
      xZRotationLabel : Gtk.Label.Gtk_Label;
   begin

      xXPositionLabel := Gtk.Label.Gtk_Label(Gtkada.Builder.Get_Widget(pxObject, "lblXPosition"));
      xXPositionLabel.Set_Text("Position X (Mi:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Minimum_Error(Simulator.ViewModel_Pid_Errors.PositionX)) & " Ma:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Maximum_Error(Simulator.ViewModel_Pid_Errors.PositionX)) & " D:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Min_Max_Error_Diff(Simulator.ViewModel_Pid_Errors.PositionX)) & " O: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_OscilationTime(Simulator.ViewModel_Pid_Errors.PositionX)));

      xYPositionLabel := Gtk.Label.Gtk_Label(Gtkada.Builder.Get_Widget(pxObject, "lblYPosition"));
      xYPositionLabel.Set_Text("Position Y (Mi:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Minimum_Error(Simulator.ViewModel_Pid_Errors.PositionY)) & " Ma:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Maximum_Error(Simulator.ViewModel_Pid_Errors.PositionY)) & " D:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Min_Max_Error_Diff(Simulator.ViewModel_Pid_Errors.PositionY)) & " O: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_OscilationTime(Simulator.ViewModel_Pid_Errors.PositionY)));

      xZPositionLabel := Gtk.Label.Gtk_Label(Gtkada.Builder.Get_Widget(pxObject, "lblZPosition"));
      xZPositionLabel.Set_Text("Position Z (Mi:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Minimum_Error(Simulator.ViewModel_Pid_Errors.PositionZ)) & " Ma:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Maximum_Error(Simulator.ViewModel_Pid_Errors.PositionZ)) & " D:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Min_Max_Error_Diff(Simulator.ViewModel_Pid_Errors.PositionZ)) & " O: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_OscilationTime(Simulator.ViewModel_Pid_Errors.PositionZ)));

      xXRotationLabel := Gtk.Label.Gtk_Label(Gtkada.Builder.Get_Widget(pxObject, "lblRotX"));
      xXRotationLabel.Set_Text("Rotation X (Mi:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Minimum_Error(Simulator.ViewModel_Pid_Errors.RotationX)) & " Ma:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Maximum_Error(Simulator.ViewModel_Pid_Errors.RotationX)) & " D:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Min_Max_Error_Diff(Simulator.ViewModel_Pid_Errors.RotationX)) & " O: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_OscilationTime(Simulator.ViewModel_Pid_Errors.RotationX)));

      xYRotationLabel := Gtk.Label.Gtk_Label(Gtkada.Builder.Get_Widget(pxObject, "lblRotY"));
      xYRotationLabel.Set_Text("Rotation Y (Mi:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Minimum_Error(Simulator.ViewModel_Pid_Errors.RotationY)) & " Ma:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Maximum_Error(Simulator.ViewModel_Pid_Errors.RotationY)) & " D:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Min_Max_Error_Diff(Simulator.ViewModel_Pid_Errors.RotationY))& " O: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_OscilationTime(Simulator.ViewModel_Pid_Errors.RotationY)));

      xZRotationLabel := Gtk.Label.Gtk_Label(Gtkada.Builder.Get_Widget(pxObject, "lblRotZ"));
      xZRotationLabel.Set_Text("Rotation Z (Mi:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Minimum_Error(Simulator.ViewModel_Pid_Errors.RotationZ)) & " Ma:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Maximum_Error(Simulator.ViewModel_Pid_Errors.RotationZ)) & " D:" & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Min_Max_Error_Diff(Simulator.ViewModel_Pid_Errors.RotationZ))& " O: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_OscilationTime(Simulator.ViewModel_Pid_Errors.RotationZ)));

   end Update_Error_Labels;

   procedure Update_View_Model is
   begin
      xViewModel.Update_Min_Max_Error_Buffers;
   end Update_View_Model;


procedure Register_Timeouts(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;
      use Simulator.ViewModel_Pid_Errors;

      xUpdateIntervall : Glib.Guint := 20;
   begin

      if xTimeoutPidPositionX = 0 then
         xTimeoutPidPositionX := Simulator.Drawing.Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidPosX")), PositionX, xViewModel));
      end if;

      if xTimeoutPidPositionY = 0 then
         xTimeoutPidPositionY := Simulator.Drawing.Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidPosY")), PositionY, xViewModel));
      end if;

      if xTimeoutPidPositionZ = 0 then
         xTimeoutPidPositionZ := Simulator.Drawing.Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidPosZ")), PositionZ, xViewModel));
      end if;

      if xTimeoutPidRotationX = 0 then
         xTimeoutPidRotationX := Simulator.Drawing.Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidRotX")), RotationX, xViewModel));
      end if;

      if xTimeoutPidRotationY = 0 then
         xTimeoutPidRotationY := Simulator.Drawing.Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidRotY")), RotationY, xViewModel));
      end if;

      if xTimeoutPidRotationZ = 0 then
         xTimeoutPidRotationZ := Simulator.Drawing.Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidRotZ")), RotationZ, xViewModel));
      end if;

      if xTimeoutUpdateWindow = 0 then
         xTimeoutUpdateWindow := Update_General_PKG.Timeout_Add
           (xUpdateIntervall, bUpdate_Window'Access, TBuilder'(xBuilder => pxObject));
      end if;

   end Register_Timeouts;
end PIDErrorsGUILogic;
