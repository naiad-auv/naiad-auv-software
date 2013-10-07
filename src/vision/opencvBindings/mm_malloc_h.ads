pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;

package mm_malloc_h is

   function posix_memalign
     (uu_memptr : System.Address;
      uu_alignment : stddef_h.size_t;
      uu_size : stddef_h.size_t) return int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/mm_malloc.h:34
   pragma Import (C, posix_memalign, "posix_memalign");

   --  skipped func _mm_malloc

   --  skipped func _mm_free

end mm_malloc_h;
