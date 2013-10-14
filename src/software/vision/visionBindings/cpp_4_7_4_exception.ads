pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package cpp_4_7_4_exception is

   package Class_c_exception is
      type c_exception is tagged limited record
         null;
      end record;
      pragma Import (CPP, c_exception);

      function New_c_exception return c_exception;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:65
      pragma CPP_Constructor (New_c_exception, "_ZNSt9exceptionC1Ev");

      procedure Delete_c_exception (this : access c_exception);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:66
      pragma Import (CPP, Delete_c_exception, "_ZNSt9exceptionD1Ev");

      procedure deleting_dtor (this : access c_exception);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:66
      pragma Import (CPP, deleting_dtor, "_ZNSt9exceptionD0Ev");

      function what (this : access constant c_exception) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:70
      pragma Import (CPP, what, "_ZNKSt9exception4whatEv");
   end;
   use Class_c_exception;
   package Class_bad_exception is
      type bad_exception is limited new c_exception with record
         null;
      end record;
      pragma Import (CPP, bad_exception);

      function New_bad_exception return bad_exception;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:78
      pragma CPP_Constructor (New_bad_exception, "_ZNSt13bad_exceptionC1Ev");

      procedure Delete_bad_exception (this : access bad_exception);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:82
      pragma Import (CPP, Delete_bad_exception, "_ZNSt13bad_exceptionD1Ev");

      procedure deleting_dtor (this : access bad_exception);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:82
      pragma Import (CPP, deleting_dtor, "_ZNSt13bad_exceptionD0Ev");

      function what (this : access constant bad_exception) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:85
      pragma Import (CPP, what, "_ZNKSt13bad_exception4whatEv");
   end;
   use Class_bad_exception;
   type terminate_handler is access procedure;
   pragma Convention (C, terminate_handler);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:89

   type unexpected_handler is access procedure;
   pragma Convention (C, unexpected_handler);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:92

   function set_terminate (arg1 : terminate_handler) return terminate_handler;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:95
   pragma Import (CPP, set_terminate, "_ZSt13set_terminatePFvvE");

   procedure c_terminate;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:99
   pragma Import (CPP, c_terminate, "_ZSt9terminatev");

   function set_unexpected (arg1 : unexpected_handler) return unexpected_handler;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:102
   pragma Import (CPP, set_unexpected, "_ZSt14set_unexpectedPFvvE");

   procedure unexpected;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:106
   pragma Import (CPP, unexpected, "_ZSt10unexpectedv");

   function uncaught_exception return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/exception:119
   pragma Import (CPP, uncaught_exception, "_ZSt18uncaught_exceptionv");

end cpp_4_7_4_exception;
