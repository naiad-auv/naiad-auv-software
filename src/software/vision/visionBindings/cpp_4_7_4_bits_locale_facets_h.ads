pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_ctype_base_h;
with Interfaces.C.Extensions;
with System;
with Interfaces.C.Strings;

package cpp_4_7_4_bits_locale_facets_h is

   package uu_ctype_abstract_base_wchar_t is
      type uu_ctype_abstract_base is tagged limited record
         null;
      end record;
      pragma Import (CPP, uu_ctype_abstract_base);

      function c_is
        (this : access constant uu_ctype_abstract_base'Class;
         uu_m : cpp_4_7_4_x86_64_pc_linux_gnu_bits_ctype_base_h.mask;
         uu_c : char_type) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:164
      pragma Import (CPP, c_is, "_ZNKSt21__ctype_abstract_baseIwE2isEtw");

      function c_is
        (this : access constant uu_ctype_abstract_base'Class;
         uu_lo : System.Address;
         uu_hi : System.Address;
         uu_vec : access cpp_4_7_4_x86_64_pc_linux_gnu_bits_ctype_base_h.mask) return access char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:181
      pragma Import (CPP, c_is, "_ZNKSt21__ctype_abstract_baseIwE2isEPKwS2_Pt");

      function scan_is
        (this : access constant uu_ctype_abstract_base'Class;
         uu_m : cpp_4_7_4_x86_64_pc_linux_gnu_bits_ctype_base_h.mask;
         uu_lo : System.Address;
         uu_hi : System.Address) return access char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:197
      pragma Import (CPP, scan_is, "_ZNKSt21__ctype_abstract_baseIwE7scan_isEtPKwS2_");

      function scan_not
        (this : access constant uu_ctype_abstract_base'Class;
         uu_m : cpp_4_7_4_x86_64_pc_linux_gnu_bits_ctype_base_h.mask;
         uu_lo : System.Address;
         uu_hi : System.Address) return access char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:213
      pragma Import (CPP, scan_not, "_ZNKSt21__ctype_abstract_baseIwE8scan_notEtPKwS2_");

      function toupper (this : access constant uu_ctype_abstract_base'Class; uu_c : char_type) return char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:227
      pragma Import (CPP, toupper, "_ZNKSt21__ctype_abstract_baseIwE7toupperEw");

      function toupper
        (this : access constant uu_ctype_abstract_base'Class;
         uu_lo : System.Address;
         uu_hi : System.Address) return access char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:242
      pragma Import (CPP, toupper, "_ZNKSt21__ctype_abstract_baseIwE7toupperEPwPKw");

      function tolower (this : access constant uu_ctype_abstract_base'Class; uu_c : char_type) return char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:256
      pragma Import (CPP, tolower, "_ZNKSt21__ctype_abstract_baseIwE7tolowerEw");

      function tolower
        (this : access constant uu_ctype_abstract_base'Class;
         uu_lo : System.Address;
         uu_hi : System.Address) return access char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:271
      pragma Import (CPP, tolower, "_ZNKSt21__ctype_abstract_baseIwE7tolowerEPwPKw");

      function widen (this : access constant uu_ctype_abstract_base'Class; uu_c : char) return char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:288
      pragma Import (CPP, widen, "_ZNKSt21__ctype_abstract_baseIwE5widenEc");

      function widen
        (this : access constant uu_ctype_abstract_base'Class;
         uu_lo : Interfaces.C.Strings.chars_ptr;
         uu_hi : Interfaces.C.Strings.chars_ptr;
         uu_to : System.Address) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:307
      pragma Import (CPP, widen, "_ZNKSt21__ctype_abstract_baseIwE5widenEPKcS2_Pw");

      function narrow
        (this : access constant uu_ctype_abstract_base'Class;
         uu_c : char_type;
         uu_dfault : char) return char;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:326
      pragma Import (CPP, narrow, "_ZNKSt21__ctype_abstract_baseIwE6narrowEwc");

      function narrow
        (this : access constant uu_ctype_abstract_base'Class;
         uu_lo : System.Address;
         uu_hi : System.Address;
         uu_dfault : char;
         uu_to : Interfaces.C.Strings.chars_ptr) return access char_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/locale_facets.h:348
      pragma Import (CPP, narrow, "_ZNKSt21__ctype_abstract_baseIwE6narrowEPKwS2_cPc");

      procedure ctype_abstract_baseend cpp_4_7_4_bits_locale_facets_h;
