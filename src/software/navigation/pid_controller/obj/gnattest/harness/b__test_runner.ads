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

   Ada_Main_Program_Name : constant String := "_ada_test_runner" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#b5a49ed5#;
   pragma Export (C, u00001, "test_runnerB");
   u00002 : constant Version_32 := 16#3935bd10#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#b31646c6#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#2d7781ef#;
   pragma Export (C, u00004, "aunitB");
   u00005 : constant Version_32 := 16#76cdf7c6#;
   pragma Export (C, u00005, "aunitS");
   u00006 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#b6c145a2#;
   pragma Export (C, u00007, "aunit__memoryB");
   u00008 : constant Version_32 := 16#6b8aa0d5#;
   pragma Export (C, u00008, "aunit__memoryS");
   u00009 : constant Version_32 := 16#bd760655#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00010, "system__storage_elementsB");
   u00011 : constant Version_32 := 16#47bb7bcd#;
   pragma Export (C, u00011, "system__storage_elementsS");
   u00012 : constant Version_32 := 16#8979db55#;
   pragma Export (C, u00012, "aunit__reporterS");
   u00013 : constant Version_32 := 16#cff320ef#;
   pragma Export (C, u00013, "ada__exceptionsB");
   u00014 : constant Version_32 := 16#813e0b0c#;
   pragma Export (C, u00014, "ada__exceptionsS");
   u00015 : constant Version_32 := 16#16173147#;
   pragma Export (C, u00015, "ada__exceptions__last_chance_handlerB");
   u00016 : constant Version_32 := 16#1f42fb5e#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerS");
   u00017 : constant Version_32 := 16#0071025c#;
   pragma Export (C, u00017, "system__soft_linksB");
   u00018 : constant Version_32 := 16#d02d7c88#;
   pragma Export (C, u00018, "system__soft_linksS");
   u00019 : constant Version_32 := 16#27940d94#;
   pragma Export (C, u00019, "system__parametersB");
   u00020 : constant Version_32 := 16#0b940a95#;
   pragma Export (C, u00020, "system__parametersS");
   u00021 : constant Version_32 := 16#17775d6d#;
   pragma Export (C, u00021, "system__secondary_stackB");
   u00022 : constant Version_32 := 16#a91821fb#;
   pragma Export (C, u00022, "system__secondary_stackS");
   u00023 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00023, "system__stack_checkingB");
   u00024 : constant Version_32 := 16#1ed4ba79#;
   pragma Export (C, u00024, "system__stack_checkingS");
   u00025 : constant Version_32 := 16#7b9f0bae#;
   pragma Export (C, u00025, "system__exception_tableB");
   u00026 : constant Version_32 := 16#2c18daf0#;
   pragma Export (C, u00026, "system__exception_tableS");
   u00027 : constant Version_32 := 16#5665ab64#;
   pragma Export (C, u00027, "system__htableB");
   u00028 : constant Version_32 := 16#3ede485b#;
   pragma Export (C, u00028, "system__htableS");
   u00029 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00029, "system__string_hashB");
   u00030 : constant Version_32 := 16#9beadec1#;
   pragma Export (C, u00030, "system__string_hashS");
   u00031 : constant Version_32 := 16#aad75561#;
   pragma Export (C, u00031, "system__exceptionsB");
   u00032 : constant Version_32 := 16#b188cee2#;
   pragma Export (C, u00032, "system__exceptionsS");
   u00033 : constant Version_32 := 16#010db1dc#;
   pragma Export (C, u00033, "system__exceptions_debugB");
   u00034 : constant Version_32 := 16#85062381#;
   pragma Export (C, u00034, "system__exceptions_debugS");
   u00035 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00035, "system__img_intB");
   u00036 : constant Version_32 := 16#bfade697#;
   pragma Export (C, u00036, "system__img_intS");
   u00037 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00037, "system__tracebackB");
   u00038 : constant Version_32 := 16#dcf1d220#;
   pragma Export (C, u00038, "system__tracebackS");
   u00039 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00039, "system__wch_conB");
   u00040 : constant Version_32 := 16#029d2868#;
   pragma Export (C, u00040, "system__wch_conS");
   u00041 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00041, "system__wch_stwB");
   u00042 : constant Version_32 := 16#2f8c0469#;
   pragma Export (C, u00042, "system__wch_stwS");
   u00043 : constant Version_32 := 16#617a40f2#;
   pragma Export (C, u00043, "system__wch_cnvB");
   u00044 : constant Version_32 := 16#1c63aebe#;
   pragma Export (C, u00044, "system__wch_cnvS");
   u00045 : constant Version_32 := 16#cb4a8015#;
   pragma Export (C, u00045, "interfacesS");
   u00046 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00046, "system__wch_jisB");
   u00047 : constant Version_32 := 16#481135aa#;
   pragma Export (C, u00047, "system__wch_jisS");
   u00048 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00048, "system__traceback_entriesB");
   u00049 : constant Version_32 := 16#ef57e814#;
   pragma Export (C, u00049, "system__traceback_entriesS");
   u00050 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00050, "ada__streamsS");
   u00051 : constant Version_32 := 16#afd62b40#;
   pragma Export (C, u00051, "ada__tagsB");
   u00052 : constant Version_32 := 16#1442fc05#;
   pragma Export (C, u00052, "ada__tagsS");
   u00053 : constant Version_32 := 16#d7975a23#;
   pragma Export (C, u00053, "system__unsigned_typesS");
   u00054 : constant Version_32 := 16#79817c71#;
   pragma Export (C, u00054, "system__val_unsB");
   u00055 : constant Version_32 := 16#c73fb718#;
   pragma Export (C, u00055, "system__val_unsS");
   u00056 : constant Version_32 := 16#aea309ed#;
   pragma Export (C, u00056, "system__val_utilB");
   u00057 : constant Version_32 := 16#11d6b0ab#;
   pragma Export (C, u00057, "system__val_utilS");
   u00058 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00058, "system__case_utilB");
   u00059 : constant Version_32 := 16#106a66dd#;
   pragma Export (C, u00059, "system__case_utilS");
   u00060 : constant Version_32 := 16#01adf261#;
   pragma Export (C, u00060, "aunit__test_resultsB");
   u00061 : constant Version_32 := 16#e00b278d#;
   pragma Export (C, u00061, "aunit__test_resultsS");
   u00062 : constant Version_32 := 16#9b1c7ff2#;
   pragma Export (C, u00062, "aunit__memory__utilsB");
   u00063 : constant Version_32 := 16#fb2f6c57#;
   pragma Export (C, u00063, "aunit__memory__utilsS");
   u00064 : constant Version_32 := 16#11329e00#;
   pragma Export (C, u00064, "ada_containersS");
   u00065 : constant Version_32 := 16#115dbc62#;
   pragma Export (C, u00065, "ada_containers__aunit_listsB");
   u00066 : constant Version_32 := 16#c8d9569a#;
   pragma Export (C, u00066, "ada_containers__aunit_listsS");
   u00067 : constant Version_32 := 16#c4150d4d#;
   pragma Export (C, u00067, "aunit__time_measureB");
   u00068 : constant Version_32 := 16#f695c452#;
   pragma Export (C, u00068, "aunit__time_measureS");
   u00069 : constant Version_32 := 16#8ba0787e#;
   pragma Export (C, u00069, "ada__calendarB");
   u00070 : constant Version_32 := 16#e791e294#;
   pragma Export (C, u00070, "ada__calendarS");
   u00071 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00071, "interfaces__cB");
   u00072 : constant Version_32 := 16#29899d4e#;
   pragma Export (C, u00072, "interfaces__cS");
   u00073 : constant Version_32 := 16#22d03640#;
   pragma Export (C, u00073, "system__os_primitivesB");
   u00074 : constant Version_32 := 16#0da78a7c#;
   pragma Export (C, u00074, "system__os_primitivesS");
   u00075 : constant Version_32 := 16#8b4fca6d#;
   pragma Export (C, u00075, "aunit__reporter__gnattestB");
   u00076 : constant Version_32 := 16#c87627c0#;
   pragma Export (C, u00076, "aunit__reporter__gnattestS");
   u00077 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00077, "gnatS");
   u00078 : constant Version_32 := 16#b48102f5#;
   pragma Export (C, u00078, "gnat__ioB");
   u00079 : constant Version_32 := 16#6227e843#;
   pragma Export (C, u00079, "gnat__ioS");
   u00080 : constant Version_32 := 16#cc4eaf2e#;
   pragma Export (C, u00080, "aunit__runB");
   u00081 : constant Version_32 := 16#fa67f913#;
   pragma Export (C, u00081, "aunit__runS");
   u00082 : constant Version_32 := 16#d01edb9b#;
   pragma Export (C, u00082, "aunit__test_suitesB");
   u00083 : constant Version_32 := 16#b270132c#;
   pragma Export (C, u00083, "aunit__test_suitesS");
   u00084 : constant Version_32 := 16#a82b211a#;
   pragma Export (C, u00084, "aunit__optionsS");
   u00085 : constant Version_32 := 16#e9d6512d#;
   pragma Export (C, u00085, "aunit__test_filtersB");
   u00086 : constant Version_32 := 16#9a67cba8#;
   pragma Export (C, u00086, "aunit__test_filtersS");
   u00087 : constant Version_32 := 16#2f22f4a9#;
   pragma Export (C, u00087, "aunit__simple_test_casesB");
   u00088 : constant Version_32 := 16#b8d0680d#;
   pragma Export (C, u00088, "aunit__simple_test_casesS");
   u00089 : constant Version_32 := 16#8872fb1a#;
   pragma Export (C, u00089, "aunit__assertionsB");
   u00090 : constant Version_32 := 16#f4097c04#;
   pragma Export (C, u00090, "aunit__assertionsS");
   u00091 : constant Version_32 := 16#6b6cea8f#;
   pragma Export (C, u00091, "aunit__testsS");
   u00092 : constant Version_32 := 16#91d2300e#;
   pragma Export (C, u00092, "system__finalization_mastersB");
   u00093 : constant Version_32 := 16#d783aa79#;
   pragma Export (C, u00093, "system__finalization_mastersS");
   u00094 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00094, "system__address_imageB");
   u00095 : constant Version_32 := 16#1c9a9b6f#;
   pragma Export (C, u00095, "system__address_imageS");
   u00096 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00096, "system__img_boolB");
   u00097 : constant Version_32 := 16#48af77be#;
   pragma Export (C, u00097, "system__img_boolS");
   u00098 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00098, "system__ioB");
   u00099 : constant Version_32 := 16#2334f11a#;
   pragma Export (C, u00099, "system__ioS");
   u00100 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00100, "ada__finalizationB");
   u00101 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00101, "ada__finalizationS");
   u00102 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00102, "system__finalization_rootB");
   u00103 : constant Version_32 := 16#f28475c5#;
   pragma Export (C, u00103, "system__finalization_rootS");
   u00104 : constant Version_32 := 16#a7a37cb6#;
   pragma Export (C, u00104, "system__storage_poolsB");
   u00105 : constant Version_32 := 16#6ed81938#;
   pragma Export (C, u00105, "system__storage_poolsS");
   u00106 : constant Version_32 := 16#ba5d60c7#;
   pragma Export (C, u00106, "system__pool_globalB");
   u00107 : constant Version_32 := 16#d56df0a6#;
   pragma Export (C, u00107, "system__pool_globalS");
   u00108 : constant Version_32 := 16#fc605663#;
   pragma Export (C, u00108, "system__memoryB");
   u00109 : constant Version_32 := 16#77fdba40#;
   pragma Export (C, u00109, "system__memoryS");
   u00110 : constant Version_32 := 16#d45bc0f4#;
   pragma Export (C, u00110, "system__crtlS");
   u00111 : constant Version_32 := 16#1b4527ff#;
   pragma Export (C, u00111, "gnat__source_infoS");
   u00112 : constant Version_32 := 16#2648146e#;
   pragma Export (C, u00112, "gnat__tracebackB");
   u00113 : constant Version_32 := 16#c23af398#;
   pragma Export (C, u00113, "gnat__tracebackS");
   u00114 : constant Version_32 := 16#25f70bc7#;
   pragma Export (C, u00114, "ada__exceptions__tracebackB");
   u00115 : constant Version_32 := 16#1e536c8b#;
   pragma Export (C, u00115, "ada__exceptions__tracebackS");
   u00116 : constant Version_32 := 16#5f14e1a0#;
   pragma Export (C, u00116, "gnat__traceback__symbolicB");
   u00117 : constant Version_32 := 16#171ff1f9#;
   pragma Export (C, u00117, "gnat__traceback__symbolicS");
   u00118 : constant Version_32 := 16#b2cb9bcf#;
   pragma Export (C, u00118, "interfaces__c__stringsB");
   u00119 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00119, "interfaces__c__stringsS");
   u00120 : constant Version_32 := 16#9d3d925a#;
   pragma Export (C, u00120, "system__address_operationsB");
   u00121 : constant Version_32 := 16#7d08efc2#;
   pragma Export (C, u00121, "system__address_operationsS");
   u00122 : constant Version_32 := 16#60301061#;
   pragma Export (C, u00122, "system__dwarf_linesB");
   u00123 : constant Version_32 := 16#bf40b3f4#;
   pragma Export (C, u00123, "system__dwarf_linesS");
   u00124 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00124, "ada__stringsS");
   u00125 : constant Version_32 := 16#35b254f4#;
   pragma Export (C, u00125, "ada__strings__boundedB");
   u00126 : constant Version_32 := 16#366f64db#;
   pragma Export (C, u00126, "ada__strings__boundedS");
   u00127 : constant Version_32 := 16#96e9c1e7#;
   pragma Export (C, u00127, "ada__strings__mapsB");
   u00128 : constant Version_32 := 16#24318e4c#;
   pragma Export (C, u00128, "ada__strings__mapsS");
   u00129 : constant Version_32 := 16#35042ca6#;
   pragma Export (C, u00129, "system__bit_opsB");
   u00130 : constant Version_32 := 16#c30e4013#;
   pragma Export (C, u00130, "system__bit_opsS");
   u00131 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00131, "ada__charactersS");
   u00132 : constant Version_32 := 16#051b1b7b#;
   pragma Export (C, u00132, "ada__characters__latin_1S");
   u00133 : constant Version_32 := 16#ddb66c1c#;
   pragma Export (C, u00133, "ada__strings__superboundedB");
   u00134 : constant Version_32 := 16#ae699a5f#;
   pragma Export (C, u00134, "ada__strings__superboundedS");
   u00135 : constant Version_32 := 16#562e7aee#;
   pragma Export (C, u00135, "ada__strings__searchB");
   u00136 : constant Version_32 := 16#b5a8c1d6#;
   pragma Export (C, u00136, "ada__strings__searchS");
   u00137 : constant Version_32 := 16#c4857ee1#;
   pragma Export (C, u00137, "system__compare_array_unsigned_8B");
   u00138 : constant Version_32 := 16#674df098#;
   pragma Export (C, u00138, "system__compare_array_unsigned_8S");
   u00139 : constant Version_32 := 16#194ccd7b#;
   pragma Export (C, u00139, "system__img_unsB");
   u00140 : constant Version_32 := 16#486366d4#;
   pragma Export (C, u00140, "system__img_unsS");
   u00141 : constant Version_32 := 16#5b00f4eb#;
   pragma Export (C, u00141, "system__object_readerB");
   u00142 : constant Version_32 := 16#f9f2ce44#;
   pragma Export (C, u00142, "system__object_readerS");
   u00143 : constant Version_32 := 16#e0b7a7e8#;
   pragma Export (C, u00143, "interfaces__c_streamsB");
   u00144 : constant Version_32 := 16#95ad191f#;
   pragma Export (C, u00144, "interfaces__c_streamsS");
   u00145 : constant Version_32 := 16#1fd820b1#;
   pragma Export (C, u00145, "system__storage_pools__subpoolsB");
   u00146 : constant Version_32 := 16#951e0de9#;
   pragma Export (C, u00146, "system__storage_pools__subpoolsS");
   u00147 : constant Version_32 := 16#1777d351#;
   pragma Export (C, u00147, "system__storage_pools__subpools__finalizationB");
   u00148 : constant Version_32 := 16#12aaf1de#;
   pragma Export (C, u00148, "system__storage_pools__subpools__finalizationS");
   u00149 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00149, "system__stream_attributesB");
   u00150 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00150, "system__stream_attributesS");
   u00151 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00151, "ada__io_exceptionsS");
   u00152 : constant Version_32 := 16#d3757657#;
   pragma Export (C, u00152, "system__val_lliB");
   u00153 : constant Version_32 := 16#2752e0f5#;
   pragma Export (C, u00153, "system__val_lliS");
   u00154 : constant Version_32 := 16#25c21d28#;
   pragma Export (C, u00154, "system__val_lluB");
   u00155 : constant Version_32 := 16#ad650d51#;
   pragma Export (C, u00155, "system__val_lluS");
   u00156 : constant Version_32 := 16#db98105c#;
   pragma Export (C, u00156, "gnat__command_lineB");
   u00157 : constant Version_32 := 16#33371422#;
   pragma Export (C, u00157, "gnat__command_lineS");
   u00158 : constant Version_32 := 16#6239f067#;
   pragma Export (C, u00158, "ada__characters__handlingB");
   u00159 : constant Version_32 := 16#3006d996#;
   pragma Export (C, u00159, "ada__characters__handlingS");
   u00160 : constant Version_32 := 16#7a69aa90#;
   pragma Export (C, u00160, "ada__strings__maps__constantsS");
   u00161 : constant Version_32 := 16#261c554b#;
   pragma Export (C, u00161, "ada__strings__unboundedB");
   u00162 : constant Version_32 := 16#2bf53506#;
   pragma Export (C, u00162, "ada__strings__unboundedS");
   u00163 : constant Version_32 := 16#b2cd7d9b#;
   pragma Export (C, u00163, "system__machine_codeS");
   u00164 : constant Version_32 := 16#8d43fb6a#;
   pragma Export (C, u00164, "system__atomic_countersB");
   u00165 : constant Version_32 := 16#f7ea6ae1#;
   pragma Export (C, u00165, "system__atomic_countersS");
   u00166 : constant Version_32 := 16#421d3150#;
   pragma Export (C, u00166, "ada__text_ioB");
   u00167 : constant Version_32 := 16#f792461d#;
   pragma Export (C, u00167, "ada__text_ioS");
   u00168 : constant Version_32 := 16#228a5436#;
   pragma Export (C, u00168, "system__file_ioB");
   u00169 : constant Version_32 := 16#2c376772#;
   pragma Export (C, u00169, "system__file_ioS");
   u00170 : constant Version_32 := 16#d6bc4ecc#;
   pragma Export (C, u00170, "system__crtl__runtimeS");
   u00171 : constant Version_32 := 16#1eab0e09#;
   pragma Export (C, u00171, "system__img_enum_newB");
   u00172 : constant Version_32 := 16#3a71cda5#;
   pragma Export (C, u00172, "system__img_enum_newS");
   u00173 : constant Version_32 := 16#14502dea#;
   pragma Export (C, u00173, "system__os_libB");
   u00174 : constant Version_32 := 16#89dce9aa#;
   pragma Export (C, u00174, "system__os_libS");
   u00175 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00175, "system__stringsB");
   u00176 : constant Version_32 := 16#0a9c4c91#;
   pragma Export (C, u00176, "system__stringsS");
   u00177 : constant Version_32 := 16#9a926c2b#;
   pragma Export (C, u00177, "system__file_control_blockS");
   u00178 : constant Version_32 := 16#c8f3c043#;
   pragma Export (C, u00178, "gnat__directory_operationsB");
   u00179 : constant Version_32 := 16#48e8a667#;
   pragma Export (C, u00179, "gnat__directory_operationsS");
   u00180 : constant Version_32 := 16#914b496f#;
   pragma Export (C, u00180, "ada__strings__fixedB");
   u00181 : constant Version_32 := 16#dc686502#;
   pragma Export (C, u00181, "ada__strings__fixedS");
   u00182 : constant Version_32 := 16#3ff16a6d#;
   pragma Export (C, u00182, "gnat__os_libS");
   u00183 : constant Version_32 := 16#c31442ce#;
   pragma Export (C, u00183, "system__val_intB");
   u00184 : constant Version_32 := 16#f5d32c6a#;
   pragma Export (C, u00184, "system__val_intS");
   u00185 : constant Version_32 := 16#7a34f6b5#;
   pragma Export (C, u00185, "ada__command_lineB");
   u00186 : constant Version_32 := 16#df5044bd#;
   pragma Export (C, u00186, "ada__command_lineS");
   u00187 : constant Version_32 := 16#084c16d0#;
   pragma Export (C, u00187, "gnat__regexpS");
   u00188 : constant Version_32 := 16#daf128da#;
   pragma Export (C, u00188, "system__regexpB");
   u00189 : constant Version_32 := 16#73e7fde9#;
   pragma Export (C, u00189, "system__regexpS");
   u00190 : constant Version_32 := 16#7d3103a4#;
   pragma Export (C, u00190, "gnat__stringsS");
   u00191 : constant Version_32 := 16#33489ddc#;
   pragma Export (C, u00191, "gnattest_generatedS");
   u00192 : constant Version_32 := 16#1b279913#;
   pragma Export (C, u00192, "gnattest_main_suiteB");
   u00193 : constant Version_32 := 16#eea1e993#;
   pragma Export (C, u00193, "gnattest_main_suiteS");
   u00194 : constant Version_32 := 16#adf2ff10#;
   pragma Export (C, u00194, "navigationB");
   u00195 : constant Version_32 := 16#afdfd964#;
   pragma Export (C, u00195, "navigationS");
   u00196 : constant Version_32 := 16#03fad068#;
   pragma Export (C, u00196, "navigation__pid_controllerB");
   u00197 : constant Version_32 := 16#2b55f2c7#;
   pragma Export (C, u00197, "navigation__pid_controllerS");
   u00198 : constant Version_32 := 16#7ea8d38f#;
   pragma Export (C, u00198, "navigation__pid_controller__cpidcontroller_test_dataB");
   u00199 : constant Version_32 := 16#1aee69b3#;
   pragma Export (C, u00199, "navigation__pid_controller__cpidcontroller_test_dataS");
   u00200 : constant Version_32 := 16#269b1972#;
   pragma Export (C, u00200, "aunit__test_fixturesB");
   u00201 : constant Version_32 := 16#3b99f1a5#;
   pragma Export (C, u00201, "aunit__test_fixturesS");
   u00202 : constant Version_32 := 16#66c876bb#;
   pragma Export (C, u00202, "navigation__pid_controller__cpidcontroller_test_data__cpidcontroller_testsB");
   u00203 : constant Version_32 := 16#574329ea#;
   pragma Export (C, u00203, "navigation__pid_controller__cpidcontroller_test_data__cpidcontroller_testsS");
   u00204 : constant Version_32 := 16#6d0081c3#;
   pragma Export (C, u00204, "system__img_realB");
   u00205 : constant Version_32 := 16#7ade57b7#;
   pragma Export (C, u00205, "system__img_realS");
   u00206 : constant Version_32 := 16#624dd865#;
   pragma Export (C, u00206, "system__fat_llfS");
   u00207 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00207, "system__float_controlB");
   u00208 : constant Version_32 := 16#5d8a4569#;
   pragma Export (C, u00208, "system__float_controlS");
   u00209 : constant Version_32 := 16#06417083#;
   pragma Export (C, u00209, "system__img_lluB");
   u00210 : constant Version_32 := 16#9e5e5ae0#;
   pragma Export (C, u00210, "system__img_lluS");
   u00211 : constant Version_32 := 16#ed066022#;
   pragma Export (C, u00211, "system__powten_tableS");
   u00212 : constant Version_32 := 16#970e140c#;
   pragma Export (C, u00212, "navigation__pid_controller__cpidcontroller_test_data__cpidcontroller_tests__suiteB");
   u00213 : constant Version_32 := 16#2b75ba13#;
   pragma Export (C, u00213, "navigation__pid_controller__cpidcontroller_test_data__cpidcontroller_tests__suiteS");
   u00214 : constant Version_32 := 16#8f189ee8#;
   pragma Export (C, u00214, "aunit__test_callerB");
   u00215 : constant Version_32 := 16#581d22b8#;
   pragma Export (C, u00215, "aunit__test_callerS");
   u00216 : constant Version_32 := 16#0980f09e#;
   pragma Export (C, u00216, "navigation__pid_controller__test_dataB");
   u00217 : constant Version_32 := 16#286430a6#;
   pragma Export (C, u00217, "navigation__pid_controller__test_dataS");
   u00218 : constant Version_32 := 16#8e77179b#;
   pragma Export (C, u00218, "navigation__pid_controller__test_data__testsB");
   u00219 : constant Version_32 := 16#d2ba1b6b#;
   pragma Export (C, u00219, "navigation__pid_controller__test_data__testsS");
   u00220 : constant Version_32 := 16#d43cea5d#;
   pragma Export (C, u00220, "navigation__pid_controller__test_data__tests__suiteB");
   u00221 : constant Version_32 := 16#56edf0f9#;
   pragma Export (C, u00221, "navigation__pid_controller__test_data__tests__suiteS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  ada.command_line%s
   --  gnat%s
   --  gnat.io%s
   --  gnat.io%b
   --  gnat.source_info%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.case_util%s
   --  system.case_util%b
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
   --  system.atomic_counters%b
   --  system.os_primitives%s
   --  system.os_primitives%b
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
   --  gnat.strings%s
   --  system.os_lib%s
   --  gnat.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.fat_llf%s
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
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
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.fixed%s
   --  ada.strings.maps.constants%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.superbounded%s
   --  ada.strings.bounded%s
   --  ada.strings.bounded%b
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
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  gnat.directory_operations%s
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.superbounded%b
   --  ada.strings.fixed%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.command_line%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  system.dwarf_lines%b
   --  system.object_reader%b
   --  gnat.directory_operations%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.regexp%s
   --  system.regexp%b
   --  gnat.regexp%s
   --  gnat.command_line%s
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  gnat.command_line%b
   --  gnat.traceback%s
   --  gnat.traceback%b
   --  gnat.traceback.symbolic%s
   --  gnat.traceback.symbolic%b
   --  ada_containers%s
   --  ada_containers.aunit_lists%s
   --  aunit%s
   --  aunit.memory%s
   --  aunit.memory%b
   --  aunit%b
   --  aunit.memory.utils%s
   --  aunit.memory.utils%b
   --  ada_containers.aunit_lists%b
   --  aunit.tests%s
   --  aunit.test_filters%s
   --  aunit.options%s
   --  aunit.time_measure%s
   --  aunit.time_measure%b
   --  aunit.test_results%s
   --  aunit.test_results%b
   --  aunit.assertions%s
   --  aunit.assertions%b
   --  aunit.reporter%s
   --  aunit.reporter.gnattest%s
   --  aunit.reporter.gnattest%b
   --  aunit.simple_test_cases%s
   --  aunit.simple_test_cases%b
   --  aunit.test_filters%b
   --  aunit.test_fixtures%s
   --  aunit.test_fixtures%b
   --  aunit.test_caller%s
   --  aunit.test_caller%b
   --  aunit.test_suites%s
   --  aunit.test_suites%b
   --  aunit.run%s
   --  aunit.run%b
   --  gnattest_generated%s
   --  gnattest_main_suite%s
   --  test_runner%b
   --  navigation%s
   --  navigation%b
   --  navigation.pid_controller%s
   --  navigation.pid_controller%b
   --  navigation.pid_controller.cpidcontroller_test_data%s
   --  navigation.pid_controller.cpidcontroller_test_data%b
   --  navigation.pid_controller.cpidcontroller_test_data.cpidcontroller_tests%s
   --  navigation.pid_controller.cpidcontroller_test_data.cpidcontroller_tests%b
   --  navigation.pid_controller.cpidcontroller_test_data.cpidcontroller_tests.suite%s
   --  navigation.pid_controller.cpidcontroller_test_data.cpidcontroller_tests.suite%b
   --  navigation.pid_controller.test_data%s
   --  navigation.pid_controller.test_data%b
   --  navigation.pid_controller.test_data.tests%s
   --  navigation.pid_controller.test_data.tests%b
   --  navigation.pid_controller.test_data.tests.suite%s
   --  navigation.pid_controller.test_data.tests.suite%b
   --  gnattest_main_suite%b
   --  END ELABORATION ORDER


end ada_main;
