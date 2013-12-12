with Gtk.Main;
with Gtk.Widget;
with Gtkada.Builder;
with Exception_Handling;
with Ada.Text_IO;
with Glib.Error;
with SetWantedStuffGUILogic;
with Simulator.ViewModel_Wanted_Pos;

package body SetWantedStuffGUI is

   procedure Register_Handlers(xBuilder : in out GtkAda.Builder.Gtkada_Builder) is
   begin
        Gtkada.Builder.Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "updateGoalsHandler",
         Handler      => SetWantedStuffGuiLogic.Update_Wanted_Position'Access);

   end Register_Handlers;

   procedure Setup_Backend(xModel : Simulator.Model.pCModel) is
   begin
     SetWantedStuffGUILogic.xViewmodel := Simulator.ViewModel_Wanted_Pos.pxCreate(xModel);
   end Setup_Backend;

   procedure Start_GUI (xModel : Simulator.Model.pCModel) is

      use Glib.Error;
      use Gtkada.Builder;

      xBuilder : aliased Gtkada_Builder;
      xError   : Glib.Error.GError;
   begin
      Gtk.Main.Init;

      Gtk_New (xBuilder);
      xError := Add_From_File (xBuilder, "./src/GladeFiles/SetWantedPosOri.glade");
      if xError /= null then
         Ada.Text_IO.Put("Error while loading .glade: ");
         Ada.Text_IO.Put(Glib.Error.Get_Message(xError));
         Error_Free (xError);
         return;
      end if;

      Register_Handlers(xBuilder);

      Setup_Backend(xModel);

      Do_Connect (xBuilder);

      Gtk.Widget.Show_All (Get_Widget (xBuilder, "setWantedStuffWindow"));
      Gtk.Main.Main;

      Unref (xBuilder);

   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E => E);

   end Start_GUI;

end SetWantedStuffGUI;
