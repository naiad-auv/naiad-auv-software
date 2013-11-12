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


with Ada.Text_IO;
with Math.Matrices;
with Gtk.Status_Bar;
with Simulator.Model;
with Ada.Exceptions;

with Text_Handling;
with PIDErrorsGUILogic;

package body MainWindowLogic is

   type EView is (Side, Top, Back, Full, FullWanted);

   type TPoint is record
      X : float;
      Y : float;
   end record;

   type TViewPositions is record
      xCurrentPosition : TPoint;
      xWantedPosition : TPoint;
   end record;

   type TView is record
      xGraph : Gtk.Drawing_Area.Gtk_Drawing_Area;
      eId : EView;
   end record;

   type T3DView is record
      xCanvas : Gtk.Drawing_Area.Gtk_Drawing_Area;
      iHeight : integer;
      iWidth : integer;
      eId : EView;
   end record;


   type TStatusBar is record
      xStatusBar : Gtk.Status_Bar.Gtk_Status_Bar;
      eId : EView;
   end record;

   package Drawing_Timeout_Drawing_View is new Glib.Main.Generic_Sources (TView);
   package Drawing_Timeout_Drawing_3DView is new Glib.Main.Generic_Sources (T3DView);
   package Drawing_Timeout_Status_Bars is new Glib.Main.Generic_Sources (TStatusBar);

   package Update_Viewmodel_PKG is new Glib.Main.Generic_Sources(Integer);

   xTimeoutSideView : Glib.Main.G_Source_Id;
   xTimeoutBackView : Glib.Main.G_Source_Id;
   xTimeoutTopView : Glib.Main.G_Source_Id;
   xTimeoutCurrent3D : Glib.Main.G_Source_Id;
   xTimeoutWanted3D : Glib.Main.G_Source_Id;

   xTimeOutTopStatusBar :Glib.Main.G_Source_Id;
   xTimeOutSideStatusBar :Glib.Main.G_Source_Id;
   xTimeOutBackStatusBar :Glib.Main.G_Source_Id;
   xTimeOut3DStatusBar :Glib.Main.G_Source_Id;

   xTimeoutUpdateViewmodel : Glib.Main.G_Source_Id;

   bSimulationRunning : boolean := false;

   function fGet_Positions_For_View(eID : EView) return TViewPositions is
      xViewPositions : TViewPositions;
      xCurrent_Position : math.Vectors.CVector := xViewmodel.xGet_Submarine_Current_Position;
      xWanted_Position : math.Vectors.CVector := xViewmodel.xGet_Submarine_Wanted_Position;
   begin

      case eID is
         when Side =>
            xViewPositions.xCurrentPosition := (xCurrent_Position.fGet_X, xCurrent_Position.fGet_Z);
            xViewPositions.xWantedPosition := (xWanted_Position.fGet_X, xWanted_Position.fGet_Z);
         when Top =>
            xViewPositions.xCurrentPosition := (xCurrent_Position.fGet_X, xCurrent_Position.fGet_Y);
            xViewPositions.xWantedPosition := (xWanted_Position.fGet_X, xWanted_Position.fGet_Y);
         when Back =>
            xViewPositions.xCurrentPosition := (xCurrent_Position.fGet_Y, xCurrent_Position.fGet_Z);
            xViewPositions.xWantedPosition := (xWanted_Position.fGet_Y, xWanted_Position.fGet_Z);
         when others =>
            xViewPositions := ((5.0, 5.0), (5.0, 5.0));

      end case;

      return xViewPositions;
   end fGet_Positions_For_View;



   function bUpdateStatusBarText(xBar : TStatusBar) return boolean is

      use Simulator.Model;

      msgid : Gtk.Status_Bar.Message_Id;

   begin

      xBar.xStatusBar.Remove_All(xBar.xStatusBar.Get_Context_Id("Statusbar test"));

      case xBar.eId is
      when Top =>
         msgid := xBar.xStatusBar.Push(xBar.xStatusBar.Get_Context_Id("Statusbar test"),"X: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_X) & " Y: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_Y));
      when Side =>
         msgid := xBar.xStatusBar.Push(xBar.xStatusBar.Get_Context_Id("Statusbar test"), "X: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_X) & " Z: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_Z));
      when Back =>
         msgid := xBar.xStatusBar.Push(xBar.xStatusBar.Get_Context_Id("Statusbar test"), "Y: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_Y) & " Z: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.xGet_Submarine_Current_Position.fGet_Z));
      when Full =>
         msgid := xBar.xStatusBar.Push(xBar.xStatusBar.Get_Context_Id("Statusbar test"), "X Rot: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Pid_Errors(RotationX)) & " Y Rot: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Pid_Errors(RotationY)) & " Z Rot: " & Text_Handling.sGet_Formatted_Float_String(xViewModel.fGet_Pid_Errors(RotationZ)));
      when others =>
         null;
      end case;

      return true;
   exception
      when E : others =>
         return false;

   end bUpdateStatusBarText;

   function bDraw_View (xView : in TView) return Boolean is
      xWindowForView : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xRedColor : Gdk.GC.Gdk_GC;
      xCustomColor : Gdk.Color.Gdk_Color;

      xViewPositions : TViewPositions := fGet_Positions_For_View(xView.eId);
   begin
      xWindowForView := Gtk.Drawing_Area.Get_Window (xView.xGraph);

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForView);
      Gdk.GC.Set_Foreground(xBlackColor, Gdk.Color.Black (Gtk.Widget.Get_Default_Colormap));
      Gdk.Color.Set_Rgb(xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xBlueColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xBlueColor, xCustomColor);
      Gdk.Color.Set_Rgb(xCustomColor,65535,0,0);
      Gdk.GC.Gdk_New (xRedColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xRedColor, xCustomColor);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlackColor,
         X1       => 0,
         Y1       => 150,
         X2       => 500,
         Y2       => 150);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlackColor,
         X1       => 150,
         Y1       => 0,
         X2       => 150,
         Y2       => 500);

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xBlueColor,
         X        => Glib.Gint(151.0 + xViewPositions.xCurrentPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xCurrentPosition.Y));


      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X + 1.0),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y + 1.0));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X - 1.0),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y - 1.0));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y));

      return True;
   end bDraw_View;

   function bDraw_3DView (xView : T3DView) return Boolean is

      use Math.Matrices;
      xWindowForView : Gdk.Window.Gdk_Window;

      xGreenColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xRedColor : Gdk.GC.Gdk_GC;
      xBlackColor : Gdk.GC.Gdk_GC;

      xCustomColor : Gdk.Color.Gdk_Color;

      xEndPoints : Projection_2D.TOrientationProjectionPoints;
      xPlaneEndPoints : Projection_2D.TPlaneProjectionPoints;

      xOrientationToDraw : Math.Matrices.CMatrix;

   begin
      Gdk.Window.Clear(Gtk.Drawing_Area.Get_Window(xView.xCanvas));

      xWindowForView := Gtk.Drawing_Area.Get_Window (xView.xCanvas);

      Case xView.eId is
         when Full =>
            xOrientationToDraw := xViewModel.xGet_Submarine_Current_Orientation;
         when FullWanted =>
            xOrientationToDraw := xViewModel.xGet_Submarine_Wanted_Orientation;
         when others =>
            return true;
      end case;


      xEndPoints := Projection_2D.txGet_Orientation_2D_Projection(iCenterX     => Integer(xView.iWidth/2),
                                                                  iCenterY     => Integer(xView.iHeight/2),
                                                                  iWidth       => xView.iWidth,
                                                                  iHeight      => xView.iHeight,
                                                                  xOrientation => xOrientationToDraw);

      xPlaneEndPoints := Projection_2D.txGet_Plane_2D_Projection(iCenterX     => Integer(xView.iWidth/2),
                                                                  iCenterY     => Integer(xView.iHeight/2),
                                                                  iWidth       => xView.iWidth,
                                                                  iHeight      => xView.iHeight,
                                                                  xOrientation => xOrientationToDraw);

      -- Set Colors
      Gdk.GC.Gdk_New (xGreenColor, xWindowForView);
      Gdk.Color.Set_Rgb(xCustomColor,0,65535,0);
      Gdk.GC.Set_Rgb_Fg_Color(xGreenColor,xCustomColor);

      Gdk.Color.Set_Rgb(xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xBlueColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xBlueColor, xCustomColor);

      Gdk.Color.Set_Rgb(xCustomColor,65535,0,0);
      Gdk.GC.Gdk_New (xRedColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xRedColor, xCustomColor);

      Gdk.Color.Set_Rgb(xCustomColor,0,0,0);
      Gdk.GC.Gdk_New (xBlackColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xBlackColor, xCustomColor);



      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlackColor,
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlackColor,
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlackColor,
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlackColor,
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).Y));


      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xRedColor,
         X1       => Glib.Gint(xView.iWidth / 2),
         Y1       => Glib.Gint(xView.iHeight / 2),
         X2       => Glib.Gint(xEndPoints(Projection_2D.XVector).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.XVector).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xGreenColor,
         X1       => Glib.Gint(xView.iWidth / 2),
         Y1       => Glib.Gint(xView.iHeight / 2),
         X2       => Glib.Gint(xEndPoints(Projection_2D.YVector).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.YVector).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlueColor,
         X1       => Glib.Gint(xView.iWidth / 2),
         Y1       => Glib.Gint(xView.iHeight / 2),
         X2       => Glib.Gint(xEndPoints(Projection_2D.ZVector).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.ZVector).Y));

      --X Arrowhead
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xRedColor,
         X1       => Glib.Gint(xEndPoints(Projection_2D.XVector).X),
         Y1       => Glib.Gint(xEndPoints(Projection_2D.XVector).Y),
         X2       => Glib.Gint(xEndPoints(Projection_2D.XArrowLeftTail).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.XArrowLeftTail).Y));
      Gdk.Drawable.Draw_Line

        (Drawable => xWindowForView,
         GC       => xRedColor,
         X1       => Glib.Gint(xEndPoints(Projection_2D.XVector).X),
         Y1       => Glib.Gint(xEndPoints(Projection_2D.XVector).Y),
         X2       => Glib.Gint(xEndPoints(Projection_2D.XArrowRightTail).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.XArrowRightTail).Y));

      --Y Arrowhead
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xGreenColor,
         X1       => Glib.Gint(xEndPoints(Projection_2D.YVector).X),
         Y1       => Glib.Gint(xEndPoints(Projection_2D.YVector).Y),
         X2       => Glib.Gint(xEndPoints(Projection_2D.YArrowLeftTail).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.YArrowLeftTail).Y));
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xGreenColor,
         X1       => Glib.Gint(xEndPoints(Projection_2D.YVector).X),
         Y1       => Glib.Gint(xEndPoints(Projection_2D.YVector).Y),
         X2       => Glib.Gint(xEndPoints(Projection_2D.YArrowRightTail).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.YArrowRightTail).Y));


      --Z Arrowhead
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlueColor,
         X1       => Glib.Gint(xEndPoints(Projection_2D.ZVector).X),
         Y1       => Glib.Gint(xEndPoints(Projection_2D.ZVector).Y),
         X2       => Glib.Gint(xEndPoints(Projection_2D.ZArrowLeftTail).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.ZArrowLeftTail).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlueColor,
         X1       => Glib.Gint(xEndPoints(Projection_2D.ZVector).X),
         Y1       => Glib.Gint(xEndPoints(Projection_2D.ZVector).Y),
         X2       => Glib.Gint(xEndPoints(Projection_2D.ZArrowRightTail).X),
         Y2       => Glib.Gint(xEndPoints(Projection_2D.ZArrowRightTail).Y));

      return True;
   end bDraw_3DView;

   function bUpdate_Viewmodel(iRedundant : Integer) return Boolean is
   begin
      if not bSimulationRunning then
         return true;
      end if;

      xViewmodel.Update(fDeltaTime => 0.01);

      return True;
   end bUpdate_Viewmodel;

   procedure Register_Timeout_Handlers(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;

      xUpdateIntervall : Glib.Guint := 20;
   begin

      if xTimeoutSideView = 0 then
         xTimeoutSideView := Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwSide")), Side));
      end if;

      if xTimeoutTopView = 0 then
         xTimeoutTopView := Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwTop")), Top));
      end if;

      if xTimeoutBackView = 0 then
         xTimeoutBackView := Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwBack")), Back));

      end if;

      if xTimeoutCurrent3D = 0 then
         xTimeoutCurrent3D := Drawing_Timeout_Drawing_3DView.Timeout_Add
           (xUpdateIntervall, bDraw_3DView'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area(Gtkada.Builder.Get_Widget(pxObject, "drw3D")), 300, 300, Full));
      end if;

      if xTimeoutWanted3D = 0 then
         xTimeoutWanted3D := Drawing_Timeout_Drawing_3DView.Timeout_Add
           (xUpdateIntervall, bDraw_3DView'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area(Gtkada.Builder.Get_Widget(pxObject, "drwWantedFull")), 85, 85, FullWanted));
      end if;


      if xTimeoutUpdateViewmodel = 0 then
         xTimeoutUpdateViewmodel := Update_Viewmodel_PKG.Timeout_Add
           (10, bUpdate_Viewmodel'Access, 1);
      end if;

      if xTimeOutTopStatusBar = 0 then
         xTimeOutTopStatusBar := Drawing_Timeout_Status_Bars.Timeout_Add
           (xUpdateIntervall, bUpdateStatusBarText'Access, (Gtk.Status_Bar.Gtk_Status_Bar(pxObject.Get_Widget("TopViewStatusBar")), Top));
      end if;

      if xTimeOutSideStatusBar = 0 then
         xTimeOutSideStatusBar := Drawing_Timeout_Status_Bars.Timeout_Add
           (xUpdateIntervall, bUpdateStatusBarText'Access, (Gtk.Status_Bar.Gtk_Status_Bar(pxObject.Get_Widget("SideViewStatusBar")), Side));
      end if;

      if xTimeOutBackStatusBar = 0 then
         xTimeOutBackStatusBar := Drawing_Timeout_Status_Bars.Timeout_Add
           (xUpdateIntervall, bUpdateStatusBarText'Access, (Gtk.Status_Bar.Gtk_Status_Bar(pxObject.Get_Widget("BackViewStatusBar")), Back));
      end if;

      if xTimeOut3DStatusBar = 0 then
         xTimeOut3DStatusBar := Drawing_Timeout_Status_Bars.Timeout_Add
           (xUpdateIntervall, bUpdateStatusBarText'Access, (Gtk.Status_Bar.Gtk_Status_Bar(pxObject.Get_Widget("3DViewStatusBar")), Full));
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
