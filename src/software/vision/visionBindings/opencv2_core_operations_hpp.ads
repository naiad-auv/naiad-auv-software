pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;
with Interfaces.C.Extensions;
with opencv2_core_core_hpp;
limited with cpp_4_7_4_bits_stringfwd_h;
with Interfaces.C.Strings;
with opencv2_core_types_c_h;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;
with System;
limited with cpp_4_7_4_iosfwd;
with cpp_4_7_4_bits_stl_vector_h;

package opencv2_core_operations_hpp is

   --  unsupported macro: CV_XADD __sync_fetch_and_add
   function LU
     (A : access float;
      astep : stddef_h.size_t;
      m : int;
      b : access float;
      bstep : stddef_h.size_t;
      n : int) return int;  -- /usr/include/opencv2/core/operations.hpp:670
   pragma Import (CPP, LU, "_ZN2cv2LUEPfmiS0_mi");

   function LU
     (A : access double;
      astep : stddef_h.size_t;
      m : int;
      b : access double;
      bstep : stddef_h.size_t;
      n : int) return int;  -- /usr/include/opencv2/core/operations.hpp:671
   pragma Import (CPP, LU, "_ZN2cv2LUEPdmiS0_mi");

   function Cholesky
     (A : access float;
      astep : stddef_h.size_t;
      m : int;
      b : access float;
      bstep : stddef_h.size_t;
      n : int) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:672
   pragma Import (CPP, Cholesky, "_ZN2cv8CholeskyEPfmiS0_mi");

   function Cholesky
     (A : access double;
      astep : stddef_h.size_t;
      m : int;
      b : access double;
      bstep : stddef_h.size_t;
      n : int) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:673
   pragma Import (CPP, Cholesky, "_ZN2cv8CholeskyEPdmiS0_mi");

   function operator_eq (r1 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range; r2 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:1985
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_5RangeES2_");

   function operator_ne (r1 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range; r2 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:1988
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_5RangeES2_");

   function operator_u (r : access constant opencv2_core_core_hpp.Class_c_Range.c_Range) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:1991
   pragma Import (CPP, operator_u, "_ZN2cvntERKNS_5RangeE");

   function operator_a (r1 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range; r2 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range) return opencv2_core_core_hpp.Class_c_Range.c_Range;  -- /usr/include/opencv2/core/operations.hpp:1994
   pragma Import (CPP, operator_a, "_ZN2cvanERKNS_5RangeES2_");

   function operator_ae (r1 : access opencv2_core_core_hpp.Class_c_Range.c_Range; r2 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range) return access opencv2_core_core_hpp.Class_c_Range.c_Range;  -- /usr/include/opencv2/core/operations.hpp:2001
   pragma Import (CPP, operator_ae, "_ZN2cvaNERNS_5RangeERKS0_");

   function operator_p (r1 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range; c_delta : int) return opencv2_core_core_hpp.Class_c_Range.c_Range;  -- /usr/include/opencv2/core/operations.hpp:2007
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_5RangeEi");

   function operator_p (c_delta : int; r1 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range) return opencv2_core_core_hpp.Class_c_Range.c_Range;  -- /usr/include/opencv2/core/operations.hpp:2012
   pragma Import (CPP, operator_p, "_ZN2cvplEiRKNS_5RangeE");

   function operator_m (r1 : access constant opencv2_core_core_hpp.Class_c_Range.c_Range; c_delta : int) return opencv2_core_core_hpp.Class_c_Range.c_Range;  -- /usr/include/opencv2/core/operations.hpp:2017
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_5RangeEi");

   procedure write
     (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
      name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      value : int);  -- /usr/include/opencv2/core/operations.hpp:2422
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKSsi");

   procedure write
     (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
      name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      value : float);  -- /usr/include/opencv2/core/operations.hpp:2423
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKSsf");

   procedure write
     (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
      name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      value : double);  -- /usr/include/opencv2/core/operations.hpp:2424
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKSsd");

   procedure write
     (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
      name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      value : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/core/operations.hpp:2425
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKSsS3_");

   procedure writeScalar (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class; value : int);  -- /usr/include/opencv2/core/operations.hpp:2430
   pragma Import (CPP, writeScalar, "_ZN2cv11writeScalarERNS_11FileStorageEi");

   procedure writeScalar (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class; value : float);  -- /usr/include/opencv2/core/operations.hpp:2431
   pragma Import (CPP, writeScalar, "_ZN2cv11writeScalarERNS_11FileStorageEf");

   procedure writeScalar (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class; value : double);  -- /usr/include/opencv2/core/operations.hpp:2432
   pragma Import (CPP, writeScalar, "_ZN2cv11writeScalarERNS_11FileStorageEd");

   procedure writeScalar (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class; value : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/core/operations.hpp:2433
   pragma Import (CPP, writeScalar, "_ZN2cv11writeScalarERNS_11FileStorageERKSs");

   procedure write (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class; r : access constant opencv2_core_core_hpp.Class_c_Range.c_Range);  -- /usr/include/opencv2/core/operations.hpp:2502
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKNS_5RangeE");

   package Class_WriteStructContext is
      type WriteStructContext is limited record
         fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage;  -- /usr/include/opencv2/core/operations.hpp:2514
      end record;
      pragma Import (CPP, WriteStructContext);

      function New_WriteStructContext
        (u_fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage;
         name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         flags : int;
         typeName : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return WriteStructContext;  -- /usr/include/opencv2/core/operations.hpp:2511
      pragma CPP_Constructor (New_WriteStructContext, "_ZN2cv18WriteStructContextC1ERNS_11FileStorageERKSsiS4_");

      procedure Delete_WriteStructContext (this : access WriteStructContext);  -- /usr/include/opencv2/core/operations.hpp:2513
      pragma Import (CPP, Delete_WriteStructContext, "_ZN2cv18WriteStructContextD1Ev");


   end;
   use Class_WriteStructContext;
   procedure write
     (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
      name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      r : access constant opencv2_core_core_hpp.Class_c_Range.c_Range);  -- /usr/include/opencv2/core/operations.hpp:2571
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKSsRKNS_5RangeE");

   procedure write
     (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
      name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      value : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/operations.hpp:2619
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKSsRKNS_3MatE");

   procedure write
     (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
      name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      value : access constant opencv2_core_core_hpp.Class_SparseMat.SparseMat);  -- /usr/include/opencv2/core/operations.hpp:2620
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKSsRKNS_9SparseMatE");

   function operator_sl (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class; str : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return access opencv2_core_core_hpp.Class_FileStorage.FileStorage;  -- /usr/include/opencv2/core/operations.hpp:2634
   pragma Import (CPP, operator_sl, "_ZN2cvlsERNS_11FileStorageERKSs");

   function operator_sl (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class; str : Interfaces.C.Strings.chars_ptr) return access opencv2_core_core_hpp.Class_FileStorage.FileStorage;  -- /usr/include/opencv2/core/operations.hpp:2636
   pragma Import (CPP, operator_sl, "_ZN2cvlsERNS_11FileStorageEPKc");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access int;
      default_value : int);  -- /usr/include/opencv2/core/operations.hpp:2664
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERii");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access Extensions.bool;
      default_value : Extensions.bool);  -- /usr/include/opencv2/core/operations.hpp:2671
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERbb");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access opencv2_core_types_c_h.uchar;
      default_value : opencv2_core_types_c_h.uchar);  -- /usr/include/opencv2/core/operations.hpp:2677
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERhh");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access opencv2_core_types_c_h.schar;
      default_value : opencv2_core_types_c_h.schar);  -- /usr/include/opencv2/core/operations.hpp:2683
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERaa");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access opencv2_core_types_c_h.ushort;
      default_value : opencv2_core_types_c_h.ushort);  -- /usr/include/opencv2/core/operations.hpp:2689
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERtt");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access short;
      default_value : short);  -- /usr/include/opencv2/core/operations.hpp:2695
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERss");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access float;
      default_value : float);  -- /usr/include/opencv2/core/operations.hpp:2701
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERff");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access double;
      default_value : double);  -- /usr/include/opencv2/core/operations.hpp:2708
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERdd");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      value : access cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      default_value : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/core/operations.hpp:2715
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERSsRKSs");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      mat : access opencv2_core_core_hpp.Class_Mat.Mat;
      default_mat : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/core/operations.hpp:2720
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERNS_3MatERKS3_");

   procedure read
     (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
      mat : access opencv2_core_core_hpp.Class_SparseMat.SparseMat;
      default_mat : access constant opencv2_core_core_hpp.Class_SparseMat.SparseMat);  -- /usr/include/opencv2/core/operations.hpp:2721
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERNS_9SparseMatERKS3_");

   function operator_eq (it1 : access constant opencv2_core_core_hpp.Class_FileNodeIterator.FileNodeIterator; it2 : access constant opencv2_core_core_hpp.Class_FileNodeIterator.FileNodeIterator) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2830
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_16FileNodeIteratorES2_");

   function operator_ne (it1 : access constant opencv2_core_core_hpp.Class_FileNodeIterator.FileNodeIterator; it2 : access constant opencv2_core_core_hpp.Class_FileNodeIterator.FileNodeIterator) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2836
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_16FileNodeIteratorES2_");

   function operator_m (it1 : access constant opencv2_core_core_hpp.Class_FileNodeIterator.FileNodeIterator; it2 : access constant opencv2_core_core_hpp.Class_FileNodeIterator.FileNodeIterator) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t;  -- /usr/include/opencv2/core/operations.hpp:2841
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_16FileNodeIteratorES2_");

   function operator_lt (it1 : access constant opencv2_core_core_hpp.Class_FileNodeIterator.FileNodeIterator; it2 : access constant opencv2_core_core_hpp.Class_FileNodeIterator.FileNodeIterator) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2846
   pragma Import (CPP, operator_lt, "_ZN2cvltERKNS_16FileNodeIteratorES2_");

   function seqPush (seq : access opencv2_core_types_c_h.CvSeq; element : System.Address) return access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/operations.hpp:3204
   pragma Import (CPP, seqPush, "_ZN2cv7seqPushEP5CvSeqPKv");

   function seqPushFront (seq : access opencv2_core_types_c_h.CvSeq; element : System.Address) return access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/operations.hpp:3205
   pragma Import (CPP, seqPushFront, "_ZN2cv12seqPushFrontEP5CvSeqPKv");

   procedure seqPop (seq : access opencv2_core_types_c_h.CvSeq; element : System.Address);  -- /usr/include/opencv2/core/operations.hpp:3206
   pragma Import (CPP, seqPop, "_ZN2cv6seqPopEP5CvSeqPv");

   procedure seqPopFront (seq : access opencv2_core_types_c_h.CvSeq; element : System.Address);  -- /usr/include/opencv2/core/operations.hpp:3207
   pragma Import (CPP, seqPopFront, "_ZN2cv11seqPopFrontEP5CvSeqPv");

   procedure seqPopMulti
     (seq : access opencv2_core_types_c_h.CvSeq;
      elements : System.Address;
      count : int;
      in_front : int);  -- /usr/include/opencv2/core/operations.hpp:3208
   pragma Import (CPP, seqPopMulti, "_ZN2cv11seqPopMultiEP5CvSeqPvii");

   procedure seqRemove (seq : access opencv2_core_types_c_h.CvSeq; index : int);  -- /usr/include/opencv2/core/operations.hpp:3210
   pragma Import (CPP, seqRemove, "_ZN2cv9seqRemoveEP5CvSeqi");

   procedure clearSeq (seq : access opencv2_core_types_c_h.CvSeq);  -- /usr/include/opencv2/core/operations.hpp:3211
   pragma Import (CPP, clearSeq, "_ZN2cv8clearSeqEP5CvSeq");

   function getSeqElem (seq : access constant opencv2_core_types_c_h.CvSeq; index : int) return access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/operations.hpp:3212
   pragma Import (CPP, getSeqElem, "_ZN2cv10getSeqElemEPK5CvSeqi");

   procedure seqRemoveSlice (seq : access opencv2_core_types_c_h.CvSeq; slice : opencv2_core_types_c_h.CvSlice);  -- /usr/include/opencv2/core/operations.hpp:3213
   pragma Import (CPP, seqRemoveSlice, "_ZN2cv14seqRemoveSliceEP5CvSeq7CvSlice");

   procedure seqInsertSlice
     (seq : access opencv2_core_types_c_h.CvSeq;
      before_index : int;
      from_arr : System.Address);  -- /usr/include/opencv2/core/operations.hpp:3214
   pragma Import (CPP, seqInsertSlice, "_ZN2cv14seqInsertSliceEP5CvSeqiPKv");

   package Class_Formatter is
      type Formatter is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, Formatter);

      procedure Delete_Formatter (this : access Formatter);  -- /usr/include/opencv2/core/operations.hpp:3479
      pragma Import (CPP, Delete_Formatter, "_ZN2cv9FormatterD1Ev");

      procedure deleting_dtor (this : access Formatter);  -- /usr/include/opencv2/core/operations.hpp:3479
      pragma Import (CPP, deleting_dtor, "_ZN2cv9FormatterD0Ev");

      procedure write
        (this : access constant Formatter;
         c_out : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class;
         m : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : access int;
         nparams : int) is abstract;  -- /usr/include/opencv2/core/operations.hpp:3480

      procedure write
        (this : access constant Formatter;
         c_out : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class;
         data : System.Address;
         nelems : int;
         c_type : int;
         params : access int;
         nparams : int) is abstract;  -- /usr/include/opencv2/core/operations.hpp:3481

      function get (fmt : Interfaces.C.Strings.chars_ptr) return access constant Formatter;  -- /usr/include/opencv2/core/operations.hpp:3483
      pragma Import (CPP, get, "_ZN2cv9Formatter3getEPKc");

      function setDefault (fmt : access constant Formatter'Class) return access constant Formatter;  -- /usr/include/opencv2/core/operations.hpp:3484
      pragma Import (CPP, setDefault, "_ZN2cv9Formatter10setDefaultEPKS0_");
   end;
   use Class_Formatter;
   package Class_Formatted is
      type Formatted is limited record
         mtx : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/core/operations.hpp:3494
         fmt : access constant Formatter;  -- /usr/include/opencv2/core/operations.hpp:3495
         params : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/core/operations.hpp:3496
      end record;
      pragma Import (CPP, Formatted);

      procedure Delete_Formatted (this : access Formatted);  -- /usr/include/opencv2/core/operations.hpp:3488
      pragma Import (CPP, Delete_Formatted, "_ZN2cv9FormattedD1Ev");

      function New_Formatted
        (m : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         fmt : access constant Formatter'Class;
         params : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Formatted;  -- /usr/include/opencv2/core/operations.hpp:3490
      pragma CPP_Constructor (New_Formatted, "_ZN2cv9FormattedC1ERKNS_3MatEPKNS_9FormatterERKSt6vectorIiSaIiEE");

      function New_Formatted
        (m : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         fmt : access constant Formatter'Class;
         params : access int) return Formatted;  -- /usr/include/opencv2/core/operations.hpp:3492
      pragma CPP_Constructor (New_Formatted, "_ZN2cv9FormattedC1ERKNS_3MatEPKNS_9FormatterEPKi");


   end;
   use Class_Formatted;
   function format
     (mtx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      fmt : Interfaces.C.Strings.chars_ptr;
      params : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Formatted;  -- /usr/include/opencv2/core/operations.hpp:3516
   pragma Import (CPP, format, "_ZN2cvL6formatERKNS_3MatEPKcRKSt6vectorIiSaIiEE");

   function operator_sl (c_out : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class; mtx : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/include/opencv2/core/operations.hpp:3541
   pragma Import (CPP, operator_sl, "_ZN2cvlsERSoRKNS_3MatE");

   function operator_sl (c_out : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class; fmtd : access constant Formatted) return access cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/include/opencv2/core/operations.hpp:3554
   pragma Import (CPP, operator_sl, "_ZN2cvlsERSoRKNS_9FormattedE");

end opencv2_core_operations_hpp;
