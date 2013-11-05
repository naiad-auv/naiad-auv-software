pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~simulator.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~simulator.adb");

with System.Restrictions;

package body ada_main is
   pragma Warnings (Off);

   procedure Do_Finalize;
   pragma Import (C, Do_Finalize, "system__standard_library__adafinal");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   procedure adainit is
      E013 : Boolean; pragma Import (Ada, E013, "system__soft_links_E");
      E159 : Boolean; pragma Import (Ada, E159, "system__fat_flt_E");
      E125 : Boolean; pragma Import (Ada, E125, "system__fat_lflt_E");
      E288 : Boolean; pragma Import (Ada, E288, "system__fat_llf_E");
      E023 : Boolean; pragma Import (Ada, E023, "system__exception_table_E");
      E207 : Boolean; pragma Import (Ada, E207, "ada__containers_E");
      E070 : Boolean; pragma Import (Ada, E070, "ada__io_exceptions_E");
      E211 : Boolean; pragma Import (Ada, E211, "ada__strings_E");
      E217 : Boolean; pragma Import (Ada, E217, "ada__strings__maps_E");
      E006 : Boolean; pragma Import (Ada, E006, "ada__tags_E");
      E054 : Boolean; pragma Import (Ada, E054, "ada__streams_E");
      E072 : Boolean; pragma Import (Ada, E072, "interfaces__c_E");
      E074 : Boolean; pragma Import (Ada, E074, "interfaces__c__strings_E");
      E107 : Boolean; pragma Import (Ada, E107, "system__assertions_E");
      E017 : Boolean; pragma Import (Ada, E017, "system__secondary_stack_E");
      E063 : Boolean; pragma Import (Ada, E063, "system__finalization_root_E");
      E065 : Boolean; pragma Import (Ada, E065, "system__finalization_implementation_E");
      E061 : Boolean; pragma Import (Ada, E061, "ada__finalization_E");
      E213 : Boolean; pragma Import (Ada, E213, "ada__strings__unbounded_E");
      E082 : Boolean; pragma Import (Ada, E082, "ada__finalization__list_controller_E");
      E080 : Boolean; pragma Import (Ada, E080, "system__file_control_block_E");
      E233 : Boolean; pragma Import (Ada, E233, "ada__streams__stream_io_E");
      E059 : Boolean; pragma Import (Ada, E059, "system__file_io_E");
      E077 : Boolean; pragma Import (Ada, E077, "system__os_lib_E");
      E231 : Boolean; pragma Import (Ada, E231, "system__strings__stream_ops_E");
      E053 : Boolean; pragma Import (Ada, E053, "ada__text_io_E");
      E088 : Boolean; pragma Import (Ada, E088, "glib_E");
      E105 : Boolean; pragma Import (Ada, E105, "gtkada__types_E");
      E124 : Boolean; pragma Import (Ada, E124, "cairo_E");
      E127 : Boolean; pragma Import (Ada, E127, "cairo__region_E");
      E084 : Boolean; pragma Import (Ada, E084, "database_E");
      E261 : Boolean; pragma Import (Ada, E261, "gdk__image_E");
      E122 : Boolean; pragma Import (Ada, E122, "gdk__rectangle_E");
      E253 : Boolean; pragma Import (Ada, E253, "glib__g_icon_E");
      E109 : Boolean; pragma Import (Ada, E109, "glib__glist_E");
      E135 : Boolean; pragma Import (Ada, E135, "gdk__visual_E");
      E111 : Boolean; pragma Import (Ada, E111, "glib__gslist_E");
      E239 : Boolean; pragma Import (Ada, E239, "glib__main_E");
      E094 : Boolean; pragma Import (Ada, E094, "glib__object_E");
      E096 : Boolean; pragma Import (Ada, E096, "glib__type_conversion_hooks_E");
      E185 : Boolean; pragma Import (Ada, E185, "glib__types_E");
      E118 : Boolean; pragma Import (Ada, E118, "glib__values_E");
      E133 : Boolean; pragma Import (Ada, E133, "gdk__color_E");
      E173 : Boolean; pragma Import (Ada, E173, "gdk__cursor_E");
      E116 : Boolean; pragma Import (Ada, E116, "glib__generic_properties_E");
      E203 : Boolean; pragma Import (Ada, E203, "gtk__tree_model_E");
      E103 : Boolean; pragma Import (Ada, E103, "gtkada__c_E");
      E099 : Boolean; pragma Import (Ada, E099, "gtkada__bindings_E");
      E114 : Boolean; pragma Import (Ada, E114, "gdk__types_E");
      E150 : Boolean; pragma Import (Ada, E150, "gdk__region_E");
      E120 : Boolean; pragma Import (Ada, E120, "gdk__event_E");
      E175 : Boolean; pragma Import (Ada, E175, "gdk__display_E");
      E129 : Boolean; pragma Import (Ada, E129, "gdk__window_E");
      E154 : Boolean; pragma Import (Ada, E154, "gdk__bitmap_E");
      E152 : Boolean; pragma Import (Ada, E152, "gdk__pixmap_E");
      E158 : Boolean; pragma Import (Ada, E158, "glib__properties_E");
      E181 : Boolean; pragma Import (Ada, E181, "gtk__accel_group_E");
      E137 : Boolean; pragma Import (Ada, E137, "gtk__enums_E");
      E156 : Boolean; pragma Import (Ada, E156, "gtk__object_E");
      E193 : Boolean; pragma Import (Ada, E193, "gtk__adjustment_E");
      E243 : Boolean; pragma Import (Ada, E243, "gtk__orientable_E");
      E086 : Boolean; pragma Import (Ada, E086, "gui_E");
      E144 : Boolean; pragma Import (Ada, E144, "pango__enums_E");
      E163 : Boolean; pragma Import (Ada, E163, "pango__attributes_E");
      E142 : Boolean; pragma Import (Ada, E142, "pango__font_E");
      E146 : Boolean; pragma Import (Ada, E146, "gdk__font_E");
      E148 : Boolean; pragma Import (Ada, E148, "gdk__gc_E");
      E165 : Boolean; pragma Import (Ada, E165, "pango__context_E");
      E167 : Boolean; pragma Import (Ada, E167, "pango__tabs_E");
      E161 : Boolean; pragma Import (Ada, E161, "pango__layout_E");
      E177 : Boolean; pragma Import (Ada, E177, "gdk__drawable_E");
      E179 : Boolean; pragma Import (Ada, E179, "gdk__rgb_E");
      E171 : Boolean; pragma Import (Ada, E171, "gdk__pixbuf_E");
      E139 : Boolean; pragma Import (Ada, E139, "gtk__style_E");
      E265 : Boolean; pragma Import (Ada, E265, "gtk__settings_E");
      E131 : Boolean; pragma Import (Ada, E131, "gtk__widget_E");
      E277 : Boolean; pragma Import (Ada, E277, "gtk__action_E");
      E279 : Boolean; pragma Import (Ada, E279, "gtk__activatable_E");
      E189 : Boolean; pragma Import (Ada, E189, "gtk__builder_E");
      E187 : Boolean; pragma Import (Ada, E187, "gtk__buildable_E");
      E191 : Boolean; pragma Import (Ada, E191, "gtk__container_E");
      E183 : Boolean; pragma Import (Ada, E183, "gtk__bin_E");
      E241 : Boolean; pragma Import (Ada, E241, "gtk__box_E");
      E285 : Boolean; pragma Import (Ada, E285, "gtk__button_E");
      E245 : Boolean; pragma Import (Ada, E245, "gtk__drawing_area_E");
      E255 : Boolean; pragma Import (Ada, E255, "gtk__editable_E");
      E257 : Boolean; pragma Import (Ada, E257, "gtk__entry_completion_E");
      E263 : Boolean; pragma Import (Ada, E263, "gtk__icon_factory_E");
      E199 : Boolean; pragma Import (Ada, E199, "gtk__marshallers_E");
      E267 : Boolean; pragma Import (Ada, E267, "gtk__misc_E");
      E259 : Boolean; pragma Import (Ada, E259, "gtk__image_E");
      E269 : Boolean; pragma Import (Ada, E269, "gtk__label_E");
      E201 : Boolean; pragma Import (Ada, E201, "gtk__notebook_E");
      E273 : Boolean; pragma Import (Ada, E273, "gtk__progress_E");
      E271 : Boolean; pragma Import (Ada, E271, "gtk__progress_bar_E");
      E251 : Boolean; pragma Import (Ada, E251, "gtk__selection_E");
      E249 : Boolean; pragma Import (Ada, E249, "gdk__dnd_E");
      E247 : Boolean; pragma Import (Ada, E247, "gtk__gentry_E");
      E283 : Boolean; pragma Import (Ada, E283, "gtk__toggle_button_E");
      E281 : Boolean; pragma Import (Ada, E281, "gtk__check_button_E");
      E275 : Boolean; pragma Import (Ada, E275, "gtk__radio_button_E");
      E169 : Boolean; pragma Import (Ada, E169, "gtk__window_E");
      E195 : Boolean; pragma Import (Ada, E195, "gtkada__builder_E");
      E204 : Boolean; pragma Import (Ada, E204, "gtkada__handlers_E");
      E237 : Boolean; pragma Import (Ada, E237, "simulator_callbacks_E");

      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Zero_Cost_Exceptions : Integer;
      pragma Import (C, Zero_Cost_Exceptions, "__gl_zero_cost_exceptions");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");
   begin
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False),
         Value => (0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, True, True, True, False, False, False, 
           True, False, True, True, True, False, False, True, 
           False, False, True, True, False, True, True, True, 
           True, True, True, True, True, True, False, True, 
           False, False, True, False, False, True, False, False, 
           False, True, False, False, True, False, True, False, 
           False, False, False, False, False, True, True, True, 
           False, False, True, False, True, True, False, True, 
           True, False, False, False, False, False, False, False, 
           False),
         Count => (0, 0, 0, 0, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Zero_Cost_Exceptions := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      System.Fat_Flt'Elab_Spec;
      E159 := True;
      System.Fat_Lflt'Elab_Spec;
      E125 := True;
      System.Fat_Llf'Elab_Spec;
      E288 := True;
      System.Exception_Table'Elab_Body;
      E023 := True;
      Ada.Containers'Elab_Spec;
      E207 := True;
      Ada.Io_Exceptions'Elab_Spec;
      E070 := True;
      Ada.Strings'Elab_Spec;
      E211 := True;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E054 := True;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Assertions'Elab_Spec;
      E107 := True;
      E074 := True;
      E072 := True;
      Ada.Tags'Elab_Body;
      E006 := True;
      E217 := True;
      System.Soft_Links'Elab_Body;
      E013 := True;
      System.Secondary_Stack'Elab_Body;
      E017 := True;
      System.Finalization_Root'Elab_Spec;
      E063 := True;
      System.Finalization_Implementation'Elab_Spec;
      System.Finalization_Implementation'Elab_Body;
      E065 := True;
      Ada.Finalization'Elab_Spec;
      E061 := True;
      Ada.Strings.Unbounded'Elab_Spec;
      E213 := True;
      Ada.Finalization.List_Controller'Elab_Spec;
      E082 := True;
      System.File_Control_Block'Elab_Spec;
      E080 := True;
      Ada.Streams.Stream_Io'Elab_Spec;
      E233 := True;
      System.Os_Lib'Elab_Body;
      E077 := True;
      System.File_Io'Elab_Body;
      E059 := True;
      System.Strings.Stream_Ops'Elab_Body;
      E231 := True;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E053 := True;
      Glib'Elab_Spec;
      E088 := True;
      Gtkada.Types'Elab_Spec;
      E105 := True;
      E124 := True;
      E127 := True;
      Database'Elab_Spec;
      E084 := True;
      E261 := True;
      E122 := True;
      E253 := True;
      E109 := True;
      Gdk.Visual'Elab_Spec;
      Gdk.Visual'Elab_Body;
      E135 := True;
      E111 := True;
      E239 := True;
      Glib.Object'Elab_Spec;
      E096 := True;
      Glib.Values'Elab_Body;
      E118 := True;
      Gdk.Color'Elab_Spec;
      E173 := True;
      Glib.Generic_Properties'Elab_Spec;
      Glib.Generic_Properties'Elab_Body;
      E116 := True;
      Gtk.Tree_Model'Elab_Spec;
      E103 := True;
      Gtkada.Bindings'Elab_Spec;
      E099 := True;
      E185 := True;
      Glib.Object'Elab_Body;
      E094 := True;
      Gtk.Tree_Model'Elab_Body;
      E203 := True;
      Gdk.Color'Elab_Body;
      E133 := True;
      Gdk.Types'Elab_Spec;
      E114 := True;
      E150 := True;
      Gdk.Event'Elab_Spec;
      Gdk.Display'Elab_Spec;
      E175 := True;
      Gdk.Window'Elab_Spec;
      E120 := True;
      E154 := True;
      E152 := True;
      Glib.Properties'Elab_Spec;
      E158 := True;
      Gtk.Accel_Group'Elab_Spec;
      Gtk.Accel_Group'Elab_Body;
      E181 := True;
      Gtk.Enums'Elab_Spec;
      E137 := True;
      Gtk.Object'Elab_Spec;
      E156 := True;
      Gtk.Adjustment'Elab_Spec;
      Gtk.Adjustment'Elab_Body;
      E193 := True;
      Gtk.Orientable'Elab_Spec;
      E243 := True;
      Pango.Enums'Elab_Spec;
      E144 := True;
      E163 := True;
      Pango.Font'Elab_Spec;
      E142 := True;
      E146 := True;
      E148 := True;
      Pango.Context'Elab_Spec;
      E165 := True;
      E167 := True;
      Pango.Layout'Elab_Spec;
      E161 := True;
      E177 := True;
      E179 := True;
      Gdk.Pixbuf'Elab_Spec;
      E171 := True;
      Gtk.Style'Elab_Spec;
      Gtk.Style'Elab_Body;
      E139 := True;
      Gtk.Settings'Elab_Spec;
      Gtk.Settings'Elab_Body;
      E265 := True;
      Gtk.Widget'Elab_Spec;
      E129 := True;
      Gtk.Action'Elab_Spec;
      Gtk.Action'Elab_Body;
      E277 := True;
      Gtk.Activatable'Elab_Spec;
      E279 := True;
      Gtk.Builder'Elab_Spec;
      E189 := True;
      E187 := True;
      Gtk.Container'Elab_Spec;
      Gtk.Container'Elab_Body;
      E191 := True;
      Gtk.Bin'Elab_Spec;
      Gtk.Bin'Elab_Body;
      E183 := True;
      Gtk.Box'Elab_Spec;
      Gtk.Box'Elab_Body;
      E241 := True;
      Gtk.Button'Elab_Spec;
      Gtk.Button'Elab_Body;
      E285 := True;
      Gtk.Drawing_Area'Elab_Spec;
      Gtk.Drawing_Area'Elab_Body;
      E245 := True;
      Gtk.Editable'Elab_Spec;
      Gtk.Editable'Elab_Body;
      E255 := True;
      Gtk.Entry_Completion'Elab_Spec;
      Gtk.Entry_Completion'Elab_Body;
      E257 := True;
      Gtk.Icon_Factory'Elab_Spec;
      Gtk.Icon_Factory'Elab_Body;
      E263 := True;
      E199 := True;
      Gtk.Misc'Elab_Spec;
      Gtk.Misc'Elab_Body;
      E267 := True;
      Gtk.Image'Elab_Spec;
      Gtk.Image'Elab_Body;
      E259 := True;
      Gtk.Label'Elab_Spec;
      Gtk.Label'Elab_Body;
      E269 := True;
      Gtk.Notebook'Elab_Spec;
      Gtk.Notebook'Elab_Body;
      E201 := True;
      Gtk.Progress'Elab_Spec;
      Gtk.Progress'Elab_Body;
      E273 := True;
      Gtk.Progress_Bar'Elab_Spec;
      Gtk.Progress_Bar'Elab_Body;
      E271 := True;
      Gtk.Selection'Elab_Spec;
      Gtk.Selection'Elab_Body;
      E251 := True;
      E249 := True;
      Gtk.Gentry'Elab_Spec;
      Gtk.Gentry'Elab_Body;
      E247 := True;
      Gtk.Toggle_Button'Elab_Spec;
      Gtk.Toggle_Button'Elab_Body;
      E283 := True;
      Gtk.Check_Button'Elab_Spec;
      Gtk.Check_Button'Elab_Body;
      E281 := True;
      Gtk.Radio_Button'Elab_Spec;
      Gtk.Radio_Button'Elab_Body;
      E275 := True;
      Gtk.Window'Elab_Spec;
      Gtk.Window'Elab_Body;
      E169 := True;
      Gtk.Widget'Elab_Body;
      E131 := True;
      Gtkada.Builder'Elab_Spec;
      Gtkada.Handlers'Elab_Spec;
      E204 := True;
      Gtkada.Builder'Elab_Body;
      E195 := True;
      Simulator_Callbacks'Elab_Body;
      E237 := True;
      E086 := True;
   end adainit;

   procedure adafinal is
   begin
      Do_Finalize;
   end adafinal;

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure initialize (Addr : System.Address);
      pragma Import (C, initialize, "__gnat_initialize");

      procedure finalize;
      pragma Import (C, finalize, "__gnat_finalize");

      procedure Ada_Main_Program;
      pragma Import (Ada, Ada_Main_Program, "_ada_simulator");

      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Break_Start;
      Ada_Main_Program;
      Do_Finalize;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   ./database.o
   --   ./simulator.o
   --   ./simulator_callbacks.o
   --   ./gui.o
   --   -L./
   --   -L/usr/lib/i386-linux-gnu/ada/adalib/gtkada/
   --   -L/usr/lib/gcc/i686-linux-gnu/4.6/adalib/
   --   -shared
   --   -lgnat-4.6
--  END Object file/option list   

end ada_main;
