with Gtk.Main;
with Glib.Main;
with Gtk.Combo_Box;
with Gtk.GEntry;

with Gdk;
with Gdk.Window;
with Gdk.GC;
with Gdk.Color;
with Gdk.Font;
with Gtk.Widget;
with Gtk.Drawing_Area;
with Gdk.Drawable;

package body SetWantedStuffGUILogic is

   procedure Update_Wanted_Position(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      sPositionX : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryX"));
      sPositionY : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryY"));
      sPositionZ : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryZ"));

      sRoll : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryRoll"));
      sPitch : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPitch"));
      sYaw : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryYaw"));
   begin
      xViewmodel.Set_Wanted_Position_And_Orientation(fPositionX    => Float'Value(sPositionX.Get_Text),
                                                     fPositionY    => Float'Value(sPositionY.Get_Text),
                                                     fPositionZ    => Float'Value(sPositionZ.Get_Text),
                                                     fOrientationR => Float'Value(sRoll.Get_Text),
                                                     fOrientationP => Float'Value(sPitch.Get_Text),
                                                     fOrientationY => Float'Value(sYaw.Get_Text));
   end Update_Wanted_Position;


end SetWantedStuffGUILogic;
