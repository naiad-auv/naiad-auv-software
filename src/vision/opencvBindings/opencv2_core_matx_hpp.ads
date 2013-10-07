pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package opencv2_core_matx_hpp is

   package Class_Matx_AddOp is
      type Matx_AddOp is limited record
         null;
      end record;
      pragma Import (CPP, Matx_AddOp);

      function New_Matx_AddOp return Matx_AddOp;  -- /usr/local/include/opencv2/core/matx.hpp:76
      pragma CPP_Constructor (New_Matx_AddOp, "_ZN2cv10Matx_AddOpC1Ev");


   end;
   use Class_Matx_AddOp;
   package Class_Matx_SubOp is
      type Matx_SubOp is limited record
         null;
      end record;
      pragma Import (CPP, Matx_SubOp);

      function New_Matx_SubOp return Matx_SubOp;  -- /usr/local/include/opencv2/core/matx.hpp:77
      pragma CPP_Constructor (New_Matx_SubOp, "_ZN2cv10Matx_SubOpC1Ev");


   end;
   use Class_Matx_SubOp;
   package Class_Matx_ScaleOp is
      type Matx_ScaleOp is limited record
         null;
      end record;
      pragma Import (CPP, Matx_ScaleOp);

      function New_Matx_ScaleOp return Matx_ScaleOp;  -- /usr/local/include/opencv2/core/matx.hpp:78
      pragma CPP_Constructor (New_Matx_ScaleOp, "_ZN2cv12Matx_ScaleOpC1Ev");


   end;
   use Class_Matx_ScaleOp;
   type Matx_MulOp is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, Matx_MulOp);  -- /usr/local/include/opencv2/core/matx.hpp:79

   type Matx_DivOp is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, Matx_DivOp);  -- /usr/local/include/opencv2/core/matx.hpp:80

   package Class_Matx_MatMulOp is
      type Matx_MatMulOp is limited record
         null;
      end record;
      pragma Import (CPP, Matx_MatMulOp);

      function New_Matx_MatMulOp return Matx_MatMulOp;  -- /usr/local/include/opencv2/core/matx.hpp:81
      pragma CPP_Constructor (New_Matx_MatMulOp, "_ZN2cv13Matx_MatMulOpC1Ev");


   end;
   use Class_Matx_MatMulOp;
   type Matx_TOp is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, Matx_TOp);  -- /usr/local/include/opencv2/core/matx.hpp:82

   --  skipped empty struct Matx12f

   --  skipped empty struct Matx12d

   --  skipped empty struct Matx13f

   --  skipped empty struct Matx13d

   --  skipped empty struct Matx14f

   --  skipped empty struct Matx14d

   --  skipped empty struct Matx16f

   --  skipped empty struct Matx16d

   type Matx;
   type Matx_val_array is array (0 .. 1) of aliased float;
   type Matx_val_array is array (0 .. 1) of aliased float;
   type mat_type;
   type mat_type_val_array is array (0 .. 1) of aliased float;
   type Matx;
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   subtype Matx21f is Matx;

   type Matx;
   type Matx_val_array is array (0 .. 1) of aliased double;
   type Matx_val_array is array (0 .. 1) of aliased double;
   type mat_type;
   type mat_type_val_array is array (0 .. 1) of aliased double;
   type Matx;
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   subtype Matx21d is Matx;

   type Matx;
   type Matx_val_array is array (0 .. 2) of aliased float;
   type Matx_val_array is array (0 .. 2) of aliased float;
   type mat_type;
   type mat_type_val_array is array (0 .. 2) of aliased float;
   type Matx;
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   subtype Matx31f is Matx;

   type Matx;
   type Matx_val_array is array (0 .. 2) of aliased double;
   type Matx_val_array is array (0 .. 2) of aliased double;
   type mat_type;
   type mat_type_val_array is array (0 .. 2) of aliased double;
   type Matx;
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   subtype Matx31d is Matx;

   type Matx;
   type Matx_val_array is array (0 .. 3) of aliased float;
   type Matx_val_array is array (0 .. 3) of aliased float;
   type mat_type;
   type mat_type_val_array is array (0 .. 3) of aliased float;
   type Matx;
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   subtype Matx41f is Matx;

   type Matx;
   type Matx_val_array is array (0 .. 3) of aliased double;
   type Matx_val_array is array (0 .. 3) of aliased double;
   type mat_type;
   type mat_type_val_array is array (0 .. 3) of aliased double;
   type Matx;
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   subtype Matx41d is Matx;

   --  skipped empty struct Matx61f

   --  skipped empty struct Matx61d

   --  skipped empty struct Matx22f

   --  skipped empty struct Matx22d

   --  skipped empty struct Matx23f

   --  skipped empty struct Matx23d

   --  skipped empty struct Matx32f

   --  skipped empty struct Matx32d

   --  skipped empty struct Matx33f

   --  skipped empty struct Matx33d

   --  skipped empty struct Matx34f

   --  skipped empty struct Matx34d

   --  skipped empty struct Matx43f

   --  skipped empty struct Matx43d

   --  skipped empty struct Matx44f

   type Matx;
   type Matx_val_array is array (0 .. 15) of aliased double;
   type Matx_val_array is array (0 .. 15) of aliased double;
   type mat_type;
   type mat_type_val_array is array (0 .. 15) of aliased double;
   type Matx;
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type Matx_val_array is array (0 .. 3) of aliased double;
   type diag_type;
   type Matx is record
      val : aliased diag_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type mat_type is record
      val : aliased diag_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is record
      val : aliased mat_type_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type diag_type is record
      val : aliased Matx_val_array;  -- /usr/local/include/opencv2/core/matx.hpp:185
   end record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   subtype Matx44d is Matx;

   --  skipped empty struct Matx66f

   --  skipped empty struct Matx66d

   --  skipped empty struct Vec2b

   --  skipped empty struct Vec3b

   --  skipped empty struct Vec4b

   --  skipped empty struct Vec2s

   --  skipped empty struct Vec3s

   --  skipped empty struct Vec4s

   --  skipped empty struct Vec2w

   --  skipped empty struct Vec3w

   --  skipped empty struct Vec4w

   type Vec;
   subtype Vec2i is Vec;

   --  skipped empty struct Vec3i

   --  skipped empty struct Vec4i

   --  skipped empty struct Vec6i

   --  skipped empty struct Vec8i

   type Vec;
   subtype Vec2f is Vec;

   type Vec;
   subtype Vec3f is Vec;

   type Vec;
   subtype Vec4f is Vec;

   --  skipped empty struct Vec6f

   type Vec;
   subtype Vec2d is Vec;

   type Vec;
   subtype Vec3d is Vec;

   type Vec;
   subtype Vec4d is Vec;

   --  skipped empty struct Vec6d

end opencv2_core_matx_hpp;
