pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_cvstd_hpp;
with cpp_4_7_4_bits_stl_vector_h;
with System;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with opencv2_core_cvdef_h;
with stddef_h;
with cpp_4_7_4_bits_stringfwd_h;
limited with opencv2_core_mat_hpp;
limited with opencv2_core_types_hpp;

package opencv2_core_persistence_hpp is

   --  skipped empty struct CvFileStorage

   --  skipped empty struct CvFileNode

   package Class_FileStorage is
      type FileStorage is tagged limited record
         fs : aliased opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/core/persistence.hpp:223
         elname : aliased opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core/persistence.hpp:224
         structs : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/core/persistence.hpp:225
         state : aliased int;  -- /usr/local/include/opencv2/core/persistence.hpp:226
      end record;
      pragma Import (CPP, FileStorage);

      function New_FileStorage return FileStorage;  -- /usr/local/include/opencv2/core/persistence.hpp:185
      pragma CPP_Constructor (New_FileStorage, "_ZN2cv11FileStorageC1Ev");

      function New_FileStorage
        (source : access constant opencv2_core_cvstd_hpp.Class_String.String;
         flags : int;
         encoding : access constant opencv2_core_cvstd_hpp.Class_String.String) return FileStorage;  -- /usr/local/include/opencv2/core/persistence.hpp:187
      pragma CPP_Constructor (New_FileStorage, "_ZN2cv11FileStorageC1ERKNS_6StringEiS3_");

      function New_FileStorage (fs : System.Address; owning : Extensions.bool) return FileStorage;  -- /usr/local/include/opencv2/core/persistence.hpp:189
      pragma CPP_Constructor (New_FileStorage, "_ZN2cv11FileStorageC1EP13CvFileStorageb");

      procedure Delete_FileStorage (this : access FileStorage);  -- /usr/local/include/opencv2/core/persistence.hpp:191
      pragma Import (CPP, Delete_FileStorage, "_ZN2cv11FileStorageD1Ev");

      procedure deleting_dtor (this : access FileStorage);  -- /usr/local/include/opencv2/core/persistence.hpp:191
      pragma Import (CPP, deleting_dtor, "_ZN2cv11FileStorageD0Ev");

      function open
        (this : access FileStorage;
         filename : access constant opencv2_core_cvstd_hpp.Class_String.String;
         flags : int;
         encoding : access constant opencv2_core_cvstd_hpp.Class_String.String) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:194
      pragma Import (CPP, open, "_ZN2cv11FileStorage4openERKNS_6StringEiS3_");

      function isOpened (this : access constant FileStorage) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:196
      pragma Import (CPP, isOpened, "_ZNK2cv11FileStorage8isOpenedEv");

      procedure release (this : access FileStorage);  -- /usr/local/include/opencv2/core/persistence.hpp:198
      pragma Import (CPP, release, "_ZN2cv11FileStorage7releaseEv");

      function releaseAndGetString (this : access FileStorage) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core/persistence.hpp:200
      pragma Import (CPP, releaseAndGetString, "_ZN2cv11FileStorage19releaseAndGetStringEv");

      function getFirstTopLevelNode (this : access constant FileStorage'Class) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:844
      pragma Import (CPP, getFirstTopLevelNode, "_ZNK2cv11FileStorage20getFirstTopLevelNodeEv");

      function root (this : access constant FileStorage'Class; streamidx : int) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:205
      pragma Import (CPP, root, "_ZNK2cv11FileStorage4rootEi");

      function operator_ob (this : access constant FileStorage'Class; nodename : access constant opencv2_core_cvstd_hpp.Class_String.String) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:207
      pragma Import (CPP, operator_ob, "_ZNK2cv11FileStorageixERKNS_6StringE");

      function operator_ob (this : access constant FileStorage'Class; nodename : Interfaces.C.Strings.chars_ptr) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:209
      pragma Import (CPP, operator_ob, "_ZNK2cv11FileStorageixEPKc");

      function operator_t (this : access FileStorage'Class) return System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:212
      pragma Import (CPP, operator_t, "_ZN2cv11FileStoragedeEv");

      function operator_t (this : access constant FileStorage'Class) return System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:214
      pragma Import (CPP, operator_t, "_ZNK2cv11FileStoragedeEv");

      procedure writeRaw
        (this : access FileStorage'Class;
         fmt : access constant opencv2_core_cvstd_hpp.Class_String.String;
         vec : access opencv2_core_cvdef_h.uchar;
         len : stddef_h.size_t);  -- /usr/local/include/opencv2/core/persistence.hpp:216
      pragma Import (CPP, writeRaw, "_ZN2cv11FileStorage8writeRawERKNS_6StringEPKhm");

      procedure writeObj
        (this : access FileStorage'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         obj : System.Address);  -- /usr/local/include/opencv2/core/persistence.hpp:218
      pragma Import (CPP, writeObj, "_ZN2cv11FileStorage8writeObjERKNS_6StringEPKv");

      function getDefaultObjectName (filename : access constant opencv2_core_cvstd_hpp.Class_String.String) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core/persistence.hpp:221
      pragma Import (CPP, getDefaultObjectName, "_ZN2cv11FileStorage20getDefaultObjectNameERKNS_6StringE");
   end;
   use Class_FileStorage;
   package Class_FileNode is
      type FileNode is limited record
         fs : System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:325
         node : System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:326
      end record;
      pragma Import (CPP, FileNode);

      function New_FileNode return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:845
      pragma CPP_Constructor (New_FileNode, "_ZN2cv8FileNodeC1Ev");

      function New_FileNode (u_fs : System.Address; u_node : System.Address) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:846
      pragma CPP_Constructor (New_FileNode, "_ZN2cv8FileNodeC1EPK13CvFileStoragePK10CvFileNode");

      function operator_ob (this : access constant FileNode; nodename : access constant opencv2_core_cvstd_hpp.Class_String.String) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:269
      pragma Import (CPP, operator_ob, "_ZNK2cv8FileNodeixERKNS_6StringE");

      function operator_ob (this : access constant FileNode; nodename : Interfaces.C.Strings.chars_ptr) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:271
      pragma Import (CPP, operator_ob, "_ZNK2cv8FileNodeixEPKc");

      function operator_ob (this : access constant FileNode; i : int) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:273
      pragma Import (CPP, operator_ob, "_ZNK2cv8FileNodeixEi");

      function c_type (this : access constant FileNode) return int;  -- /usr/local/include/opencv2/core/persistence.hpp:275
      pragma Import (CPP, c_type, "_ZNK2cv8FileNode4typeEv");

      function empty (this : access constant FileNode) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:848
      pragma Import (CPP, empty, "_ZNK2cv8FileNode5emptyEv");

      function isNone (this : access constant FileNode) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:849
      pragma Import (CPP, isNone, "_ZNK2cv8FileNode6isNoneEv");

      function isSeq (this : access constant FileNode) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:850
      pragma Import (CPP, isSeq, "_ZNK2cv8FileNode5isSeqEv");

      function isMap (this : access constant FileNode) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:851
      pragma Import (CPP, isMap, "_ZNK2cv8FileNode5isMapEv");

      function isInt (this : access constant FileNode) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:852
      pragma Import (CPP, isInt, "_ZNK2cv8FileNode5isIntEv");

      function isReal (this : access constant FileNode) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:853
      pragma Import (CPP, isReal, "_ZNK2cv8FileNode6isRealEv");

      function isString (this : access constant FileNode) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:854
      pragma Import (CPP, isString, "_ZNK2cv8FileNode8isStringEv");

      function isNamed (this : access constant FileNode) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:292
      pragma Import (CPP, isNamed, "_ZNK2cv8FileNode7isNamedEv");

      function name (this : access constant FileNode) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core/persistence.hpp:294
      pragma Import (CPP, name, "_ZNK2cv8FileNode4nameEv");

      function size (this : access constant FileNode) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/persistence.hpp:296
      pragma Import (CPP, size, "_ZNK2cv8FileNode4sizeEv");

      function operator_38 (this : access constant FileNode) return int;  -- /usr/local/include/opencv2/core/persistence.hpp:857
      pragma Import (CPP, operator_38, "_ZNK2cv8FileNodecviEv");

      function operator_39 (this : access constant FileNode) return float;  -- /usr/local/include/opencv2/core/persistence.hpp:858
      pragma Import (CPP, operator_39, "_ZNK2cv8FileNodecvfEv");

      function operator_40 (this : access constant FileNode) return double;  -- /usr/local/include/opencv2/core/persistence.hpp:859
      pragma Import (CPP, operator_40, "_ZNK2cv8FileNodecvdEv");

      function operator_41 (this : access constant FileNode) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core/persistence.hpp:860
      pragma Import (CPP, operator_41, "_ZNK2cv8FileNodecvNS_6StringEEv");

      function operator_3 (this : access constant FileNode) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:135
      pragma Import (CPP, operator_3, "_ZNK2cv8FileNodecvSsEv");

      function operator_t (this : access FileNode) return System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:855
      pragma Import (CPP, operator_t, "_ZN2cv8FileNodedeEv");

      function operator_t (this : access constant FileNode) return System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:856
      pragma Import (CPP, operator_t, "_ZNK2cv8FileNodedeEv");

      function c_begin (this : access constant FileNode) return FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:861
      pragma Import (CPP, c_begin, "_ZNK2cv8FileNode5beginEv");

      function c_end (this : access constant FileNode) return FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:862
      pragma Import (CPP, c_end, "_ZNK2cv8FileNode3endEv");

      procedure readRaw
        (this : access constant FileNode;
         fmt : access constant opencv2_core_cvstd_hpp.Class_String.String;
         vec : access opencv2_core_cvdef_h.uchar;
         len : stddef_h.size_t);  -- /usr/local/include/opencv2/core/persistence.hpp:863
      pragma Import (CPP, readRaw, "_ZNK2cv8FileNode7readRawERKNS_6StringEPhm");

      function readObj (this : access constant FileNode) return System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:322
      pragma Import (CPP, readObj, "_ZNK2cv8FileNode7readObjEv");
   end;
   use Class_FileNode;
   type FileNodeIterator;
   type SeqReader is record
      header_size : aliased int;  -- /usr/local/include/opencv2/core/persistence.hpp:368
      seq : System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:369
      block : System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:370
      ptr : access opencv2_core_cvdef_h.schar;  -- /usr/local/include/opencv2/core/persistence.hpp:371
      block_min : access opencv2_core_cvdef_h.schar;  -- /usr/local/include/opencv2/core/persistence.hpp:372
      block_max : access opencv2_core_cvdef_h.schar;  -- /usr/local/include/opencv2/core/persistence.hpp:373
      delta_index : aliased int;  -- /usr/local/include/opencv2/core/persistence.hpp:374
      prev_elem : access opencv2_core_cvdef_h.schar;  -- /usr/local/include/opencv2/core/persistence.hpp:375
   end record;
   pragma Convention (C_Pass_By_Copy, SeqReader);
   package Class_FileNodeIterator is
      type FileNodeIterator is limited record
         fs : System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:378
         container : System.Address;  -- /usr/local/include/opencv2/core/persistence.hpp:379
         reader : aliased SeqReader;  -- /usr/local/include/opencv2/core/persistence.hpp:380
         remaining : aliased stddef_h.size_t;  -- /usr/local/include/opencv2/core/persistence.hpp:381
      end record;
      pragma Import (CPP, FileNodeIterator);

      function New_FileNodeIterator return FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:339
      pragma CPP_Constructor (New_FileNodeIterator, "_ZN2cv16FileNodeIteratorC1Ev");

      function New_FileNodeIterator
        (fs : System.Address;
         node : System.Address;
         ofs : stddef_h.size_t) return FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:341
      pragma CPP_Constructor (New_FileNodeIterator, "_ZN2cv16FileNodeIteratorC1EPK13CvFileStoragePK10CvFileNodem");

      function operator_t (this : access constant FileNodeIterator) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:864
      pragma Import (CPP, operator_t, "_ZNK2cv16FileNodeIteratordeEv");

      function operator__gt (this : access constant FileNodeIterator) return FileNode;  -- /usr/local/include/opencv2/core/persistence.hpp:865
      pragma Import (CPP, operator__gt, "_ZNK2cv16FileNodeIteratorptEv");

      function operator_pp (this : access FileNodeIterator) return access FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:350
      pragma Import (CPP, operator_pp, "_ZN2cv16FileNodeIteratorppEv");

      function operator_pp (this : access FileNodeIterator; arg2 : int) return FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:352
      pragma Import (CPP, operator_pp, "_ZN2cv16FileNodeIteratorppEi");

      function operator_mm (this : access FileNodeIterator) return access FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:354
      pragma Import (CPP, operator_mm, "_ZN2cv16FileNodeIteratormmEv");

      function operator_mm (this : access FileNodeIterator; arg2 : int) return FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:356
      pragma Import (CPP, operator_mm, "_ZN2cv16FileNodeIteratormmEi");

      function operator_pa (this : access FileNodeIterator; ofs : int) return access FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:358
      pragma Import (CPP, operator_pa, "_ZN2cv16FileNodeIteratorpLEi");

      function operator_ma (this : access FileNodeIterator; ofs : int) return access FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:360
      pragma Import (CPP, operator_ma, "_ZN2cv16FileNodeIteratormIEi");

      function readRaw
        (this : access FileNodeIterator;
         fmt : access constant opencv2_core_cvstd_hpp.Class_String.String;
         vec : access opencv2_core_cvdef_h.uchar;
         maxCount : stddef_h.size_t) return access FileNodeIterator;  -- /usr/local/include/opencv2/core/persistence.hpp:363
      pragma Import (CPP, readRaw, "_ZN2cv16FileNodeIterator7readRawERKNS_6StringEPhm");
   end;
   use Class_FileNodeIterator;
   procedure write
     (fs : access FileStorage'Class;
      name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      value : int);  -- /usr/local/include/opencv2/core/persistence.hpp:388
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKNS_6StringEi");

   procedure write
     (fs : access FileStorage'Class;
      name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      value : float);  -- /usr/local/include/opencv2/core/persistence.hpp:389
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKNS_6StringEf");

   procedure write
     (fs : access FileStorage'Class;
      name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      value : double);  -- /usr/local/include/opencv2/core/persistence.hpp:390
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKNS_6StringEd");

   procedure write
     (fs : access FileStorage'Class;
      name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      value : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core/persistence.hpp:391
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKNS_6StringES4_");

   procedure write
     (fs : access FileStorage'Class;
      name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      value : access constant opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core/persistence.hpp:392
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKNS_6StringERKNS_3MatE");

   procedure write
     (fs : access FileStorage'Class;
      name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      value : access constant opencv2_core_mat_hpp.Class_SparseMat.SparseMat);  -- /usr/local/include/opencv2/core/persistence.hpp:393
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKNS_6StringERKNS_9SparseMatE");

   procedure write
     (fs : access FileStorage'Class;
      name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      value : System.Address);  -- /usr/local/include/opencv2/core/persistence.hpp:394
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKNS_6StringERKSt6vectorINS_8KeyPointESaIS6_EE");

   procedure writeScalar (fs : access FileStorage'Class; value : int);  -- /usr/local/include/opencv2/core/persistence.hpp:396
   pragma Import (CPP, writeScalar, "_ZN2cv11writeScalarERNS_11FileStorageEi");

   procedure writeScalar (fs : access FileStorage'Class; value : float);  -- /usr/local/include/opencv2/core/persistence.hpp:397
   pragma Import (CPP, writeScalar, "_ZN2cv11writeScalarERNS_11FileStorageEf");

   procedure writeScalar (fs : access FileStorage'Class; value : double);  -- /usr/local/include/opencv2/core/persistence.hpp:398
   pragma Import (CPP, writeScalar, "_ZN2cv11writeScalarERNS_11FileStorageEd");

   procedure writeScalar (fs : access FileStorage'Class; value : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core/persistence.hpp:399
   pragma Import (CPP, writeScalar, "_ZN2cv11writeScalarERNS_11FileStorageERKNS_6StringE");

   procedure read
     (node : access constant FileNode;
      value : access int;
      default_value : int);  -- /usr/local/include/opencv2/core/persistence.hpp:401
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERii");

   procedure read
     (node : access constant FileNode;
      value : access float;
      default_value : float);  -- /usr/local/include/opencv2/core/persistence.hpp:402
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERff");

   procedure read
     (node : access constant FileNode;
      value : access double;
      default_value : double);  -- /usr/local/include/opencv2/core/persistence.hpp:403
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERdd");

   procedure read
     (node : access constant FileNode;
      value : access opencv2_core_cvstd_hpp.Class_String.String;
      default_value : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core/persistence.hpp:404
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERNS_6StringERKS3_");

   procedure read
     (node : access constant FileNode;
      mat : access opencv2_core_mat_hpp.Class_Mat.Mat;
      default_mat : access constant opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core/persistence.hpp:405
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERNS_3MatERKS3_");

   procedure read
     (node : access constant FileNode;
      mat : access opencv2_core_mat_hpp.Class_SparseMat.SparseMat;
      default_mat : access constant opencv2_core_mat_hpp.Class_SparseMat.SparseMat);  -- /usr/local/include/opencv2/core/persistence.hpp:406
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERNS_9SparseMatERKS3_");

   procedure read (node : access constant FileNode; keypoints : System.Address);  -- /usr/local/include/opencv2/core/persistence.hpp:407
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERSt6vectorINS_8KeyPointESaIS4_EE");

   procedure read
     (node : access constant FileNode;
      value : access opencv2_core_types_hpp.Class_c_Range.c_Range;
      default_value : access constant opencv2_core_types_hpp.Class_c_Range.c_Range);  -- /usr/local/include/opencv2/core/persistence.hpp:454
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERNS_5RangeERKS3_");

   function operator_sl (fs : access FileStorage'Class; str : access constant opencv2_core_cvstd_hpp.Class_String.String) return access FileStorage;  -- /usr/local/include/opencv2/core/persistence.hpp:462
   pragma Import (CPP, operator_sl, "_ZN2cvlsERNS_11FileStorageERKNS_6StringE");

   package Class_WriteStructContext is
      type WriteStructContext is limited record
         fs : access FileStorage;  -- /usr/local/include/opencv2/core/persistence.hpp:473
      end record;
      pragma Import (CPP, WriteStructContext);

      function New_WriteStructContext
        (u_fs : access FileStorage;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         flags : int;
         typeName : access constant opencv2_core_cvstd_hpp.Class_String.String) return WriteStructContext;  -- /usr/local/include/opencv2/core/persistence.hpp:470
      pragma CPP_Constructor (New_WriteStructContext, "_ZN2cv8internal18WriteStructContextC1ERNS_11FileStorageERKNS_6StringEiS6_");

      procedure Delete_WriteStructContext (this : access WriteStructContext);  -- /usr/local/include/opencv2/core/persistence.hpp:471
      pragma Import (CPP, Delete_WriteStructContext, "_ZN2cv8internal18WriteStructContextD1Ev");


   end;
   use Class_WriteStructContext;
   procedure write (fs : access FileStorage'Class; r : access constant opencv2_core_types_hpp.Class_c_Range.c_Range);  -- /usr/local/include/opencv2/core/persistence.hpp:627
   pragma Import (CPP, write, "_ZN2cvL5writeERNS_11FileStorageERKNS_5RangeE");

   procedure write
     (fs : access FileStorage'Class;
      name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      r : access constant opencv2_core_types_hpp.Class_c_Range.c_Range);  -- /usr/local/include/opencv2/core/persistence.hpp:691
   pragma Import (CPP, write, "_ZN2cvL5writeERNS_11FileStorageERKNS_6StringERKNS_5RangeE");

   procedure read
     (node : access constant FileNode;
      value : access Extensions.bool;
      default_value : Extensions.bool);  -- /usr/local/include/opencv2/core/persistence.hpp:706
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERbb");

   procedure read
     (node : access constant FileNode;
      value : access opencv2_core_cvdef_h.uchar;
      default_value : opencv2_core_cvdef_h.uchar);  -- /usr/local/include/opencv2/core/persistence.hpp:714
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERhh");

   procedure read
     (node : access constant FileNode;
      value : access opencv2_core_cvdef_h.schar;
      default_value : opencv2_core_cvdef_h.schar);  -- /usr/local/include/opencv2/core/persistence.hpp:722
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERaa");

   procedure read
     (node : access constant FileNode;
      value : access opencv2_core_cvdef_h.ushort;
      default_value : opencv2_core_cvdef_h.ushort);  -- /usr/local/include/opencv2/core/persistence.hpp:730
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERtt");

   procedure read
     (node : access constant FileNode;
      value : access short;
      default_value : short);  -- /usr/local/include/opencv2/core/persistence.hpp:738
   pragma Import (CPP, read, "_ZN2cvL4readERKNS_8FileNodeERss");

   function operator_sl (fs : access FileStorage'Class; str : Interfaces.C.Strings.chars_ptr) return access FileStorage;  -- /usr/local/include/opencv2/core/persistence.hpp:779
   pragma Import (CPP, operator_sl, "_ZN2cvlsERNS_11FileStorageEPKc");

   function operator_sl (fs : access FileStorage'Class; value : Interfaces.C.Strings.chars_ptr) return access FileStorage;  -- /usr/local/include/opencv2/core/persistence.hpp:785
   pragma Import (CPP, operator_sl, "_ZN2cvlsERNS_11FileStorageEPc");

   function operator_eq (it1 : access constant FileNodeIterator; it2 : access constant FileNodeIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:820
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_16FileNodeIteratorES2_");

   function operator_ne (it1 : access constant FileNodeIterator; it2 : access constant FileNodeIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:827
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_16FileNodeIteratorES2_");

   function operator_m (it1 : access constant FileNodeIterator; it2 : access constant FileNodeIterator) return stddef_h.ptrdiff_t;  -- /usr/local/include/opencv2/core/persistence.hpp:833
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_16FileNodeIteratorES2_");

   function operator_lt (it1 : access constant FileNodeIterator; it2 : access constant FileNodeIterator) return Extensions.bool;  -- /usr/local/include/opencv2/core/persistence.hpp:839
   pragma Import (CPP, operator_lt, "_ZN2cvltERKNS_16FileNodeIteratorES2_");

end opencv2_core_persistence_hpp;
