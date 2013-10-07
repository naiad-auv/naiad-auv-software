pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_stl_vector_h;
with Interfaces.C.Strings;

package coreAda_cpp is

   img : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- coreAda.cpp:6
   pragma Import (C, img, "img");

   procedure appendImg_Wrap (src : Interfaces.C.Strings.chars_ptr);  -- coreAda.cpp:8
   pragma Import (CPP, appendImg_Wrap, "_Z14appendImg_WrapPc");

   procedure cvtColor_Wrap
     (src : int;
      dst : int;
      filter : int);  -- coreAda.cpp:13
   pragma Import (CPP, cvtColor_Wrap, "_Z13cvtColor_Wrapiii");

   procedure Canny_Wrap
     (src : int;
      dst : int;
      lThresh : int;
      hThresh : int;
      kernelSize : int);  -- coreAda.cpp:18
   pragma Import (CPP, Canny_Wrap, "_Z10Canny_Wrapiiiii");

   procedure imread_Wrap (name : Interfaces.C.Strings.chars_ptr);  -- coreAda.cpp:23
   pragma Import (CPP, imread_Wrap, "_Z11imread_WrapPc");

   function imwrite_Wrap (name : Interfaces.C.Strings.chars_ptr; src : int) return int;  -- coreAda.cpp:28
   pragma Import (CPP, imwrite_Wrap, "_Z12imwrite_WrapPci");

   procedure imshow_Wrap (name : Interfaces.C.Strings.chars_ptr; src : int);  -- coreAda.cpp:36
   pragma Import (CPP, imshow_Wrap, "_Z11imshow_WrapPci");

   procedure waitKey_Wrap;  -- coreAda.cpp:41
   pragma Import (CPP, waitKey_Wrap, "_Z12waitKey_Wrapv");

   function size_Wrap return int;  -- coreAda.cpp:46
   pragma Import (CPP, size_Wrap, "_Z9size_Wrapv");

end coreAda_cpp;
