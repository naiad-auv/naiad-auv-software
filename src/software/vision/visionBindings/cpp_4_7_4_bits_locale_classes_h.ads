pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_atomic_word_h;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;
with System;
with Interfaces.C.Strings;
with cpp_4_7_4_bits_stringfwd_h;
with Interfaces.C.Extensions;

package cpp_4_7_4_bits_locale_classes_h is

   type u_Impl;
   type locale;
   subtype locale_u_S_c_name_array is Interfaces.C.char_array (0 .. 1);
   type facet is record
      u_M_refcount : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_atomic_word_h.u_Atomic_word;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:346
   end record;
   pragma Convention (C_Pass_By_Copy, facet);
   type id is record
      u_M_index : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:455
   end record;
   pragma Convention (C_Pass_By_Copy, id);
   type u_Impl is record
      u_M_refcount : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_atomic_word_h.u_Atomic_word;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:497
      u_M_facets : System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:498
      u_M_facets_size : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:499
      u_M_caches : System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:500
      u_M_names : System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:501
   end record;
   pragma Convention (C_Pass_By_Copy, u_Impl);
   package Class_locale is
      type locale is limited record
         u_M_impl : access u_Impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:282
      end record;
      pragma Import (CPP, locale);

      function New_locale return locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:119
      pragma CPP_Constructor (New_locale, "_ZNSt6localeC1Ev");

      function New_locale (uu_s : Interfaces.C.Strings.chars_ptr) return locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:139
      pragma CPP_Constructor (New_locale, "_ZNSt6localeC1EPKc");

      function New_locale
        (uu_base : System.Address;
         uu_s : Interfaces.C.Strings.chars_ptr;
         uu_cat : category) return locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:153
      pragma CPP_Constructor (New_locale, "_ZNSt6localeC1ERKS_PKci");

      function New_locale
        (uu_base : System.Address;
         uu_add : System.Address;
         uu_cat : category) return locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:166
      pragma CPP_Constructor (New_locale, "_ZNSt6localeC1ERKS_S1_i");

      procedure Delete_locale (this : access locale);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:183
      pragma Import (CPP, Delete_locale, "_ZNSt6localeD1Ev");

      function operator_as (this : access locale; uu_other : System.Address) return access constant locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:194
      pragma Import (CPP, operator_as, "_ZNSt6localeaSERKS_");

      function name (this : access constant locale) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:218
      pragma Import (CPP, name, "_ZNKSt6locale4nameEv");

      function operator_eq (this : access constant locale; uu_other : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:228
      pragma Import (CPP, operator_eq, "_ZNKSt6localeeqERKS_");

      function operator_ne (this : access constant locale; uu_other : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:237
      pragma Import (CPP, operator_ne, "_ZNKSt6localeneERKS_");

      function global (uu_loc : System.Address) return locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:272
      pragma Import (CPP, global, "_ZNSt6locale6globalERKS_");

      function classic return access constant locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:278
      pragma Import (CPP, classic, "_ZNSt6locale7classicEv");

      function New_locale (arg1 : access u_Impl) return locale;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:313
      pragma CPP_Constructor (New_locale, "_ZNSt6localeC1EPNS_5_ImplE");

      --  skipped func _S_initialize

      --  skipped func _S_initialize_once

      --  skipped func _S_normalize_category

      --  skipped func _M_coalesce

      none : aliased category;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:100
      pragma Import (CPP, none, "_ZNSt6locale4noneE");

      ctype : aliased category;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:101
      pragma Import (CPP, ctype, "_ZNSt6locale5ctypeE");

      numeric : aliased category;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:102
      pragma Import (CPP, numeric, "_ZNSt6locale7numericE");

      collate : aliased category;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:103
      pragma Import (CPP, collate, "_ZNSt6locale7collateE");

      time : aliased category;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:104
      pragma Import (CPP, time, "_ZNSt6locale4timeE");

      monetary : aliased category;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:105
      pragma Import (CPP, monetary, "_ZNSt6locale8monetaryE");

      messages : aliased category;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:106
      pragma Import (CPP, messages, "_ZNSt6locale8messagesE");

      c_all : aliased category;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_classes.h:108
      pragma Import (CPP, c_all, "_ZNSt6locale3allE");








   end;
   use Class_locale;
end cpp_4_7_4_bits_locale_classes_h;
