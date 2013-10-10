pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_exception;
with Interfaces.C.Strings;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;
with System;

package cpp_4_7_4_new is

   package Class_bad_alloc is
      type bad_alloc is limited new cpp_4_7_4_exception.Class_c_exception.c_exception with record
         null;
      end record;
      pragma Import (CPP, bad_alloc);

      function New_bad_alloc return bad_alloc;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:59
      pragma CPP_Constructor (New_bad_alloc, "_ZNSt9bad_allocC1Ev");

      procedure Delete_bad_alloc (this : access bad_alloc);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:63
      pragma Import (CPP, Delete_bad_alloc, "_ZNSt9bad_allocD1Ev");

      procedure deleting_dtor (this : access bad_alloc);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:63
      pragma Import (CPP, deleting_dtor, "_ZNSt9bad_allocD0Ev");

      function what (this : access constant bad_alloc) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:66
      pragma Import (CPP, what, "_ZNKSt9bad_alloc4whatEv");
   end;
   use Class_bad_alloc;
   type nothrow_t is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, nothrow_t);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:69

   nothrow : aliased nothrow_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:71
   pragma Import (CPP, nothrow, "_ZSt7nothrow");

   type new_handler is access procedure;
   pragma Convention (C, new_handler);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:75

   function set_new_handler (arg1 : new_handler) return new_handler;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:79
   pragma Import (CPP, set_new_handler, "_ZSt15set_new_handlerPFvvE");

   function operator_new (arg1 : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:93
   pragma Import (CPP, operator_new, "_Znwm");

   function operator_new_ob (arg1 : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:95
   pragma Import (CPP, operator_new_ob, "_Znam");

   procedure operator_delete (arg1 : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:97
   pragma Import (CPP, operator_delete, "_ZdlPv");

   procedure operator_delete_ob (arg1 : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:99
   pragma Import (CPP, operator_delete_ob, "_ZdaPv");

   function operator_new (arg1 : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t; arg2 : access constant nothrow_t) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:101
   pragma Import (CPP, operator_new, "_ZnwmRKSt9nothrow_t");

   function operator_new_ob (arg1 : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t; arg2 : access constant nothrow_t) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:103
   pragma Import (CPP, operator_new_ob, "_ZnamRKSt9nothrow_t");

   procedure operator_delete (arg1 : System.Address; arg2 : access constant nothrow_t);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:105
   pragma Import (CPP, operator_delete, "_ZdlPvRKSt9nothrow_t");

   procedure operator_delete_ob (arg1 : System.Address; arg2 : access constant nothrow_t);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:107
   pragma Import (CPP, operator_delete_ob, "_ZdaPvRKSt9nothrow_t");

   function operator_new (arg1 : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t; uu_p : System.Address) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:111
   pragma Import (CPP, operator_new, "_ZnwmPv");

   function operator_new_ob (arg1 : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t; uu_p : System.Address) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:113
   pragma Import (CPP, operator_new_ob, "_ZnamPv");

   procedure operator_delete (arg1 : System.Address; arg2 : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:117
   pragma Import (CPP, operator_delete, "_ZdlPvS_");

   procedure operator_delete_ob (arg1 : System.Address; arg2 : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/new:118
   pragma Import (CPP, operator_delete_ob, "_ZdaPvS_");

end cpp_4_7_4_new;
