with Gtk.Main;
with Glib.Main;
with Gtk.Combo_Box;
with Gtk.GEntry;
with Ada;
with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
with Gdk;
with Gdk.Window;
with Gdk.GC;
with Gdk.Color;
with Gtk.Widget;
with Gdk.Drawable;
with Simulator.ViewModel_Actuators;
with Gtk.Progress_Bar;
with Glib;
with Ada.Text_IO;
with Text_Handling;


package body ActuatorsGUILogic is

   xTimeoutMotorLevels : Glib.Main.G_Source_Id;

   package Thruster_Update_Timeout is new Glib.Main.Generic_Sources (TBuilder);


   procedure Register_Timeout_Handlers(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;
      use Simulator.ViewModel_Actuators;

      xUpdateIntervall : Glib.Guint := 20;
   begin
      if xTimeoutMotorLevels = 0 then
         xTimeoutMotorLevels := Thruster_Update_Timeout.Timeout_Add
           (xUpdateIntervall * 10, bSet_Motor_Levels'Access, (TBuilder'(xBuilder => pxObject)));
      end if;
   end Register_Timeout_Handlers;

   function bSet_Motor_Levels (pxObject : TBuilder) return Boolean is
      use Ada.Numerics.Elementary_Functions;
      use Ada.Numerics;
      use Glib;

   begin
      Set_Thruster_Power(pxObject, 1, xViewModel.fGet_Motor_Force(1));
      Set_Thruster_Power(pxObject, 2, xViewModel.fGet_Motor_Force(2));
      Set_Thruster_Power(pxObject, 3, xViewModel.fGet_Motor_Force(3));
      Set_Thruster_Power(pxObject, 4, xViewModel.fGet_Motor_Force(4));
      Set_Thruster_Power(pxObject, 5, xViewModel.fGet_Motor_Force(5));
      Set_Thruster_Power(pxObject, 6, xViewModel.fGet_Motor_Force(6));

      return True;
   end bSet_Motor_Levels;

   procedure Set_Thruster_Power(pxObject : TBuilder; thrusterIndex : Simulator.ViewModel_Actuators.iMotorIndex; thrusterPower : float) is

      xThrusterProgressBar : Gtk.Progress_Bar.Gtk_Progress_Bar;

      xValue : Glib.Gdouble;
   begin

      xThrusterProgressBar := xGet_Thruster_Bar(pxObject, thrusterIndex);

      xValue := Glib.Gdouble(abs(thrusterPower));

      if(thrusterPower > 0.0) then
         xThrusterProgressBar.Set_Orientation(Orientation => Gtk.Progress_Bar.Progress_Left_To_Right);
      else
         xThrusterProgressBar.Set_Orientation(Orientation => Gtk.Progress_Bar.Progress_Right_To_Left);
      end if;

      xThrusterProgressBar.Set_Text(Text_Handling.sGet_Formatted_Float_String(thrusterPower));
      xThrusterProgressBar.Set_Value(xValue);

   end Set_Thruster_Power;

   function xGet_Thruster_Bar(pxObject : TBuilder; thrusterIndex : Simulator.ViewModel_Actuators.iMotorIndex) return Gtk.Progress_Bar.Gtk_Progress_Bar is
   begin
      case thrusterIndex is
      when 1 =>
         return Gtk.Progress_Bar.Gtk_Progress_Bar(pxObject.xBuilder.Get_Widget("ThrustBar1"));
      when 2=>
         return Gtk.Progress_Bar.Gtk_Progress_Bar(pxObject.xBuilder.Get_Widget("ThrustBar2"));
      when 3=>
         return Gtk.Progress_Bar.Gtk_Progress_Bar(pxObject.xBuilder.Get_Widget("ThrustBar3"));
      when 4=>
         return Gtk.Progress_Bar.Gtk_Progress_Bar(pxObject.xBuilder.Get_Widget("ThrustBar4"));
      when 5=>
         return Gtk.Progress_Bar.Gtk_Progress_Bar(pxObject.xBuilder.Get_Widget("ThrustBar5"));
      when 6=>
         return Gtk.Progress_Bar.Gtk_Progress_Bar(pxObject.xBuilder.Get_Widget("ThrustBar6"));
      when others =>
         return null;
   end case;

   end xGet_Thruster_Bar;
end ActuatorsGUILogic;
