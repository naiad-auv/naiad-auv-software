with Gtk.Main;
with Glib.Error;
with Gtk.Widget;
with Gtkada.Builder;
with Exception_Handling;
with PIDConfigurationGUILogic;

with Ada.Text_IO;
with Glib.Error;
with SensorsGUILogic;
with Simulator.ViewModel_Sensors;

package body SensorsGUI is

   procedure Register_Handlers(xBuilder : in out GtkAda.Builder.Gtkada_Builder) is
   begin
      null;
   end Register_Handlers;

   procedure Setup_Backend(xModel : Simulator.Model.pCModel) is
   begin
      SensorsGUILogic.xModel := xModel;
      SensorsGUILogic.xViewmodel := Simulator.ViewModel_Sensors.pxCreate(xModel);
   end Setup_Backend;

   procedure Start_GUI (xModel : Simulator.Model.pCModel) is

      use Glib.Error;
      use Gtkada.Builder;

      xBuilder : aliased Gtkada_Builder;
      xError   : Glib.Error.GError;
   begin
      Gtk.Main.Init;

      Gtk_New (xBuilder);
      xError := Add_From_File (xBuilder, "./src/GladeFiles/Sensors.glade");
      if xError /= null then
         Ada.Text_IO.Put("Error while loading .glade: ");
         Ada.Text_IO.Put(Glib.Error.Get_Message(xError));
         Error_Free (xError);
         return;
      end if;


      Register_Handlers(xBuilder);

      Setup_Backend(xModel);

      Do_Connect (xBuilder);

      Gtk.Widget.Show_All (Get_Widget (xBuilder, "sensorWindow"));
      Gtk.Main.Main;

      Unref (xBuilder);

   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E => E);

   end Start_GUI;

end SensorsGUI;
