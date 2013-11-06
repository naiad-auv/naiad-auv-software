with Gtkada.Builder;
with Gtk.Main;
with Gtk.Drawing_Area;
with Glib.Main;
with Gdk.Window;
with Gdk.GC;
with Gdk.Color;
with Gdk.Drawable;
with Gtk.Widget;
with Ada.Strings.Unbounded;
with Glib;
with Gtk.Adjustment;
with Ada.Numerics.Elementary_Functions;
with Ada.Numerics;
with Gtk.Combo_Box;
with Gtk.GEntry;
with Gdk.Font;

with Simulator.ViewModel;
with Math.Vectors;
with Navigation.Motion_Component;

with Ada.Text_IO;

package body Callbacks is

   type EView is (Side, Top, Back);

   type TPoint is record
      X : float;
      Y : float;
   end record;

   type TViewPositions is record
      xCurrentPosition : TPoint;
      xWantedPosition : TPoint;
   end record;

   type TView is record
      xGraph : Gtk.Drawing_Area.Gtk_Drawing_Area;
      eId : EView;
   end record;

   type TPidGraph is record
      xGraph : Gtk.Drawing_Area.Gtk_Drawing_Area;
      eId : Simulator.ViewModel.EMotionComponent;
   end record;

   type TPid_Scaling_In_Y is array (Simulator.ViewModel.EMotionComponent'Range) of float;

   package Drawing_Timeout_Pid is new Glib.Main.Generic_Sources (TPidGraph);
   package Drawing_Timeout_Drawing_View is new Glib.Main.Generic_Sources (TView);
   package Drawing_Timeout_Drawing_Area is new Glib.Main.Generic_Sources (Gtk.Drawing_Area.Gtk_Drawing_Area);
   package Update_Viewmodel_PKG is new Glib.Main.Generic_Sources(Integer);

   xTimeoutPidPositionX : Glib.Main.G_Source_Id;
   xTimeoutPidPositionY : Glib.Main.G_Source_Id;
   xTimeoutPidPositionZ : Glib.Main.G_Source_Id;
   xTimeoutPidDriftX : Glib.Main.G_Source_Id;
   xTimeoutPidDriftY : Glib.Main.G_Source_Id;
   xTimeoutPidDriftZ : Glib.Main.G_Source_Id;
   --xTimeoutPidDirectional : Glib.Main.G_Source_Id;
   --xTimeoutPidPlanar : Glib.Main.G_Source_Id;
   xTimeoutSideView : Glib.Main.G_Source_Id;
   xTimeoutBackView : Glib.Main.G_Source_Id;
   xTimeoutTopView : Glib.Main.G_Source_Id;
   xTimeoutMotorLevels : Glib.Main.G_Source_Id;
   xTimeoutUpdateViewmodel : Glib.Main.G_Source_Id;

   xPid_Scaling : TPid_Scaling_In_Y := (others => 1.0);

   iPidCounter : float := 0.0;

   xViewmodel : Simulator.ViewModel.pCViewModel := Simulator.ViewModel.pxCreate;

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

   function fGet_Positions_For_View(eID : EView) return TViewPositions is
      xViewPositions : TViewPositions;
      xCurrent_Position : math.Vectors.CVector := xViewmodel.xGet_Submarine_Current_Position;
      xWanted_Position : math.Vectors.CVector := xViewmodel.xGet_Submarine_Wanted_Position;
   begin

      case eID is
         when Side =>
            xViewPositions.xCurrentPosition := (xCurrent_Position.fGet_X, xCurrent_Position.fGet_Z);
            xViewPositions.xWantedPosition := (xWanted_Position.fGet_X, xWanted_Position.fGet_Z);
         when Top =>
            xViewPositions.xCurrentPosition := (xCurrent_Position.fGet_X, xCurrent_Position.fGet_Y);
            xViewPositions.xWantedPosition := (xWanted_Position.fGet_X, xWanted_Position.fGet_Y);
         when Back =>
            xViewPositions.xCurrentPosition := (xCurrent_Position.fGet_Y, xCurrent_Position.fGet_Z);
            xViewPositions.xWantedPosition := (xWanted_Position.fGet_Y, xWanted_Position.fGet_Z);
         when others =>
            xViewPositions := ((5.0, 5.0), (5.0, 5.0));

      end case;

      return xViewPositions;
   end fGet_Positions_For_View;

   function bDraw_View (xView : in TView) return Boolean is
      xWindowForView : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xRedColor : Gdk.GC.Gdk_GC;
      xCustomColor : Gdk.Color.Gdk_Color;

      xViewPositions : TViewPositions := fGet_Positions_For_View(xView.eId);
   begin
      xWindowForView := Gtk.Drawing_Area.Get_Window (xView.xGraph);

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForView);
      Gdk.GC.Set_Foreground(xBlackColor, Gdk.Color.Black (Gtk.Widget.Get_Default_Colormap));
      Gdk.Color.Set_Rgb(xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xBlueColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xBlueColor, xCustomColor);
      Gdk.Color.Set_Rgb(xCustomColor,65535,0,0);
      Gdk.GC.Gdk_New (xRedColor, xWindowForView);
      Gdk.GC.Set_Rgb_Fg_Color(xRedColor, xCustomColor);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlackColor,
         X1       => 0,
         Y1       => 150,
         X2       => 500,
         Y2       => 150);

      Gdk.Drawable.Draw_Line
        (Drawable => xWindowForView,
         GC       => xBlackColor,
         X1       => 150,
         Y1       => 0,
         X2       => 150,
         Y2       => 500);

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xBlueColor,
         X        => Glib.Gint(151.0 + xViewPositions.xCurrentPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xCurrentPosition.Y));

      Gdk.Drawable.Draw_Point
        (Drawable => xWindowForView,
         GC       => xRedColor,
         X        => Glib.Gint(150.0 + xViewPositions.xWantedPosition.X),
         Y        => Glib.Gint(150.0 - xViewPositions.xWantedPosition.Y));

      return True;
   end bDraw_View;

   function fGet_Pid_Scaling_In_Y(xPid : Simulator.ViewModel.EMotionComponent) return float is
   begin
      return xPid_Scaling(xPid);
   end fGet_Pid_Scaling_In_Y;

   procedure Double_Pid_Scaling_In_Y(xPid : Simulator.ViewModel.EMotionComponent) is
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
    --  Gdk.Font.Fontset_Load(Font         => xFont,
      --                      Fontset_Name => "Terminal");

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

   function bUpdate_Viewmodel(iRedundant : Integer) return Boolean is
   begin
      xViewmodel.Update_View_Model(fDeltaTime => 0.01);

      return True;
   end bUpdate_Viewmodel;

   function bDraw_Motor_Levels (xMotorArea : in Gtk.Drawing_Area.Gtk_Drawing_Area) return Boolean is
      use Ada.Numerics.Elementary_Functions;
      use Ada.Numerics;
      use Glib;

      xWindowForMotors : Gdk.Window.Gdk_Window;
      xBlackColor   : Gdk.GC.Gdk_GC;
      xBlueColor : Gdk.GC.Gdk_GC;
      xCustomColor : Gdk.Color.Gdk_Color;

      Len : Gint := -35;
      Outer : Gint := 60;
      Inner : Gint := 55;

