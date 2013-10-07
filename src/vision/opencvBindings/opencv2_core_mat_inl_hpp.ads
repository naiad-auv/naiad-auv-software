pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_mat_hpp;
with Interfaces.C.Extensions;
with stddef_h;

package opencv2_core_mat_inl_hpp is

   function operator_eq (a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2105
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_16MatConstIteratorES2_");

   function operator_ne (a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2111
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_16MatConstIteratorES2_");

   function operator_lt (a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2117
   pragma Import (CPP, operator_lt, "_ZN2cvltERKNS_16MatConstIteratorES2_");

   function operator_gt (a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2123
   pragma Import (CPP, operator_gt, "_ZN2cvgtERKNS_16MatConstIteratorES2_");

   function operator_le (a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2129
   pragma Import (CPP, operator_le, "_ZN2cvleERKNS_16MatConstIteratorES2_");

   function operator_ge (a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2135
   pragma Import (CPP, operator_ge, "_ZN2cvgeERKNS_16MatConstIteratorES2_");

   function operator_m (b : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator) return stddef_h.ptrdiff_t;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2141
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_16MatConstIteratorES2_");

   function operator_p (a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; ofs : stddef_h.ptrdiff_t) return opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2152
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_16MatConstIteratorEl");

   function operator_p (ofs : stddef_h.ptrdiff_t; a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator) return opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2159
   pragma Import (CPP, operator_p, "_ZN2cvplElRKNS_16MatConstIteratorE");

   function operator_m (a : access constant opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator; ofs : stddef_h.ptrdiff_t) return opencv2_core_mat_hpp.Class_MatConstIterator.MatConstIterator;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2166
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_16MatConstIteratorEl");

   function operator_eq (it1 : access constant opencv2_core_mat_hpp.Class_SparseMatConstIterator.SparseMatConstIterator; it2 : access constant opencv2_core_mat_hpp.Class_SparseMatConstIterator.SparseMatConstIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2514
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_22SparseMatConstIteratorES2_");

   function operator_ne (it1 : access constant opencv2_core_mat_hpp.Class_SparseMatConstIterator.SparseMatConstIterator; it2 : access constant opencv2_core_mat_hpp.Class_SparseMatConstIterator.SparseMatConstIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2520
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_22SparseMatConstIteratorES2_");

   function operator_pa (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2848
   pragma Import (CPP, operator_pa, "_ZN2cvpLERNS_3MatERKNS_7MatExprE");

   function operator_pa (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2855
   pragma Import (CPP, operator_pa, "_ZN2cvpLERKNS_3MatERKNS_7MatExprE");

   function operator_ma (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2876
   pragma Import (CPP, operator_ma, "_ZN2cvmIERNS_3MatERKNS_7MatExprE");

   function operator_ma (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2883
   pragma Import (CPP, operator_ma, "_ZN2cvmIERKNS_3MatERKNS_7MatExprE");

   function operator_ta (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2904
   pragma Import (CPP, operator_ta, "_ZN2cvmLERNS_3MatERKNS_7MatExprE");

   function operator_ta (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2911
   pragma Import (CPP, operator_ta, "_ZN2cvmLERKNS_3MatERKNS_7MatExprE");

   function operator_da (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2932
   pragma Import (CPP, operator_da, "_ZN2cvdVERNS_3MatERKNS_7MatExprE");

   function operator_da (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/mat.inl.hpp:2939
   pragma Import (CPP, operator_da, "_ZN2cvdVERKNS_3MatERKNS_7MatExprE");

end opencv2_core_mat_inl_hpp;
