with Gtk.Main;
with Glib.Error;
with Gtk.Widget;
with Gtkada.Builder;
with Simulator_Callbacks;

with Ada.Text_IO; use Ada.Text_IO;

package body GUI is

   procedure Start_GUI(pxDatabase : Database.pTDatabase) is
      use Glib.Error;
      use Gtkada.Builder;

      xBuilder : aliased Gtkada_Builder;
      xError   : Glib.Error.GError;
   begin
      Gtk.Main.Init;
      Simulator_Callbacks.Set_Database(pxDatabase);

      Gtk_New (xBuilder);
      xError := Add_From_File (xBuilder, "NaiadSimulator.glade");
      if xError /= null then
         Ada.Text_IO.Put_Line ("Error : " & Get_Message (xError));
         Error_Free (xError);
         return;
      end if;

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "Main_Quit",
         Handler      => Simulator_Callbacks.Quit'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "File_Exit",
         Handler      => Simulator_Callbacks.Quit'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "Init_Draw",
         Handler      => Simulator_Callbacks.Start_Draw_Timeout'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "Init_Sensors",
         Handler      => Simulator_Callbacks.Start_Sensor_Timeout'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "Init_Actuators",
         Handler      => Simulator_Callbacks.Start_Actuator_Timeout'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "Change_Goal",
         Handler      => Simulator_Callbacks.Change_Goal'Access);

      Register_Handler
        (Builder      => xBuilder,
         Handler_Name => "Change_Pid",
         Handler      => Simulator_Callbacks.Change_Pid'Access);

      Do_Connect (xBuilder);

      Gtk.Widget.Show_All (Get_Widget (xBuilder, "main_window"));
      Gtk.Main.Main;

      Put_Line("Exited cleanly");

      Unref (xBuilder);

   end Start_GUI;

end GUI;
