pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~imu_testing_main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~imu_testing_main.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E083 : Short_Integer; pragma Import (Ada, E083, "system__os_lib_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__fat_llf_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ada__io_exceptions_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__tags_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__streams_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "interfaces__c_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c__strings_E");
   E031 : Short_Integer; pragma Import (Ada, E031, "system__exceptions_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__finalization_root_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "ada__finalization_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__storage_pools_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__finalization_masters_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "system__storage_pools__subpools_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "system__pool_global_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "system__file_control_block_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "system__file_io_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "gnat__serial_communications_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__secondary_stack_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__text_io_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ins_controller_utils_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "str2float_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "uartwrapper_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E114 := E114 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "uartwrapper__finalize_spec");
      begin
         F1;
      end;
      E056 := E056 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      E117 := E117 - 1;
      E088 := E088 - 1;
      E102 := E102 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__file_io__finalize_body");
      begin
         E071 := E071 - 1;
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "gnat__serial_communications__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__file_control_block__finalize_spec");
      begin
         E086 := E086 - 1;
         F5;
      end;
      E098 := E098 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__pool_global__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__storage_pools__subpools__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__finalization_masters__finalize_spec");
      begin
         F8;
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
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Fat_Llf'Elab_Spec;
      E130 := E130 + 1;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E076 := E076 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E057 := E057 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E031 := E031 + 1;
      System.Finalization_Root'Elab_Spec;
      E075 := E075 + 1;
      Ada.Finalization'Elab_Spec;
      E073 := E073 + 1;
      System.Storage_Pools'Elab_Spec;
      E096 := E096 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E098 := E098 + 1;
      System.File_Control_Block'Elab_Spec;
      E086 := E086 + 1;
      Gnat.Serial_Communications'Elab_Spec;
      System.File_Io'Elab_Body;
      E071 := E071 + 1;
      E102 := E102 + 1;
      System.Finalization_Masters'Elab_Body;
      E088 := E088 + 1;
      E078 := E078 + 1;
      E050 := E050 + 1;
      Ada.Tags'Elab_Body;
      E059 := E059 + 1;
      System.Soft_Links'Elab_Body;
      E015 := E015 + 1;
      System.Os_Lib'Elab_Body;
      E083 := E083 + 1;
      System.Secondary_Stack'Elab_Body;
      E019 := E019 + 1;
      E117 := E117 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E056 := E056 + 1;
      E123 := E123 + 1;
      Uartwrapper'Elab_Spec;
      E114 := E114 + 1;
      E106 := E106 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_imu_testing_main");

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
   --   /home/nils/robotic_project/git/naiad-auv-software/src/lib/str2float/build/str2float.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/software/imu_testing/build/imu_testing_main.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/firmware/UartWrapper/obj/uartwrapper.o
   --   /home/nils/robotic_project/git/naiad-auv-software/src/software/imu_testing/build/ins_controller_utils.o
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/software/imu_testing/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/software/imu_testing/build/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/firmware/UartWrapper/obj/
   --   -L/home/nils/robotic_project/git/naiad-auv-software/src/lib/str2float/build/
   --   -L/usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
