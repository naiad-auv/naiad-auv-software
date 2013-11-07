pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2013 (20130314)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_bbb_can_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#2a673f1e#;
   pragma Export (C, u00001, "bbb_can_mainB");
   u00002 : constant Version_32 := 16#3935bd10#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#9e44d182#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#ead315d2#;
   pragma Export (C, u00004, "bbb_canB");
   u00005 : constant Version_32 := 16#f7b2f6ea#;
   pragma Export (C, u00005, "bbb_canS");
   u00006 : constant Version_32 := 16#afd62b40#;
   pragma Export (C, u00006, "ada__tagsB");
   u00007 : constant Version_32 := 16#39106b41#;
   pragma Export (C, u00007, "ada__tagsS");
   u00008 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00008, "adaS");
   u00009 : constant Version_32 := 16#e2a1b7ab#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#ac6c9c48#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#16173147#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#1f42fb5e#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#90249111#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#0071025c#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#fd7febcc#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#27940d94#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#26c69dd1#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#17775d6d#;
   pragma Export (C, u00018, "system__secondary_stackB");
   u00019 : constant Version_32 := 16#844ab6bf#;
   pragma Export (C, u00019, "system__secondary_stackS");
   u00020 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#6ae9ec89#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#33862d3d#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#7b9f0bae#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#014a4db4#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#5665ab64#;
   pragma Export (C, u00026, "system__htableB");
   u00027 : constant Version_32 := 16#138cdf1f#;
   pragma Export (C, u00027, "system__htableS");
   u00028 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00028, "system__string_hashB");
   u00029 : constant Version_32 := 16#b6b84985#;
   pragma Export (C, u00029, "system__string_hashS");
   u00030 : constant Version_32 := 16#aad75561#;
   pragma Export (C, u00030, "system__exceptionsB");
   u00031 : constant Version_32 := 16#9cda59a6#;
   pragma Export (C, u00031, "system__exceptionsS");
   u00032 : constant Version_32 := 16#010db1dc#;
   pragma Export (C, u00032, "system__exceptions_debugB");
   u00033 : constant Version_32 := 16#a854b4c5#;
   pragma Export (C, u00033, "system__exceptions_debugS");
   u00034 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00034, "system__img_intB");
   u00035 : constant Version_32 := 16#92ff71d3#;
   pragma Export (C, u00035, "system__img_intS");
   u00036 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00036, "system__tracebackB");
   u00037 : constant Version_32 := 16#f1a34564#;
   pragma Export (C, u00037, "system__tracebackS");
   u00038 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00038, "system__wch_conB");
   u00039 : constant Version_32 := 16#2fcfbf2c#;
   pragma Export (C, u00039, "system__wch_conS");
   u00040 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00040, "system__wch_stwB");
   u00041 : constant Version_32 := 16#02de932d#;
   pragma Export (C, u00041, "system__wch_stwS");
   u00042 : constant Version_32 := 16#617a40f2#;
   pragma Export (C, u00042, "system__wch_cnvB");
   u00043 : constant Version_32 := 16#313139fa#;
   pragma Export (C, u00043, "system__wch_cnvS");
   u00044 : constant Version_32 := 16#cb4a8015#;
   pragma Export (C, u00044, "interfacesS");
   u00045 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00045, "system__wch_jisB");
   u00046 : constant Version_32 := 16#6543a2ee#;
   pragma Export (C, u00046, "system__wch_jisS");
   u00047 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00047, "system__traceback_entriesB");
   u00048 : constant Version_32 := 16#c2057f50#;
   pragma Export (C, u00048, "system__traceback_entriesS");
   u00049 : constant Version_32 := 16#fac5cd67#;
   pragma Export (C, u00049, "system__unsigned_typesS");
   u00050 : constant Version_32 := 16#25c21d28#;
   pragma Export (C, u00050, "system__val_lluB");
   u00051 : constant Version_32 := 16#80379a15#;
   pragma Export (C, u00051, "system__val_lluS");
   u00052 : constant Version_32 := 16#aea309ed#;
   pragma Export (C, u00052, "system__val_utilB");
   u00053 : constant Version_32 := 16#3c8427ef#;
   pragma Export (C, u00053, "system__val_utilS");
   u00054 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00054, "system__case_utilB");
   u00055 : constant Version_32 := 16#3d38f199#;
   pragma Export (C, u00055, "system__case_utilS");
   u00056 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00056, "gnatS");
   u00057 : constant Version_32 := 16#eb9778d0#;
   pragma Export (C, u00057, "gnat__serial_communicationsB");
   u00058 : constant Version_32 := 16#066119d0#;
   pragma Export (C, u00058, "gnat__serial_communicationsS");
   u00059 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00059, "ada__streamsS");
   u00060 : constant Version_32 := 16#3ff16a6d#;
   pragma Export (C, u00060, "gnat__os_libS");
   u00061 : constant Version_32 := 16#3902baae#;
   pragma Export (C, u00061, "system__os_libB");
   u00062 : constant Version_32 := 16#89dce9aa#;
   pragma Export (C, u00062, "system__os_libS");
   u00063 : constant Version_32 := 16#f90957b0#;
   pragma Export (C, u00063, "system__crtlS");
   u00064 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00064, "system__stringsB");
   u00065 : constant Version_32 := 16#27cedbd5#;
   pragma Export (C, u00065, "system__stringsS");
   u00066 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00066, "system__communicationB");
   u00067 : constant Version_32 := 16#650fb457#;
   pragma Export (C, u00067, "system__communicationS");
   u00068 : constant Version_32 := 16#60238118#;
   pragma Export (C, u00068, "system__os_constantsS");
   u00069 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00069, "interfaces__cB");
   u00070 : constant Version_32 := 16#29899d4e#;
   pragma Export (C, u00070, "interfaces__cS");
   u00071 : constant Version_32 := 16#a7a37cb6#;
   pragma Export (C, u00071, "system__storage_poolsB");
   u00072 : constant Version_32 := 16#438a8e7c#;
   pragma Export (C, u00072, "system__storage_poolsS");
   u00073 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00073, "ada__finalizationB");
   u00074 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00074, "ada__finalizationS");
   u00075 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00075, "system__finalization_rootB");
   u00076 : constant Version_32 := 16#dfd6e281#;
   pragma Export (C, u00076, "system__finalization_rootS");
   u00077 : constant Version_32 := 16#1fd820b1#;
   pragma Export (C, u00077, "system__storage_pools__subpoolsB");
   u00078 : constant Version_32 := 16#951e0de9#;
   pragma Export (C, u00078, "system__storage_pools__subpoolsS");
   u00079 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00079, "system__address_imageB");
   u00080 : constant Version_32 := 16#31c80c2b#;
   pragma Export (C, u00080, "system__address_imageS");
   u00081 : constant Version_32 := 16#91d2300e#;
   pragma Export (C, u00081, "system__finalization_mastersB");
   u00082 : constant Version_32 := 16#fad13d3d#;
   pragma Export (C, u00082, "system__finalization_mastersS");
   u00083 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00083, "system__img_boolB");
   u00084 : constant Version_32 := 16#65fde0fa#;
   pragma Export (C, u00084, "system__img_boolS");
   u00085 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00085, "system__ioB");
   u00086 : constant Version_32 := 16#0e66665e#;
   pragma Export (C, u00086, "system__ioS");
   u00087 : constant Version_32 := 16#1777d351#;
   pragma Export (C, u00087, "system__storage_pools__subpools__finalizationB");
   u00088 : constant Version_32 := 16#12aaf1de#;
   pragma Export (C, u00088, "system__storage_pools__subpools__finalizationS");
   u00089 : constant Version_32 := 16#ba5d60c7#;
   pragma Export (C, u00089, "system__pool_globalB");
   u00090 : constant Version_32 := 16#d56df0a6#;
   pragma Export (C, u00090, "system__pool_globalS");
   u00091 : constant Version_32 := 16#fc605663#;
   pragma Export (C, u00091, "system__memoryB");
   u00092 : constant Version_32 := 16#5aaf2d04#;
   pragma Export (C, u00092, "system__memoryS");
   u00093 : constant Version_32 := 16#6e92cb91#;
   pragma Export (C, u00093, "uartwrapperB");
   u00094 : constant Version_32 := 16#74930088#;
   pragma Export (C, u00094, "uartwrapperS");
   u00095 : constant Version_32 := 16#45724809#;
   pragma Export (C, u00095, "ada__calendar__delaysB");
   u00096 : constant Version_32 := 16#474dd4b1#;
   pragma Export (C, u00096, "ada__calendar__delaysS");
   u00097 : constant Version_32 := 16#8ba0787e#;
   pragma Export (C, u00097, "ada__calendarB");
   u00098 : constant Version_32 := 16#e791e294#;
   pragma Export (C, u00098, "ada__calendarS");
   u00099 : constant Version_32 := 16#22d03640#;
   pragma Export (C, u00099, "system__os_primitivesB");
   u00100 : constant Version_32 := 16#20f51d38#;
   pragma Export (C, u00100, "system__os_primitivesS");
   u00101 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00101, "system__tracesB");
   u00102 : constant Version_32 := 16#6239f9bb#;
   pragma Export (C, u00102, "system__tracesS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  gnat.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  system.communication%s
   --  system.communication%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.os_constants%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  gnat.serial_communications%s
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  gnat.serial_communications%b
   --  system.address_image%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  bbb_can%s
   --  bbb_can_main%b
   --  uartwrapper%s
   --  uartwrapper%b
   --  bbb_can%b
   --  END ELABORATION ORDER


end ada_main;
