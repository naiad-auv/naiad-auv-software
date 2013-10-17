pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_bits_allocator_h is

<<<<<<< HEAD
   package uu_alloc_swap_unknown109688_0 is
=======
   package uu_alloc_swap_unknown179320_0 is
>>>>>>> 90003bf92f5d4d04a747536e30e3c2520778863e
      type uu_alloc_swap is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_swap);

      --  skipped func _S_do_it

   end;
<<<<<<< HEAD
   use uu_alloc_swap_unknown109688_0;



   package uu_alloc_neq_unknown140608_0 is
=======
   use uu_alloc_swap_unknown179320_0;



   package uu_alloc_neq_unknown210240_0 is
>>>>>>> 90003bf92f5d4d04a747536e30e3c2520778863e
      type uu_alloc_neq is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_neq);

      --  skipped func _S_do_it

   end;
<<<<<<< HEAD
   use uu_alloc_neq_unknown140608_0;
=======
   use uu_alloc_neq_unknown210240_0;
>>>>>>> 90003bf92f5d4d04a747536e30e3c2520778863e



end cpp_4_7_4_bits_allocator_h;
