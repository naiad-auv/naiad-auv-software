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

   Ada_Main_Program_Name : constant String := "_ada_sensor_controller" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#53ff90a6#;
   pragma Export (C, u00001, "sensor_controllerB");
   u00002 : constant Version_32 := 16#3935bd10#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#9e44d182#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#cb4a8015#;
   pragma Export (C, u00004, "interfacesS");
   u00005 : constant Version_32 := 16#38e0fbd3#;
   pragma Export (C, u00005, "pressure_sensorB");
   u00006 : constant Version_32 := 16#2e3a783e#;
   pragma Export (C, u00006, "pressure_sensorS");
   u00007 : constant Version_32 := 16#5e0b101b#;
   pragma Export (C, u00007, "adcB");
   u00008 : constant Version_32 := 16#1c9b322f#;
   pragma Export (C, u00008, "adcS");
   u00009 : constant Version_32 := 16#90249111#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#9f9feadf#;
   pragma Export (C, u00010, "system__machine_codeS");
   u00011 : constant Version_32 := 16#332b9772#;
   pragma Export (C, u00011, "avrS");
   u00012 : constant Version_32 := 16#67e21c7d#;
   pragma Export (C, u00012, "avr__at90can128S");
   u00013 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00013, "system__storage_elementsB");
   u00014 : constant Version_32 := 16#6ae9ec89#;
   pragma Export (C, u00014, "system__storage_elementsS");
   u00015 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00015, "adaS");
   u00016 : constant Version_32 := 16#fac5cd67#;
   pragma Export (C, u00016, "system__unsigned_typesS");
   u00017 : constant Version_32 := 16#28b2c7ed#;
   pragma Export (C, u00017, "salinity_sensorB");
   u00018 : constant Version_32 := 16#02772e38#;
   pragma Export (C, u00018, "salinity_sensorS");
   u00019 : constant Version_32 := 16#c31442ce#;
   pragma Export (C, u00019, "system__val_intB");
   u00020 : constant Version_32 := 16#d881bb2e#;
   pragma Export (C, u00020, "system__val_intS");
   u00021 : constant Version_32 := 16#79817c71#;
   pragma Export (C, u00021, "system__val_unsB");
   u00022 : constant Version_32 := 16#ea6d205c#;
   pragma Export (C, u00022, "system__val_unsS");
   u00023 : constant Version_32 := 16#aea309ed#;
   pragma Export (C, u00023, "system__val_utilB");
   u00024 : constant Version_32 := 16#3c8427ef#;
   pragma Export (C, u00024, "system__val_utilS");
   u00025 : constant Version_32 := 16#e2a1b7ab#;
   pragma Export (C, u00025, "ada__exceptionsB");
   u00026 : constant Version_32 := 16#ac6c9c48#;
   pragma Export (C, u00026, "ada__exceptionsS");
   u00027 : constant Version_32 := 16#16173147#;
   pragma Export (C, u00027, "ada__exceptions__last_chance_handlerB");
   u00028 : constant Version_32 := 16#1f42fb5e#;
   pragma Export (C, u00028, "ada__exceptions__last_chance_handlerS");
   u00029 : constant Version_32 := 16#0071025c#;
   pragma Export (C, u00029, "system__soft_linksB");
   u00030 : constant Version_32 := 16#fd7febcc#;
   pragma Export (C, u00030, "system__soft_linksS");
   u00031 : constant Version_32 := 16#27940d94#;
   pragma Export (C, u00031, "system__parametersB");
   u00032 : constant Version_32 := 16#26c69dd1#;
   pragma Export (C, u00032, "system__parametersS");
   u00033 : constant Version_32 := 16#17775d6d#;
   pragma Export (C, u00033, "system__secondary_stackB");
   u00034 : constant Version_32 := 16#844ab6bf#;
   pragma Export (C, u00034, "system__secondary_stackS");
   u00035 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00035, "system__stack_checkingB");
   u00036 : constant Version_32 := 16#33862d3d#;
   pragma Export (C, u00036, "system__stack_checkingS");
   u00037 : constant Version_32 := 16#7b9f0bae#;
   pragma Export (C, u00037, "system__exception_tableB");
   u00038 : constant Version_32 := 16#014a4db4#;
   pragma Export (C, u00038, "system__exception_tableS");
   u00039 : constant Version_32 := 16#5665ab64#;
   pragma Export (C, u00039, "system__htableB");
   u00040 : constant Version_32 := 16#138cdf1f#;
   pragma Export (C, u00040, "system__htableS");
   u00041 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00041, "system__string_hashB");
   u00042 : constant Version_32 := 16#b6b84985#;
   pragma Export (C, u00042, "system__string_hashS");
   u00043 : constant Version_32 := 16#aad75561#;
   pragma Export (C, u00043, "system__exceptionsB");
   u00044 : constant Version_32 := 16#9cda59a6#;
   pragma Export (C, u00044, "system__exceptionsS");
   u00045 : constant Version_32 := 16#010db1dc#;
   pragma Export (C, u00045, "system__exceptions_debugB");
   u00046 : constant Version_32 := 16#a854b4c5#;
   pragma Export (C, u00046, "system__exceptions_debugS");
   u00047 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00047, "system__img_intB");
   u00048 : constant Version_32 := 16#92ff71d3#;
   pragma Export (C, u00048, "system__img_intS");
   u00049 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00049, "system__tracebackB");
   u00050 : constant Version_32 := 16#f1a34564#;
   pragma Export (C, u00050, "system__tracebackS");
   u00051 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00051, "system__wch_conB");
   u00052 : constant Version_32 := 16#2fcfbf2c#;
   pragma Export (C, u00052, "system__wch_conS");
   u00053 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00053, "system__wch_stwB");
   u00054 : constant Version_32 := 16#02de932d#;
   pragma Export (C, u00054, "system__wch_stwS");
   u00055 : constant Version_32 := 16#617a40f2#;
   pragma Export (C, u00055, "system__wch_cnvB");
   u00056 : constant Version_32 := 16#313139fa#;
   pragma Export (C, u00056, "system__wch_cnvS");
   u00057 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00057, "system__wch_jisB");
   u00058 : constant Version_32 := 16#6543a2ee#;
   pragma Export (C, u00058, "system__wch_jisS");
   u00059 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00059, "system__traceback_entriesB");
   u00060 : constant Version_32 := 16#c2057f50#;
   pragma Export (C, u00060, "system__traceback_entriesS");
   u00061 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00061, "system__case_utilB");
   u00062 : constant Version_32 := 16#3d38f199#;
   pragma Export (C, u00062, "system__case_utilS");
   u00063 : constant Version_32 := 16#992bdfae#;
   pragma Export (C, u00063, "sensor_controller_packB");
   u00064 : constant Version_32 := 16#087c523d#;
   pragma Export (C, u00064, "sensor_controller_packS");
   u00065 : constant Version_32 := 16#afd62b40#;
   pragma Export (C, u00065, "ada__tagsB");
   u00066 : constant Version_32 := 16#39106b41#;
   pragma Export (C, u00066, "ada__tagsS");
   u00067 : constant Version_32 := 16#25c21d28#;
   pragma Export (C, u00067, "system__val_lluB");
   u00068 : constant Version_32 := 16#80379a15#;
   pragma Export (C, u00068, "system__val_lluS");
   u00069 : constant Version_32 := 16#7dbbd31d#;
   pragma Export (C, u00069, "text_ioS");
   u00070 : constant Version_32 := 16#421d3150#;
   pragma Export (C, u00070, "ada__text_ioB");
   u00071 : constant Version_32 := 16#dac0d159#;
   pragma Export (C, u00071, "ada__text_ioS");
   u00072 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00072, "ada__streamsS");
   u00073 : constant Version_32 := 16#e0b7a7e8#;
   pragma Export (C, u00073, "interfaces__c_streamsB");
   u00074 : constant Version_32 := 16#95ad191f#;
   pragma Export (C, u00074, "interfaces__c_streamsS");
   u00075 : constant Version_32 := 16#f90957b0#;
   pragma Export (C, u00075, "system__crtlS");
   u00076 : constant Version_32 := 16#228a5436#;
   pragma Export (C, u00076, "system__file_ioB");
   u00077 : constant Version_32 := 16#0165f036#;
   pragma Export (C, u00077, "system__file_ioS");
   u00078 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00078, "ada__finalizationB");
   u00079 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00079, "ada__finalizationS");
   u00080 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00080, "system__finalization_rootB");
   u00081 : constant Version_32 := 16#dfd6e281#;
   pragma Export (C, u00081, "system__finalization_rootS");
   u00082 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00082, "ada__io_exceptionsS");
   u00083 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00083, "interfaces__cB");
   u00084 : constant Version_32 := 16#29899d4e#;
   pragma Export (C, u00084, "interfaces__cS");
   u00085 : constant Version_32 := 16#9f990c8b#;
   pragma Export (C, u00085, "interfaces__c__stringsB");
   u00086 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00086, "interfaces__c__stringsS");
   u00087 : constant Version_32 := 16#d6bc4ecc#;
   pragma Export (C, u00087, "system__crtl__runtimeS");
   u00088 : constant Version_32 := 16#1eab0e09#;
   pragma Export (C, u00088, "system__img_enum_newB");
   u00089 : constant Version_32 := 16#17235ae1#;
   pragma Export (C, u00089, "system__img_enum_newS");
   u00090 : constant Version_32 := 16#3902baae#;
   pragma Export (C, u00090, "system__os_libB");
   u00091 : constant Version_32 := 16#89dce9aa#;
   pragma Export (C, u00091, "system__os_libS");
   u00092 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00092, "system__stringsB");
   u00093 : constant Version_32 := 16#27cedbd5#;
   pragma Export (C, u00093, "system__stringsS");
   u00094 : constant Version_32 := 16#b7c0fb6f#;
   pragma Export (C, u00094, "system__file_control_blockS");
   u00095 : constant Version_32 := 16#91d2300e#;
   pragma Export (C, u00095, "system__finalization_mastersB");
   u00096 : constant Version_32 := 16#fad13d3d#;
   pragma Export (C, u00096, "system__finalization_mastersS");
   u00097 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00097, "system__address_imageB");
   u00098 : constant Version_32 := 16#31c80c2b#;
   pragma Export (C, u00098, "system__address_imageS");
   u00099 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00099, "system__img_boolB");
   u00100 : constant Version_32 := 16#65fde0fa#;
   pragma Export (C, u00100, "system__img_boolS");
   u00101 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00101, "system__ioB");
   u00102 : constant Version_32 := 16#0e66665e#;
   pragma Export (C, u00102, "system__ioS");
   u00103 : constant Version_32 := 16#a7a37cb6#;
   pragma Export (C, u00103, "system__storage_poolsB");
   u00104 : constant Version_32 := 16#438a8e7c#;
   pragma Export (C, u00104, "system__storage_poolsS");
   u00105 : constant Version_32 := 16#ba5d60c7#;
   pragma Export (C, u00105, "system__pool_globalB");
   u00106 : constant Version_32 := 16#d56df0a6#;
   pragma Export (C, u00106, "system__pool_globalS");
   u00107 : constant Version_32 := 16#fc605663#;
   pragma Export (C, u00107, "system__memoryB");
   u00108 : constant Version_32 := 16#5aaf2d04#;
   pragma Export (C, u00108, "system__memoryS");
   u00109 : constant Version_32 := 16#1fd820b1#;
   pragma Export (C, u00109, "system__storage_pools__subpoolsB");
   u00110 : constant Version_32 := 16#951e0de9#;
   pragma Export (C, u00110, "system__storage_pools__subpoolsS");
   u00111 : constant Version_32 := 16#1777d351#;
   pragma Export (C, u00111, "system__storage_pools__subpools__finalizationB");
   u00112 : constant Version_32 := 16#12aaf1de#;
   pragma Export (C, u00112, "system__storage_pools__subpools__finalizationS");
   u00113 : constant Version_32 := 16#babc5fff#;
   pragma Export (C, u00113, "avr__at90can128__canB");
   u00114 : constant Version_32 := 16#499a3916#;
   pragma Export (C, u00114, "avr__at90can128__canS");
   u00115 : constant Version_32 := 16#176ef4cd#;
   pragma Export (C, u00115, "temp_sensorB");
   u00116 : constant Version_32 := 16#9f062e47#;
   pragma Export (C, u00116, "temp_sensorS");
   u00117 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00117, "ada__float_text_ioB");
   u00118 : constant Version_32 := 16#e61b3c6c#;
   pragma Export (C, u00118, "ada__float_text_ioS");
   u00119 : constant Version_32 := 16#d5f9759f#;
   pragma Export (C, u00119, "ada__text_io__float_auxB");
   u00120 : constant Version_32 := 16#f854caf5#;
   pragma Export (C, u00120, "ada__text_io__float_auxS");
   u00121 : constant Version_32 := 16#cd6ba629#;
   pragma Export (C, u00121, "ada__text_io__generic_auxB");
   u00122 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00122, "ada__text_io__generic_auxS");
   u00123 : constant Version_32 := 16#6d0081c3#;
   pragma Export (C, u00123, "system__img_realB");
   u00124 : constant Version_32 := 16#578cc0f3#;
   pragma Export (C, u00124, "system__img_realS");
   u00125 : constant Version_32 := 16#4f1f4f21#;
   pragma Export (C, u00125, "system__fat_llfS");
   u00126 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00126, "system__float_controlB");
   u00127 : constant Version_32 := 16#70d8d22d#;
   pragma Export (C, u00127, "system__float_controlS");
   u00128 : constant Version_32 := 16#06417083#;
   pragma Export (C, u00128, "system__img_lluB");
   u00129 : constant Version_32 := 16#b30ccda4#;
   pragma Export (C, u00129, "system__img_lluS");
   u00130 : constant Version_32 := 16#194ccd7b#;
   pragma Export (C, u00130, "system__img_unsB");
   u00131 : constant Version_32 := 16#6531f190#;
   pragma Export (C, u00131, "system__img_unsS");
   u00132 : constant Version_32 := 16#c054f766#;
   pragma Export (C, u00132, "system__powten_tableS");
   u00133 : constant Version_32 := 16#8ff77155#;
   pragma Export (C, u00133, "system__val_realB");
   u00134 : constant Version_32 := 16#6e0de600#;
   pragma Export (C, u00134, "system__val_realS");
   u00135 : constant Version_32 := 16#0be1b996#;
   pragma Export (C, u00135, "system__exn_llfB");
   u00136 : constant Version_32 := 16#11a08ffe#;
   pragma Export (C, u00136, "system__exn_llfS");
   u00137 : constant Version_32 := 16#13fde8c6#;
   pragma Export (C, u00137, "system__fat_fltS");
   u00138 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00138, "ada__stringsS");
   u00139 : constant Version_32 := 16#914b496f#;
   pragma Export (C, u00139, "ada__strings__fixedB");
   u00140 : constant Version_32 := 16#dc686502#;
   pragma Export (C, u00140, "ada__strings__fixedS");
   u00141 : constant Version_32 := 16#96e9c1e7#;
   pragma Export (C, u00141, "ada__strings__mapsB");
   u00142 : constant Version_32 := 16#24318e4c#;
   pragma Export (C, u00142, "ada__strings__mapsS");
   u00143 : constant Version_32 := 16#1856bbe2#;
   pragma Export (C, u00143, "system__bit_opsB");
   u00144 : constant Version_32 := 16#c30e4013#;
   pragma Export (C, u00144, "system__bit_opsS");
   u00145 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00145, "ada__charactersS");
   u00146 : constant Version_32 := 16#051b1b7b#;
   pragma Export (C, u00146, "ada__characters__latin_1S");
   u00147 : constant Version_32 := 16#7b7cedaa#;
   pragma Export (C, u00147, "ada__strings__searchB");
   u00148 : constant Version_32 := 16#b5a8c1d6#;
   pragma Export (C, u00148, "ada__strings__searchS");
   u00149 : constant Version_32 := 16#6fc82885#;
   pragma Export (C, u00149, "avr__at90can128__calendarB");
   u00150 : constant Version_32 := 16#10309d59#;
   pragma Export (C, u00150, "avr__at90can128__calendarS");
   u00151 : constant Version_32 := 16#aad5bb72#;
   pragma Export (C, u00151, "digital_ioB");
   u00152 : constant Version_32 := 16#7d0ea0e8#;
   pragma Export (C, u00152, "digital_ioS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_real%s
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
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
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
   --  system.val_int%s
   --  system.val_llu%s
   --  system.val_real%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_real%b
   --  system.val_llu%b
   --  system.val_int%b
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
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.fixed%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.crtl.runtime%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.fixed%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.float_aux%s
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%b
   --  text_io%s
   --  avr%s
   --  avr.at90can128%s
   --  adc%s
   --  adc%b
   --  avr.at90can128.calendar%s
   --  avr.at90can128.calendar%b
   --  avr.at90can128.can%s
   --  avr.at90can128.can%b
   --  digital_io%s
   --  digital_io%b
   --  pressure_sensor%s
   --  pressure_sensor%b
   --  salinity_sensor%s
   --  salinity_sensor%b
   --  temp_sensor%s
   --  temp_sensor%b
   --  sensor_controller_pack%s
   --  sensor_controller_pack%b
   --  sensor_controller%b
   --  END ELABORATION ORDER


end ada_main;
