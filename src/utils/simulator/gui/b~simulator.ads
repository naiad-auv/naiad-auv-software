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

   Ada_Main_Program_Name : constant String := "_ada_simulator" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#75b14caf#;
   pragma Export (C, u00001, "simulatorB");
   u00002 : constant Version_32 := 16#ba46b2cd#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#10d589fc#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#07116dec#;
   pragma Export (C, u00005, "ada__tagsB");
   u00006 : constant Version_32 := 16#2f42ba32#;
   pragma Export (C, u00006, "ada__tagsS");
   u00007 : constant Version_32 := 16#9cd289cc#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#ed247096#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#95643e9a#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#03cf4fc2#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#2d1a1afa#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#30ec78bc#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#ec1008f3#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#0d2b82ae#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#b1479900#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#72905399#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#39743d54#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#d7d76762#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#8eb8a6d6#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#a7343537#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#8fdb15ca#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#ff3fa16b#;
   pragma Export (C, u00024, "system__htableB");
   u00025 : constant Version_32 := 16#c2c5b625#;
   pragma Export (C, u00025, "system__htableS");
   u00026 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00026, "system__string_hashB");
   u00027 : constant Version_32 := 16#0b86c26e#;
   pragma Export (C, u00027, "system__string_hashS");
   u00028 : constant Version_32 := 16#6a8a6a74#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#880bf0fb#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00030, "system__img_intB");
   u00031 : constant Version_32 := 16#2fc1fa38#;
   pragma Export (C, u00031, "system__img_intS");
   u00032 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00032, "system__tracebackB");
   u00033 : constant Version_32 := 16#4c9dce8f#;
   pragma Export (C, u00033, "system__tracebackS");
   u00034 : constant Version_32 := 16#47fb468c#;
   pragma Export (C, u00034, "system__unsigned_typesS");
   u00035 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00035, "system__wch_conB");
   u00036 : constant Version_32 := 16#92f134c7#;
   pragma Export (C, u00036, "system__wch_conS");
   u00037 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00037, "system__wch_stwB");
   u00038 : constant Version_32 := 16#bfe018c6#;
   pragma Export (C, u00038, "system__wch_stwS");
   u00039 : constant Version_32 := 16#5d4d477e#;
   pragma Export (C, u00039, "system__wch_cnvB");
   u00040 : constant Version_32 := 16#8c0fb211#;
   pragma Export (C, u00040, "system__wch_cnvS");
   u00041 : constant Version_32 := 16#f77d8799#;
   pragma Export (C, u00041, "interfacesS");
   u00042 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00042, "system__wch_jisB");
   u00043 : constant Version_32 := 16#d87d2905#;
   pragma Export (C, u00043, "system__wch_jisS");
   u00044 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00044, "system__traceback_entriesB");
   u00045 : constant Version_32 := 16#7f3bf4bb#;
   pragma Export (C, u00045, "system__traceback_entriesS");
   u00046 : constant Version_32 := 16#e6965fe6#;
   pragma Export (C, u00046, "system__val_unsB");
   u00047 : constant Version_32 := 16#5753abb7#;
   pragma Export (C, u00047, "system__val_unsS");
   u00048 : constant Version_32 := 16#46a1f7a9#;
   pragma Export (C, u00048, "system__val_utilB");
   u00049 : constant Version_32 := 16#26b78fe5#;
   pragma Export (C, u00049, "system__val_utilS");
   u00050 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00050, "system__case_utilB");
   u00051 : constant Version_32 := 16#80067a72#;
   pragma Export (C, u00051, "system__case_utilS");
   u00052 : constant Version_32 := 16#7a8f4ce5#;
   pragma Export (C, u00052, "ada__text_ioB");
   u00053 : constant Version_32 := 16#7662da97#;
   pragma Export (C, u00053, "ada__text_ioS");
   u00054 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00054, "ada__streamsS");
   u00055 : constant Version_32 := 16#7a48d8b1#;
   pragma Export (C, u00055, "interfaces__c_streamsB");
   u00056 : constant Version_32 := 16#40dd1af2#;
   pragma Export (C, u00056, "interfaces__c_streamsS");
   u00057 : constant Version_32 := 16#1d302859#;
   pragma Export (C, u00057, "system__crtlS");
   u00058 : constant Version_32 := 16#5efa797c#;
   pragma Export (C, u00058, "system__file_ioB");
   u00059 : constant Version_32 := 16#206d1d17#;
   pragma Export (C, u00059, "system__file_ioS");
   u00060 : constant Version_32 := 16#7cc77cc0#;
   pragma Export (C, u00060, "ada__finalizationB");
   u00061 : constant Version_32 := 16#01acb175#;
   pragma Export (C, u00061, "ada__finalizationS");
   u00062 : constant Version_32 := 16#01cb6d81#;
   pragma Export (C, u00062, "system__finalization_rootB");
   u00063 : constant Version_32 := 16#23ed1b02#;
   pragma Export (C, u00063, "system__finalization_rootS");
   u00064 : constant Version_32 := 16#dbb36d26#;
   pragma Export (C, u00064, "system__finalization_implementationB");
   u00065 : constant Version_32 := 16#b301b745#;
   pragma Export (C, u00065, "system__finalization_implementationS");
   u00066 : constant Version_32 := 16#386436bc#;
   pragma Export (C, u00066, "system__restrictionsB");
   u00067 : constant Version_32 := 16#d5f873b7#;
   pragma Export (C, u00067, "system__restrictionsS");
   u00068 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00068, "system__stream_attributesB");
   u00069 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00069, "system__stream_attributesS");
   u00070 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00070, "ada__io_exceptionsS");
   u00071 : constant Version_32 := 16#a2230cb9#;
   pragma Export (C, u00071, "interfaces__cB");
   u00072 : constant Version_32 := 16#ebbc3ca7#;
   pragma Export (C, u00072, "interfaces__cS");
   u00073 : constant Version_32 := 16#7afa2756#;
   pragma Export (C, u00073, "interfaces__c__stringsB");
   u00074 : constant Version_32 := 16#739e0600#;
   pragma Export (C, u00074, "interfaces__c__stringsS");
   u00075 : constant Version_32 := 16#621b06ef#;
   pragma Export (C, u00075, "system__crtl__runtimeS");
   u00076 : constant Version_32 := 16#f9b9cd19#;
   pragma Export (C, u00076, "system__os_libB");
   u00077 : constant Version_32 := 16#a6d80a38#;
   pragma Export (C, u00077, "system__os_libS");
   u00078 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00078, "system__stringsB");
   u00079 : constant Version_32 := 16#9af0503e#;
   pragma Export (C, u00079, "system__stringsS");
   u00080 : constant Version_32 := 16#f225f4c0#;
   pragma Export (C, u00080, "system__file_control_blockS");
   u00081 : constant Version_32 := 16#b90c86f6#;
   pragma Export (C, u00081, "ada__finalization__list_controllerB");
   u00082 : constant Version_32 := 16#b97dfd74#;
   pragma Export (C, u00082, "ada__finalization__list_controllerS");
   u00083 : constant Version_32 := 16#24c446ad#;
   pragma Export (C, u00083, "databaseB");
   u00084 : constant Version_32 := 16#71f51070#;
   pragma Export (C, u00084, "databaseS");
   u00085 : constant Version_32 := 16#90b866fe#;
   pragma Export (C, u00085, "guiB");
   u00086 : constant Version_32 := 16#a11ee2a9#;
   pragma Export (C, u00086, "guiS");
   u00087 : constant Version_32 := 16#48753c3f#;
   pragma Export (C, u00087, "glibB");
   u00088 : constant Version_32 := 16#aa73ee6a#;
   pragma Export (C, u00088, "glibS");
   u00089 : constant Version_32 := 16#2f3c957f#;
   pragma Export (C, u00089, "glib__errorB");
   u00090 : constant Version_32 := 16#ef11e73d#;
   pragma Export (C, u00090, "glib__errorS");
   u00091 : constant Version_32 := 16#ce8835fc#;
   pragma Export (C, u00091, "gtkS");
   u00092 : constant Version_32 := 16#f64d28ae#;
   pragma Export (C, u00092, "gdkS");
   u00093 : constant Version_32 := 16#f8a1d39b#;
   pragma Export (C, u00093, "glib__objectB");
   u00094 : constant Version_32 := 16#c6371ef1#;
   pragma Export (C, u00094, "glib__objectS");
   u00095 : constant Version_32 := 16#398f61a7#;
   pragma Export (C, u00095, "glib__type_conversion_hooksB");
   u00096 : constant Version_32 := 16#445b1475#;
   pragma Export (C, u00096, "glib__type_conversion_hooksS");
   u00097 : constant Version_32 := 16#57aea1c7#;
   pragma Export (C, u00097, "gtkadaS");
   u00098 : constant Version_32 := 16#3481b1e2#;
   pragma Export (C, u00098, "gtkada__bindingsB");
   u00099 : constant Version_32 := 16#3377f32f#;
   pragma Export (C, u00099, "gtkada__bindingsS");
   u00100 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00100, "gnatS");
   u00101 : constant Version_32 := 16#7d3103a4#;
   pragma Export (C, u00101, "gnat__stringsS");
   u00102 : constant Version_32 := 16#100afe53#;
   pragma Export (C, u00102, "gtkada__cB");
   u00103 : constant Version_32 := 16#8c0647d8#;
   pragma Export (C, u00103, "gtkada__cS");
   u00104 : constant Version_32 := 16#6fb6efdc#;
   pragma Export (C, u00104, "gtkada__typesB");
   u00105 : constant Version_32 := 16#13109374#;
   pragma Export (C, u00105, "gtkada__typesS");
   u00106 : constant Version_32 := 16#6f332493#;
   pragma Export (C, u00106, "system__assertionsB");
   u00107 : constant Version_32 := 16#8ebefc51#;
   pragma Export (C, u00107, "system__assertionsS");
   u00108 : constant Version_32 := 16#2d0faf9d#;
   pragma Export (C, u00108, "glib__glistB");
   u00109 : constant Version_32 := 16#47f8e6c7#;
   pragma Export (C, u00109, "glib__glistS");
   u00110 : constant Version_32 := 16#3b2e7eed#;
   pragma Export (C, u00110, "glib__gslistB");
   u00111 : constant Version_32 := 16#adb9d188#;
   pragma Export (C, u00111, "glib__gslistS");
   u00112 : constant Version_32 := 16#6f9906ee#;
   pragma Export (C, u00112, "gtk__mainB");
   u00113 : constant Version_32 := 16#8e757ffc#;
   pragma Export (C, u00113, "gtk__mainS");
   u00114 : constant Version_32 := 16#e6c57dae#;
   pragma Export (C, u00114, "gdk__typesS");
   u00115 : constant Version_32 := 16#51c2a9fc#;
   pragma Export (C, u00115, "glib__generic_propertiesB");
   u00116 : constant Version_32 := 16#0dfedcb1#;
   pragma Export (C, u00116, "glib__generic_propertiesS");
   u00117 : constant Version_32 := 16#c934b725#;
   pragma Export (C, u00117, "glib__valuesB");
   u00118 : constant Version_32 := 16#72668889#;
   pragma Export (C, u00118, "glib__valuesS");
   u00119 : constant Version_32 := 16#2a84e989#;
   pragma Export (C, u00119, "gdk__eventB");
   u00120 : constant Version_32 := 16#f6b60881#;
   pragma Export (C, u00120, "gdk__eventS");
   u00121 : constant Version_32 := 16#217ef243#;
   pragma Export (C, u00121, "gdk__rectangleB");
   u00122 : constant Version_32 := 16#3ace198e#;
   pragma Export (C, u00122, "gdk__rectangleS");
   u00123 : constant Version_32 := 16#a738a1a3#;
   pragma Export (C, u00123, "cairoB");
   u00124 : constant Version_32 := 16#adc60756#;
   pragma Export (C, u00124, "cairoS");
   u00125 : constant Version_32 := 16#88f16a20#;
   pragma Export (C, u00125, "system__fat_lfltS");
   u00126 : constant Version_32 := 16#50ae1241#;
   pragma Export (C, u00126, "cairo__regionB");
   u00127 : constant Version_32 := 16#3ad35712#;
   pragma Export (C, u00127, "cairo__regionS");
   u00128 : constant Version_32 := 16#b7ed16af#;
   pragma Export (C, u00128, "gdk__windowB");
   u00129 : constant Version_32 := 16#822533cf#;
   pragma Export (C, u00129, "gdk__windowS");
   u00130 : constant Version_32 := 16#e1443d70#;
   pragma Export (C, u00130, "gtk__widgetB");
   u00131 : constant Version_32 := 16#724307c2#;
   pragma Export (C, u00131, "gtk__widgetS");
   u00132 : constant Version_32 := 16#886565a5#;
   pragma Export (C, u00132, "gdk__colorB");
   u00133 : constant Version_32 := 16#be8c9938#;
   pragma Export (C, u00133, "gdk__colorS");
   u00134 : constant Version_32 := 16#1cecc062#;
   pragma Export (C, u00134, "gdk__visualB");
   u00135 : constant Version_32 := 16#1580debe#;
   pragma Export (C, u00135, "gdk__visualS");
   u00136 : constant Version_32 := 16#4c104b4c#;
   pragma Export (C, u00136, "gtk__enumsB");
   u00137 : constant Version_32 := 16#d90def47#;
   pragma Export (C, u00137, "gtk__enumsS");
   u00138 : constant Version_32 := 16#7e2b0c56#;
   pragma Export (C, u00138, "gtk__styleB");
   u00139 : constant Version_32 := 16#8001fc14#;
   pragma Export (C, u00139, "gtk__styleS");
   u00140 : constant Version_32 := 16#d3c8e76d#;
   pragma Export (C, u00140, "pangoS");
   u00141 : constant Version_32 := 16#b98df965#;
   pragma Export (C, u00141, "pango__fontB");
   u00142 : constant Version_32 := 16#7d3a7274#;
   pragma Export (C, u00142, "pango__fontS");
   u00143 : constant Version_32 := 16#853ec0b7#;
   pragma Export (C, u00143, "pango__enumsB");
   u00144 : constant Version_32 := 16#f3fe5737#;
   pragma Export (C, u00144, "pango__enumsS");
   u00145 : constant Version_32 := 16#9542bea9#;
   pragma Export (C, u00145, "gdk__fontB");
   u00146 : constant Version_32 := 16#36f135f3#;
   pragma Export (C, u00146, "gdk__fontS");
   u00147 : constant Version_32 := 16#557e4e5c#;
   pragma Export (C, u00147, "gdk__gcB");
   u00148 : constant Version_32 := 16#17b10250#;
   pragma Export (C, u00148, "gdk__gcS");
   u00149 : constant Version_32 := 16#cf4253f9#;
   pragma Export (C, u00149, "gdk__regionB");
   u00150 : constant Version_32 := 16#c39790b5#;
   pragma Export (C, u00150, "gdk__regionS");
   u00151 : constant Version_32 := 16#d846c6e4#;
   pragma Export (C, u00151, "gdk__pixmapB");
   u00152 : constant Version_32 := 16#af0526c2#;
   pragma Export (C, u00152, "gdk__pixmapS");
   u00153 : constant Version_32 := 16#ed02b600#;
   pragma Export (C, u00153, "gdk__bitmapB");
   u00154 : constant Version_32 := 16#f567db9b#;
   pragma Export (C, u00154, "gdk__bitmapS");
   u00155 : constant Version_32 := 16#b1c8fd91#;
   pragma Export (C, u00155, "gtk__objectB");
   u00156 : constant Version_32 := 16#4e072ff5#;
   pragma Export (C, u00156, "gtk__objectS");
   u00157 : constant Version_32 := 16#17a869e9#;
   pragma Export (C, u00157, "glib__propertiesB");
   u00158 : constant Version_32 := 16#682c1fb0#;
   pragma Export (C, u00158, "glib__propertiesS");
   u00159 : constant Version_32 := 16#aec3632d#;
   pragma Export (C, u00159, "system__fat_fltS");
   u00160 : constant Version_32 := 16#7c989e54#;
   pragma Export (C, u00160, "pango__layoutB");
   u00161 : constant Version_32 := 16#32af7128#;
   pragma Export (C, u00161, "pango__layoutS");
   u00162 : constant Version_32 := 16#c0be7ba1#;
   pragma Export (C, u00162, "pango__attributesB");
   u00163 : constant Version_32 := 16#666d7227#;
   pragma Export (C, u00163, "pango__attributesS");
   u00164 : constant Version_32 := 16#98dba6c5#;
   pragma Export (C, u00164, "pango__contextB");
   u00165 : constant Version_32 := 16#df5146b2#;
   pragma Export (C, u00165, "pango__contextS");
   u00166 : constant Version_32 := 16#f1493a4a#;
   pragma Export (C, u00166, "pango__tabsB");
   u00167 : constant Version_32 := 16#c159aa01#;
   pragma Export (C, u00167, "pango__tabsS");
   u00168 : constant Version_32 := 16#02fdff43#;
   pragma Export (C, u00168, "gtk__windowB");
   u00169 : constant Version_32 := 16#64f6f30a#;
   pragma Export (C, u00169, "gtk__windowS");
   u00170 : constant Version_32 := 16#69f90ada#;
   pragma Export (C, u00170, "gdk__pixbufB");
   u00171 : constant Version_32 := 16#713ac880#;
   pragma Export (C, u00171, "gdk__pixbufS");
   u00172 : constant Version_32 := 16#8c3f35ca#;
   pragma Export (C, u00172, "gdk__cursorB");
   u00173 : constant Version_32 := 16#a5c39181#;
   pragma Export (C, u00173, "gdk__cursorS");
   u00174 : constant Version_32 := 16#9bb40ebd#;
   pragma Export (C, u00174, "gdk__displayB");
   u00175 : constant Version_32 := 16#a37ccb2a#;
   pragma Export (C, u00175, "gdk__displayS");
   u00176 : constant Version_32 := 16#c2e34853#;
   pragma Export (C, u00176, "gdk__drawableB");
   u00177 : constant Version_32 := 16#5ab47d3c#;
   pragma Export (C, u00177, "gdk__drawableS");
   u00178 : constant Version_32 := 16#76d61e87#;
   pragma Export (C, u00178, "gdk__rgbB");
   u00179 : constant Version_32 := 16#d376c0c2#;
   pragma Export (C, u00179, "gdk__rgbS");
   u00180 : constant Version_32 := 16#861a8ee2#;
   pragma Export (C, u00180, "gtk__accel_groupB");
   u00181 : constant Version_32 := 16#c1d3ea52#;
   pragma Export (C, u00181, "gtk__accel_groupS");
   u00182 : constant Version_32 := 16#a197cf03#;
   pragma Export (C, u00182, "gtk__binB");
   u00183 : constant Version_32 := 16#49646a83#;
   pragma Export (C, u00183, "gtk__binS");
   u00184 : constant Version_32 := 16#ebd2f44a#;
   pragma Export (C, u00184, "glib__typesB");
   u00185 : constant Version_32 := 16#ffacd95c#;
   pragma Export (C, u00185, "glib__typesS");
   u00186 : constant Version_32 := 16#e6487998#;
   pragma Export (C, u00186, "gtk__buildableB");
   u00187 : constant Version_32 := 16#91a889d8#;
   pragma Export (C, u00187, "gtk__buildableS");
   u00188 : constant Version_32 := 16#02f2f727#;
   pragma Export (C, u00188, "gtk__builderB");
   u00189 : constant Version_32 := 16#de386e38#;
   pragma Export (C, u00189, "gtk__builderS");
   u00190 : constant Version_32 := 16#a65b09f5#;
   pragma Export (C, u00190, "gtk__containerB");
   u00191 : constant Version_32 := 16#fe9a550d#;
   pragma Export (C, u00191, "gtk__containerS");
   u00192 : constant Version_32 := 16#d43b17a9#;
   pragma Export (C, u00192, "gtk__adjustmentB");
   u00193 : constant Version_32 := 16#87a9fd8d#;
   pragma Export (C, u00193, "gtk__adjustmentS");
   u00194 : constant Version_32 := 16#f84b71e9#;
   pragma Export (C, u00194, "gtkada__builderB");
   u00195 : constant Version_32 := 16#5db46617#;
   pragma Export (C, u00195, "gtkada__builderS");
   u00196 : constant Version_32 := 16#cb022ae3#;
   pragma Export (C, u00196, "gtk__handlersB");
   u00197 : constant Version_32 := 16#dc606d67#;
   pragma Export (C, u00197, "gtk__handlersS");
   u00198 : constant Version_32 := 16#b81a02fe#;
   pragma Export (C, u00198, "gtk__marshallersB");
   u00199 : constant Version_32 := 16#08dc7f66#;
   pragma Export (C, u00199, "gtk__marshallersS");
   u00200 : constant Version_32 := 16#c8495f7b#;
   pragma Export (C, u00200, "gtk__notebookB");
   u00201 : constant Version_32 := 16#1cb6bfd9#;
   pragma Export (C, u00201, "gtk__notebookS");
   u00202 : constant Version_32 := 16#2825fc15#;
   pragma Export (C, u00202, "gtk__tree_modelB");
   u00203 : constant Version_32 := 16#7f557252#;
   pragma Export (C, u00203, "gtk__tree_modelS");
   u00204 : constant Version_32 := 16#7b68a342#;
   pragma Export (C, u00204, "gtkada__handlersS");
   u00205 : constant Version_32 := 16#1eab0e09#;
   pragma Export (C, u00205, "system__img_enum_newB");
   u00206 : constant Version_32 := 16#aa1dd10a#;
   pragma Export (C, u00206, "system__img_enum_newS");
   u00207 : constant Version_32 := 16#5e196e91#;
   pragma Export (C, u00207, "ada__containersS");
   u00208 : constant Version_32 := 16#95e48a93#;
   pragma Export (C, u00208, "ada__containers__hash_tablesS");
   u00209 : constant Version_32 := 16#c24eaf4d#;
   pragma Export (C, u00209, "ada__containers__prime_numbersB");
   u00210 : constant Version_32 := 16#6d3af8ed#;
   pragma Export (C, u00210, "ada__containers__prime_numbersS");
   u00211 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00211, "ada__stringsS");
   u00212 : constant Version_32 := 16#0e71a6bb#;
   pragma Export (C, u00212, "ada__strings__unboundedB");
   u00213 : constant Version_32 := 16#17719459#;
   pragma Export (C, u00213, "ada__strings__unboundedS");
   u00214 : constant Version_32 := 16#914b496f#;
   pragma Export (C, u00214, "ada__strings__fixedB");
   u00215 : constant Version_32 := 16#dc686502#;
   pragma Export (C, u00215, "ada__strings__fixedS");
   u00216 : constant Version_32 := 16#96e9c1e7#;
   pragma Export (C, u00216, "ada__strings__mapsB");
   u00217 : constant Version_32 := 16#24318e4c#;
   pragma Export (C, u00217, "ada__strings__mapsS");
   u00218 : constant Version_32 := 16#b9e58495#;
   pragma Export (C, u00218, "system__bit_opsB");
   u00219 : constant Version_32 := 16#c30e4013#;
   pragma Export (C, u00219, "system__bit_opsS");
   u00220 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00220, "ada__charactersS");
   u00221 : constant Version_32 := 16#051b1b7b#;
   pragma Export (C, u00221, "ada__characters__latin_1S");
   u00222 : constant Version_32 := 16#c6426641#;
   pragma Export (C, u00222, "ada__strings__searchB");
   u00223 : constant Version_32 := 16#b5a8c1d6#;
   pragma Export (C, u00223, "ada__strings__searchS");
   u00224 : constant Version_32 := 16#c4857ee1#;
   pragma Export (C, u00224, "system__compare_array_unsigned_8B");
   u00225 : constant Version_32 := 16#f721ec37#;
   pragma Export (C, u00225, "system__compare_array_unsigned_8S");
   u00226 : constant Version_32 := 16#9d3d925a#;
   pragma Export (C, u00226, "system__address_operationsB");
   u00227 : constant Version_32 := 16#ed64f36d#;
   pragma Export (C, u00227, "system__address_operationsS");
   u00228 : constant Version_32 := 16#217daf40#;
   pragma Export (C, u00228, "ada__strings__unbounded__hashB");
   u00229 : constant Version_32 := 16#8e367f23#;
   pragma Export (C, u00229, "ada__strings__unbounded__hashS");
   u00230 : constant Version_32 := 16#71efeffb#;
   pragma Export (C, u00230, "system__strings__stream_opsB");
   u00231 : constant Version_32 := 16#8453d1c6#;
   pragma Export (C, u00231, "system__strings__stream_opsS");
   u00232 : constant Version_32 := 16#3eb9422c#;
   pragma Export (C, u00232, "ada__streams__stream_ioB");
   u00233 : constant Version_32 := 16#9fa60b9d#;
   pragma Export (C, u00233, "ada__streams__stream_ioS");
   u00234 : constant Version_32 := 16#595ba38f#;
   pragma Export (C, u00234, "system__communicationB");
   u00235 : constant Version_32 := 16#af34b4d0#;
   pragma Export (C, u00235, "system__communicationS");
   u00236 : constant Version_32 := 16#443ac371#;
   pragma Export (C, u00236, "simulator_callbacksB");
   u00237 : constant Version_32 := 16#a170ff13#;
   pragma Export (C, u00237, "simulator_callbacksS");
   u00238 : constant Version_32 := 16#4a0896e2#;
   pragma Export (C, u00238, "glib__mainB");
   u00239 : constant Version_32 := 16#e60331e5#;
   pragma Export (C, u00239, "glib__mainS");
   u00240 : constant Version_32 := 16#ac830e6e#;
   pragma Export (C, u00240, "gtk__boxB");
   u00241 : constant Version_32 := 16#3eadf058#;
   pragma Export (C, u00241, "gtk__boxS");
   u00242 : constant Version_32 := 16#04c07fef#;
   pragma Export (C, u00242, "gtk__orientableB");
   u00243 : constant Version_32 := 16#2882c3d4#;
   pragma Export (C, u00243, "gtk__orientableS");
   u00244 : constant Version_32 := 16#f0a7f6d3#;
   pragma Export (C, u00244, "gtk__drawing_areaB");
   u00245 : constant Version_32 := 16#328868ea#;
   pragma Export (C, u00245, "gtk__drawing_areaS");
   u00246 : constant Version_32 := 16#dafa5509#;
   pragma Export (C, u00246, "gtk__gentryB");
   u00247 : constant Version_32 := 16#1956799d#;
   pragma Export (C, u00247, "gtk__gentryS");
   u00248 : constant Version_32 := 16#0ae224a4#;
   pragma Export (C, u00248, "gdk__dndB");
   u00249 : constant Version_32 := 16#d515cb42#;
   pragma Export (C, u00249, "gdk__dndS");
   u00250 : constant Version_32 := 16#0ad7d835#;
   pragma Export (C, u00250, "gtk__selectionB");
   u00251 : constant Version_32 := 16#eaf75f70#;
   pragma Export (C, u00251, "gtk__selectionS");
   u00252 : constant Version_32 := 16#f746d897#;
   pragma Export (C, u00252, "glib__g_iconB");
   u00253 : constant Version_32 := 16#fcb8b305#;
   pragma Export (C, u00253, "glib__g_iconS");
   u00254 : constant Version_32 := 16#d980a0c2#;
   pragma Export (C, u00254, "gtk__editableB");
   u00255 : constant Version_32 := 16#b7f501d2#;
   pragma Export (C, u00255, "gtk__editableS");
   u00256 : constant Version_32 := 16#fb8b8342#;
   pragma Export (C, u00256, "gtk__entry_completionB");
   u00257 : constant Version_32 := 16#a01cacab#;
   pragma Export (C, u00257, "gtk__entry_completionS");
   u00258 : constant Version_32 := 16#8eb9477f#;
   pragma Export (C, u00258, "gtk__imageB");
   u00259 : constant Version_32 := 16#f019fff3#;
   pragma Export (C, u00259, "gtk__imageS");
   u00260 : constant Version_32 := 16#6121b6bc#;
   pragma Export (C, u00260, "gdk__imageB");
   u00261 : constant Version_32 := 16#dab835cb#;
   pragma Export (C, u00261, "gdk__imageS");
   u00262 : constant Version_32 := 16#66aa6846#;
   pragma Export (C, u00262, "gtk__icon_factoryB");
   u00263 : constant Version_32 := 16#d607b01d#;
   pragma Export (C, u00263, "gtk__icon_factoryS");
   u00264 : constant Version_32 := 16#c5a31049#;
   pragma Export (C, u00264, "gtk__settingsB");
   u00265 : constant Version_32 := 16#37a67e63#;
   pragma Export (C, u00265, "gtk__settingsS");
   u00266 : constant Version_32 := 16#73990cc1#;
   pragma Export (C, u00266, "gtk__miscB");
   u00267 : constant Version_32 := 16#28c2780b#;
   pragma Export (C, u00267, "gtk__miscS");
   u00268 : constant Version_32 := 16#1b275661#;
   pragma Export (C, u00268, "gtk__labelB");
   u00269 : constant Version_32 := 16#443eed3e#;
   pragma Export (C, u00269, "gtk__labelS");
   u00270 : constant Version_32 := 16#7dd93750#;
   pragma Export (C, u00270, "gtk__progress_barB");
   u00271 : constant Version_32 := 16#ca92c110#;
   pragma Export (C, u00271, "gtk__progress_barS");
   u00272 : constant Version_32 := 16#88f261ab#;
   pragma Export (C, u00272, "gtk__progressB");
   u00273 : constant Version_32 := 16#b84c32c8#;
   pragma Export (C, u00273, "gtk__progressS");
   u00274 : constant Version_32 := 16#e3638b84#;
   pragma Export (C, u00274, "gtk__radio_buttonB");
   u00275 : constant Version_32 := 16#6cd04e24#;
   pragma Export (C, u00275, "gtk__radio_buttonS");
   u00276 : constant Version_32 := 16#40de880a#;
   pragma Export (C, u00276, "gtk__actionB");
   u00277 : constant Version_32 := 16#2ceb9061#;
   pragma Export (C, u00277, "gtk__actionS");
   u00278 : constant Version_32 := 16#723c7711#;
   pragma Export (C, u00278, "gtk__activatableB");
   u00279 : constant Version_32 := 16#79a1d2f9#;
   pragma Export (C, u00279, "gtk__activatableS");
   u00280 : constant Version_32 := 16#db96e43e#;
   pragma Export (C, u00280, "gtk__check_buttonB");
   u00281 : constant Version_32 := 16#a0bd8201#;
   pragma Export (C, u00281, "gtk__check_buttonS");
   u00282 : constant Version_32 := 16#212c8eb8#;
   pragma Export (C, u00282, "gtk__toggle_buttonB");
   u00283 : constant Version_32 := 16#6565ea8a#;
   pragma Export (C, u00283, "gtk__toggle_buttonS");
   u00284 : constant Version_32 := 16#fa18cd98#;
   pragma Export (C, u00284, "gtk__buttonB");
   u00285 : constant Version_32 := 16#8fd41909#;
   pragma Export (C, u00285, "gtk__buttonS");
   u00286 : constant Version_32 := 16#0f54972d#;
   pragma Export (C, u00286, "system__img_realB");
   u00287 : constant Version_32 := 16#eab24b18#;
   pragma Export (C, u00287, "system__img_realS");
   u00288 : constant Version_32 := 16#f221c4ca#;
   pragma Export (C, u00288, "system__fat_llfS");
   u00289 : constant Version_32 := 16#06417083#;
   pragma Export (C, u00289, "system__img_lluB");
   u00290 : constant Version_32 := 16#0e32464f#;
   pragma Export (C, u00290, "system__img_lluS");
   u00291 : constant Version_32 := 16#194ccd7b#;
   pragma Export (C, u00291, "system__img_unsB");
   u00292 : constant Version_32 := 16#d80f7a7b#;
   pragma Export (C, u00292, "system__img_unsS");
   u00293 : constant Version_32 := 16#7d6a7c8d#;
   pragma Export (C, u00293, "system__powten_tableS");
   u00294 : constant Version_32 := 16#90617b06#;
   pragma Export (C, u00294, "system__val_realB");
   u00295 : constant Version_32 := 16#d3336deb#;
   pragma Export (C, u00295, "system__val_realS");
   u00296 : constant Version_32 := 16#0be1b996#;
   pragma Export (C, u00296, "system__exn_llfB");
   u00297 : constant Version_32 := 16#ac9e0415#;
   pragma Export (C, u00297, "system__exn_llfS");
   u00298 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00298, "system__concat_2B");
   u00299 : constant Version_32 := 16#d6cae806#;
   pragma Export (C, u00299, "system__concat_2S");
   u00300 : constant Version_32 := 16#0936cab5#;
   pragma Export (C, u00300, "system__memoryB");
   u00301 : constant Version_32 := 16#e791a6ef#;
   pragma Export (C, u00301, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
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
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_real%s
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
   --  gnat.strings%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
   --  system.val_real%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_real%b
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
   --  ada.containers%s
   --  ada.containers.hash_tables%s
   --  ada.containers.prime_numbers%s
   --  ada.containers.prime_numbers%b
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
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.assertions%s
   --  system.assertions%b
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
   --  system.secondary_stack%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.finalization_implementation%s
   --  system.finalization_implementation%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  ada.strings.unbounded.hash%s
   --  ada.strings.unbounded.hash%b
   --  ada.finalization.list_controller%s
   --  ada.finalization.list_controller%b
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  ada.streams.stream_io%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.file_io%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  glib%s
   --  glib%b
   --  gdk%s
   --  glib.error%s
   --  glib.error%b
   --  gtkada%s
   --  gtkada.types%s
   --  gtkada.types%b
   --  pango%s
   --  cairo%s
   --  cairo%b
   --  cairo.region%s
   --  cairo.region%b
   --  database%s
   --  database%b
   --  gdk.image%s
   --  gdk.image%b
   --  gdk.rectangle%s
   --  gdk.rectangle%b
   --  glib.g_icon%s
   --  glib.g_icon%b
   --  glib.glist%s
   --  glib.glist%b
   --  gdk.visual%s
   --  gdk.visual%b
   --  glib.gslist%s
   --  glib.gslist%b
   --  glib.main%s
   --  glib.main%b
   --  glib.object%s
   --  glib.type_conversion_hooks%s
   --  glib.type_conversion_hooks%b
   --  glib.types%s
   --  glib.values%s
   --  glib.values%b
   --  gdk.color%s
   --  gdk.cursor%s
   --  gdk.cursor%b
   --  glib.generic_properties%s
   --  glib.generic_properties%b
   --  gtk%s
   --  gtk.tree_model%s
   --  gtkada.c%s
   --  gtkada.c%b
   --  gtkada.bindings%s
   --  gtkada.bindings%b
   --  glib.types%b
   --  glib.object%b
   --  gtk.tree_model%b
   --  gdk.color%b
   --  gdk.types%s
   --  gdk.region%s
   --  gdk.region%b
   --  gdk.event%s
   --  gdk.display%s
   --  gdk.display%b
   --  gdk.window%s
   --  gdk.event%b
   --  gdk.bitmap%s
   --  gdk.bitmap%b
   --  gdk.pixmap%s
   --  gdk.pixmap%b
   --  glib.properties%s
   --  glib.properties%b
   --  gtk.accel_group%s
   --  gtk.accel_group%b
   --  gtk.enums%s
   --  gtk.enums%b
   --  gtk.object%s
   --  gtk.object%b
   --  gtk.adjustment%s
   --  gtk.adjustment%b
   --  gtk.orientable%s
   --  gtk.orientable%b
   --  gui%s
   --  simulator%b
   --  pango.enums%s
   --  pango.enums%b
   --  pango.attributes%s
   --  pango.attributes%b
   --  pango.font%s
   --  pango.font%b
   --  gdk.font%s
   --  gdk.font%b
   --  gdk.gc%s
   --  gdk.gc%b
   --  pango.context%s
   --  pango.context%b
   --  pango.tabs%s
   --  pango.tabs%b
   --  pango.layout%s
   --  pango.layout%b
   --  gdk.drawable%s
   --  gdk.drawable%b
   --  gdk.rgb%s
   --  gdk.rgb%b
   --  gdk.pixbuf%s
   --  gdk.pixbuf%b
   --  gtk.style%s
   --  gtk.style%b
   --  gtk.settings%s
   --  gtk.settings%b
   --  gtk.widget%s
   --  gdk.window%b
   --  gtk.action%s
   --  gtk.action%b
   --  gtk.activatable%s
   --  gtk.activatable%b
   --  gtk.builder%s
   --  gtk.builder%b
   --  gtk.buildable%s
   --  gtk.buildable%b
   --  gtk.container%s
   --  gtk.container%b
   --  gtk.bin%s
   --  gtk.bin%b
   --  gtk.box%s
   --  gtk.box%b
   --  gtk.button%s
   --  gtk.button%b
   --  gtk.drawing_area%s
   --  gtk.drawing_area%b
   --  gtk.editable%s
   --  gtk.editable%b
   --  gtk.entry_completion%s
   --  gtk.entry_completion%b
   --  gtk.icon_factory%s
   --  gtk.icon_factory%b
   --  gtk.main%s
   --  gtk.main%b
   --  gtk.marshallers%s
   --  gtk.marshallers%b
   --  gtk.misc%s
   --  gtk.misc%b
   --  gtk.image%s
   --  gtk.image%b
   --  gtk.label%s
   --  gtk.label%b
   --  gtk.notebook%s
   --  gtk.notebook%b
   --  gtk.progress%s
   --  gtk.progress%b
   --  gtk.progress_bar%s
   --  gtk.progress_bar%b
   --  gtk.selection%s
   --  gtk.selection%b
   --  gdk.dnd%s
   --  gdk.dnd%b
   --  gtk.gentry%s
   --  gtk.gentry%b
   --  gtk.toggle_button%s
   --  gtk.toggle_button%b
   --  gtk.check_button%s
   --  gtk.check_button%b
   --  gtk.radio_button%s
   --  gtk.radio_button%b
   --  gtk.window%s
   --  gtk.window%b
   --  gtk.widget%b
   --  gtk.handlers%s
   --  gtk.handlers%b
   --  gtkada.builder%s
   --  gtkada.handlers%s
   --  gtkada.builder%b
   --  simulator_callbacks%s
   --  simulator_callbacks%b
   --  gui%b
   --  END ELABORATION ORDER

end ada_main;
