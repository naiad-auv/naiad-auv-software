pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_stringfwd_h;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_atomic_word_h;
with System;
with cpp_4_7_4_bits_postypes_h;
with cpp_4_7_4_bits_locale_classes_h;
with Interfaces.C.Extensions;

package cpp_4_7_4_bits_ios_base_h is

   subtype u_Ios_Fmtflags is unsigned;
   u_S_boolalpha : constant u_Ios_Fmtflags := 1;
   u_S_dec : constant u_Ios_Fmtflags := 2;
   u_S_fixed : constant u_Ios_Fmtflags := 4;
   u_S_hex : constant u_Ios_Fmtflags := 8;
   u_S_internal : constant u_Ios_Fmtflags := 16;
   u_S_left : constant u_Ios_Fmtflags := 32;
   u_S_oct : constant u_Ios_Fmtflags := 64;
   u_S_right : constant u_Ios_Fmtflags := 128;
   u_S_scientific : constant u_Ios_Fmtflags := 256;
   u_S_showbase : constant u_Ios_Fmtflags := 512;
   u_S_showpoint : constant u_Ios_Fmtflags := 1024;
   u_S_showpos : constant u_Ios_Fmtflags := 2048;
   u_S_skipws : constant u_Ios_Fmtflags := 4096;
   u_S_unitbuf : constant u_Ios_Fmtflags := 8192;
   u_S_uppercase : constant u_Ios_Fmtflags := 16384;
   u_S_adjustfield : constant u_Ios_Fmtflags := 176;
   u_S_basefield : constant u_Ios_Fmtflags := 74;
   u_S_floatfield : constant u_Ios_Fmtflags := 260;
   u_S_ios_fmtflags_end : constant u_Ios_Fmtflags := 65536;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:53

   function operator_a (uu_a : u_Ios_Fmtflags; uu_b : u_Ios_Fmtflags) return u_Ios_Fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:77
   pragma Import (CPP, operator_a, "_ZStanSt13_Ios_FmtflagsS_");

   function operator_o (uu_a : u_Ios_Fmtflags; uu_b : u_Ios_Fmtflags) return u_Ios_Fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:81
   pragma Import (CPP, operator_o, "_ZStorSt13_Ios_FmtflagsS_");

   function operator_x (uu_a : u_Ios_Fmtflags; uu_b : u_Ios_Fmtflags) return u_Ios_Fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:85
   pragma Import (CPP, operator_x, "_ZSteoSt13_Ios_FmtflagsS_");

   function operator_ti (uu_a : u_Ios_Fmtflags) return u_Ios_Fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:89
   pragma Import (CPP, operator_ti, "_ZStcoSt13_Ios_Fmtflags");

   function operator_oe (uu_a : access u_Ios_Fmtflags; uu_b : u_Ios_Fmtflags) return access u_Ios_Fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:93
   pragma Import (CPP, operator_oe, "_ZStoRRSt13_Ios_FmtflagsS_");

   function operator_ae (uu_a : access u_Ios_Fmtflags; uu_b : u_Ios_Fmtflags) return access u_Ios_Fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:97
   pragma Import (CPP, operator_ae, "_ZStaNRSt13_Ios_FmtflagsS_");

   function operator_xe (uu_a : access u_Ios_Fmtflags; uu_b : u_Ios_Fmtflags) return access u_Ios_Fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:101
   pragma Import (CPP, operator_xe, "_ZSteORSt13_Ios_FmtflagsS_");

   subtype u_Ios_Openmode is unsigned;
   u_S_app : constant u_Ios_Openmode := 1;
   u_S_ate : constant u_Ios_Openmode := 2;
   u_S_bin : constant u_Ios_Openmode := 4;
   u_S_in : constant u_Ios_Openmode := 8;
   u_S_out : constant u_Ios_Openmode := 16;
   u_S_trunc : constant u_Ios_Openmode := 32;
   u_S_ios_openmode_end : constant u_Ios_Openmode := 65536;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:105

   function operator_a (uu_a : u_Ios_Openmode; uu_b : u_Ios_Openmode) return u_Ios_Openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:117
   pragma Import (CPP, operator_a, "_ZStanSt13_Ios_OpenmodeS_");

   function operator_o (uu_a : u_Ios_Openmode; uu_b : u_Ios_Openmode) return u_Ios_Openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:121
   pragma Import (CPP, operator_o, "_ZStorSt13_Ios_OpenmodeS_");

   function operator_x (uu_a : u_Ios_Openmode; uu_b : u_Ios_Openmode) return u_Ios_Openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:125
   pragma Import (CPP, operator_x, "_ZSteoSt13_Ios_OpenmodeS_");

   function operator_ti (uu_a : u_Ios_Openmode) return u_Ios_Openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:129
   pragma Import (CPP, operator_ti, "_ZStcoSt13_Ios_Openmode");

   function operator_oe (uu_a : access u_Ios_Openmode; uu_b : u_Ios_Openmode) return access u_Ios_Openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:133
   pragma Import (CPP, operator_oe, "_ZStoRRSt13_Ios_OpenmodeS_");

   function operator_ae (uu_a : access u_Ios_Openmode; uu_b : u_Ios_Openmode) return access u_Ios_Openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:137
   pragma Import (CPP, operator_ae, "_ZStaNRSt13_Ios_OpenmodeS_");

   function operator_xe (uu_a : access u_Ios_Openmode; uu_b : u_Ios_Openmode) return access u_Ios_Openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:141
   pragma Import (CPP, operator_xe, "_ZSteORSt13_Ios_OpenmodeS_");

   subtype u_Ios_Iostate is unsigned;
   u_S_goodbit : constant u_Ios_Iostate := 0;
   u_S_badbit : constant u_Ios_Iostate := 1;
   u_S_eofbit : constant u_Ios_Iostate := 2;
   u_S_failbit : constant u_Ios_Iostate := 4;
   u_S_ios_iostate_end : constant u_Ios_Iostate := 65536;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:145

   function operator_a (uu_a : u_Ios_Iostate; uu_b : u_Ios_Iostate) return u_Ios_Iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:155
   pragma Import (CPP, operator_a, "_ZStanSt12_Ios_IostateS_");

   function operator_o (uu_a : u_Ios_Iostate; uu_b : u_Ios_Iostate) return u_Ios_Iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:159
   pragma Import (CPP, operator_o, "_ZStorSt12_Ios_IostateS_");

   function operator_x (uu_a : u_Ios_Iostate; uu_b : u_Ios_Iostate) return u_Ios_Iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:163
   pragma Import (CPP, operator_x, "_ZSteoSt12_Ios_IostateS_");

   function operator_ti (uu_a : u_Ios_Iostate) return u_Ios_Iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:167
   pragma Import (CPP, operator_ti, "_ZStcoSt12_Ios_Iostate");

   function operator_oe (uu_a : access u_Ios_Iostate; uu_b : u_Ios_Iostate) return access u_Ios_Iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:171
   pragma Import (CPP, operator_oe, "_ZStoRRSt12_Ios_IostateS_");

   function operator_ae (uu_a : access u_Ios_Iostate; uu_b : u_Ios_Iostate) return access u_Ios_Iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:175
   pragma Import (CPP, operator_ae, "_ZStaNRSt12_Ios_IostateS_");

   function operator_xe (uu_a : access u_Ios_Iostate; uu_b : u_Ios_Iostate) return access u_Ios_Iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:179
   pragma Import (CPP, operator_xe, "_ZSteORSt12_Ios_IostateS_");

   subtype u_Ios_Seekdir is unsigned;
   u_S_beg : constant u_Ios_Seekdir := 0;
   u_S_cur : constant u_Ios_Seekdir := 1;
   u_S_end : constant u_Ios_Seekdir := 2;
   u_S_ios_seekdir_end : constant u_Ios_Seekdir := 65536;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:183

   type ios_base_u_M_local_word_array is array (0 .. 7) of aliased u_Words;
   type ios_base;
   type failure is record
      u_M_msg : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:228
   end record;
   pragma Convention (C_Pass_By_Copy, failure);
   type streampos is null record;
   pragma Convention (C_Pass_By_Copy, streampos);
   type u_Callback_list is record
      u_M_next : access u_Callback_list;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:465
      u_M_fn : event_callback;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:466
      u_M_index : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:467
      u_M_refcount : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_atomic_word_h.u_Atomic_word;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:468
   end record;
   pragma Convention (C_Pass_By_Copy, u_Callback_list);
   type u_Words is record
      u_M_pword : System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:503
      u_M_iword : aliased long;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:504
   end record;
   pragma Convention (C_Pass_By_Copy, u_Words);
   type Init is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, Init);
   package Class_ios_base is
      type ios_base is tagged limited record
         u_M_precision : aliased cpp_4_7_4_bits_postypes_h.streamsize;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:454
         u_M_width : aliased cpp_4_7_4_bits_postypes_h.streamsize;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:455
         u_M_flags : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:456
         u_M_exception : aliased iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:457
         u_M_streambuf_state : aliased iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:458
         u_M_callbacks : access u_Callback_list;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:492
         u_M_word_zero : aliased u_Words;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:509
         u_M_local_word : aliased ios_base_u_M_local_word_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:514
         u_M_word_size : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:517
         u_M_word : access u_Words;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:518
         u_M_ios_locale : aliased cpp_4_7_4_bits_locale_classes_h.Class_locale.locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:524
      end record;
      pragma Import (CPP, ios_base);

      procedure register_callback
        (this : access ios_base'Class;
         uu_fn : event_callback;
         uu_index : int);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:451
      pragma Import (CPP, register_callback, "_ZNSt8ios_base17register_callbackEPFvNS_5eventERS_iEi");

      --  skipped func _M_call_callbacks

      --  skipped func _M_dispose_callbacks

      --  skipped func _M_grow_words

      --  skipped func _M_init

      function flags (this : access constant ios_base'Class) return fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:553
      pragma Import (CPP, flags, "_ZNKSt8ios_base5flagsEv");

      function flags (this : access ios_base'Class; uu_fmtfl : fmtflags) return fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:564
      pragma Import (CPP, flags, "_ZNSt8ios_base5flagsESt13_Ios_Fmtflags");

      function setf (this : access ios_base'Class; uu_fmtfl : fmtflags) return fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:580
      pragma Import (CPP, setf, "_ZNSt8ios_base4setfESt13_Ios_Fmtflags");

      function setf
        (this : access ios_base'Class;
         uu_fmtfl : fmtflags;
         uu_mask : fmtflags) return fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:597
      pragma Import (CPP, setf, "_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_");

      procedure unsetf (this : access ios_base'Class; uu_mask : fmtflags);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:612
      pragma Import (CPP, unsetf, "_ZNSt8ios_base6unsetfESt13_Ios_Fmtflags");

      function precision (this : access constant ios_base'Class) return cpp_4_7_4_bits_postypes_h.streamsize;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:623
      pragma Import (CPP, precision, "_ZNKSt8ios_base9precisionEv");

      function precision (this : access ios_base'Class; uu_prec : cpp_4_7_4_bits_postypes_h.streamsize) return cpp_4_7_4_bits_postypes_h.streamsize;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:632
      pragma Import (CPP, precision, "_ZNSt8ios_base9precisionEl");

      function width (this : access constant ios_base'Class) return cpp_4_7_4_bits_postypes_h.streamsize;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:646
      pragma Import (CPP, width, "_ZNKSt8ios_base5widthEv");

      function width (this : access ios_base'Class; uu_wide : cpp_4_7_4_bits_postypes_h.streamsize) return cpp_4_7_4_bits_postypes_h.streamsize;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:655
      pragma Import (CPP, width, "_ZNSt8ios_base5widthEl");

      function sync_with_stdio (uu_sync : Extensions.bool) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:674
      pragma Import (CPP, sync_with_stdio, "_ZNSt8ios_base15sync_with_stdioEb");

      function imbue (this : access ios_base'Class; uu_loc : access constant cpp_4_7_4_bits_locale_classes_h.Class_locale.locale) return cpp_4_7_4_bits_locale_classes_h.Class_locale.locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:686
      pragma Import (CPP, imbue, "_ZNSt8ios_base5imbueERKSt6locale");

      function getloc (this : access constant ios_base'Class) return cpp_4_7_4_bits_locale_classes_h.Class_locale.locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:697
      pragma Import (CPP, getloc, "_ZNKSt8ios_base6getlocEv");

      --  skipped func _M_getloc

      function xalloc return int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:727
      pragma Import (CPP, xalloc, "_ZNSt8ios_base6xallocEv");

      function iword (this : access ios_base'Class; uu_ix : int) return access long;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:743
      pragma Import (CPP, iword, "_ZNSt8ios_base5iwordEi");

      function pword (this : access ios_base'Class; uu_ix : int) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:764
      pragma Import (CPP, pword, "_ZNSt8ios_base5pwordEi");

      procedure Delete_ios_base (this : access ios_base);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:780
      pragma Import (CPP, Delete_ios_base, "_ZNSt8ios_baseD1Ev");

      procedure deleting_dtor (this : access ios_base);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:780
      pragma Import (CPP, deleting_dtor, "_ZNSt8ios_baseD0Ev");

      function New_ios_base return ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:783
      pragma CPP_Constructor (New_ios_base, "_ZNSt8ios_baseC1Ev");

      function operator_as (this : access ios_base'Class; arg2 : access constant ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:791
      pragma Import (CPP, operator_as, "_ZNSt8ios_baseaSERKS_");

      boolalpha : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:260
      pragma Import (CPP, boolalpha, "_ZNSt8ios_base9boolalphaE");

      dec : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:263
      pragma Import (CPP, dec, "_ZNSt8ios_base3decE");

      fixed : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:266
      pragma Import (CPP, fixed, "_ZNSt8ios_base5fixedE");

      hex : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:269
      pragma Import (CPP, hex, "_ZNSt8ios_base3hexE");

      internal : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:274
      pragma Import (CPP, internal, "_ZNSt8ios_base8internalE");

      left : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:278
      pragma Import (CPP, left, "_ZNSt8ios_base4leftE");

      oct : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:281
      pragma Import (CPP, oct, "_ZNSt8ios_base3octE");

      right : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:285
      pragma Import (CPP, right, "_ZNSt8ios_base5rightE");

      scientific : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:288
      pragma Import (CPP, scientific, "_ZNSt8ios_base10scientificE");

      showbase : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:292
      pragma Import (CPP, showbase, "_ZNSt8ios_base8showbaseE");

      showpoint : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:296
      pragma Import (CPP, showpoint, "_ZNSt8ios_base9showpointE");

      showpos : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:299
      pragma Import (CPP, showpos, "_ZNSt8ios_base7showposE");

      skipws : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:302
      pragma Import (CPP, skipws, "_ZNSt8ios_base6skipwsE");

      unitbuf : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:305
      pragma Import (CPP, unitbuf, "_ZNSt8ios_base7unitbufE");

      uppercase : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:309
      pragma Import (CPP, uppercase, "_ZNSt8ios_base9uppercaseE");

      adjustfield : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:312
      pragma Import (CPP, adjustfield, "_ZNSt8ios_base11adjustfieldE");

      basefield : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:315
      pragma Import (CPP, basefield, "_ZNSt8ios_base9basefieldE");

      floatfield : aliased fmtflags;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:318
      pragma Import (CPP, floatfield, "_ZNSt8ios_base10floatfieldE");

      badbit : aliased iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:336
      pragma Import (CPP, badbit, "_ZNSt8ios_base6badbitE");

      eofbit : aliased iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:339
      pragma Import (CPP, eofbit, "_ZNSt8ios_base6eofbitE");

      failbit : aliased iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:344
      pragma Import (CPP, failbit, "_ZNSt8ios_base7failbitE");

      goodbit : aliased iostate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:347
      pragma Import (CPP, goodbit, "_ZNSt8ios_base7goodbitE");

      app : aliased openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:366
      pragma Import (CPP, app, "_ZNSt8ios_base3appE");

      ate : aliased openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:369
      pragma Import (CPP, ate, "_ZNSt8ios_base3ateE");

      binary : aliased openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:374
      pragma Import (CPP, binary, "_ZNSt8ios_base6binaryE");

      c_in : aliased openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:377
      pragma Import (CPP, c_in, "_ZNSt8ios_base2inE");

      c_out : aliased openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:380
      pragma Import (CPP, c_out, "_ZNSt8ios_base3outE");

      trunc : aliased openmode;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:383
      pragma Import (CPP, trunc, "_ZNSt8ios_base5truncE");

      beg : aliased seekdir;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:398
      pragma Import (CPP, beg, "_ZNSt8ios_base3begE");

      cur : aliased seekdir;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:401
      pragma Import (CPP, cur, "_ZNSt8ios_base3curE");

      c_end : aliased seekdir;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:404
      pragma Import (CPP, c_end, "_ZNSt8ios_base3endE");
   end;
   use Class_ios_base;
   function boolalpha (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:797
   pragma Import (CPP, boolalpha, "_ZSt9boolalphaRSt8ios_base");

   function noboolalpha (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:805
   pragma Import (CPP, noboolalpha, "_ZSt11noboolalphaRSt8ios_base");

   function showbase (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:813
   pragma Import (CPP, showbase, "_ZSt8showbaseRSt8ios_base");

   function noshowbase (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:821
   pragma Import (CPP, noshowbase, "_ZSt10noshowbaseRSt8ios_base");

   function showpoint (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:829
   pragma Import (CPP, showpoint, "_ZSt9showpointRSt8ios_base");

   function noshowpoint (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:837
   pragma Import (CPP, noshowpoint, "_ZSt11noshowpointRSt8ios_base");

   function showpos (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:845
   pragma Import (CPP, showpos, "_ZSt7showposRSt8ios_base");

   function noshowpos (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:853
   pragma Import (CPP, noshowpos, "_ZSt9noshowposRSt8ios_base");

   function skipws (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:861
   pragma Import (CPP, skipws, "_ZSt6skipwsRSt8ios_base");

   function noskipws (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:869
   pragma Import (CPP, noskipws, "_ZSt8noskipwsRSt8ios_base");

   function uppercase (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:877
   pragma Import (CPP, uppercase, "_ZSt9uppercaseRSt8ios_base");

   function nouppercase (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:885
   pragma Import (CPP, nouppercase, "_ZSt11nouppercaseRSt8ios_base");

   function unitbuf (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:893
   pragma Import (CPP, unitbuf, "_ZSt7unitbufRSt8ios_base");

   function nounitbuf (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:901
   pragma Import (CPP, nounitbuf, "_ZSt9nounitbufRSt8ios_base");

   function internal (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:910
   pragma Import (CPP, internal, "_ZSt8internalRSt8ios_base");

   function left (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:918
   pragma Import (CPP, left, "_ZSt4leftRSt8ios_base");

   function right (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:926
   pragma Import (CPP, right, "_ZSt5rightRSt8ios_base");

   function dec (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:935
   pragma Import (CPP, dec, "_ZSt3decRSt8ios_base");

   function hex (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:943
   pragma Import (CPP, hex, "_ZSt3hexRSt8ios_base");

   function oct (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:951
   pragma Import (CPP, oct, "_ZSt3octRSt8ios_base");

   function fixed (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:960
   pragma Import (CPP, fixed, "_ZSt5fixedRSt8ios_base");

   function scientific (uu_base : access ios_base'Class) return access ios_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/ios_base.h:968
   pragma Import (CPP, scientific, "_ZSt10scientificRSt8ios_base");

end cpp_4_7_4_bits_ios_base_h;
