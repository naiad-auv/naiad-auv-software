with Math;
with Projection_2D;
with Gdk.Color;
with Math.Matrices;
with Gdk.Drawable;
with Glib;
with Gtk.Widget;
with Math.Vectors;

package body Simulator.Drawing is

   function bDraw_View (xView : in TView) return Boolean is
      xWindowForView : Gdk.Window.Gdk_Window;

      xColors : ViewColors;

      xViewPositions : TViewPositions := fGet_Positions_For_View(xView.eId, xView.xMainWindowViewModel);
   begin
      xWindowForView := Gtk.Drawing_Area.Get_Window (xView.xGraph);

      xColors := xGet_Colors(xWindowForView);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColors.xBlackColor,
         X1       => 0,
         Y1       => 150,
         X2       => 500,
         Y2       => 150);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColors.xBlackColor,
         X1       => 150,
         Y1       => 0,
         X2       => 150,
         Y2       => 500);

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xColors.xBlueColor,
         X        => Glib.Gint(151.0 + xViewPositions.xCurrentPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xCurrentPosition.Y));


      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xColors.xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X + 1.0),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xColors.xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y + 1.0));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xColors.xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X - 1.0),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xColors.xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y - 1.0));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xColors.xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y));

      return True;
   end bDraw_View;

   procedure Draw_Cross(xCanvas : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xStartPoint : TPoint; xEndPoint : TPoint) is
   begin
      Gdk.Drawable.Draw_Line
        (Drawable => xCanvas,
         GC       => xColors.xBlackColor,
         X1       => 0,
         Y1       => 150,
         X2       => 500,
         Y2       => 150);

      Gdk.Drawable.Draw_Line
        (Drawable => xCanvas,
         GC       => xColors.xBlackColor,
         X1       => 150,
         Y1       => 0,
         X2       => 150,
         Y2       => 500);
   end Draw_Cross;

   function bDraw_3DView (xView : T3DView) return Boolean is

      use Math.Matrices;

      xWindowForView : Gdk.Window.Gdk_Window;
      xColors : ViewColors;

      xEndPoints : Projection_2D.TOrientationProjectionPoints;

      xOrientationToDraw : Math.Matrices.CMatrix;

   begin
      Gdk.Window.Clear(Gtk.Drawing_Area.Get_Window(xView.xCanvas));

      xWindowForView := Gtk.Drawing_Area.Get_Window (xView.xCanvas);

      Case xView.eId is
         when Full =>
            xOrientationToDraw := xView.xMainWindowViewModel.xGet_Submarine_Current_Orientation;
         when FullWanted =>
            xOrientationToDraw := xView.xMainWindowViewModel.xGet_Submarine_Wanted_Orientation;
         when others =>
            return true;
      end case;


      xEndPoints := Projection_2D.txGet_Orientation_2D_Projection(iCenterX     => Integer(xView.iWidth/2),
                                                                  iCenterY     => Integer(xView.iHeight/2),
                                                                  iWidth       => xView.iWidth,
                                                                  iHeight      => xView.iHeight,
                                                                  xOrientation => xOrientationToDraw);


      xColors := xGet_Colors(xWindowForView);

      Draw_Plane(xWindowForView, xColors, xOrientationToDraw, xView);

      Draw_Axis_Arrow(xWindowForView, xColors.xRedColor, xView, xEndPoints(Projection_2D.XVector));
      Draw_Axis_Arrow(xWindowForView, xColors.xGreenColor, xView,xEndPoints(Projection_2D.YVector));
      Draw_Axis_Arrow(xWindowForView, xColors.xBlueColor, xView, xEndPoints(Projection_2D.ZVector));


      return True;
   end bDraw_3DView;

   function xGet_Colors(xWindowForView : Gdk.Window.Gdk_Window) return ViewColors is
      xColors : ViewColors;
   begin
      Gdk.GC.Gdk_New (xColors.xGreenColor, xWindowForView);
      Gdk.Color.Set_Rgb(xColors.xCustomColor,0,65535,0);
      Gdk.GC.Set_Rgb_Fg_Color(xColors.xGreenColor,xColors.xCustomColor);

      Gdk.Color.Set_Rgb(xColors.xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xColors.xBlueColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xColors.xBlueColor, xColors.xCustomColor);

      Gdk.Color.Set_Rgb(xColors.xCustomColor,65535,0,0);
      Gdk.GC.Gdk_New (xColors.xRedColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xColors.xRedColor, xColors.xCustomColor);

      Gdk.Color.Set_Rgb(xColors.xCustomColor,0,0,0);
      Gdk.GC.Gdk_New (xColors.xBlackColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xColors.xBlackColor, xColors.xCustomColor);

      return xColors;
   end xGet_Colors;

   procedure Draw_Plane(xWindowForView : Gdk.Window.Gdk_Window; xColors : ViewColors; xOrientationToDraw : Math.Matrices.CMatrix; xView : T3DView) is
      xPlaneEndPoints : Projection_2D.TPlaneProjectionPoints;

   begin

      xPlaneEndPoints := Projection_2D.txGet_Plane_2D_Projection(iCenterX     => Integer(xView.iWidth/2),
                                                                 iCenterY     => Integer(xView.iHeight/2),
                                                                 iWidth       => xView.iWidth,
                                                                 iHeight      => xView.iHeight,
                                                                 xOrientation => xOrientationToDraw);
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColors.xBlackColor,
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColors.xBlackColor,
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColors.xBlackColor,
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColors.xBlackColor,
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).Y));
   end Draw_Plane;

   procedure Draw_Axis_Arrow(xWindowForView : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xView : T3DView; xAxisArrowPoints : Projection_2D.TAxisArrow) is
   begin
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColor,
         X1       => Glib.Gint(xView.iWidth / 2),
         Y1       => Glib.Gint(xView.iHeight / 2),
         X2       => Glib.Gint(xAxisArrowPoints(Projection_2D.Head).X),
         Y2       => Glib.Gint(xAxisArrowPoints(Projection_2D.Head).Y));

      Draw_Arrow_Head(xWindowForView, xColor, xView, xAxisArrowPoints);
   end Draw_Axis_Arrow;

   procedure Draw_Arrow_Head(xWindowForView : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xView : T3DView; xAxisArrowPoints : Projection_2D.TAxisArrow) is
   begin
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColor,
         X1       => Glib.Gint(xAxisArrowPoints(Projection_2D.Head).X),
         Y1       => Glib.Gint(xAxisArrowPoints(Projection_2D.Head).Y),
         X2       => Glib.Gint(xAxisArrowPoints(Projection_2D.LeftTail).X),
         Y2       => Glib.Gint(xAxisArrowPoints(Projection_2D.LeftTail).Y));
      Gdk.Drawable.Draw_Line

        (Drawable => xWindowForView,
         GC       => xColor,
         X1       => Glib.Gint(xAxisArrowPoints(Projection_2D.Head).X),
         Y1       => Glib.Gint(xAxisArrowPoints(Projection_2D.Head).Y),
         X2       => Glib.Gint(xAxisArrowPoints(Projection_2D.RightTail).X),
         Y2       => Glib.Gint(xAxisArrowPoints(Projection_2D.RightTail).Y));
   end Draw_Arrow_Head;

   function fGet_Positions_For_View (eID : Simulator.Drawing.EView; xViewModel : Simulator.ViewModel_Representation.pCViewModel_Representation) return TViewPositions is
      xViewPositions : TViewPositions;
      xCurrent_Position : math.Vectors.CVector := xViewmodel.xGet_Submarine_Current_Position;
      xWanted_Position : math.Vectors.CVector := xViewmodel.xGet_Submarine_Wanted_Position;
   begin

      case eID is
         when Side =>
            xViewPositions.xCurrentPosition := (xCurrent_Position.fGet_X, xCurrent_Position.fGet_Z);
            xViewPositions.xWantedPosition := (xWanted_Position.fGet_X, xWanted_Position.fGet_Z);
         when Top =>
            xViewPositions.xCurrentPosition := (-xCurrent_Position.fGet_Y, xCurrent_Position.fGet_X);
            xViewPositions.xWantedPosition := (-xWanted_Position.fGet_Y, xWanted_Position.fGet_X);
         when Back =>
            xViewPositions.xCurrentPosition := (-xCurrent_Position.fGet_Y, xCurrent_Position.fGet_Z);
            xViewPositions.xWantedPosition := (-xWanted_Position.fGet_Y, xWanted_Position.fGet_Z);
         when others =>
            xViewPositions := ((5.0, 5.0), (5.0, 5.0));

      end case;

      return xViewPositions;
   end fGet_Positions_For_View;

 function bDraw_Pid (xPid : in TPidGraph) return Boolean is
      xWindowForPid : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xCustomColor : Gdk.Color.Gdk_Color;
   begin
      xWindowForPid := Gtk.Drawing_Area.Get_Window (xPid.xGraph);

      if (bPid_Counter_Restarted) then
         Gdk.Window.Clear(xWindowForPid);
      end if;

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForPid);
      Gdk.GC.Set_Foreground(xBlackColor, Gdk.Color.Black (Gtk.Widget.Get_Default_Colormap));
      Gdk.Color.Set_Rgb(xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xBlueColor, xWindowForPid);
      Gdk.GC.Set_Rgb_Fg_Color(xBlueColor, xCustomColor);

      -- Draw X axis
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForPid,
         GC       => xBlackColor,
         X1       => 0,
         Y1       => 25,
         X2       => 1000,
         Y2       => 25);

      -- Draw error point
      if (abs(fGet_Pid_Scaling_In_Y(xPid.eId)) > 0.00001) then
         if( abs(xPid.xPIDErrorsWindowViewModel.fGet_Pid_Errors(xPid.eId)/fGet_Pid_Scaling_In_Y(xPid.eId)) > 25.0) then
            Double_Pid_Scaling_In_Y(xPid.eId);
         end if;
      else
         return True;
      end if;

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForPid,
         GC       => xBlueColor,
         X        => Glib.Gint(iPidCounter),
         Y        => Glib.Gint(25.0 - xPid.xPIDErrorsWindowViewModel.fGet_Pid_Errors(xPid.eId) / fGet_Pid_Scaling_In_Y(xPid.eId)));

      return True;
   end bDraw_Pid;

   function bPid_Counter_Restarted return boolean is
      bRestart : boolean := false;
      fStep : float := 0.1;
      fPidGraphWidth : float := 400.0;
   begin

      if (iPidCounter > fPidGraphWidth) then
         iPidCounter := 0.0;
      end if;

      if (iPidCounter + 2.0 > fPidGraphWidth) then
         bRestart := true;
      end if;

      iPidCounter := iPidCounter + fStep;

      return bRestart;
   end bPid_Counter_Restarted;

  function fGet_Pid_Scaling_In_Y(xPid : Simulator.ViewModel_Pid_Errors.EMotionComponent) return float is
   begin
      return xPid_Scaling(xPid);
   end fGet_Pid_Scaling_In_Y;

   procedure Double_Pid_Scaling_In_Y(xPid : Simulator.ViewModel_Pid_Errors.EMotionComponent) is
   begin
      xPid_Scaling(xPid) := 2.0 * xPid_Scaling(xPid);
   end Double_Pid_Scaling_In_Y;


end Simulator.Drawing;
