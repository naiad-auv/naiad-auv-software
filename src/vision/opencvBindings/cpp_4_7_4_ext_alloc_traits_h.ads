pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with cpp_4_7_4_bits_allocator_h;

package cpp_4_7_4_ext_alloc_traits_h is

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv3MatEEE8allocateERS3_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv3MatEEE10deallocateERS3_PS2_m");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv3MatEEE7destroyERS3_PS2_");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv3MatEEE8max_sizeERKS3_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv8Subdiv2D8QuadEdgeEEE8allocateERS4_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv8Subdiv2D8QuadEdgeEEE10deallocateERS4_PS3_m");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv8Subdiv2D8QuadEdgeEEE7destroyERS4_PS3_");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv8Subdiv2D8QuadEdgeEEE8max_sizeERKS4_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv8Subdiv2D6VertexEEE8allocateERS4_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv8Subdiv2D6VertexEEE10deallocateERS4_PS3_m");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv8Subdiv2D6VertexEEE7destroyERS4_PS3_");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv8Subdiv2D6VertexEEE8max_sizeERKS4_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaIPhEE8allocateERS2_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaIPhEE10deallocateERS2_PS1_m");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaIPhEE7destroyERS2_PS1_");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaIPhEE8max_sizeERKS2_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv6KDTree4NodeEEE8allocateERS4_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv6KDTree4NodeEEE10deallocateERS4_PS3_m");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv6KDTree4NodeEEE7destroyERS4_PS3_");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaIN2cv6KDTree4NodeEEE8max_sizeERKS4_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaIcEE8allocateERS1_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaIcEE10deallocateERS1_Pcm");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaIcEE7destroyERS1_Pc");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaIcEE8max_sizeERKS1_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaImEE8allocateERS1_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaImEE10deallocateERS1_Pmm");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaImEE7destroyERS1_Pm");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaImEE8max_sizeERKS1_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaIhEE8allocateERS1_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaIhEE10deallocateERS1_Phm");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaIhEE7destroyERS1_Ph");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaIhEE8max_sizeERKS1_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;

   package uu_alloc_traits_Class_allocator.allocator is
      type uu_alloc_traits is limited record
         null;
      end record;
      pragma Import (CPP, uu_alloc_traits);

      function allocate (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_n : size_type) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:195
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx14__alloc_traitsISaIiEE8allocateERS1_m");

      procedure deallocate
        (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator;
         uu_p : pointer;
         uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:198
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx14__alloc_traitsISaIiEE10deallocateERS1_Pim");

      procedure destroy (uu_a : access cpp_4_7_4_bits_allocator_h.Class_allocator.allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:205
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx14__alloc_traitsISaIiEE7destroyERS1_Pi");

      function max_size (uu_a : access constant cpp_4_7_4_bits_allocator_h.Class_allocator.allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/alloc_traits.h:208
      pragma Import (CPP, max_size, "_ZN9__gnu_cxx14__alloc_traitsISaIiEE8max_sizeERKS1_");

      --  skipped func _S_select_on_copy

      --  skipped func _S_on_swap

   end;
   use uu_alloc_traits_Class_allocator.allocator;



end cpp_4_7_4_ext_alloc_traits_h;
