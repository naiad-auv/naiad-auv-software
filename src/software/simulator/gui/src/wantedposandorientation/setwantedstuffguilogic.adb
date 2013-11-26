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
with Ada.Text_IO;
with Text_Handling;

package body SetWantedStuffGUILogic is

   procedure Update_Wanted_Position(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      sPositionX : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryXPos"));
      sPositionY : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryYPos"));
      sPositionZ : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryZPos"));

      sRotationX : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryXRot"));
      sRotationY : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryYRot"));
      sRotationZ : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryZRot"));
   begin
      Ada.Text_IO.Put_Line("Updating wanted pos and orientation");

      xViewmodel.Set_Wanted_Position_And_Orientation(fPositionX    => Text_Handling.fTry_Get_Float_String(sPositionX.Get_Text, 0.0),
                                                     fPositionY    => Text_Handling.fTry_Get_Float_String(sPositionY.Get_Text, 0.0),
                                                     fPositionZ    => Text_Handling.fTry_Get_Float_String(sPositionZ.Get_Text, 0.0),
                                                     fRotationX => Text_Handling.fTry_Get_Float_String(sRotationX.Get_Text, 0.0),
                                                     fRotationY => Text_Handling.fTry_Get_Float_String(sRotationY.Get_Text, 0.0),
                                                     fRotationZ => Text_Handling.fTry_Get_Float_String(sRotationZ.Get_Text, 0.0));
   exception
      when E : others =>
         Ada.Text_IO.Put_Line("Exception occured when setting wanted data");
   end Update_Wanted_Position;
end SetWantedStuffGUILogic;
