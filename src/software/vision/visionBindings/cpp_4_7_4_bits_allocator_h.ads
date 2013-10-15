pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_bits_allocator_h is

   package uu_alloc_swap_unknown40056_0 is
      type uu_alloc_swap is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_swap);

      --  skipped func _S_do_it

   end;
   use uu_alloc_swap_unknown40056_0;



   package uu_alloc_neq_unknown70976_0 is
      type uu_alloc_neq is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_neq);

      --  skipped func _S_do_it

   end;
   use uu_alloc_neq_unknown70976_0;



end cpp_4_7_4_bits_allocator_h;
