pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;

package cpp_4_7_4_bits_postypes_h is

   subtype streamoff is long;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/postypes.h:90

   subtype streamsize is cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/postypes.h:100

   --  skipped empty struct streampos

   --  skipped empty struct wstreampos

end cpp_4_7_4_bits_postypes_h;
