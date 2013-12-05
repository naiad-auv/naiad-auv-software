package body Simulator.Window_Operators is

 function fGet_Window_Width(xWindow : Gdk.Window.Gdk_Window) return float is
   begin
      return xGet_Window_Size(xWindow => xWindow).fWidth;
   end fGet_Window_Width;

   function fGet_Window_Height(xWindow : Gdk.Window.Gdk_Window) return float is
   begin
      return xGet_Window_Size(xWindow => xWindow).fHeight;
   end fGet_Window_Height;

   function xGet_Window_Size(xWindow : Gdk.Window.Gdk_Window) return TWindowSize is
      use Glib;

      iWindowHeight : Glib.Gint;
      iWindowWidth  : Glib.Gint;
      iWindowX : Glib.Gint;
      iWindowY  : Glib.Gint;
      iWindowDepth : Glib.Gint;

   begin

      Gdk.Window.Get_Geometry(Window => xWindow,
                              X      => iWindowX,
                              Y      => iWindowY,
                              Width  => iWindowWidth,
                              Height => iWindowHeight,
                              Depth  => iWindowDepth);

   return TWindowSize'(fWidth  => float(iWindowWidth),
                       fHeight => float(iWindowHeight));
end xGet_Window_Size;

end Simulator.Window_Operators;
