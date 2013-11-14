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

      xViewmodel.Set_Wanted_Position_And_Orientation(fPositionX    => fTry_Get_Float_From_Text_Box(sPositionX.Get_Text),
                                                     fPositionY    => fTry_Get_Float_From_Text_Box(sPositionY.Get_Text),
                                                     fPositionZ    => fTry_Get_Float_From_Text_Box(sPositionZ.Get_Text),
                                                     fRotationX    => fTry_Get_Float_From_Text_Box(sRotationX.Get_Text),
                                                     fRotationY    => fTry_Get_Float_From_Text_Box(sRotationY.Get_Text),
                                                     fRotationZ    => fTry_Get_Float_From_Text_Box(sRotationZ.Get_Text));
   exception
      when E : others =>
         Ada.Text_IO.Put_Line("ABO");
   end Update_Wanted_Position;

   function fTry_Get_Float_From_Text_Box(sValueToConvert : string) return float is
   begin
      return Float'Value(sValueToConvert);
   exception
      when E: others =>
         return 0.0;
   end fTry_Get_Float_From_Text_Box;



end SetWantedStuffGUILogic;
