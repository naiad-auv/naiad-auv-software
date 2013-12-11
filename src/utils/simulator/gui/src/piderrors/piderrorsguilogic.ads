with Gtkada.Builder;
with Simulator.Model;
with Simulator.ViewModel_Pid_Errors;
with Gtk.Drawing_Area;
with Glib.Main;
with Simulator.Drawing;

package PIDErrorsGUILogic is

   xViewModel : Simulator.ViewModel_Pid_Errors.pCViewModel_Pid_Errors;

   procedure Register_Timeouts(pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);

   procedure Reset;

private

   procedure Update_View_Model;
   procedure Update_Error_Labels (pxObject : access Gtkada.Builder.Gtkada_Builder_Record'Class);


   type TBuilder is record
      xBuilder : access Gtkada.Builder.Gtkada_Builder_Record'Class;
   end record;


   package Update_General_PKG is new Glib.Main.Generic_Sources(TBuilder);

   xTimeoutPidPositionX : Glib.Main.G_Source_Id;
   xTimeoutPidPositionY : Glib.Main.G_Source_Id;
   xTimeoutPidPositionZ : Glib.Main.G_Source_Id;

   xTimeoutPidRotationX : Glib.Main.G_Source_Id;
   xTimeoutPidRotationY : Glib.Main.G_Source_Id;
   xTimeoutPidRotationZ : Glib.Main.G_Source_Id;

   xTimeoutUpdateWindow : Glib.Main.G_Source_Id;

end PIDErrorsGUILogic;
