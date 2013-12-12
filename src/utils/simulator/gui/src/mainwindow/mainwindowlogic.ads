with Gtkada.Builder;
with Simulator.Model;
with Simulator.ViewModel_Representation;
with Gtk.Status_Bar;
with Glib.Main;
with Simulator.Drawing;

package MainWindowLogic is

   xModel : Simulator.Model.pCModel := Simulator.Model.pxCreate(10);
   xViewmodel : Simulator.ViewModel_Representation.pCViewModel_Representation := Simulator.ViewModel_Representation.pxCreate(xModel);

   procedure Quit (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Register_Timeout_Handlers(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Restart_Simulation(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Start_Simulation(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Pause_Simulation(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   --windows
   procedure Show_Thruster_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Show_PIDCfg_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Show_WantedStuff_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Show_PID_Errors_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);
   procedure Show_Sensor_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

private
   type TStatusBar is record
      xStatusBar : Gtk.Status_Bar.Gtk_Status_Bar;
      eId : Simulator.Drawing.EView;
   end record;

   package Drawing_Timeout_Status_Bars is new Glib.Main.Generic_Sources (TStatusBar);

   package Update_Viewmodel_PKG is new Glib.Main.Generic_Sources(Integer);

   xTimeoutSideView : Glib.Main.G_Source_Id;
   xTimeoutBackView : Glib.Main.G_Source_Id;
   xTimeoutTopView : Glib.Main.G_Source_Id;
   xTimeoutCurrent3D : Glib.Main.G_Source_Id;
   xTimeoutWanted3D : Glib.Main.G_Source_Id;

   xTimeOutTopStatusBar :Glib.Main.G_Source_Id;
   xTimeOutSideStatusBar :Glib.Main.G_Source_Id;
   xTimeOutBackStatusBar :Glib.Main.G_Source_Id;
   xTimeOut3DStatusBar :Glib.Main.G_Source_Id;

   xTimeoutUpdateViewmodel : Glib.Main.G_Source_Id;

   bSimulationRunning : boolean := false;

    procedure Clear_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class; sName : String);


end MainWindowLogic;
