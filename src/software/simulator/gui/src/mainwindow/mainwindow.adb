with Gtk.Main;
with Glib.Error;
with Gtk.Widget;
with Gtkada.Builder;
with Exception_Handling;
with MainWindowLogic;

with Ada.Text_IO;
with Glib.Error;
with Ada.Exceptions;

package body MainWindow is

   procedure Register_Button_Handlers(xBuilder : in out GtkAda.Builder.Gtkada_Builder) is
   begin

      Gtkada.Builder.Register_Handler(Builder      => xBuilder,
                                      Handler_Name => "startSimulationHandler",
                                      Handler      => MainWindowLogic.Start_Simulation'Access);

      Gtkada.Builder.Register_Handler(Builder      => xBuilder,
                                      Handler_Name => "pauseSimulationHandler",
                                      Handler      => MainWindowLogic.Pause_Simulation'Access);

      Gtkada.Builder.Register_Handler(Builder      => xBuilder,
                                      Handler_Name => "restartSimulationHandler",
                                      Handler      => MainWindowLogic.Restart_Simulation'Access);

      Gtkada.Builder.Register_Handler(Builder      => xBuilder,
                                      Handler_Name => "showThrusterWindowHandler",
                                      Handler      => MainWindowLogic.Show_Thruster_Window'Access);

      Gtkada.Builder.Register_Handler(Builder      => xBuilder,
                                      Handler_Name => "showPidCfgWindowHandler",
                                      Handler      => MainWindowLogic.Show_PIDCfg_Window'Access);

      Gtkada.Builder.Register_Handler(Builder      => xBuilder,
                                      Handler_Name => "showSetWantedStuffWindowHandler",
                                      Handler      => MainWindowLogic.Show_WantedStuff_Window'Access);

      Gtkada.Builder.Register_Handler(Builder      => xBuilder,
                                      Handler_Name => "showPidErrorsWindowHandler",
                                      Handler      => MainWindowLogic.Show_PID_Errors_Window'Access);

      Gtkada.Builder.Register_Handler(Builder      => xBuilder,
                                      Handler_Name => "showSensorWindowHandler",
                                      Handler      => MainWindowLogic.Show_Sensor_Window'Access);

   end Register_Button_Handlers;


   procedure Register_Draw_Handlers(xBuilder : in out GtkAda.Builder.Gtkada_Builder) is
   begin
      Gtkada.Builder.Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "initDraw",
         Handler      => MainWindowLogic.Draw_Timeout'Access);
   end Register_Draw_Handlers;

   procedure Start_GUI is
      use Glib.Error;
      use Gtkada.Builder;

      xBuilder : aliased Gtkada_Builder;
      xError   : Glib.Error.GError;
   begin
      Gtk.Main.Init;

      Gtk_New (xBuilder);
      xError := Add_From_File (xBuilder, "./src/GladeFiles/MainWindow.glade");
      if xError /= null then
         Ada.Text_IO.Put("Error while loading .glade: ");
         Ada.Text_IO.Put(Glib.Error.Get_Message(xError));
         Error_Free (xError);
         return;
      end if;

      Register_Button_Handlers(xBuilder);
      Register_Draw_Handlers(xBuilder);

      Ada.Text_IO.Put_Line("Main window handlers registred");

      Do_Connect (xBuilder);

      Ada.Text_IO.Put_Line("xBuilder connected");

      Gtk.Widget.Show_All (Get_Widget (xBuilder, "mainWindow"));
      Gtk.Main.Main;

      Unref (xBuilder);

   exception

      when E : others =>

         Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Message(E));
         Exception_Handling.Unhandled_Exception(E => E);

   end Start_GUI;




end MainWindow;
