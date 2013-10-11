pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sensor_controller.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sensor_controller.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E091 : Short_Integer; pragma Import (Ada, E091, "system__os_lib_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "system__soft_links_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__fat_flt_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "system__fat_llf_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "system__exception_table_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "ada__io_exceptions_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ada__strings_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ada__strings__maps_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__tags_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "ada__streams_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "interfaces__c_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "interfaces__c__strings_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "system__exceptions_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "system__finalization_root_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "ada__finalization_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "system__storage_pools_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__finalization_masters_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "system__storage_pools__subpools_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "system__pool_global_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "system__file_control_block_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__file_io_E");
   E034 : Short_Integer; pragma Import (Ada, E034, "system__secondary_stack_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "ada__text_io_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "avr__at90can128_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "adc_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "avr__at90can128__calendar_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "avr__at90can128__can_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "digital_io_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "pressure_sensor_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "salinity_sensor_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "temp_sensor_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "sensor_controller_pack_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E071 := E071 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__text_io__finalize_spec");
      begin
         F1;
      end;
      E096 := E096 - 1;
      E110 := E110 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__file_io__finalize_body");
      begin
         E077 := E077 - 1;
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__file_control_block__finalize_spec");
      begin
         E094 := E094 - 1;
         F3;
      end;
      E106 := E106 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__pool_global__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__storage_pools__subpools__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__finalization_masters__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
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

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Fat_Flt'Elab_Spec;
      E137 := E137 + 1;
      System.Fat_Llf'Elab_Spec;
      E125 := E125 + 1;
      System.Exception_Table'Elab_Body;
      E038 := E038 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E082 := E082 + 1;
      Ada.Strings'Elab_Spec;
      E138 := E138 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E072 := E072 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E044 := E044 + 1;
      System.Finalization_Root'Elab_Spec;
      E081 := E081 + 1;
      Ada.Finalization'Elab_Spec;
      E079 := E079 + 1;
      System.Storage_Pools'Elab_Spec;
      E104 := E104 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Pool_Global'Elab_Spec;
      E106 := E106 + 1;
      System.File_Control_Block'Elab_Spec;
      E094 := E094 + 1;
      System.File_Io'Elab_Body;
      E077 := E077 + 1;
      E110 := E110 + 1;
      System.Finalization_Masters'Elab_Body;
      E096 := E096 + 1;
      E086 := E086 + 1;
      E084 := E084 + 1;
      Ada.Tags'Elab_Body;
      E066 := E066 + 1;
      E142 := E142 + 1;
      System.Soft_Links'Elab_Body;
      E030 := E030 + 1;
      System.Os_Lib'Elab_Body;
      E091 := E091 + 1;
      System.Secondary_Stack'Elab_Body;
      E034 := E034 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E071 := E071 + 1;
      AVR.AT90CAN128'ELAB_SPEC;
      E012 := E012 + 1;
      ADC'ELAB_SPEC;
      ADC'ELAB_BODY;
      E008 := E008 + 1;
      AVR.AT90CAN128.CALENDAR'ELAB_BODY;
      E150 := E150 + 1;
      E114 := E114 + 1;
      E152 := E152 + 1;
      E006 := E006 + 1;
      E018 := E018 + 1;
      E116 := E116 + 1;
      E064 := E064 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sensor_controller");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/avr.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/avr-at90can128.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/adc.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/avr-at90can128-calendar.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/avr-at90can128-can.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/digital_io.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/pressure_sensor.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/salinity_sensor.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/temp_sensor.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/sensor_controller_pack.o
   --   /home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/sensor_controller.o
   --   -L/home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-electronics/src/Template2/sensor_controller3/build/
   --   -L/usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
