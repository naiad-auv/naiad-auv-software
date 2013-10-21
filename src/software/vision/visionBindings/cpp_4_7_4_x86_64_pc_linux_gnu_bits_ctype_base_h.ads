pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_x86_64_pc_linux_gnu_bits_ctype_base_h is

   package Class_ctype_base is
      type ctype_base is record
         null;
      end record;
      pragma Convention (C_Pass_By_Copy, ctype_base);

      upper : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:50
      pragma Import (CPP, upper, "_ZNSt10ctype_base5upperE");

      lower : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:51
      pragma Import (CPP, lower, "_ZNSt10ctype_base5lowerE");

      alpha : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:52
      pragma Import (CPP, alpha, "_ZNSt10ctype_base5alphaE");

      digit : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:53
      pragma Import (CPP, digit, "_ZNSt10ctype_base5digitE");

      xdigit : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:54
      pragma Import (CPP, xdigit, "_ZNSt10ctype_base6xdigitE");

      space : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:55
      pragma Import (CPP, space, "_ZNSt10ctype_base5spaceE");

      print : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:56
      pragma Import (CPP, print, "_ZNSt10ctype_base5printE");

      graph : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:57
      pragma Import (CPP, graph, "_ZNSt10ctype_base5graphE");

      cntrl : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:58
      pragma Import (CPP, cntrl, "_ZNSt10ctype_base5cntrlE");

      punct : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:59
      pragma Import (CPP, punct, "_ZNSt10ctype_base5punctE");

      alnum : aliased mask;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/x86_64-pc-linux-gnu/bits/ctype_base.h:60
      pragma Import (CPP, alnum, "_ZNSt10ctype_base5alnumE");
   end;
   use Class_ctype_base;
end cpp_4_7_4_x86_64_pc_linux_gnu_bits_ctype_base_h;
