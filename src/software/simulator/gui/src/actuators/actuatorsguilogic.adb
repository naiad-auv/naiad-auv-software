with Gtk.Main;
with Glib.Main;
with Gtk.Combo_Box;
with Gtk.GEntry;
with Ada;
with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
with Gdk;
with Gdk.Window;
with Gdk.GC;
with Gdk.Color;
with Gtk.Widget;
with Gdk.Drawable;


package body ActuatorsGUILogic is

   xTimeoutMotorLevels : Glib.Main.G_Source_Id;

   package Drawing_Timeout_Drawing_Area is new Glib.Main.Generic_Sources (Gtk.Drawing_Area.Gtk_Drawing_Area);


   procedure Draw_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;
      use Simulator.ViewModel_Actuators;

      xUpdateIntervall : Glib.Guint := 20;
   begin

      if xTimeoutMotorLevels = 0 then
         xTimeoutMotorLevels := Drawing_Timeout_Drawing_Area.Timeout_Add
           (xUpdateIntervall * 10, bDraw_Motor_Levels'Access, Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwMotorLevels")));
      end if;
   end Draw_Timeout;

   function bDraw_Motor_Levels (xMotorArea : in Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean is
      use Ada.Numerics.Elementary_Functions;
      use Ada.Numerics;
      use Glib;

      xWindowForMotors : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xCustomColor : Gdk.Color.Gdk_Color;

      Len : Gint := -35;
      Outer : Gint := 60;
      Inner : Gint := 55;

      --        xMotor1Force : float := xViewmodel.
   begin
      xWindowForMotors := Gtk.Drawing_Area.Get_Window (xMotorArea);

      Gdk.Window.Clear(xWindowForMotors);

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForMotors);
      Gdk.GC.Set_Foreground(xBlackColor, Gdk.Color.Black (Gtk.Widget.Get_Default_Colormap));
      Gdk.Color.Set_Rgb(xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xBlueColor, xWindowForMotors);
      Gdk.GC.Set_Rgb_Fg_Color(xBlueColor, xCustomColor);

      Gdk.Drawable.Draw_Polygon
        (Drawable => xWindowForMotors,
         GC       => xBlackColor,
         Filled   => True,
         Points   => ((75, 25),(30, 100),(120, 100)));

      Gdk.Drawable.Draw_Polygon
        (Drawable => xWindowForMotors,
         GC       => xBlueColor,
         Filled   => True,
         Points   => ((75, 75 - Inner),(75, 75 - Outer),(75 + Len, 75 - Outer),(75 + Len, 75 - Inner))); -- End point depends on motor values ...

      Gdk.Drawable.Draw_Polygon
        (Drawable => xWindowForMotors,
         GC       => xBlueColor,
         Filled   => True,
         Points   => ((75 - Gint(Float(Inner) * Sin(2.0 * Pi / 3.0)), 75 - Gint(Float(Inner) * Cos(2.0 * Pi / 3.0))),
                      (75 - Gint(Float(Outer + 1) * Sin(2.0 * Pi / 3.0)), 75 - Gint(Float(Outer + 1) * Cos(2.0 * Pi / 3.0))),
                      (75 - Gint(Float(Outer + 1) * Sin(2.0 * Pi / 3.0)) - Gint(Float(Len) * Sin(Pi / 6.0)),
                       75 - Gint(Float(Outer + 1) * Cos(2.0 * Pi / 3.0)) - Gint(Float(Len) * Cos(Pi / 6.0))),
                      (75 - Gint(Float(Inner) * Sin(2.0 * Pi / 3.0)) - Gint(Float(Len) * Sin(Pi / 6.0)),
                       75 - Gint(Float(Inner) * Cos(2.0 * Pi / 3.0))  - Gint(Float(Len) * Cos(Pi / 6.0))))); -- End point depends on motor values ...

      Gdk.Drawable.Draw_Polygon
        (Drawable => xWindowForMotors,
         GC       => xBlueColor,
         Filled   => True,
         Points   => ((75 - Gint(Float(Inner) * Sin(4.0 * Pi / 3.0)), 75 - Gint(Float(Inner) * Cos(4.0 * Pi / 3.0))),
                      (75 - Gint(Float(Outer + 1) * Sin(4.0 * Pi / 3.0)), 75 - Gint(Float(Outer + 1) * Cos(4.0 * Pi / 3.0))),
                      (75 - Gint(Float(Outer + 1) * Sin(4.0 * Pi / 3.0)) - Gint(Float(Len) * Sin(Pi / 6.0)),
                       75 - Gint(Float(Outer + 1) * Cos(4.0 * Pi / 3.0)) + Gint(Float(Len) * Cos(Pi / 6.0))),
                      (75 - Gint(Float(Inner) * Sin(4.0 * Pi / 3.0)) - Gint(Float(Len) * Sin(Pi / 6.0)),
                       75 - Gint(Float(Inner) * Cos(4.0 * Pi / 3.0)) + Gint(Float(Len) * Cos(Pi / 6.0))))); -- End point depends on motor values ...

      return True;
   end bDraw_Motor_Levels;
end ActuatorsGUILogic;
