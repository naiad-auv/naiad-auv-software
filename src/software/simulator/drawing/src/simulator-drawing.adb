with Math;
with Projection_2D;
with Gdk.Color;
with Math.Matrices;
with Gdk.Drawable;
with Glib;
with Gtk.Widget;
with Gtk.Window;
with Math.Vectors;
with Ada.Text_IO;
with Simulator.Colors;
with Simulator.Window_Operators;

package body Simulator.Drawing is

   function bDraw_View (xView : in TView) return Boolean is

      use Glib;

      xWindowForView : Gdk.Window.Gdk_Window;
      xViewPositions : TViewPositions := fGet_Positions_For_View(xView.eId, xView.xMainWindowViewModel, Integer(xView.xCanvas.Get_Allocation_Width), Integer(xView.xCanvas.Get_Allocation_Height));
      xWindowSize : Simulator.Window_Operators.TWindowSize;

   begin
      xWindowForView := Gtk.Drawing_Area.Get_Window (xView.xCanvas);

      xWindowSize  := Simulator.Window_Operators.xGet_Window_Size(xWindow => xWindowForView);

      Draw_Cross(xCanvas           => xWindowForView,
                 xColor            => Simulator.Colors.xBlackColor(xWindowForView),
                 xCenterPoint      => TPoint'(xWindowSize.fWidth / 2.0 - 1.0,
                   xWindowSize.fHeight / 2.0),
                 iHorizontalLength => Integer(xWindowSize.fWidth),
                 iVerticalLength   => Integer(xWindowSize.fHeight));

      Draw_Target_Point(xCanvas      => xWindowForView,
                        xColor       => Simulator.Colors.xRedColor(xWindowForView),
                        xCenterPoint => xViewPositions.xWantedPosition);

      Draw_Point_Relative_To_Center_Of_View(xCanvas          => xWindowForView,
                                            xColor           => Simulator.Colors.xBlueColor(xWindowForView),
                                            xCurrentPosition => xViewPositions.xCurrentPosition);
      return True;
   end bDraw_View;

   procedure Draw_Target_Point(xCanvas : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xCenterPoint : TPoint) is
   begin
      Draw_Cross(xCanvas           => xCanvas,
                 xColor            => xColor,
                 xCenterPoint      => xCenterPoint,
                 iHorizontalLength => 3,
                 iVerticalLength   => 3);
   end Draw_Target_Point;

   procedure Draw_Point_Relative_To_Center_Of_View(xCanvas : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xCurrentPosition : TPoint) is
   begin
      Gdk.Drawable.Draw_Point
        (Drawable => xCanvas,
         GC       => xColor,
         X        => Glib.Gint(xCurrentPosition.X),
         Y        => Glib.Gint(xCurrentPosition.Y));

   end Draw_Point_Relative_To_Center_Of_View;

   procedure Draw_Cross(xCanvas : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xCenterPoint : TPoint; iHorizontalLength : Integer; iVerticalLength : Integer) is
   begin
      Gdk.Drawable.Draw_Line
        (Drawable => xCanvas,
         GC       => xColor,
         X1       => Glib.Gint(xCenterPoint.X - float(iHorizontalLength / 2)),
         Y1       => Glib.Gint(xCenterPoint.Y),
         X2       => Glib.Gint(xCenterPoint.X + float(iHorizontalLength / 2)),
         Y2       => Glib.Gint(xCenterPoint.Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xCanvas,
         GC       => xColor,
         X1       => Glib.Gint(xCenterPoint.X),
         Y1       => Glib.Gint(xCenterPoint.Y - float(iVerticalLength / 2)),
         X2       => Glib.Gint(xCenterPoint.X),
         Y2       => Glib.Gint(xCenterPoint.Y + float(iVerticalLength / 2)));

   end Draw_Cross;

   function bDraw_3DView (xView : TView) return Boolean is
      use Math.Matrices;

      xWindowForView : Gdk.Window.Gdk_Window;
      xEndPoints : Projection_2D.TOrientationProjectionPoints;
      xOrientationToDraw : Math.Matrices.CMatrix;
      xWindowSize : Simulator.Window_Operators.TWindowSize;
   begin
      Gdk.Window.Clear(Gtk.Drawing_Area.Get_Window(xView.xCanvas));

      xWindowForView := Gtk.Drawing_Area.Get_Window (xView.xCanvas);

      xWindowSize  := Simulator.Window_Operators.xGet_Window_Size(xWindow => xWindowForView);

      Case xView.eId is
         when Full =>
            xOrientationToDraw := xView.xMainWindowViewModel.xGet_Submarine_Current_Orientation;
         when FullWanted =>
            xOrientationToDraw := xView.xMainWindowViewModel.xGet_Submarine_Wanted_Orientation;
         when others =>
            return true;
      end case;

      xEndPoints := Projection_2D.txGet_Orientation_2D_Projection(iCenterX     => Integer(xWindowSize.fWidth / 2.0),
                                                                  iCenterY     => Integer(xWindowSize.fHeight / 2.0),
                                                                  iWidth       => Integer(xWindowSize.fWidth),
                                                                  iHeight      => Integer(xWindowSize.fHeight),
                                                                  xOrientation => xOrientationToDraw);
      Draw_Plane(xWindowForView, xOrientationToDraw, xView);

      Draw_Axis_Arrow(xWindowForView, Simulator.Colors.xRedColor(xWindowForView), xView, xEndPoints(Projection_2D.XVector));
      Draw_Axis_Arrow(xWindowForView, Simulator.Colors.xGreenColor(xWindowForView), xView,xEndPoints(Projection_2D.YVector));
      Draw_Axis_Arrow(xWindowForView, Simulator.Colors.xBlueColor(xWindowForView), xView, xEndPoints(Projection_2D.ZVector));


      return True;
   end bDraw_3DView;

   procedure Draw_Plane (xWindowForView : Gdk.Window.Gdk_Window; xOrientationToDraw : Math.Matrices.CMatrix; xView : TView) is

      xPlaneEndPoints : Projection_2D.TPlaneProjectionPoints;

      xWindowSize : Simulator.Window_Operators.TWindowSize := Simulator.Window_Operators.xGet_Window_Size(xWindowForView);

   begin

      xPlaneEndPoints := Projection_2D.txGet_Plane_2D_Projection(iCenterX     => Integer(xWindowSize.fWidth / 2.0),
                                                                 iCenterY     => Integer(xWindowSize.fHeight / 2.0),
                                                                 iWidth       => Integer(xWindowSize.fWidth),
                                                                 iHeight      => Integer(xWindowSize.fHeight),
                                                                 xOrientation => xOrientationToDraw);
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => Simulator.Colors.xBlackColor(xWindowForView),
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => Simulator.Colors.xBlackColor(xWindowForView),
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperRight).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => Simulator.Colors.xBlackColor(xWindowForView),
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerRight).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).Y));

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => Simulator.Colors.xBlackColor(xWindowForView),
         X1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).X),
         Y1       => Glib.Gint(xPlaneEndPoints(Projection_2D.LowerLeft).Y),
         X2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).X),
         Y2       => Glib.Gint(xPlaneEndPoints(Projection_2D.UpperLeft).Y));
   end Draw_Plane;

   procedure Draw_Axis_Arrow (xWindowForView : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xView : TView; xAxisArrowPoints : Projection_2D.TAxisArrow) is

      xWindowSize : Simulator.Window_Operators.TWindowSize := Simulator.Window_Operators.xGet_Window_Size(xWindowForView);
   begin

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xColor,
         X1       => Glib.Gint(xWindowSize.fWidth / 2.0),
         Y1       => Glib.Gint(xWindowSize.fHeight / 2.0),
         X2       => Glib.Gint(xAxisArrowPoints(Projection_2D.Head).X),
         Y2       => Glib.Gint(xAxisArrowPoints(Projection_2D.Head).Y));

      Draw_Arrow_Head(xWindowForView, xColor, xAxisArrowPoints);
   end Draw_Axis_Arrow;

   procedure Draw_Arrow_Head(xWindowForView : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xAxisArrowPoints : Projection_2D.TAxisArrow) is
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

   function fGet_Positions_For_View (eID : Simulator.Drawing.EView; xViewModel : Simulator.ViewModel_Representation.pCViewModel_Representation; iWindowHeight : integer; iWindowWidth : integer) return TViewPositions is
      xViewPositions : TViewPositions;
      xCurrent_Position : math.Vectors.CVector := xViewmodel.xGet_Submarine_Current_Position;
      xWanted_Position : math.Vectors.CVector := xViewmodel.xGet_Submarine_Wanted_Position;
   begin

      case eID is
         when Side =>
            xViewPositions.xCurrentPosition := (xCurrent_Position.fGet_X, -xCurrent_Position.fGet_Z);
            xViewPositions.xWantedPosition := (xWanted_Position.fGet_X, -xWanted_Position.fGet_Z);
         when Top =>
            xViewPositions.xCurrentPosition := (-xCurrent_Position.fGet_Y, -xCurrent_Position.fGet_X);
            xViewPositions.xWantedPosition := (-xWanted_Position.fGet_Y, -xWanted_Position.fGet_X);
         when Back =>
            xViewPositions.xCurrentPosition := (-xCurrent_Position.fGet_Y, -xCurrent_Position.fGet_Z);
            xViewPositions.xWantedPosition := (-xWanted_Position.fGet_Y, -xWanted_Position.fGet_Z);
         when others =>
            xViewPositions := ((5.0, 5.0), (5.0, 5.0));
      end case;

      return xMove_Into_View(xViewPositions, iWindowHeight, iWindowWidth);
   end fGet_Positions_For_View;

   function xMove_Into_View(xViewPositions : TViewPositions; iWindowHeight : Integer; iWindowWidth : integer) return TViewPositions is
   begin
      return TViewPositions'(TPoint'(xViewPositions.xCurrentPosition.X + float(iWindowWidth / 2),
                             xViewPositions.xCurrentPosition.Y + float(iWindowHeight / 2)),
                             TPoint'(xViewPositions.xWantedPosition.X + float(iWindowWidth / 2),
                               xViewPositions.xWantedPosition.Y + float(iWindowHeight / 2)));
   end xMove_Into_View;

   function xMove_Point_Into_View(xPoint : TPoint; iWindowHeight : Integer; iWindowWidth : integer) return TPoint is
   begin
      return TPoint'(xPoint.X + float(iWindowWidth / 2), xPoint.Y + float(iWindowHeight / 2));
   end xMove_Point_Into_View;

   function bDraw_Pid (xPid : in TPidGraph) return Boolean is
      xWindowForPid : Gdk.Window.Gdk_Window;
      xWindowSize : Simulator.Window_Operators.TWindowSize;
   begin
      xWindowForPid := Gtk.Drawing_Area.Get_Window (xPid.xGraph);
      xWindowSize := Simulator.Window_Operators.xGet_Window_Size(xWindow => xWindowForPid);

      Preform_PID_Drawing_Step(xWindowForPid);

      -- Draw X axis
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForPid,
         GC       => Simulator.Colors.xBlackColor(xWindowForPid),
         X1       => 0,
         Y1       => Glib.Gint(xWindowSize.fHeight / 2.0),
         X2       => Glib.Gint(xWindowSize.fWidth),
         Y2       => Glib.Gint(xWindowSize.fHeight / 2.0));

      -- Draw error point
      if (abs(fGet_Pid_Scaling_In_Y(xPid.eId)) > 0.00001) then
         if( abs(xPid.xPIDErrorsWindowViewModel.fGet_Pid_Errors(xPid.eId)/fGet_Pid_Scaling_In_Y(xPid.eId)) > (xWindowSize.fHeight / 2.0)) then
            Double_Pid_Scaling_In_Y(xPid.eId);
         end if;
      else
         return True;
      end if;

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForPid,
         GC       => Simulator.Colors.xBlueColor(xWindowForPid),
         X        => Glib.Gint(iPidCounter),
         Y        => Glib.Gint((xWindowSize.fHeight / 2.0) - xPid.xPIDErrorsWindowViewModel.fGet_Pid_Errors(xPid.eId) / fGet_Pid_Scaling_In_Y(xPid.eId)));

      return True;
   end bDraw_Pid;

   procedure Preform_PID_Drawing_Step(xCanvas : in out Gdk.Window.Gdk_Window) is
      fWindowWidth : float;
   begin

      fWindowWidth := Simulator.Window_Operators.fGet_Window_Width(xCanvas);

      if (iPidCounter > fWindowWidth) then
         iPidCounter := 0.0;
         Gdk.Window.Clear(xCanvas);
      end if;

      iPidCounter := iPidCounter + 0.1;
   end Preform_PID_Drawing_Step;


   function fGet_Pid_Scaling_In_Y(xPid : Simulator.ViewModel_Pid_Errors.EMotionComponent) return float is
   begin
      return xPid_Scaling(xPid);
   end fGet_Pid_Scaling_In_Y;

   procedure Double_Pid_Scaling_In_Y(xPid : Simulator.ViewModel_Pid_Errors.EMotionComponent) is
   begin
      xPid_Scaling(xPid) := 2.0 * xPid_Scaling(xPid);
   end Double_Pid_Scaling_In_Y;


end Simulator.Drawing;
