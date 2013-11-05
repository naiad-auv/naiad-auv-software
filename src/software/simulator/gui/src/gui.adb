with Gtk.Main;
with Glib.Error;
with Gtk.Widget;
with Gtkada.Builder;
with Exception_Handling;
with Callbacks;

package body GUI is

   procedure Start_GUI is
      use Glib.Error;
      use Gtkada.Builder;

      xBuilder : aliased Gtkada_Builder;
      xError   : Glib.Error.GError;
   begin
      Gtk.Main.Init;

      Gtk_New (xBuilder);
      xError := Add_From_File (xBuilder, "NaiadGui.glade");
      if xError /= null then
         Error_Free (xError);
         return;
      end if;

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "mainQuit",
         Handler      => Callbacks.Quit'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "fileQuit",
         Handler      => Callbacks.Quit'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "initDraw",
         Handler      => Callbacks.Draw_Timeout'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "restartSimulation",
         Handler      => Callbacks.Restart_Simulation'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "updateGoal",
         Handler      => Callbacks.Update_Wanted_Position'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "updatePidConstants",
         Handler      => Callbacks.Update_Pid_Constants'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "changedPid",
         Handler      => Callbacks.Selected_Pid_Changed'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "initPid",
         Handler      => Callbacks.Init_Pid'Access);

      Do_Connect (xBuilder);

      Gtk.Widget.Show_All (Get_Widget (xBuilder, "mainWindow"));
      Gtk.Main.Main;

      Unref (xBuilder);

   exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E => E);

   end Start_GUI;

end GUI;
