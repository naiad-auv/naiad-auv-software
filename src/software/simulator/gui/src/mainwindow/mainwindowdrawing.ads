with Gdk.GC;
with Gdk.Window;
with Gtk;
with Gtk.Drawing_Area;
with Gdk.Color;
with Math;
with Math.Matrices;
with Projection_2D;

package MainWindowDrawing is

   type EView is (Side, Top, Back, Full, FullWanted);

   type T3DView is record
      xCanvas : Gtk.Drawing_Area.Gtk_Drawing_Area;
      iHeight : integer;
      iWidth : integer;
      eId : EView;
   end record;

   type TView is record
      xGraph : Gtk.Drawing_Area.Gtk_Drawing_Area;
      eId : MainWindowDrawing.EView;
   end record;

   function bDraw_3DView (xView : T3DView) return Boolean;
   function bDraw_View (xView : in TView) return Boolean;

private

   type TPoint is record
      X : float;
      Y : float;
   end record;

   type TViewPositions is record
      xCurrentPosition : TPoint;
      xWantedPosition : TPoint;
   end record;

   type ViewColors is record
      xGreenColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xRedColor : Gdk.GC.Gdk_GC;
      xBlackColor : Gdk.GC.Gdk_GC;

      xCustomColor : Gdk.Color.Gdk_Color;
   end record;

   function fGet_Positions_For_View(eID : MainWindowDrawing.EView) return TViewPositions;

   procedure Draw_Plane (xWindowForView : Gdk.Window.Gdk_Window; xColors : ViewColors; xOrientationToDraw : Math.Matrices.CMatrix; xView : T3DView);
   procedure Draw_Axis_Arrow (xWindowForView : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xView : T3DView; xAxisArrowPoints : Projection_2D.TAxisArrow);
   procedure Draw_Arrow_Head(xWindowForView : Gdk.Window.Gdk_Window; xColor : Gdk.GC.Gdk_GC; xView : T3DView; xAxisArrowPoints : Projection_2D.TAxisArrow);

   function xGet_Colors(xWindowForView : Gdk.Window.Gdk_Window) return ViewColors;

end MainWindowDrawing;
