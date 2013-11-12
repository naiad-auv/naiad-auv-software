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

package body PIDErrorsGUILogic is

   type TPid_Scaling_In_Y is array (Simulator.ViewModel_Pid_Errors.EMotionComponent'Range) of float;

   type TPidGraph is record
      xGraph : Gtk.Drawing_Area.Gtk_Drawing_Area;
      eId : Simulator.ViewModel_Pid_Errors.EMotionComponent;
   end record;


   xPid_Scaling : TPid_Scaling_In_Y := (others => 1.0);

   iPidCounter : float := 0.0;

   package Drawing_Timeout_Pid is new Glib.Main.Generic_Sources (TPidGraph);
   package Update_Viewmodel_PKG is new Glib.Main.Generic_Sources(integer);

   xTimeoutPidPositionX : Glib.Main.G_Source_Id;
   xTimeoutPidPositionY : Glib.Main.G_Source_Id;
   xTimeoutPidPositionZ : Glib.Main.G_Source_Id;

   xTimeoutPidRotationX : Glib.Main.G_Source_Id;
   xTimeoutPidRotationY : Glib.Main.G_Source_Id;
   xTimeoutPidRotationZ : Glib.Main.G_Source_Id;



   function bPid_Counter_Restarted return boolean is
      bRestart : boolean := false;
      fStep : float := 0.1;
      fPidGraphWidth : float := 400.0;
   begin

      if (iPidCounter > fPidGraphWidth) then
         iPidCounter := 0.0;
      end if;

      if (iPidCounter + 2.0 > fPidGraphWidth) then
         bRestart := true;
      end if;

      iPidCounter := iPidCounter + fStep;

      return bRestart;
   end bPid_Counter_Restarted;

    function fGet_Pid_Scaling_In_Y(xPid : Simulator.ViewModel_Pid_Errors.EMotionComponent) return float is
   begin
      return xPid_Scaling(xPid);
   end fGet_Pid_Scaling_In_Y;

   procedure Double_Pid_Scaling_In_Y(xPid : Simulator.ViewModel_Pid_Errors.EMotionComponent) is
   begin
      xPid_Scaling(xPid) := 2.0 * xPid_Scaling(xPid);
   end Double_Pid_Scaling_In_Y;

   function bDraw_Pid (xPid : in TPidGraph) return Boolean is
      xWindowForPid : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xCustomColor : Gdk.Color.Gdk_Color;
      xFont : Gdk.Font.Gdk_Font;
   begin
      xWindowForPid := Gtk.Drawing_Area.Get_Window (xPid.xGraph);

      if (bPid_Counter_Restarted) then
         Gdk.Window.Clear(xWindowForPid);
      end if;

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForPid);
      Gdk.GC.Set_Foreground(xBlackColor, Gdk.Color.Black (Gtk.Widget.Get_Default_Colormap));
      Gdk.Color.Set_Rgb(xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xBlueColor, xWindowForPid);
      Gdk.GC.Set_Rgb_Fg_Color(xBlueColor, xCustomColor);

      -- Draw X axis
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForPid,
         GC       => xBlackColor,
         X1       => 0,
         Y1       => 25,
         X2       => 1000,
         Y2       => 25);

      -- Draw Scaling
       -- Gdk.Font.Fontset_Load(Font         => xFont,
         --                   Fontset_Name => "");

      Gdk.Drawable.Draw_Text
        (Drawable => xWindowForPid,
         Font     => xFont,
         GC       => xBlackColor,
         X        => 1,
         Y        => 15,
         Text     => "1 / " & Integer(fGet_Pid_Scaling_In_Y(xPid.eId))'Img);

      -- Draw error point
      if (abs(fGet_Pid_Scaling_In_Y(xPid.eId)) > 0.00001) then
         if( abs(xViewmodel.fGet_Pid_Errors(xPid.eId)/fGet_Pid_Scaling_In_Y(xPid.eId)) > 25.0) then
            Double_Pid_Scaling_In_Y(xPid.eId);
         end if;
      else
         return True;
      end if;

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForPid,
         GC       => xBlueColor,
         X        => Glib.Gint(iPidCounter),
         Y        => Glib.Gint(25.0 - xViewmodel.fGet_Pid_Errors(xPid.eId) / fGet_Pid_Scaling_In_Y(xPid.eId)));

      return True;
   end bDraw_Pid;

procedure Register_Timeouts(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;
      use Simulator.ViewModel_Pid_Errors;

      xUpdateIntervall : Glib.Guint := 20;
   begin

      if xTimeoutPidPositionX = 0 then
         xTimeoutPidPositionX := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidPosX")), X));
      end if;

      if xTimeoutPidPositionY = 0 then
         xTimeoutPidPositionY := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidPosY")), Y));
      end if;

      if xTimeoutPidPositionZ = 0 then
         xTimeoutPidPositionZ := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidPosZ")), Z));
      end if;

      if xTimeoutPidRotationX = 0 then
         xTimeoutPidRotationX := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidRotX")), RotationX));
      end if;

      if xTimeoutPidRotationY = 0 then
         xTimeoutPidRotationY := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidRotY")), RotationY));
      end if;

      if xTimeoutPidRotationZ = 0 then
         xTimeoutPidRotationZ := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidRotZ")), RotationZ));
      end if;
   end Register_Timeouts;
end PIDErrorsGUILogic;
