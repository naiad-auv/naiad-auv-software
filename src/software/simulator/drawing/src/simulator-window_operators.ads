with Gdk.Window;
with Glib;

package Simulator.Window_Operators is

   type TWindowSize is record
      fWidth : float;
      fHeight : float;
   end record;

   function fGet_Window_Width(xWindow : Gdk.Window.Gdk_Window) return float;

   function fGet_Window_Height(xWindow : Gdk.Window.Gdk_Window) return float;

   function xGet_Window_Size(xWindow : Gdk.Window.Gdk_Window) return TWindowSize;

end Simulator.Window_Operators;
