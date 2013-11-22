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
                    "GNAT Version: 4.6" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure Break_Start;
   pragma Import (C, Break_Start, "__gnat_break_start");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#2a43c73e#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#ba46b2cd#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#10d589fc#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#336c89ce#;
   pragma Export (C, u00005, "ada__directoriesB");
   u00006 : constant Version_32 := 16#067aca50#;
   pragma Export (C, u00006, "ada__directoriesS");
   u00007 : constant Version_32 := 16#0f244912#;
   pragma Export (C, u00007, "ada__calendarB");
   u00008 : constant Version_32 := 16#0bc00dc5#;
   pragma Export (C, u00008, "ada__calendarS");
   u00009 : constant Version_32 := 16#9cd289cc#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#ed247096#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#95643e9a#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#03cf4fc2#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#2d1a1afa#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#30ec78bc#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#ec1008f3#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#0d2b82ae#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#b1479900#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#72905399#;
   pragma Export (C, u00018, "system__secondary_stackB");
   u00019 : constant Version_32 := 16#39743d54#;
   pragma Export (C, u00019, "system__secondary_stackS");
   u00020 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#d7d76762#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#8eb8a6d6#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#a7343537#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#8fdb15ca#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ff3fa16b#;
   pragma Export (C, u00026, "system__htableB");
   u00027 : constant Version_32 := 16#c2c5b625#;
   pragma Export (C, u00027, "system__htableS");
   u00028 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00028, "system__string_hashB");
   u00029 : constant Version_32 := 16#0b86c26e#;
   pragma Export (C, u00029, "system__string_hashS");
   u00030 : constant Version_32 := 16#6a8a6a74#;
   pragma Export (C, u00030, "system__exceptionsB");
   u00031 : constant Version_32 := 16#880bf0fb#;
   pragma Export (C, u00031, "system__exceptionsS");
   u00032 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#2fc1fa38#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#4c9dce8f#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#47fb468c#;
   pragma Export (C, u00036, "system__unsigned_typesS");
   u00037 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00037, "system__wch_conB");
   u00038 : constant Version_32 := 16#92f134c7#;
   pragma Export (C, u00038, "system__wch_conS");
   u00039 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00039, "system__wch_stwB");
   u00040 : constant Version_32 := 16#bfe018c6#;
   pragma Export (C, u00040, "system__wch_stwS");
   u00041 : constant Version_32 := 16#5d4d477e#;
   pragma Export (C, u00041, "system__wch_cnvB");
   u00042 : constant Version_32 := 16#8c0fb211#;
   pragma Export (C, u00042, "system__wch_cnvS");
   u00043 : constant Version_32 := 16#f77d8799#;
   pragma Export (C, u00043, "interfacesS");
   u00044 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00044, "system__wch_jisB");
   u00045 : constant Version_32 := 16#d87d2905#;
   pragma Export (C, u00045, "system__wch_jisS");
   u00046 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00046, "system__traceback_entriesB");
   u00047 : constant Version_32 := 16#7f3bf4bb#;
   pragma Export (C, u00047, "system__traceback_entriesS");
   u00048 : constant Version_32 := 16#22d03640#;
   pragma Export (C, u00048, "system__os_primitivesB");
   u00049 : constant Version_32 := 16#9dcb96d3#;
   pragma Export (C, u00049, "system__os_primitivesS");
   u00050 : constant Version_32 := 16#82106b28#;
   pragma Export (C, u00050, "ada__calendar__formattingB");
   u00051 : constant Version_32 := 16#7ece677a#;
   pragma Export (C, u00051, "ada__calendar__formattingS");
   u00052 : constant Version_32 := 16#e3cca715#;
   pragma Export (C, u00052, "ada__calendar__time_zonesB");
   u00053 : constant Version_32 := 16#74a1fd86#;
   pragma Export (C, u00053, "ada__calendar__time_zonesS");
   u00054 : constant Version_32 := 16#7993dbbd#;
   pragma Export (C, u00054, "system__val_intB");
   u00055 : constant Version_32 := 16#65bf30c5#;
   pragma Export (C, u00055, "system__val_intS");
   u00056 : constant Version_32 := 16#e6965fe6#;
   pragma Export (C, u00056, "system__val_unsB");
   u00057 : constant Version_32 := 16#5753abb7#;
   pragma Export (C, u00057, "system__val_unsS");
   u00058 : constant Version_32 := 16#46a1f7a9#;
   pragma Export (C, u00058, "system__val_utilB");
   u00059 : constant Version_32 := 16#26b78fe5#;
   pragma Export (C, u00059, "system__val_utilS");
   u00060 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00060, "system__case_utilB");
   u00061 : constant Version_32 := 16#80067a72#;
   pragma Export (C, u00061, "system__case_utilS");
   u00062 : constant Version_32 := 16#90617b06#;
   pragma Export (C, u00062, "system__val_realB");
   u00063 : constant Version_32 := 16#d3336deb#;
   pragma Export (C, u00063, "system__val_realS");
   u00064 : constant Version_32 := 16#0be1b996#;
   pragma Export (C, u00064, "system__exn_llfB");
   u00065 : constant Version_32 := 16#ac9e0415#;
   pragma Export (C, u00065, "system__exn_llfS");
   u00066 : constant Version_32 := 16#7d6a7c8d#;
   pragma Export (C, u00066, "system__powten_tableS");
   u00067 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00067, "ada__charactersS");
   u00068 : constant Version_32 := 16#833355f1#;
   pragma Export (C, u00068, "ada__characters__handlingB");
   u00069 : constant Version_32 := 16#3006d996#;
   pragma Export (C, u00069, "ada__characters__handlingS");
   u00070 : constant Version_32 := 16#051b1b7b#;
   pragma Export (C, u00070, "ada__characters__latin_1S");
   u00071 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00071, "ada__stringsS");
   u00072 : constant Version_32 := 16#96e9c1e7#;
   pragma Export (C, u00072, "ada__strings__mapsB");
   u00073 : constant Version_32 := 16#24318e4c#;
   pragma Export (C, u00073, "ada__strings__mapsS");
   u00074 : constant Version_32 := 16#b9e58495#;
   pragma Export (C, u00074, "system__bit_opsB");
   u00075 : constant Version_32 := 16#c30e4013#;
   pragma Export (C, u00075, "system__bit_opsS");
   u00076 : constant Version_32 := 16#7a69aa90#;
   pragma Export (C, u00076, "ada__strings__maps__constantsS");
   u00077 : constant Version_32 := 16#e559f18d#;
   pragma Export (C, u00077, "ada__directories__validityB");
   u00078 : constant Version_32 := 16#a2334639#;
   pragma Export (C, u00078, "ada__directories__validityS");
   u00079 : constant Version_32 := 16#b90c86f6#;
   pragma Export (C, u00079, "ada__finalization__list_controllerB");
   u00080 : constant Version_32 := 16#b97dfd74#;
   pragma Export (C, u00080, "ada__finalization__list_controllerS");
   u00081 : constant Version_32 := 16#7cc77cc0#;
   pragma Export (C, u00081, "ada__finalizationB");
   u00082 : constant Version_32 := 16#01acb175#;
   pragma Export (C, u00082, "ada__finalizationS");
   u00083 : constant Version_32 := 16#01cb6d81#;
   pragma Export (C, u00083, "system__finalization_rootB");
   u00084 : constant Version_32 := 16#23ed1b02#;
   pragma Export (C, u00084, "system__finalization_rootS");
   u00085 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00085, "ada__streamsS");
   u00086 : constant Version_32 := 16#07116dec#;
   pragma Export (C, u00086, "ada__tagsB");
   u00087 : constant Version_32 := 16#2f42ba32#;
   pragma Export (C, u00087, "ada__tagsS");
   u00088 : constant Version_32 := 16#dbb36d26#;
   pragma Export (C, u00088, "system__finalization_implementationB");
   u00089 : constant Version_32 := 16#b301b745#;
   pragma Export (C, u00089, "system__finalization_implementationS");
   u00090 : constant Version_32 := 16#386436bc#;
   pragma Export (C, u00090, "system__restrictionsB");
   u00091 : constant Version_32 := 16#d5f873b7#;
   pragma Export (C, u00091, "system__restrictionsS");
   u00092 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00092, "system__stream_attributesB");
   u00093 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00093, "system__stream_attributesS");
   u00094 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00094, "ada__io_exceptionsS");
   u00095 : constant Version_32 := 16#914b496f#;
   pragma Export (C, u00095, "ada__strings__fixedB");
   u00096 : constant Version_32 := 16#dc686502#;
   pragma Export (C, u00096, "ada__strings__fixedS");
   u00097 : constant Version_32 := 16#c6426641#;
   pragma Export (C, u00097, "ada__strings__searchB");
   u00098 : constant Version_32 := 16#b5a8c1d6#;
   pragma Export (C, u00098, "ada__strings__searchS");
   u00099 : constant Version_32 := 16#0e71a6bb#;
   pragma Export (C, u00099, "ada__strings__unboundedB");
   u00100 : constant Version_32 := 16#17719459#;
   pragma Export (C, u00100, "ada__strings__unboundedS");
   u00101 : constant Version_32 := 16#c4857ee1#;
   pragma Export (C, u00101, "system__compare_array_unsigned_8B");
   u00102 : constant Version_32 := 16#f721ec37#;
   pragma Export (C, u00102, "system__compare_array_unsigned_8S");
   u00103 : constant Version_32 := 16#9d3d925a#;
   pragma Export (C, u00103, "system__address_operationsB");
   u00104 : constant Version_32 := 16#ed64f36d#;
   pragma Export (C, u00104, "system__address_operationsS");
   u00105 : constant Version_32 := 16#1d302859#;
   pragma Export (C, u00105, "system__crtlS");
   u00106 : constant Version_32 := 16#5efa797c#;
   pragma Export (C, u00106, "system__file_ioB");
   u00107 : constant Version_32 := 16#206d1d17#;
   pragma Export (C, u00107, "system__file_ioS");
   u00108 : constant Version_32 := 16#a2230cb9#;
   pragma Export (C, u00108, "interfaces__cB");
   u00109 : constant Version_32 := 16#ebbc3ca7#;
   pragma Export (C, u00109, "interfaces__cS");
   u00110 : constant Version_32 := 16#7afa2756#;
   pragma Export (C, u00110, "interfaces__c__stringsB");
   u00111 : constant Version_32 := 16#739e0600#;
   pragma Export (C, u00111, "interfaces__c__stringsS");
   u00112 : constant Version_32 := 16#7a48d8b1#;
   pragma Export (C, u00112, "interfaces__c_streamsB");
   u00113 : constant Version_32 := 16#40dd1af2#;
   pragma Export (C, u00113, "interfaces__c_streamsS");
   u00114 : constant Version_32 := 16#621b06ef#;
   pragma Export (C, u00114, "system__crtl__runtimeS");
   u00115 : constant Version_32 := 16#f9b9cd19#;
   pragma Export (C, u00115, "system__os_libB");
   u00116 : constant Version_32 := 16#a6d80a38#;
   pragma Export (C, u00116, "system__os_libS");
   u00117 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00117, "system__stringsB");
   u00118 : constant Version_32 := 16#9af0503e#;
   pragma Export (C, u00118, "system__stringsS");
   u00119 : constant Version_32 := 16#f225f4c0#;
   pragma Export (C, u00119, "system__file_control_blockS");
   u00120 : constant Version_32 := 16#e7698cad#;
   pragma Export (C, u00120, "system__regexpB");
   u00121 : constant Version_32 := 16#548f62f9#;
   pragma Export (C, u00121, "system__regexpS");
   u00122 : constant Version_32 := 16#7a8f4ce5#;
   pragma Export (C, u00122, "ada__text_ioB");
   u00123 : constant Version_32 := 16#7662da97#;
   pragma Export (C, u00123, "ada__text_ioS");
   u00124 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00124, "gnatS");
   u00125 : constant Version_32 := 16#9630e485#;
   pragma Export (C, u00125, "gnat__serial_communicationsB");
   u00126 : constant Version_32 := 16#9e9a9c43#;
   pragma Export (C, u00126, "gnat__serial_communicationsS");
   u00127 : constant Version_32 := 16#10f589ff#;
   pragma Export (C, u00127, "gnat__os_libS");
   u00128 : constant Version_32 := 16#595ba38f#;
   pragma Export (C, u00128, "system__communicationB");
   u00129 : constant Version_32 := 16#af34b4d0#;
   pragma Export (C, u00129, "system__communicationS");
   u00130 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00130, "system__concat_2B");
   u00131 : constant Version_32 := 16#d6cae806#;
   pragma Export (C, u00131, "system__concat_2S");
   u00132 : constant Version_32 := 16#9694aed4#;
   pragma Export (C, u00132, "uartwrapperB");
   u00133 : constant Version_32 := 16#90f3f4dd#;
   pragma Export (C, u00133, "uartwrapperS");
   u00134 : constant Version_32 := 16#0936cab5#;
   pragma Export (C, u00134, "system__memoryB");
   u00135 : constant Version_32 := 16#e791a6ef#;
   pragma Export (C, u00135, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.htable%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.val_int%s
   --  system.val_real%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_real%b
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
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.fixed%s
   --  ada.strings.maps.constants%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.crtl.runtime%s
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.time_zones%s
   --  ada.calendar.time_zones%b
   --  ada.calendar.formatting%s
   --  system.communication%s
   --  system.communication%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.fixed%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  ada.calendar.formatting%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.finalization_implementation%s
   --  system.finalization_implementation%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  ada.directories%s
   --  ada.directories.validity%s
   --  ada.directories.validity%b
   --  ada.finalization.list_controller%s
   --  ada.finalization.list_controller%b
   --  gnat.serial_communications%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.file_io%b
   --  gnat.os_lib%s
   --  gnat.serial_communications%b
   --  system.regexp%s
   --  system.regexp%b
   --  ada.directories%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  uartwrapper%s
   --  uartwrapper%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
