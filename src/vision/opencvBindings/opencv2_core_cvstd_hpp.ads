pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_cvdef_h;
with stddef_h;
with System;
with Interfaces.C.Strings;
limited with opencv2_core_persistence_hpp;
with Interfaces.C.Extensions;
with cpp_4_7_4_bits_stringfwd_h;

package opencv2_core_cvstd_hpp is

   function c_abs (a : opencv2_core_cvdef_h.uchar) return opencv2_core_cvdef_h.uchar;  -- /usr/local/include/opencv2/core/cvstd.hpp:82
   pragma Import (CPP, c_abs, "_ZStL3absh");

   function c_abs (a : opencv2_core_cvdef_h.ushort) return opencv2_core_cvdef_h.ushort;  -- /usr/local/include/opencv2/core/cvstd.hpp:83
   pragma Import (CPP, c_abs, "_ZStL3abst");

   function c_abs (a : unsigned) return unsigned;  -- /usr/local/include/opencv2/core/cvstd.hpp:84
   pragma Import (CPP, c_abs, "_ZStL3absj");

   function c_abs (a : opencv2_core_cvdef_h.uint64) return opencv2_core_cvdef_h.uint64;  -- /usr/local/include/opencv2/core/cvstd.hpp:85
   pragma Import (CPP, c_abs, "_ZStL3absm");

   function fastMalloc (bufSize : stddef_h.size_t) return System.Address;  -- /usr/local/include/opencv2/core/cvstd.hpp:117
   pragma Import (CPP, fastMalloc, "_ZN2cv10fastMallocEm");

   procedure fastFree (ptr : System.Address);  -- /usr/local/include/opencv2/core/cvstd.hpp:125
   pragma Import (CPP, fastFree, "_ZN2cv8fastFreeEPv");

   package DefaultDeleter_CvVideoWriter is
      type DefaultDeleter is limited record
         null;
      end record;
      pragma Import (CPP, DefaultDeleter);

      procedure operator_op (this : access constant DefaultDeleter; p : System.Address);  -- /usr/local/include/opencv2/highgui.hpp:548
      pragma Import (CPP, operator_op, "_ZNK2cv14DefaultDeleterI13CvVideoWriterEclEPS1_");

   end;
   use DefaultDeleter_CvVideoWriter;

   package DefaultDeleter_CvCapture is
      type DefaultDeleter is limited record
         null;
      end record;
      pragma Import (CPP, DefaultDeleter);

      procedure operator_op (this : access constant DefaultDeleter; p : System.Address);  -- /usr/local/include/opencv2/highgui.hpp:547
      pragma Import (CPP, operator_op, "_ZNK2cv14DefaultDeleterI9CvCaptureEclEPS1_");

   end;
   use DefaultDeleter_CvCapture;

   package DefaultDeleter_CvFileStorage is
      type DefaultDeleter is limited record
         null;
      end record;
      pragma Import (CPP, DefaultDeleter);

      procedure operator_op (this : access constant DefaultDeleter; p : System.Address);  -- /usr/local/include/opencv2/core/persistence.hpp:229
      pragma Import (CPP, operator_op, "_ZNK2cv14DefaultDeleterI13CvFileStorageEclEPS1_");

   end;
   use DefaultDeleter_CvFileStorage;



   package Class_String is
      type String is limited record
         cstr_u : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/opencv2/core/cvstd.hpp:426
         len_u : aliased stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:427
      end record;
      pragma Import (CPP, String);

      function New_String return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:437
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1Ev");

      function New_String
        (str : System.Address;
         pos : stddef_h.size_t;
         len : stddef_h.size_t) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:450
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1ERKS0_mm");

      function New_String (s : Interfaces.C.Strings.chars_ptr) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:467
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1EPKc");

      function New_String (s : Interfaces.C.Strings.chars_ptr; n : stddef_h.size_t) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:476
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1EPKcm");

      function New_String (n : stddef_h.size_t; c : char) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:484
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1Emc");

      function New_String (first : Interfaces.C.Strings.chars_ptr; last : Interfaces.C.Strings.chars_ptr) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:491
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1EPKcS2_");

      function New_String (fn : access constant opencv2_core_persistence_hpp.Class_FileNode.FileNode) return String;  -- /usr/local/include/opencv2/core/persistence.hpp:866
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1ERKNS_8FileNodeE");

      procedure Delete_String (this : access String);  -- /usr/local/include/opencv2/core/cvstd.hpp:512
      pragma Import (CPP, Delete_String, "_ZN2cv6StringD1Ev");

      function operator_as (this : access String; str : System.Address) return access String;  -- /usr/local/include/opencv2/core/cvstd.hpp:518
      pragma Import (CPP, operator_as, "_ZN2cv6StringaSERKS0_");

      function operator_as (this : access String; s : Interfaces.C.Strings.chars_ptr) return access String;  -- /usr/local/include/opencv2/core/cvstd.hpp:530
      pragma Import (CPP, operator_as, "_ZN2cv6StringaSEPKc");

      function operator_as (this : access String; c : char) return access String;  -- /usr/local/include/opencv2/core/cvstd.hpp:540
      pragma Import (CPP, operator_as, "_ZN2cv6StringaSEc");

      function size (this : access constant String) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:548
      pragma Import (CPP, size, "_ZNK2cv6String4sizeEv");

      function length (this : access constant String) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:554
      pragma Import (CPP, length, "_ZNK2cv6String6lengthEv");

      function operator_ob (this : access constant String; idx : stddef_h.size_t) return char;  -- /usr/local/include/opencv2/core/cvstd.hpp:560
      pragma Import (CPP, operator_ob, "_ZNK2cv6StringixEm");

      function operator_ob (this : access constant String; idx : int) return char;  -- /usr/local/include/opencv2/core/cvstd.hpp:566
      pragma Import (CPP, operator_ob, "_ZNK2cv6StringixEi");

      function c_begin (this : access constant String) return Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/opencv2/core/cvstd.hpp:572
      pragma Import (CPP, c_begin, "_ZNK2cv6String5beginEv");

      function c_end (this : access constant String) return Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/opencv2/core/cvstd.hpp:578
      pragma Import (CPP, c_end, "_ZNK2cv6String3endEv");

      function c_str (this : access constant String) return Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/opencv2/core/cvstd.hpp:590
      pragma Import (CPP, c_str, "_ZNK2cv6String5c_strEv");

      function empty (this : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:584
      pragma Import (CPP, empty, "_ZNK2cv6String5emptyEv");

      procedure clear (this : access String);  -- /usr/local/include/opencv2/core/cvstd.hpp:603
      pragma Import (CPP, clear, "_ZN2cv6String5clearEv");

      function compare (this : access constant String; s : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/local/include/opencv2/core/cvstd.hpp:609
      pragma Import (CPP, compare, "_ZNK2cv6String7compareEPKc");

      function compare (this : access constant String; str : System.Address) return int;  -- /usr/local/include/opencv2/core/cvstd.hpp:616
      pragma Import (CPP, compare, "_ZNK2cv6String7compareERKS0_");

      procedure swap (this : access String; str : access String);  -- /usr/local/include/opencv2/core/cvstd.hpp:596
      pragma Import (CPP, swap, "_ZN2cv6String4swapERS0_");

      function substr
        (this : access constant String;
         pos : stddef_h.size_t;
         len : stddef_h.size_t) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:623
      pragma Import (CPP, substr, "_ZNK2cv6String6substrEmm");

      function find
        (this : access constant String;
         s : Interfaces.C.Strings.chars_ptr;
         pos : stddef_h.size_t;
         n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:629
      pragma Import (CPP, find, "_ZNK2cv6String4findEPKcmm");

      function find
        (this : access constant String;
         c : char;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:643
      pragma Import (CPP, find, "_ZNK2cv6String4findEcm");

      function find
        (this : access constant String;
         str : System.Address;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:649
      pragma Import (CPP, find, "_ZNK2cv6String4findERKS0_m");

      function find
        (this : access constant String;
         s : Interfaces.C.Strings.chars_ptr;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:655
      pragma Import (CPP, find, "_ZNK2cv6String4findEPKcm");

      function rfind
        (this : access constant String;
         s : Interfaces.C.Strings.chars_ptr;
         pos : stddef_h.size_t;
         n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:672
      pragma Import (CPP, rfind, "_ZNK2cv6String5rfindEPKcmm");

      function rfind
        (this : access constant String;
         c : char;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:686
      pragma Import (CPP, rfind, "_ZNK2cv6String5rfindEcm");

      function rfind
        (this : access constant String;
         str : System.Address;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:692
      pragma Import (CPP, rfind, "_ZNK2cv6String5rfindERKS0_m");

      function rfind
        (this : access constant String;
         s : Interfaces.C.Strings.chars_ptr;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:698
      pragma Import (CPP, rfind, "_ZNK2cv6String5rfindEPKcm");

      function find_first_of
        (this : access constant String;
         s : Interfaces.C.Strings.chars_ptr;
         pos : stddef_h.size_t;
         n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:704
      pragma Import (CPP, find_first_of, "_ZNK2cv6String13find_first_ofEPKcmm");

      function find_first_of
        (this : access constant String;
         c : char;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:718
      pragma Import (CPP, find_first_of, "_ZNK2cv6String13find_first_ofEcm");

      function find_first_of
        (this : access constant String;
         str : System.Address;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:724
      pragma Import (CPP, find_first_of, "_ZNK2cv6String13find_first_ofERKS0_m");

      function find_first_of
        (this : access constant String;
         s : Interfaces.C.Strings.chars_ptr;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:730
      pragma Import (CPP, find_first_of, "_ZNK2cv6String13find_first_ofEPKcm");

      function find_last_of
        (this : access constant String;
         s : Interfaces.C.Strings.chars_ptr;
         pos : stddef_h.size_t;
         n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:744
      pragma Import (CPP, find_last_of, "_ZNK2cv6String12find_last_ofEPKcmm");

      function find_last_of
        (this : access constant String;
         c : char;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:757
      pragma Import (CPP, find_last_of, "_ZNK2cv6String12find_last_ofEcm");

      function find_last_of
        (this : access constant String;
         str : System.Address;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:763
      pragma Import (CPP, find_last_of, "_ZNK2cv6String12find_last_ofERKS0_m");

      function find_last_of
        (this : access constant String;
         s : Interfaces.C.Strings.chars_ptr;
         pos : stddef_h.size_t) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:769
      pragma Import (CPP, find_last_of, "_ZNK2cv6String12find_last_ofEPKcm");

      function toLowerCase (this : access constant String) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:782
      pragma Import (CPP, toLowerCase, "_ZNK2cv6String11toLowerCaseEv");

      function New_String (str : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return String;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:73
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1ERKSs");

      function New_String
        (str : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         pos : stddef_h.size_t;
         len : stddef_h.size_t) return String;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:84
      pragma CPP_Constructor (New_String, "_ZN2cv6StringC1ERKSsmm");

      function operator_as (this : access String; str : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return access String;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:95
      pragma Import (CPP, operator_as, "_ZN2cv6StringaSERKSs");

      function operator_3 (this : access constant String) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:107
      pragma Import (CPP, operator_3, "_ZNK2cv6StringcvSsEv");

      function allocate (this : access String; len : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/opencv2/core/cvstd.hpp:429
      pragma Import (CPP, allocate, "_ZN2cv6String8allocateEm");

      procedure deallocate (this : access String);  -- /usr/local/include/opencv2/core/cvstd.hpp:430
      pragma Import (CPP, deallocate, "_ZN2cv6String10deallocateEv");

      npos : aliased stddef_h.size_t;  -- /usr/local/include/opencv2/core/cvstd.hpp:350
      pragma Import (CPP, npos, "_ZN2cv6String4nposE");
   end;
   use Class_String;
   function operator_p (lhs : access constant String; rhs : access constant String) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:795
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_6StringES2_");

   function operator_p (lhs : access constant String; rhs : Interfaces.C.Strings.chars_ptr) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:805
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_6StringEPKc");

   function operator_p (lhs : Interfaces.C.Strings.chars_ptr; rhs : access constant String) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:816
   pragma Import (CPP, operator_p, "_ZN2cvplEPKcRKNS_6StringE");

   function operator_p (lhs : access constant String; rhs : char) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:827
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_6StringEc");

   function operator_p (lhs : char; rhs : access constant String) return String;  -- /usr/local/include/opencv2/core/cvstd.hpp:837
   pragma Import (CPP, operator_p, "_ZN2cvplEcRKNS_6StringE");

   function operator_eq (lhs : access constant String; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:846
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_6StringES2_");

   function operator_eq (lhs : Interfaces.C.Strings.chars_ptr; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:847
   pragma Import (CPP, operator_eq, "_ZN2cveqEPKcRKNS_6StringE");

   function operator_eq (lhs : access constant String; rhs : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:848
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_6StringEPKc");

   function operator_ne (lhs : access constant String; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:849
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_6StringES2_");

   function operator_ne (lhs : Interfaces.C.Strings.chars_ptr; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:850
   pragma Import (CPP, operator_ne, "_ZN2cvneEPKcRKNS_6StringE");

   function operator_ne (lhs : access constant String; rhs : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:851
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_6StringEPKc");

   function operator_lt (lhs : access constant String; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:852
   pragma Import (CPP, operator_lt, "_ZN2cvltERKNS_6StringES2_");

   function operator_lt (lhs : Interfaces.C.Strings.chars_ptr; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:853
   pragma Import (CPP, operator_lt, "_ZN2cvltEPKcRKNS_6StringE");

   function operator_lt (lhs : access constant String; rhs : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:854
   pragma Import (CPP, operator_lt, "_ZN2cvltERKNS_6StringEPKc");

   function operator_le (lhs : access constant String; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:855
   pragma Import (CPP, operator_le, "_ZN2cvleERKNS_6StringES2_");

   function operator_le (lhs : Interfaces.C.Strings.chars_ptr; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:856
   pragma Import (CPP, operator_le, "_ZN2cvleEPKcRKNS_6StringE");

   function operator_le (lhs : access constant String; rhs : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:857
   pragma Import (CPP, operator_le, "_ZN2cvleERKNS_6StringEPKc");

   function operator_gt (lhs : access constant String; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:858
   pragma Import (CPP, operator_gt, "_ZN2cvgtERKNS_6StringES2_");

   function operator_gt (lhs : Interfaces.C.Strings.chars_ptr; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:859
   pragma Import (CPP, operator_gt, "_ZN2cvgtEPKcRKNS_6StringE");

   function operator_gt (lhs : access constant String; rhs : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:860
   pragma Import (CPP, operator_gt, "_ZN2cvgtERKNS_6StringEPKc");

   function operator_ge (lhs : access constant String; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:861
   pragma Import (CPP, operator_ge, "_ZN2cvgeERKNS_6StringES2_");

   function operator_ge (lhs : Interfaces.C.Strings.chars_ptr; rhs : access constant String) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:862
   pragma Import (CPP, operator_ge, "_ZN2cvgeEPKcRKNS_6StringE");

   function operator_ge (lhs : access constant String; rhs : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /usr/local/include/opencv2/core/cvstd.hpp:863
   pragma Import (CPP, operator_ge, "_ZN2cvgeERKNS_6StringEPKc");

end opencv2_core_cvstd_hpp;