--        xMotor1Force : float := xViewmodel.
   begin
      xWindowForMotors := Gtk.Drawing_Area.Get_Window (xMotorArea);

      Gdk.Window.Clear(xWindowForMotors);

      -- Set Colors
      Gdk.GC.Gdk_New (xBlackColor, xWindowForMotors);
      Gdk.GC.Set_Foreground(xBlackColor, Gdk.Color.Black (Gtk.Widget.Get_Default_Colormap));
      Gdk.Color.Set_Rgb(xCustomColor,0,0,65535);
      Gdk.GC.Gdk_New (xBlueColor, xWindowForMotors);
      Gdk.GC.Set_Rgb_Fg_Color(xBlueColor, xCustomColor);

      Gdk.Drawable.Draw_Polygon
        (Drawable => xWindowForMotors,
         GC       => xBlackColor,
         Filled   => True,
         Points   => ((75, 25),(30, 100),(120, 100)));

      Gdk.Drawable.Draw_Polygon
        (Drawable => xWindowForMotors,
         GC       => xBlueColor,
         Filled   => True,
         Points   => ((75, 75 - Inner),(75, 75 - Outer),(75 + Len, 75 - Outer),(75 + Len, 75 - Inner))); -- End point depends on motor values ...

      Gdk.Drawable.Draw_Polygon
        (Drawable => xWindowForMotors,
         GC       => xBlueColor,
         Filled   => True,
         Points   => ((75 - Gint(Float(Inner) * Sin(2.0 * Pi / 3.0)), 75 - Gint(Float(Inner) * Cos(2.0 * Pi / 3.0))),
                      (75 - Gint(Float(Outer + 1) * Sin(2.0 * Pi / 3.0)), 75 - Gint(Float(Outer + 1) * Cos(2.0 * Pi / 3.0))),
                      (75 - Gint(Float(Outer + 1) * Sin(2.0 * Pi / 3.0)) - Gint(Float(Len) * Sin(Pi / 6.0)),
                       75 - Gint(Float(Outer + 1) * Cos(2.0 * Pi / 3.0)) - Gint(Float(Len) * Cos(Pi / 6.0))),
                      (75 - Gint(Float(Inner) * Sin(2.0 * Pi / 3.0)) - Gint(Float(Len) * Sin(Pi / 6.0)),
                       75 - Gint(Float(Inner) * Cos(2.0 * Pi / 3.0))  - Gint(Float(Len) * Cos(Pi / 6.0))))); -- End point depends on motor values ...

      Gdk.Drawable.Draw_Polygon
        (Drawable => xWindowForMotors,
         GC       => xBlueColor,
         Filled   => True,
         Points   => ((75 - Gint(Float(Inner) * Sin(4.0 * Pi / 3.0)), 75 - Gint(Float(Inner) * Cos(4.0 * Pi / 3.0))),
                      (75 - Gint(Float(Outer + 1) * Sin(4.0 * Pi / 3.0)), 75 - Gint(Float(Outer + 1) * Cos(4.0 * Pi / 3.0))),
                      (75 - Gint(Float(Outer + 1) * Sin(4.0 * Pi / 3.0)) - Gint(Float(Len) * Sin(Pi / 6.0)),
                       75 - Gint(Float(Outer + 1) * Cos(4.0 * Pi / 3.0)) + Gint(Float(Len) * Cos(Pi / 6.0))),
                      (75 - Gint(Float(Inner) * Sin(4.0 * Pi / 3.0)) - Gint(Float(Len) * Sin(Pi / 6.0)),
                       75 - Gint(Float(Inner) * Cos(4.0 * Pi / 3.0)) + Gint(Float(Len) * Cos(Pi / 6.0))))); -- End point depends on motor values ...

      return True;
   end bDraw_Motor_Levels;

   procedure Draw_Timeout(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Glib.Main;
      use Glib;
      use Simulator.ViewModel;

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

      if xTimeoutPidDriftX = 0 then
         xTimeoutPidDriftX := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidDriftX")), DriftX));
      end if;

      if xTimeoutPidDriftY = 0 then
         xTimeoutPidDriftY := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidDriftY")), DriftY));
      end if;

      if xTimeoutPidDriftZ = 0 then
         xTimeoutPidDriftZ := Drawing_Timeout_Pid.Timeout_Add
           (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidDriftZ")), DriftZ));
      end if;

    --  if xTimeoutPidPlanar = 0 then
    --     xTimeoutPidPlanar := Drawing_Timeout_Pid.Timeout_Add
 --          (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidPlanar")), Plane));
      --   null;
     -- end if;

  --    if xTimeoutPidDirectional = 0 then
      --   xTimeoutPidDirectional := Drawing_Timeout_Pid.Timeout_Add
   --        (xUpdateIntervall, bDraw_Pid'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwPidDirectional")), Direction));
    --     null;
      --end if;

      if xTimeoutMotorLevels = 0 then
         xTimeoutMotorLevels := Drawing_Timeout_Drawing_Area.Timeout_Add
           (xUpdateIntervall * 10, bDraw_Motor_Levels'Access, Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwMotorLevels")));
      end if;

      if xTimeoutSideView = 0 then
         xTimeoutSideView := Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwSide")), Side));
      end if;

      if xTimeoutTopView = 0 then
         xTimeoutTopView := Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwTop")), Top));
      end if;

      if xTimeoutBackView = 0 then
         xTimeoutBackView := Drawing_Timeout_Drawing_View.Timeout_Add
           (xUpdateIntervall, bDraw_View'Access, (Gtk.Drawing_Area.Gtk_Drawing_Area (Gtkada.Builder.Get_Widget(pxObject, "drwBack")), Back));
      end if;

      if xTimeoutUpdateViewmodel = 0 then
         xTimeoutUpdateViewmodel := Update_Viewmodel_PKG.Timeout_Add
           (10, bUpdate_Viewmodel'Access, 1);
      end if;

   end Draw_Timeout;

   procedure Clear_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class; sName : String) is
      xWindow : Gtk.Drawing_Area.Gtk_Drawing_Area := Gtk.Drawing_Area.Gtk_Drawing_Area(Gtkada.Builder.Get_Widget(pxObject, sName));
   begin
      Gdk.Window.Clear(Gtk.Drawing_Area.Get_Window(xWindow));
   end Clear_Window;

   procedure Clear_All_Pids(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      Clear_Window(pxObject, "drwSide");
      Clear_Window(pxObject, "drwTop");
      Clear_Window(pxObject, "drwBack");
      Clear_Window(pxObject, "drwPidPosX");
      Clear_Window(pxObject, "drwPidPosY");
      Clear_Window(pxObject, "drwPidPosZ");
      Clear_Window(pxObject, "drwPidPlanar");
      Clear_Window(pxObject, "drwPidDirectional");
      Clear_Window(pxObject, "drwPidDriftX");
      Clear_Window(pxObject, "drwPidDriftY");
      Clear_Window(pxObject, "drwPidDriftZ");
      Clear_Window(pxObject, "drwDirectional");
      Clear_Window(pxObject, "drwDirectionalGoal");
      Clear_Window(pxObject, "drwPlanar");
      Clear_Window(pxObject, "drwPlanarGoal");
   end Clear_All_Pids;

   procedure Restart_Simulation(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
   begin
      xViewmodel.Restart;

      iPidCounter := 0.0;

      Clear_All_Pids(pxObject);

      xPid_Scaling := (others => 1.0);

   end Restart_Simulation;

   procedure Update_Wanted_Position(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      sPositionX : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryX"));
      sPositionY : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryY"));
      sPositionZ : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryZ"));

      sRoll : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryRoll"));
      sPitch : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPitch"));
      sYaw : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryYaw"));
   begin
      xViewmodel.Set_Wanted_Position_And_Orientation(fPositionX    => Float'Value(sPositionX.Get_Text),
                                                     fPositionY    => Float'Value(sPositionY.Get_Text),
                                                     fPositionZ    => Float'Value(sPositionZ.Get_Text),
                                                     fOrientationR => Float'Value(sRoll.Get_Text),
                                                     fOrientationP => Float'Value(sPitch.Get_Text),
                                                     fOrientationY => Float'Value(sYaw.Get_Text));
   end Update_Wanted_Position;

   procedure Update_Pid_Constants(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      sPidProportionalConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantP"));
      sPidIntegratingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantI"));
      sPidDerivatingConstant : Gtk.GEntry.Gtk_Entry := Gtk.GEntry.Gtk_Entry(Gtkada.Builder.Get_Widget(pxObject, "entryPidConstantD"));
   begin
      xViewmodel.Set_Value_Of_Selected_Pid(fProporitonalPart => Float'Value(sPidProportionalConstant.Get_Text),
                                           fIntegratingPart  => Float'Value(sPidIntegratingConstant.Get_Text),
                                           fDerivativePart   => Float'Value(sPidDerivatingConstant.Get_Text));
   end Update_Pid_Constants;

   procedure Init_Pid(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Simulator.ViewModel;
   begin
      xViewmodel.Set_Selected_Pid(X);
   end Init_Pid;

   procedure Selected_Pid_Changed(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      use Simulator.ViewModel;

      xSelectedPID : Gtk.Combo_Box.Gtk_Combo_Box := Gtk.Combo_Box.Gtk_Combo_Box(Gtkada.Builder.Get_Widget(pxObject, "cmbPids"));
   begin

      case xSelectedPID.Get_Active is
         when 0 =>
            xViewmodel.Set_Selected_Pid(X);
         when 1 =>
            xViewmodel.Set_Selected_Pid(Y);
         when 2 =>
            xViewmodel.Set_Selected_Pid(Z);
     --    when 3 =>
 --           xViewmodel.Set_Selected_Pid(Plane);
     --    when 4 =>
   --         xViewmodel.Set_Selected_Pid(Direction);
         when 5 =>
            xViewmodel.Set_Selected_Pid(DriftX);
         when 6 =>
            xViewmodel.Set_Selected_Pid(DriftY);
         when 7 =>
            xViewmodel.Set_Selected_Pid(DriftZ);
         when others =>
            null;
      end case;

   end Selected_Pid_Changed;

   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class) is
      pragma Unreferenced (pxObject);
   begin
      Gtk.Main.Main_Quit;
   end Quit;

end Callbacks;
