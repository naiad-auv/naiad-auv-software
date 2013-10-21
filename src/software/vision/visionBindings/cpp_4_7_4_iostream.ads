pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_iosfwd;

package cpp_4_7_4_iostream is

   cin : aliased cpp_4_7_4_iosfwd.Class_istream.istream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/iostream:61
   pragma Import (CPP, cin, "_ZSt3cin");

   cout : aliased cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/iostream:62
   pragma Import (CPP, cout, "_ZSt4cout");

   cerr : aliased cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/iostream:63
   pragma Import (CPP, cerr, "_ZSt4cerr");

   clog : aliased cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/iostream:64
   pragma Import (CPP, clog, "_ZSt4clog");

   wcin : aliased cpp_4_7_4_iosfwd.Class_wistream.wistream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/iostream:67
   pragma Import (CPP, wcin, "_ZSt4wcin");

   wcout : aliased cpp_4_7_4_iosfwd.Class_wostream.wostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/iostream:68
   pragma Import (CPP, wcout, "_ZSt5wcout");

   wcerr : aliased cpp_4_7_4_iosfwd.Class_wostream.wostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/iostream:69
   pragma Import (CPP, wcerr, "_ZSt5wcerr");

   wclog : aliased cpp_4_7_4_iosfwd.Class_wostream.wostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/iostream:70
   pragma Import (CPP, wclog, "_ZSt5wclog");

end cpp_4_7_4_iostream;
