package body Simulator.Colors is

   -----------------
   -- xBlackColor --
   -----------------

   function xBlackColor(xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc is
   begin
      return xGet_Color(0,0,0,xCanvas);
   end xBlackColor;

   ----------------
   -- xBlueColor --
   ----------------

   function xBlueColor(xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc is
   begin
      return xGet_Color(0,0,Glib.Guint16'Last,xCanvas);
   end xBlueColor;

   ---------------
   -- xRedColor --
   ---------------

   function xRedColor(xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc is
   begin
      return xGet_Color(Glib.Guint16'Last,0,0,xCanvas);
   end xRedColor;

   -----------------
   -- xGreenColor --
   -----------------

   function xGreenColor(xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc is
   begin
      return xGet_Color(0,Glib.Guint16'Last,0,xCanvas);
   end xGreenColor;

   function xGet_Color(Red : Glib.Guint16; Green : Glib.Guint16; Blue : Glib.Guint16; xCanvas : Gdk.Window.Gdk_Window) return Gdk.Gc.Gdk_Gc is
   	xGraphicsContext : Gdk.GC.Gdk_GC;
   begin
      Gdk.Color.Set_Rgb(xColorBase,Red,Green,Blue);
      Gdk.GC.Gdk_New(GC       => xGraphicsContext,
                     Drawable => xCanvas);
      Gdk.GC.Set_Rgb_Fg_Color(xGraphicsContext, xColorBase);

      return xGraphicsContext;
   end xGet_Color;

end Simulator.Colors;
