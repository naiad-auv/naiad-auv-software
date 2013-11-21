with Gtkada.Builder;
with Gtk.Main;
with Gtk.Drawing_Area;
with Glib.Main;
with Gdk.Window;
with Gdk.GC;
with Gdk.Color;
with Gdk.Drawable;
with Gtk.Widget;
with Ada.Strings.Unbounded;
with Glib;
with Gtk.Adjustment;
with Ada.Numerics.Elementary_Functions;
with Ada.Numerics;
with Gtk.Combo_Box;
with Gtk.GEntry;
with Gdk.Font;

with Math.Vectors;
with Navigation.Motion_Component;

with PIDConfigurationGUI;
with PIDErrorsGUI;
with SetWantedStuffGUI;
with ActuatorsGui;
with SensorsGUI;

with Projection_2D;

with Simulator.Drawing;


with Ada.Text_IO;
with Math.Matrices;
with Gtk.Status_Bar;
with Simulator.Model;
with Ada.Exceptions;

with Text_Handling;
with PIDErrorsGUILogic;
with Simulator.ViewModel_Pid_Errors;
with MainWindowLogic;

package body MainWindowLogic is



   function bUpdateStatusBarText(xBar : TStatusBar) return boolean is

      use Simulator.Model;

      msgid : Gtk.Status_Bar.Message_Id;

   begin

      xBar.xStatusBar.Remove_All(xBar.xStatusBar.Get_Context_Id("Statusbar test"));

      case xBar.eId is
      when Simulator.Drawing.Top =>
         msgid := xBar.xStatusBar.Push(xBar.xStatusBar.Get_Context_Id("Statusbar test"),"X: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_X) & " Y: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_Y));
      when Simulator.Drawing.Side =>
         msgid := xBar.xStatusBar.Push(xBar.xStatusBar.Get_Context_Id("Statusbar test"), "X: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_X) & " Z: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_Z));
      when Simulator.Drawing.Back =>
         msgid := xBar.xStatusBar.Push(xBar.xStatusBar.Get_Context_Id("Statusbar test"), "Y: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_Y) & " Z: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_Z));
      when Simulator.Drawing.Full =>
         msgid := xBar.xStatusBar.Push(xBar.xStatusBar.Get_Context_Id("Statusbar test"), "X Rot: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Pid_Errors(RotationX)) & " Y Rot: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Pid_Errors(RotationY)) & " Z Rot: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Pid_Errors(RotationZ)));
      when others =>
         null;
      end case;

      return true;
   exception
      when E : others =>
         return false;

   end bUpdateStatusBarText;


   function bUpdate_Viewmodel(iRedundant : Integer) return Boolean is

      use Simulator.ViewModel_Pid_Errors;
   begin
      if not bSimulationRunning then
         return true;
      end if;

      xViewmodel.Update(fDeltaTime => 0.01);

      if PIDErrorsGUILogic.xViewModel /= null then
         PIDErrorsGUILogic.xViewmodel.Update_Delta_Time;
      end if;

      return True;
   end bUpdate_Viewmodel;

   procedure Register_Timeout_Handlers(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;

      xUpdateIntervall : Glib.Guint := 20;
   begin

      if xTimeoutSideView = 0 then
         xTimeoutSideView := Simulator.Drawing.Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwSide")), Simulator.Drawing.Side, xViewModel));
      end if;

      if xTimeoutTopView = 0 then
         xTimeoutTopView := Simulator.Drawing.Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwTop")), Simulator.Drawing.Top, xViewModel));
      end if;

      if xTimeoutBackView = 0 then
         xTimeoutBackView := Simulator.Drawing.Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwBack")), Simulator.Drawing.Back, xViewModel));

      end if;

      if xTimeoutCurrent3D = 0 then
         xTimeoutCurrent3D := Simulator.Drawing.Drawing_Timeout_Drawing_3DView.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_3DView'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area(Gtkada.Builder.Get_Widget(pxObject, "drw3D")), 300, 300, Simulator.Drawing.Full, xViewModel));
      end if;

      if xTimeoutWanted3D = 0 then
         xTimeoutWanted3D := Simulator.Drawing.Drawing_Timeout_Drawing_3DView.Timeout_Add
           (xUpdateIntervall, Simulator.Drawing.bDraw_3DView'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area(Gtkada.Builder.Get_Widget(pxObject, "drwWantedFull")), 85, 85, Simulator.Drawing.FullWanted, xViewModel));
      end if;


      if xTimeoutUpdateViewmodel = 0 then
         xTimeoutUpdateViewmodel := Update_Viewmodel_PKG.Timeout_Add
           (10, bUpdate_Viewmodel'Access, 1);
      end if;

      if xTimeOutTopStatusBar = 0 then
         xTimeOutTopStatusBar := Drawing_Timeout_Status_Bars.Timeout_Add
           (xUpdateIntervall, bUpdateStatusBarText'Access, (Gtk.Status_Bar.Gtk_Status_Bar(pxObject.Get_Widget("TopViewStatusBar")), Simulator.Drawing.Top));
      end if;

      if xTimeOutSideStatusBar = 0 then
         xTimeOutSideStatusBar := Drawing_Timeout_Status_Bars.Timeout_Add
           (xUpdateIntervall, bUpdateStatusBarText'Access, (Gtk.Status_Bar.Gtk_Status_Bar(pxObject.Get_Widget("SideViewStatusBar")), Simulator.Drawing.Side));
      end if;

      if xTimeOutBackStatusBar = 0 then
         xTimeOutBackStatusBar := Drawing_Timeout_Status_Bars.Timeout_Add
           (xUpdateIntervall, bUpdateStatusBarText'Access, (Gtk.Status_Bar.Gtk_Status_Bar(pxObject.Get_Widget("BackViewStatusBar")), Simulator.Drawing.Back));
      end if;

      if xTimeOut3DStatusBar = 0 then
         xTimeOut3DStatusBar := Drawing_Timeout_Status_Bars.Timeout_Add
           (xUpdateIntervall, bUpdateStatusBarText'Access, (Gtk.Status_Bar.Gtk_Status_Bar(pxObject.Get_Widget("3DViewStatusBar")), Simulator.Drawing.Full));
      end if;
   end Register_Timeout_Handlers;

   procedure Clear_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class; sName : String) is
      xWindow : Gtk.Drawing_Area.Gtk_Drawing_Area := Gtk.Drawing_Area.Gtk_Drawing_Area(Gtkada.Builder.Get_Widget(pxObject, sName));
   begin
      Gdk.Window.Clear(Gtk.Drawing_Area.Get_Window(xWindow));
   exception
      when E : others =>
         Ada.Text_IO.Put_Line(ada.Exceptions.Exception_Message(E));
   end Clear_Window;

   procedure Clear_Drawing_Areas(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      Clear_Window(pxObject, "drwSide");
      Clear_Window(pxObject, "drwTop");
      Clear_Window(pxObject, "drwBack");
   end Clear_Drawing_Areas;

   procedure Restart_Simulation(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      xViewmodel.Restart;

      Clear_Drawing_Areas(pxObject);

      PIDErrorsGUI.Reset;

      bSimulationRunning := false;
   end Restart_Simulation;

   procedure Start_Simulation(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      bSimulationRunning := true;
   end Start_Simulation;

   procedure Pause_Simulation(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      bSimulationRunning := false;
   end Pause_Simulation;

   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      pragma Unreferenced (pxObject);
   begin
      Gtk.Main.Main_Quit;
   end Quit;

   --windows
   procedure Show_Thruster_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      ActuatorsGUI.Start_GUI(xModel);
   end Show_Thruster_Window;

   procedure Show_PIDCfg_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      PIDConfigurationGUI.Start_GUI(xModel);
   end Show_Pidcfg_Window;

   procedure Show_WantedStuff_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      SetWantedStuffGUI.Start_GUI(xModel);
   end Show_WantedStuff_Window;


   procedure Show_PID_Errors_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      PIDErrorsGUI.Start_GUI(xModel);
   end Show_PID_Errors_Window;

   procedure Show_Sensor_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      SensorsGUI.Start_GUI(xModel);
   end Show_Sensor_Window;



end MainWindowLogic;
