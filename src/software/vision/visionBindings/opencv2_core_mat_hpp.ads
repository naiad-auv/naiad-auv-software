pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;
with opencv2_core_core_hpp;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;

package opencv2_core_mat_hpp is

   function cvarrToMatND
     (arr : System.Address;
      copyData : Extensions.bool;
      coiMode : int) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:746
   pragma Import (CPP, cvarrToMatND, "_ZN2cvL12cvarrToMatNDEPKvbi");

   package Class_MatOp is
      type MatOp is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, MatOp);

      function New_MatOp return MatOp is abstract;  -- /usr/include/opencv2/core/mat.hpp:1128
      pragma CPP_Constructor (New_MatOp, "_ZN2cv5MatOpC1Ev");

      procedure Delete_MatOp (this : access MatOp);  -- /usr/include/opencv2/core/mat.hpp:1129
      pragma Import (CPP, Delete_MatOp, "_ZN2cv5MatOpD1Ev");

      procedure deleting_dtor (this : access MatOp);  -- /usr/include/opencv2/core/mat.hpp:1129
      pragma Import (CPP, deleting_dtor, "_ZN2cv5MatOpD0Ev");

      function elementWise (this : access constant MatOp; expr : System.Address) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:1131
      pragma Import (CPP, elementWise, "_ZNK2cv5MatOp11elementWiseERKNS_7MatExprE");

      procedure assign
        (this : access constant MatOp;
         expr : System.Address;
         m : access opencv2_core_core_hpp.Class_Mat.Mat;
         c_type : int) is abstract;  -- /usr/include/opencv2/core/mat.hpp:1132

      procedure roi
        (this : access constant MatOp;
         expr : System.Address;
         rowRange : access constant opencv2_core_core_hpp.Class_c_Range.c_Range;
         colRange : access constant opencv2_core_core_hpp.Class_c_Range.c_Range;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1133
      pragma Import (CPP, roi, "_ZNK2cv5MatOp3roiERKNS_7MatExprERKNS_5RangeES6_RS1_");

      procedure diag
        (this : access constant MatOp;
         expr : System.Address;
         d : int;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1135
      pragma Import (CPP, diag, "_ZNK2cv5MatOp4diagERKNS_7MatExprEiRS1_");

      procedure augAssignAdd
        (this : access constant MatOp;
         expr : System.Address;
         m : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/mat.hpp:1136
      pragma Import (CPP, augAssignAdd, "_ZNK2cv5MatOp12augAssignAddERKNS_7MatExprERNS_3MatE");

      procedure augAssignSubtract
        (this : access constant MatOp;
         expr : System.Address;
         m : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/mat.hpp:1137
      pragma Import (CPP, augAssignSubtract, "_ZNK2cv5MatOp17augAssignSubtractERKNS_7MatExprERNS_3MatE");

      procedure augAssignMultiply
        (this : access constant MatOp;
         expr : System.Address;
         m : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/mat.hpp:1138
      pragma Import (CPP, augAssignMultiply, "_ZNK2cv5MatOp17augAssignMultiplyERKNS_7MatExprERNS_3MatE");

      procedure augAssignDivide
        (this : access constant MatOp;
         expr : System.Address;
         m : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/mat.hpp:1139
      pragma Import (CPP, augAssignDivide, "_ZNK2cv5MatOp15augAssignDivideERKNS_7MatExprERNS_3MatE");

      procedure augAssignAnd
        (this : access constant MatOp;
         expr : System.Address;
         m : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/mat.hpp:1140
      pragma Import (CPP, augAssignAnd, "_ZNK2cv5MatOp12augAssignAndERKNS_7MatExprERNS_3MatE");

      procedure augAssignOr
        (this : access constant MatOp;
         expr : System.Address;
         m : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/mat.hpp:1141
      pragma Import (CPP, augAssignOr, "_ZNK2cv5MatOp11augAssignOrERKNS_7MatExprERNS_3MatE");

      procedure augAssignXor
        (this : access constant MatOp;
         expr : System.Address;
         m : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/mat.hpp:1142
      pragma Import (CPP, augAssignXor, "_ZNK2cv5MatOp12augAssignXorERKNS_7MatExprERNS_3MatE");

      procedure add
        (this : access constant MatOp;
         expr1 : System.Address;
         expr2 : System.Address;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1144
      pragma Import (CPP, add, "_ZNK2cv5MatOp3addERKNS_7MatExprES3_RS1_");

      procedure add
        (this : access constant MatOp;
         expr1 : System.Address;
         s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1145
      pragma Import (CPP, add, "_ZNK2cv5MatOp3addERKNS_7MatExprERKNS_7Scalar_IdEERS1_");

      procedure subtract
        (this : access constant MatOp;
         expr1 : System.Address;
         expr2 : System.Address;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1147
      pragma Import (CPP, subtract, "_ZNK2cv5MatOp8subtractERKNS_7MatExprES3_RS1_");

      procedure subtract
        (this : access constant MatOp;
         s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar;
         expr : System.Address;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1148
      pragma Import (CPP, subtract, "_ZNK2cv5MatOp8subtractERKNS_7Scalar_IdEERKNS_7MatExprERS5_");

      procedure multiply
        (this : access constant MatOp;
         expr1 : System.Address;
         expr2 : System.Address;
         res : System.Address;
         scale : double);  -- /usr/include/opencv2/core/mat.hpp:1150
      pragma Import (CPP, multiply, "_ZNK2cv5MatOp8multiplyERKNS_7MatExprES3_RS1_d");

      procedure multiply
        (this : access constant MatOp;
         expr1 : System.Address;
         s : double;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1151
      pragma Import (CPP, multiply, "_ZNK2cv5MatOp8multiplyERKNS_7MatExprEdRS1_");

      procedure divide
        (this : access constant MatOp;
         expr1 : System.Address;
         expr2 : System.Address;
         res : System.Address;
         scale : double);  -- /usr/include/opencv2/core/mat.hpp:1153
      pragma Import (CPP, divide, "_ZNK2cv5MatOp6divideERKNS_7MatExprES3_RS1_d");

      procedure divide
        (this : access constant MatOp;
         s : double;
         expr : System.Address;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1154
      pragma Import (CPP, divide, "_ZNK2cv5MatOp6divideEdRKNS_7MatExprERS1_");

      procedure c_abs
        (this : access constant MatOp;
         expr : System.Address;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1156
      pragma Import (CPP, c_abs, "_ZNK2cv5MatOp3absERKNS_7MatExprERS1_");

      procedure transpose
        (this : access constant MatOp;
         expr : System.Address;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1158
      pragma Import (CPP, transpose, "_ZNK2cv5MatOp9transposeERKNS_7MatExprERS1_");

      procedure matmul
        (this : access constant MatOp;
         expr1 : System.Address;
         expr2 : System.Address;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1159
      pragma Import (CPP, matmul, "_ZNK2cv5MatOp6matmulERKNS_7MatExprES3_RS1_");

      procedure invert
        (this : access constant MatOp;
         expr : System.Address;
         method : int;
         res : System.Address);  -- /usr/include/opencv2/core/mat.hpp:1160
      pragma Import (CPP, invert, "_ZNK2cv5MatOp6invertERKNS_7MatExprEiRS1_");

      function size (this : access constant MatOp; expr : System.Address) return opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/core/mat.hpp:1162
      pragma Import (CPP, size, "_ZNK2cv5MatOp4sizeERKNS_7MatExprE");

      function c_type (this : access constant MatOp; expr : System.Address) return int;  -- /usr/include/opencv2/core/mat.hpp:1163
      pragma Import (CPP, c_type, "_ZNK2cv5MatOp4typeERKNS_7MatExprE");
   end;
   use Class_MatOp;
   package Class_MatExpr is
      type MatExpr is limited record
         op : access constant MatOp;  -- /usr/include/opencv2/core/mat.hpp:1206
         flags : aliased int;  -- /usr/include/opencv2/core/mat.hpp:1207
         a : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1209
         b : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1209
         c : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1209
         alpha : aliased double;  -- /usr/include/opencv2/core/mat.hpp:1210
         beta : aliased double;  -- /usr/include/opencv2/core/mat.hpp:1210
         s : aliased opencv2_core_core_hpp.Class_Scalar.Scalar;  -- /usr/include/opencv2/core/mat.hpp:1211
      end record;
      pragma Import (CPP, MatExpr);

      procedure Delete_MatExpr (this : access MatExpr);  -- /usr/include/opencv2/core/mat.hpp:1167
      pragma Import (CPP, Delete_MatExpr, "_ZN2cv7MatExprD1Ev");

      function New_MatExpr return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1170
      pragma CPP_Constructor (New_MatExpr, "_ZN2cv7MatExprC1Ev");

      function New_MatExpr
        (u_op : access constant MatOp;
         u_flags : int;
         u_a : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         u_b : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         u_c : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         u_alpha : double;
         u_beta : double;
         u_s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1171
      pragma CPP_Constructor (New_MatExpr, "_ZN2cv7MatExprC1EPKNS_5MatOpEiRKNS_3MatES6_S6_ddRKNS_7Scalar_IdEE");

      function New_MatExpr (m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1174
      pragma CPP_Constructor (New_MatExpr, "_ZN2cv7MatExprC1ERKNS_3MatE");

      function operator_77 (this : access constant MatExpr) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1175
      pragma Import (CPP, operator_77, "_ZNK2cv7MatExprcvNS_3MatEEv");

      function row (this : access constant MatExpr; y : int) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1189
      pragma Import (CPP, row, "_ZNK2cv7MatExpr3rowEi");

      function col (this : access constant MatExpr; x : int) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1190
      pragma Import (CPP, col, "_ZNK2cv7MatExpr3colEi");

      function diag (this : access constant MatExpr; d : int) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1191
      pragma Import (CPP, diag, "_ZNK2cv7MatExpr4diagEi");

      function operator_op
        (this : access constant MatExpr;
         rowRange : access constant opencv2_core_core_hpp.Class_c_Range.c_Range;
         colRange : access constant opencv2_core_core_hpp.Class_c_Range.c_Range) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1192
      pragma Import (CPP, operator_op, "_ZNK2cv7MatExprclERKNS_5RangeES3_");

      function operator_op (this : access constant MatExpr; roi : access constant opencv2_core_core_hpp.Class_Rect.Rect) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1193
      pragma Import (CPP, operator_op, "_ZNK2cv7MatExprclERKNS_5Rect_IiEE");

      function cross (this : access constant MatExpr; m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1195
      pragma Import (CPP, cross, "_ZNK2cv7MatExpr5crossERKNS_3MatE");

      function dot (this : access constant MatExpr; m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return double;  -- /usr/include/opencv2/core/mat.hpp:1196
      pragma Import (CPP, dot, "_ZNK2cv7MatExpr3dotERKNS_3MatE");

      function t (this : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1198
      pragma Import (CPP, t, "_ZNK2cv7MatExpr1tEv");

      function inv (this : access constant MatExpr; method : int) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1199
      pragma Import (CPP, inv, "_ZNK2cv7MatExpr3invEi");

      function mul
        (this : access constant MatExpr;
         e : System.Address;
         scale : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1200
      pragma Import (CPP, mul, "_ZNK2cv7MatExpr3mulERKS0_d");

      function mul
        (this : access constant MatExpr;
         m : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         scale : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1201
      pragma Import (CPP, mul, "_ZNK2cv7MatExpr3mulERKNS_3MatEd");

      function size (this : access constant MatExpr) return opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/core/mat.hpp:1203
      pragma Import (CPP, size, "_ZNK2cv7MatExpr4sizeEv");

      function c_type (this : access constant MatExpr) return int;  -- /usr/include/opencv2/core/mat.hpp:1204
      pragma Import (CPP, c_type, "_ZNK2cv7MatExpr4typeEv");
   end;
   use Class_MatExpr;
   function operator_p (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1215
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_3MatES2_");

   function operator_p (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1216
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_p (s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1217
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_7Scalar_IdEERKNS_3MatE");

   function operator_p (e : access constant MatExpr; m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1218
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_7MatExprERKNS_3MatE");

   function operator_p (m : access constant opencv2_core_core_hpp.Class_Mat.Mat; e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1219
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_3MatERKNS_7MatExprE");

   function operator_p (e : access constant MatExpr; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1220
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_7MatExprERKNS_7Scalar_IdEE");

   function operator_p (s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar; e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1221
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_7Scalar_IdEERKNS_7MatExprE");

   function operator_p (e1 : access constant MatExpr; e2 : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1222
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_7MatExprES2_");

   function operator_m (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1224
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_3MatES2_");

   function operator_m (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1225
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_m (s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1226
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_7Scalar_IdEERKNS_3MatE");

   function operator_m (e : access constant MatExpr; m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1227
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_7MatExprERKNS_3MatE");

   function operator_m (m : access constant opencv2_core_core_hpp.Class_Mat.Mat; e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1228
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_3MatERKNS_7MatExprE");

   function operator_m (e : access constant MatExpr; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1229
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_7MatExprERKNS_7Scalar_IdEE");

   function operator_m (s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar; e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1230
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_7Scalar_IdEERKNS_7MatExprE");

   function operator_m (e1 : access constant MatExpr; e2 : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1231
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_7MatExprES2_");

   function operator_m (m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1233
   pragma Import (CPP, operator_m, "_ZN2cvngERKNS_3MatE");

   function operator_m (e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1234
   pragma Import (CPP, operator_m, "_ZN2cvngERKNS_7MatExprE");

   function operator_t (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1236
   pragma Import (CPP, operator_t, "_ZN2cvmlERKNS_3MatES2_");

   function operator_t (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1237
   pragma Import (CPP, operator_t, "_ZN2cvmlERKNS_3MatEd");

   function operator_t (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1238
   pragma Import (CPP, operator_t, "_ZN2cvmlEdRKNS_3MatE");

   function operator_t (e : access constant MatExpr; m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1239
   pragma Import (CPP, operator_t, "_ZN2cvmlERKNS_7MatExprERKNS_3MatE");

   function operator_t (m : access constant opencv2_core_core_hpp.Class_Mat.Mat; e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1240
   pragma Import (CPP, operator_t, "_ZN2cvmlERKNS_3MatERKNS_7MatExprE");

   function operator_t (e : access constant MatExpr; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1241
   pragma Import (CPP, operator_t, "_ZN2cvmlERKNS_7MatExprEd");

   function operator_t (s : double; e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1242
   pragma Import (CPP, operator_t, "_ZN2cvmlEdRKNS_7MatExprE");

   function operator_t (e1 : access constant MatExpr; e2 : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1243
   pragma Import (CPP, operator_t, "_ZN2cvmlERKNS_7MatExprES2_");

   function operator_d (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1245
   pragma Import (CPP, operator_d, "_ZN2cvdvERKNS_3MatES2_");

   function operator_d (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1246
   pragma Import (CPP, operator_d, "_ZN2cvdvERKNS_3MatEd");

   function operator_d (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1247
   pragma Import (CPP, operator_d, "_ZN2cvdvEdRKNS_3MatE");

   function operator_d (e : access constant MatExpr; m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1248
   pragma Import (CPP, operator_d, "_ZN2cvdvERKNS_7MatExprERKNS_3MatE");

   function operator_d (m : access constant opencv2_core_core_hpp.Class_Mat.Mat; e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1249
   pragma Import (CPP, operator_d, "_ZN2cvdvERKNS_3MatERKNS_7MatExprE");

   function operator_d (e : access constant MatExpr; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1250
   pragma Import (CPP, operator_d, "_ZN2cvdvERKNS_7MatExprEd");

   function operator_d (s : double; e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1251
   pragma Import (CPP, operator_d, "_ZN2cvdvEdRKNS_7MatExprE");

   function operator_d (e1 : access constant MatExpr; e2 : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1252
   pragma Import (CPP, operator_d, "_ZN2cvdvERKNS_7MatExprES2_");

   function operator_lt (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1254
   pragma Import (CPP, operator_lt, "_ZN2cvltERKNS_3MatES2_");

   function operator_lt (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1255
   pragma Import (CPP, operator_lt, "_ZN2cvltERKNS_3MatEd");

   function operator_lt (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1256
   pragma Import (CPP, operator_lt, "_ZN2cvltEdRKNS_3MatE");

   function operator_le (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1258
   pragma Import (CPP, operator_le, "_ZN2cvleERKNS_3MatES2_");

   function operator_le (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1259
   pragma Import (CPP, operator_le, "_ZN2cvleERKNS_3MatEd");

   function operator_le (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1260
   pragma Import (CPP, operator_le, "_ZN2cvleEdRKNS_3MatE");

   function operator_eq (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1262
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_3MatES2_");

   function operator_eq (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1263
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_3MatEd");

   function operator_eq (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1264
   pragma Import (CPP, operator_eq, "_ZN2cveqEdRKNS_3MatE");

   function operator_ne (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1266
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_3MatES2_");

   function operator_ne (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1267
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_3MatEd");

   function operator_ne (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1268
   pragma Import (CPP, operator_ne, "_ZN2cvneEdRKNS_3MatE");

   function operator_ge (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1270
   pragma Import (CPP, operator_ge, "_ZN2cvgeERKNS_3MatES2_");

   function operator_ge (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1271
   pragma Import (CPP, operator_ge, "_ZN2cvgeERKNS_3MatEd");

   function operator_ge (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1272
   pragma Import (CPP, operator_ge, "_ZN2cvgeEdRKNS_3MatE");

   function operator_gt (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1274
   pragma Import (CPP, operator_gt, "_ZN2cvgtERKNS_3MatES2_");

   function operator_gt (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1275
   pragma Import (CPP, operator_gt, "_ZN2cvgtERKNS_3MatEd");

   function operator_gt (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1276
   pragma Import (CPP, operator_gt, "_ZN2cvgtEdRKNS_3MatE");

   function min (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1278
   pragma Import (CPP, min, "_ZN2cv3minERKNS_3MatES2_");

   function min (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1279
   pragma Import (CPP, min, "_ZN2cv3minERKNS_3MatEd");

   function min (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1280
   pragma Import (CPP, min, "_ZN2cv3minEdRKNS_3MatE");

   function max (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1282
   pragma Import (CPP, max, "_ZN2cv3maxERKNS_3MatES2_");

   function max (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1283
   pragma Import (CPP, max, "_ZN2cv3maxERKNS_3MatEd");

   function max (s : double; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1284
   pragma Import (CPP, max, "_ZN2cv3maxEdRKNS_3MatE");

   function operator_a (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1347
   pragma Import (CPP, operator_a, "_ZN2cvanERKNS_3MatES2_");

   function operator_a (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1348
   pragma Import (CPP, operator_a, "_ZN2cvanERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_a (s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1349
   pragma Import (CPP, operator_a, "_ZN2cvanERKNS_7Scalar_IdEERKNS_3MatE");

   function operator_o (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1351
   pragma Import (CPP, operator_o, "_ZN2cvorERKNS_3MatES2_");

   function operator_o (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1352
   pragma Import (CPP, operator_o, "_ZN2cvorERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_o (s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1353
   pragma Import (CPP, operator_o, "_ZN2cvorERKNS_7Scalar_IdEERKNS_3MatE");

   function operator_x (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1355
   pragma Import (CPP, operator_x, "_ZN2cveoERKNS_3MatES2_");

   function operator_x (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1356
   pragma Import (CPP, operator_x, "_ZN2cveoERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_x (s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar; a : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1357
   pragma Import (CPP, operator_x, "_ZN2cveoERKNS_7Scalar_IdEERKNS_3MatE");

   function operator_ti (m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1359
   pragma Import (CPP, operator_ti, "_ZN2cvcoERKNS_3MatE");

   function c_abs (m : access constant opencv2_core_core_hpp.Class_Mat.Mat) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1361
   pragma Import (CPP, c_abs, "_ZN2cv3absERKNS_3MatE");

   function c_abs (e : access constant MatExpr) return MatExpr;  -- /usr/include/opencv2/core/mat.hpp:1362
   pragma Import (CPP, c_abs, "_ZN2cv3absERKNS_7MatExprE");

   function operator_pa (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1388
   pragma Import (CPP, operator_pa, "_ZN2cvpLERKNS_3MatES2_");

   function operator_pa (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1394
   pragma Import (CPP, operator_pa, "_ZN2cvpLERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_pa (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant MatExpr) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1414
   pragma Import (CPP, operator_pa, "_ZN2cvpLERKNS_3MatERKNS_7MatExprE");

   function operator_ma (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1427
   pragma Import (CPP, operator_ma, "_ZN2cvmIERKNS_3MatES2_");

   function operator_ma (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1433
   pragma Import (CPP, operator_ma, "_ZN2cvmIERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_ma (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant MatExpr) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1453
   pragma Import (CPP, operator_ma, "_ZN2cvmIERKNS_3MatERKNS_7MatExprE");

   function operator_ta (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1466
   pragma Import (CPP, operator_ta, "_ZN2cvmLERKNS_3MatES2_");

   function operator_ta (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1472
   pragma Import (CPP, operator_ta, "_ZN2cvmLERKNS_3MatEd");

   function operator_ta (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant MatExpr) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1492
   pragma Import (CPP, operator_ta, "_ZN2cvmLERKNS_3MatERKNS_7MatExprE");

   function operator_da (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1505
   pragma Import (CPP, operator_da, "_ZN2cvdVERKNS_3MatES2_");

   function operator_da (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : double) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1511
   pragma Import (CPP, operator_da, "_ZN2cvdVERKNS_3MatEd");

   function operator_da (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant MatExpr) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1531
   pragma Import (CPP, operator_da, "_ZN2cvdVERKNS_3MatERKNS_7MatExprE");

   function operator_ae (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1546
   pragma Import (CPP, operator_ae, "_ZN2cvaNERKNS_3MatES2_");

   function operator_ae (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1552
   pragma Import (CPP, operator_ae, "_ZN2cvaNERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_oe (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1572
   pragma Import (CPP, operator_oe, "_ZN2cvoRERKNS_3MatES2_");

   function operator_oe (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1578
   pragma Import (CPP, operator_oe, "_ZN2cvoRERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_xe (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; b : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1598
   pragma Import (CPP, operator_xe, "_ZN2cveOERKNS_3MatES2_");

   function operator_xe (a : access constant opencv2_core_core_hpp.Class_Mat.Mat; s : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return access opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/mat.hpp:1604
   pragma Import (CPP, operator_xe, "_ZN2cveOERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_eq (a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:1911
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_16MatConstIteratorES2_");

   function operator_lt (a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:1935
   pragma Import (CPP, operator_lt, "_ZN2cvltERKNS_16MatConstIteratorES2_");

   function operator_gt (a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:1939
   pragma Import (CPP, operator_gt, "_ZN2cvgtERKNS_16MatConstIteratorES2_");

   function operator_le (a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:1943
   pragma Import (CPP, operator_le, "_ZN2cvleERKNS_16MatConstIteratorES2_");

   function operator_ge (a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator; b : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:1947
   pragma Import (CPP, operator_ge, "_ZN2cvgeERKNS_16MatConstIteratorES2_");

   function operator_m (b : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator; a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t;  -- /usr/include/opencv2/core/mat.hpp:1950
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_16MatConstIteratorES2_");

   function operator_p (a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator; ofs : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t) return opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1952
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_16MatConstIteratorEl");

   function operator_p (ofs : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t; a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator) return opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1955
   pragma Import (CPP, operator_p, "_ZN2cvplElRKNS_16MatConstIteratorE");

   function operator_m (a : access constant opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator; ofs : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t) return opencv2_core_core_hpp.Class_MatConstIterator.MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1958
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_16MatConstIteratorEl");

   function operator_eq (it1 : access constant opencv2_core_core_hpp.Class_SparseMatConstIterator.SparseMatConstIterator; it2 : access constant opencv2_core_core_hpp.Class_SparseMatConstIterator.SparseMatConstIterator) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:2262
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_22SparseMatConstIteratorES2_");

   function operator_ne (it1 : access constant opencv2_core_core_hpp.Class_SparseMatConstIterator.SparseMatConstIterator; it2 : access constant opencv2_core_core_hpp.Class_SparseMatConstIterator.SparseMatConstIterator) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:2265
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_22SparseMatConstIteratorES2_");

end opencv2_core_mat_hpp;
