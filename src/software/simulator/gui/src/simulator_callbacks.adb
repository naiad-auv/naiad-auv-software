with Gtk.Main;
with Gtk.Widget;
with Glib;
with Glib.Main;
with Gtk.GEntry;
with Gtk.Progress_Bar;
with Gtk.Drawing_Area;
with Gdk.Window;
with Gdk.GC;
with Gdk.Color;
with Gdk.Drawable;

with Database; use Database;
with Gtk.Box;
with Gtk.Label;
with Gtk.Radio_Button;
with Ada.Text_IO; use Ada.Text_IO;

package body Simulator_Callbacks is

   package Drawing_Timeout is new Glib.Main.Generic_Sources (Gtk.Drawing_Area.Gtk_Drawing_Area);
   package Vbox_Timeout is new Glib.Main.Generic_Sources (Gtk.Box.Gtk_Vbox);
   package Hbox_Timeout is new Glib.Main.Generic_Sources (Gtk.Box.Gtk_Hbox);

   xTimeoutDraw : Glib.Main.G_Source_Id;
   xTimeoutDrawPid : Glib.Main.G_Source_Id;
   xTimeoutDrawYX : Glib.Main.G_Source_Id;
   xTimeoutDrawZX : Glib.Main.G_Source_Id;
   xTimeoutDrawZY : Glib.Main.G_Source_Id;
   xTimeoutSensor : Glib.Main.G_Source_Id;
   xTimeoutMotorLabels : Glib.Main.G_Source_Id;
   xTimeoutMotorProgress : Glib.Main.G_Source_Id;
   xTimeoutPneumatics : Glib.Main.G_Source_Id;

   iPidCounter : Integer := 0;
   iPidFrequency : Integer := 0;
   bPidLastValuePositive : Boolean;
   fLastError : float;
   fNewError : float;
   fLastDiff : float;

   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      pragma Unreferenced (pxObject);
   begin
      Gtk.Main.Main_Quit;
   end Quit;

   procedure Set_Database(pxDatabase : Database.pTDatabase) is
   begin
      pxDatabaseReference := pxDatabase;
   end Set_Database;

   function Draw_Map (Area : in Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean is
      xWindowForGraphYX : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xCustomColor : Gdk.Color.Gdk_Color;
   begin
      xWindowForGraphYX := Gtk.Drawing_Area.Get_Window (Area);

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForGraphYX);
      Gdk.GC.Set_Foreground(xBlackColor, Gdk.Color.Black (Gtk.Widget.Get_Default_Colormap));
      Gdk.Color.Set_Rgb(xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xBlueColor, xWindowForGraphYX);
      Gdk.GC.Set_Rgb_Fg_Color(xBlueColor, xCustomColor);

      -- Draw Current Position
      Gdk.Drawable.Draw_Rectangle
        (Drawable => xWindowForGraphYX,
         GC       => xBlackColor,
         Filled   => True,
         X        => Glib.Gint(pxDatabaseReference.fPositionX + 249.0),
         Y        => Glib.Gint(249.0 - pxDatabaseReference.fPositionY),
         Width    => 2,
         Height   => 2);

      -- Draw Goal Position
      Gdk.Drawable.Draw_Rectangle
        (Drawable => xWindowForGraphYX,
         GC       => xBlueColor,
         Filled   => True,
         X        => Glib.Gint(pxDatabaseReference.fGoalPositionX + 249.0),
         Y        => Glib.Gint(249.0 - pxDatabaseReference.fGoalPositionY),
         Width    => 2,
         Height   => 2);

      return True;
   end Draw_Map;

   function Draw_Pid (Area : in Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean is
      xWindowForPid : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xCustomColor : Gdk.Color.Gdk_Color;
   begin
      xWindowForPid := Gtk.Drawing_Area.Get_Window (Area);

      if (iPidCounter > 600) then
         iPidCounter := 0;
      end if;

      if (iPidCounter = 0) then
         Gdk.Window.Clear(xWindowForPid);
      end if;

      iPidCounter := iPidCounter + 1;

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
         Y1       => 100,
         X2       => 1000,
         Y2       => 100);

      -- Draw error point
      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForPid,
         GC       => xBlueColor,
         X        => Glib.Gint(iPidCounter),
         Y        => Glib.Gint((pxDatabaseReference.fCurrentDirectionaAngle - pxDatabaseReference.fGoalDirectionalAngle) / 1.0 + 100.0));

      return True;
   end Draw_Pid;

   function Draw_YX (xGraphForProjectionYX : in Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean is
      xWindowForGraphYX : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
   begin
      xWindowForGraphYX := Gtk.Drawing_Area.Get_Window (xGraphForProjectionYX);

      -- Clear screen
      GDK.Window.Clear (xWindowForGraphYX);

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForGraphYX);

      -- Draw Cross Hair
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphYX,
         GC       => xBlackColor,
         X1       => 0,
         Y1       => 50,
         X2       => 100,
         Y2       => 50);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphYX,
         GC       => xBlackColor,
         X1       => 50,
         Y1       => 100,
         X2       => 50,
         Y2       => 0);

      -- Draw Vector
     Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphYX,
         GC       => xBlackColor,
         X1       => Glib.Gint(pxDatabaseReference.tfRollPitchYaw(2,1) * (-50.0) + 50.0),
         Y1       => Glib.Gint(pxDatabaseReference.tfRollPitchYaw(1,1) * (-50.0) + 50.0),
         X2       => 50,
         Y2       => 50);

      return True;
   end Draw_YX;

   function Draw_ZY (xGraphForProjectionZY : in Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean is
      xWindowForGraphZY : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
   begin
      xWindowForGraphZY := Gtk.Drawing_Area.Get_Window (xGraphForProjectionZY);

      -- Clear screen
      GDK.Window.Clear (xWindowForGraphZY);

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForGraphZY);

      -- Draw Cross Hair
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphZY,
         GC       => xBlackColor,
         X1       => 0,
         Y1       => 50,
         X2       => 100,
         Y2       => 50);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphZY,
         GC       => xBlackColor,
         X1       => 50,
         Y1       => 100,
         X2       => 50,
         Y2       => 0);

      -- Draw Vector
     Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphZY,
         GC       => xBlackColor,
         X1       => Glib.Gint(pxDatabaseReference.tfRollPitchYaw(2,2) * (-50.0) + 50.0),
         Y1       => Glib.Gint(pxDatabaseReference.tfRollPitchYaw(3,2) * (-50.0) + 50.0),
         X2       => Glib.Gint(pxDatabaseReference.tfRollPitchYaw(2,2) * 50.0 + 50.0),
         Y2       => Glib.Gint(pxDatabaseReference.tfRollPitchYaw(3,2) * 50.0 + 50.0));

      return True;
   end Draw_ZY;

   function Draw_ZX (xGraphForProjectionZX : in Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean is
      xWindowForGraphZX : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
   begin
      xWindowForGraphZX := Gtk.Drawing_Area.Get_Window (xGraphForProjectionZX);

      -- Clear screen
      GDK.Window.Clear (xWindowForGraphZX);

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForGraphZX);

      -- Draw Cross Hair
      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphZX,
         GC       => xBlackColor,
         X1       => 0,
         Y1       => 50,
         X2       => 100,
         Y2       => 50);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphZX,
         GC       => xBlackColor,
         X1       => 50,
         Y1       => 100,
         X2       => 50,
         Y2       => 0);

      -- Draw Vector
     Gdk.Drawable.Draw_Line
        (Drawable => xWindowForGraphZX,
         GC       => xBlackColor,
         X1       => Glib.Gint(pxDatabaseReference.tfRollPitchYaw(1,1) * 50.0 + 50.0),
         Y1       => Glib.Gint(pxDatabaseReference.tfRollPitchYaw(3,1) * (-50.0) + 50.0),
         X2       => 50,
         Y2       => 50);

      return True;
   end Draw_ZX;

   function Update_Sensor (xVerticalBoxForSensorLabels : in Gtk.Box.Gtk_Vbox) return Boolean is
      xRollLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(0));
      xPitchLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(1));
      xYawLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(2));

      xDepthLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(3));

      xVelocityXLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(4));
      xVelocityYLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(5));
      xPositionXLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(6));
      xPositionYLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(7));

      xMaxPidLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(8));
      xPidFreqLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(9));
      xPidErrorLabel : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(10));
      xPidErrorLabel2 : Gtk.Label.Gtk_Label := Gtk.Label.Gtk_Label(xVerticalBoxForSensorLabels.Get_Child(11));
   begin

      xRollLabel.Set_Label("nan");
      xPitchLabel.Set_Label("nan");
      xYawLabel.Set_Label("nan");

      xDepthLabel.Set_Label(pxDatabaseReference.fDepth'Img);

      xVelocityXLabel.Set_Label(pxDatabaseReference.fVelocityX'Img);
      xVelocityYLabel.Set_Label(pxDatabaseReference.fVelocityY'Img);
      xPositionXLabel.Set_Label(pxDatabaseReference.fPositionX'Img);
      xPositionYLabel.Set_Label(pxDatabaseReference.fPositionY'Img);

      if (pxDatabaseReference.fPositionX - pxDatabaseReference.fGoalPositionX < 0.0) then
--           bPidCurrentValuePositive := false;
--
--        else if(pxDatabaseReference.fPositionX - pxDatabaseReference.fGoalPositionX > 0.0 and then not bPidCurrentValuePositive)
--           bPidCurrentValuePositive := true;
--
         if bPidLastValuePositive = true then
            xPidFreqLabel.Set_Label(Float(Abs(Float(iPidFrequency) * 0.01 * 2.0))'Img);
            iPidFrequency := 0;
         else
            iPidFrequency := iPidFrequency + 1;
         end if;

         bPidLastValuePositive := false;
      else
         iPidFrequency := iPidFrequency + 1;

         bPidLastValuePositive := true;
      end if;

      fNewError := Float(pxDatabaseReference.fPositionX - pxDatabaseReference.fGoalPositionX);

      if fNewError < fLastError then
         if fLastDiff > 0.0 then
            -- vändning
            xPidErrorLabel.Set_Label(float(abs(fLastError))'Img);
         end if;
      else
         if fLastDiff < 0.0 then
            xPidErrorLabel.Set_Label(float(abs(fLastError))'Img);
         end if;
      end if;

      fLastDiff := fNewError - fLastError; -- -40 - -50 = 10	40 - 50 = -10
      fLastError := fNewError;

      if (Float'Value(xMaxPidLabel.Get_Label) < Abs(Float(pxDatabaseReference.fPositionX - pxDatabaseReference.fGoalPositionX))) then
         xMaxPidLabel.Set_Label(Float(Abs(pxDatabaseReference.fPositionX - pxDatabaseReference.fGoalPositionX))'Img);
      end if;

      return True;
   end Update_Sensor;

   function Update_Motor_Labels (xHorizontalBoxForMotorLabels : in Gtk.Box.Gtk_Hbox) return Boolean is
      type Decimal_Number is digits 2;
   begin
      for i in 1 .. 6 loop
         Gtk.Label.Gtk_Label(xHorizontalBoxForMotorLabels.Get_Child(Glib.Gint(i - 1))).Set_Label(Decimal_Number(pxDatabaseReference.tfMotor(i))'Img);
      end loop;
      return True;
   end Update_Motor_Labels;

   function Update_Motor_Progress_Bars (xHorizontalBoxForMotorBars : in Gtk.Box.Gtk_Hbox) return Boolean is
      use Gtk.Progress_Bar;
   begin
      for i in 1 .. 6 loop
         if (pxDatabaseReference.tfMotor(i) < 0.0)
         then
            Gtk_Progress_Bar(xHorizontalBoxForMotorBars.Get_Child(Glib.Gint(i - 1))).Set_Orientation(Progress_Top_To_Bottom);
         else
            Gtk_Progress_Bar(xHorizontalBoxForMotorBars.Get_Child(Glib.Gint(i - 1))).Set_Orientation(Progress_Bottom_To_Top);
         end if;

         Gtk_Progress_Bar(xHorizontalBoxForMotorBars.Get_Child(Glib.Gint(i - 1))).Set_Fraction(Glib.Gdouble(Abs(pxDatabaseReference.tfMotor(i) / 100.0)));
      end loop;
      return True;
   end Update_Motor_Progress_Bars;

   function Update_Pneumatic_States (xVerticalBoxForPneumaticStates : in Gtk.Box.Gtk_Vbox) return Boolean is
   begin
      Gtk.Radio_Button.Gtk_Radio_Button(xVerticalBoxForPneumaticStates.Get_Child(0)).Set_Active(Is_Active => pxDatabaseReference.bGripperOpen);
      Gtk.Radio_Button.Gtk_Radio_Button(xVerticalBoxForPneumaticStates.Get_Child(1)).Set_Active(Is_Active => pxDatabaseReference.bLeftTorpedoShot);
      Gtk.Radio_Button.Gtk_Radio_Button(xVerticalBoxForPneumaticStates.Get_Child(2)).Set_Active(Is_Active => pxDatabaseReference.bRightTorpedoShot);
      Gtk.Radio_Button.Gtk_Radio_Button(xVerticalBoxForPneumaticStates.Get_Child(3)).Set_Active(Is_Active => pxDatabaseReference.bLeftMarkerDropped);
      Gtk.Radio_Button.Gtk_Radio_Button(xVerticalBoxForPneumaticStates.Get_Child(4)).Set_Active(Is_Active => pxDatabaseReference.bRightMarkerDropped);

      return True;
   end Update_Pneumatic_States;

   procedure Start_Draw_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
   begin
      if xTimeoutDraw = 0 then
         xTimeoutDraw := Drawing_Timeout.Timeout_Add
           (5, Draw_Map'Access, Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwMap")));
      end if;

      if xTimeoutDrawPid = 0 then
         xTimeoutDrawPid := Drawing_Timeout.Timeout_Add
           (10, Draw_Pid'Access, Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPid")));
      end if;

      if xTimeoutDrawYX = 0 then
         xTimeoutDrawYX := Drawing_Timeout.Timeout_Add
           (50, Draw_YX'Access, Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwYX")));
      end if;

      if xTimeoutDrawZX = 0 then
         xTimeoutDrawZX := Drawing_Timeout.Timeout_Add
           (50, Draw_ZX'Access, Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwZX")));
      end if;

      if xTimeoutDrawZY = 0 then
         xTimeoutDrawZY := Drawing_Timeout.Timeout_Add
           (50, Draw_ZY'Access, Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwZY")));
      end if;

   end Start_Draw_Timeout;

   procedure Start_Sensor_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
   begin
      if xTimeoutSensor = 0 then
         xTimeoutSensor := VBox_Timeout.Timeout_Add
           (200, Update_Sensor'Access, Gtk.Box.Gtk_Vbox (Gtkada.Builder.Get_Widget(pxObject, "vboxSensorValues")));
      end if;
   end Start_Sensor_Timeout;

   procedure Start_Actuator_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
   begin
      if xTimeoutMotorLabels = 0 then
         xTimeoutMotorLabels := HBox_Timeout.Timeout_Add
           (250, Update_Motor_Labels'Access, Gtk.Box.Gtk_Hbox (Gtkada.Builder.Get_Widget(pxObject, "hboxMotorLabels")));
      end if;

      if xTimeoutMotorProgress = 0 then
         xTimeoutMotorProgress := HBox_Timeout.Timeout_Add
           (250, Update_Motor_Progress_Bars'Access, Gtk.Box.Gtk_Hbox (Gtkada.Builder.Get_Widget(pxObject, "hboxMotorBars")));
      end if;

      if xTimeoutPneumatics = 0 then
         xTimeoutPneumatics := VBox_Timeout.Timeout_Add
           (250, Update_Pneumatic_States'Access, Gtk.Box.Gtk_Vbox (Gtkada.Builder.Get_Widget(pxObject, "vboxPneumaticStates")));
      end if;
   end Start_Actuator_Timeout;

   procedure Change_Goal(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;

      sTextBoxForGoalValueX : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "txtbGoalX"));
      sTextBoxForGoalValueY : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "txtbGoalY"));
   begin

      if (sTextBoxForGoalValueX.Get_Text_Length > Glib.Guint16(0) and
            sTextBoxForGoalValueY.Get_Text_Length > Glib.Guint16(0))
      then
         pxDatabaseReference.fGoalPositionX := Float'Value(sTextBoxForGoalValueX.Get_Text);
         pxDatabaseReference.fGoalPositionY := Float'Value(sTextBoxForGoalValueY.Get_Text);

         iPidCounter := 0;
      end if;

   exception
      when others => NULL;
   end Change_Goal;

   procedure Change_Pid(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;

      sTextBoxForProportionalValue : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "txtbProportional"));
      sTextBoxForIntegratingValue : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "txtbIntegrating"));
      sTextBoxForDerivativeValue : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "txtbDerivative"));
   begin

      if (sTextBoxForProportionalValue.Get_Text_Length > Glib.Guint16(0) and then
            sTextBoxForIntegratingValue.Get_Text_Length > Glib.Guint16(0) and then
            sTextBoxForDerivativeValue.Get_Text_Length > Glib.Guint16(0))
      then
         Database.fProportional := Float'Value(sTextBoxForProportionalValue.Get_Text);
         Database.fIntegrating := Float'Value(sTextBoxForIntegratingValue.Get_Text);
         Database.fDerivative := Float'Value(sTextBoxForDerivativeValue.Get_Text);

         iPidCounter := 0;
      end if;

   exception
      when others => NULL;
   end Change_Pid;

end Simulator_Callbacks;
