with Gtkada.Builder;
with Simulator.Model;
with Simulator.ViewModel_Representation;

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
    procedure Clear_Window(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class; sName : String);


end MainWindowLogic;
