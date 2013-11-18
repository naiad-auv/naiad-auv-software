with Gtk.Main;
with Glib.Error;
with Gtk.Widget;
with Gtkada.Builder;
with Exception_Handling;
with PIDConfigurationGUILogic;

with Ada.Text_IO;
with Glib.Error;
with ActuatorsGUILogic;
with Simulator.ViewModel_Actuators;
with Ada.Exceptions;

package body ActuatorsGUI is

   procedure Register_Handlers(xBuilder : in out GtkAda.Builder.Gtkada_Builder) is
   begin

      null;
   end Register_Handlers;

   procedure Setup_Backend(xModel : Simulator.Model.pCModel) is
   begin
      ActuatorsGUILogic.xModel := xModel;
      ActuatorsGUILogic.xViewmodel := Simulator.ViewModel_Actuators.pxCreate(xModel);
   end Setup_Backend;

   procedure Start_GUI (xModel : Simulator.Model.pCModel) is

      use Glib.Error;
      use Gtkada.Builder;

      xBuilder : aliased Gtkada_Builder;
      xError   : Glib.Error.GError;
   begin

      Gtk.Main.Init;

      Gtk_New (xBuilder);
      xError := Add_From_File (xBuilder, "./src/GladeFiles/Actuators.glade");
      if xError /= null then
         Ada.Text_IO.Put("Error while loading .glade: ");
         Ada.Text_IO.Put(Glib.Error.Get_Message(xError));
         Error_Free (xError);
         return;
      end if;


      Register_Handlers(xBuilder);

      Setup_Backend(xModel);

      Do_Connect (xBuilder);

      Gtk.Widget.Show_All (Get_Widget (xBuilder, "ActuatorsWindow"));
      Gtk.Main.Main;

      Unref (xBuilder);

   exception
      when E : others =>
         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Message(E));
         Exception_Handling.Unhandled_Exception(E => E);

   end Start_GUI;

end ActuatorsGUI;
