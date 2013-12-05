with Gdk.GC;
with Glib;
with Gdk.Color;
with Gdk.Drawable;
with Gdk.Window;

Package Simulator.Colors is

   function xBlackColor(xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc;
   function xBlueColor(xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc;
   function xRedColor(xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc;
   function xGreenColor(xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc;

private
   function xGet_Color(Red : Glib.Guint16; Green : Glib.Guint16; Blue : Glib.Guint16; xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc;

   xColorBase :  Gdk.Color.Gdk_Color;
End Simulator.Colors;
