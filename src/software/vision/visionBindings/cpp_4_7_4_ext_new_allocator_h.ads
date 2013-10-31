pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package cpp_4_7_4_ext_new_allocator_h is

   package new_allocator_wchar_t is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIwEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIwED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIwE7addressERw");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIwE7addressERKw");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIwE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIwE10deallocateEPwm");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIwE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access wchar_t);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIwE9constructEPwRKw");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIwE7destroyEPw");

   end;
   use new_allocator_wchar_t;

   package new_allocator_char is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIcEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIcED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIcE7addressERc");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIcE7addressERKc");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIcE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIcE10deallocateEPcm");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIcE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access char);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIcE9constructEPcRKc");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIcE7destroyEPc");

   end;
   use new_allocator_char;



end cpp_4_7_4_ext_new_allocator_h;
