pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with cpp_4_7_4_bits_stringfwd_h;
with Interfaces.C.Extensions;
limited with cpp_4_7_4_bits_stl_vector_h;
with opencv2_flann_defines_h;
with opencv2_core_core_hpp;

package opencv2_flann_miniflann_hpp is

   package Class_IndexParams is
      type IndexParams is limited record
         params : System.Address;  -- /usr/include/opencv2/flann/miniflann.hpp:80
      end record;
      pragma Import (CPP, IndexParams);

      function New_IndexParams return IndexParams;  -- /usr/include/opencv2/flann/miniflann.hpp:61
      pragma CPP_Constructor (New_IndexParams, "_ZN2cv5flann11IndexParamsC1Ev");

      procedure Delete_IndexParams (this : access IndexParams);  -- /usr/include/opencv2/flann/miniflann.hpp:62
      pragma Import (CPP, Delete_IndexParams, "_ZN2cv5flann11IndexParamsD1Ev");

      function getString
        (this : access constant IndexParams;
         key : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         defaultVal : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/flann/miniflann.hpp:64
      pragma Import (CPP, getString, "_ZNK2cv5flann11IndexParams9getStringERKSsS3_");

      function getInt
        (this : access constant IndexParams;
         key : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         defaultVal : int) return int;  -- /usr/include/opencv2/flann/miniflann.hpp:65
      pragma Import (CPP, getInt, "_ZNK2cv5flann11IndexParams6getIntERKSsi");

      function getDouble
        (this : access constant IndexParams;
         key : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         defaultVal : double) return double;  -- /usr/include/opencv2/flann/miniflann.hpp:66
      pragma Import (CPP, getDouble, "_ZNK2cv5flann11IndexParams9getDoubleERKSsd");

      procedure setString
        (this : access IndexParams;
         key : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         value : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/flann/miniflann.hpp:68
      pragma Import (CPP, setString, "_ZN2cv5flann11IndexParams9setStringERKSsS3_");

      procedure setInt
        (this : access IndexParams;
         key : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         value : int);  -- /usr/include/opencv2/flann/miniflann.hpp:69
      pragma Import (CPP, setInt, "_ZN2cv5flann11IndexParams6setIntERKSsi");

      procedure setDouble
        (this : access IndexParams;
         key : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         value : double);  -- /usr/include/opencv2/flann/miniflann.hpp:70
      pragma Import (CPP, setDouble, "_ZN2cv5flann11IndexParams9setDoubleERKSsd");

      procedure setFloat
        (this : access IndexParams;
         key : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         value : float);  -- /usr/include/opencv2/flann/miniflann.hpp:71
      pragma Import (CPP, setFloat, "_ZN2cv5flann11IndexParams8setFloatERKSsf");

      procedure setBool
        (this : access IndexParams;
         key : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         value : Extensions.bool);  -- /usr/include/opencv2/flann/miniflann.hpp:72
      pragma Import (CPP, setBool, "_ZN2cv5flann11IndexParams7setBoolERKSsb");

      procedure setAlgorithm (this : access IndexParams; value : int);  -- /usr/include/opencv2/flann/miniflann.hpp:73
      pragma Import (CPP, setAlgorithm, "_ZN2cv5flann11IndexParams12setAlgorithmEi");

      procedure getAll
        (this : access constant IndexParams;
         names : System.Address;
         types : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         strValues : System.Address;
         numValues : System.Address);  -- /usr/include/opencv2/flann/miniflann.hpp:75
      pragma Import (CPP, getAll, "_ZNK2cv5flann11IndexParams6getAllERSt6vectorISsSaISsEERS2_IiSaIiEES5_RS2_IdSaIdEE");
   end;
   use Class_IndexParams;
   package Class_KDTreeIndexParams is
      type KDTreeIndexParams is limited record
         parent : aliased IndexParams;
      end record;
      pragma Import (CPP, KDTreeIndexParams);

      function New_KDTreeIndexParams (trees : int) return KDTreeIndexParams;  -- /usr/include/opencv2/flann/miniflann.hpp:85
      pragma CPP_Constructor (New_KDTreeIndexParams, "_ZN2cv5flann17KDTreeIndexParamsC1Ei");


   end;
   use Class_KDTreeIndexParams;
   package Class_LinearIndexParams is
      type LinearIndexParams is limited record
         parent : aliased IndexParams;
      end record;
      pragma Import (CPP, LinearIndexParams);

      function New_LinearIndexParams return LinearIndexParams;  -- /usr/include/opencv2/flann/miniflann.hpp:90
      pragma CPP_Constructor (New_LinearIndexParams, "_ZN2cv5flann17LinearIndexParamsC1Ev");


   end;
   use Class_LinearIndexParams;
   package Class_CompositeIndexParams is
      type CompositeIndexParams is limited record
         parent : aliased IndexParams;
      end record;
      pragma Import (CPP, CompositeIndexParams);

      function New_CompositeIndexParams
        (trees : int;
         branching : int;
         iterations : int;
         centers_init : opencv2_flann_defines_h.flann_centers_init_t;
         cb_index : float) return CompositeIndexParams;  -- /usr/include/opencv2/flann/miniflann.hpp:95
      pragma CPP_Constructor (New_CompositeIndexParams, "_ZN2cv5flann20CompositeIndexParamsC1EiiiN7cvflann20flann_centers_init_tEf");


   end;
   use Class_CompositeIndexParams;
   package Class_AutotunedIndexParams is
      type AutotunedIndexParams is limited record
         parent : aliased IndexParams;
      end record;
      pragma Import (CPP, AutotunedIndexParams);

      function New_AutotunedIndexParams
        (target_precision : float;
         build_weight : float;
         memory_weight : float;
         sample_fraction : float) return AutotunedIndexParams;  -- /usr/include/opencv2/flann/miniflann.hpp:101
      pragma CPP_Constructor (New_AutotunedIndexParams, "_ZN2cv5flann20AutotunedIndexParamsC1Effff");


   end;
   use Class_AutotunedIndexParams;
   package Class_KMeansIndexParams is
      type KMeansIndexParams is limited record
         parent : aliased IndexParams;
      end record;
      pragma Import (CPP, KMeansIndexParams);

      function New_KMeansIndexParams
        (branching : int;
         iterations : int;
         centers_init : opencv2_flann_defines_h.flann_centers_init_t;
         cb_index : float) return KMeansIndexParams;  -- /usr/include/opencv2/flann/miniflann.hpp:107
      pragma CPP_Constructor (New_KMeansIndexParams, "_ZN2cv5flann17KMeansIndexParamsC1EiiN7cvflann20flann_centers_init_tEf");


   end;
   use Class_KMeansIndexParams;
   package Class_LshIndexParams is
      type LshIndexParams is limited record
         parent : aliased IndexParams;
      end record;
      pragma Import (CPP, LshIndexParams);

      function New_LshIndexParams
        (table_number : int;
         key_size : int;
         multi_probe_level : int) return LshIndexParams;  -- /usr/include/opencv2/flann/miniflann.hpp:113
      pragma CPP_Constructor (New_LshIndexParams, "_ZN2cv5flann14LshIndexParamsC1Eiii");


   end;
   use Class_LshIndexParams;
   package Class_SavedIndexParams is
      type SavedIndexParams is limited record
         parent : aliased IndexParams;
      end record;
      pragma Import (CPP, SavedIndexParams);

      function New_SavedIndexParams (filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return SavedIndexParams;  -- /usr/include/opencv2/flann/miniflann.hpp:118
      pragma CPP_Constructor (New_SavedIndexParams, "_ZN2cv5flann16SavedIndexParamsC1ERKSs");


   end;
   use Class_SavedIndexParams;
   package Class_SearchParams is
      type SearchParams is limited record
         parent : aliased IndexParams;
      end record;
      pragma Import (CPP, SearchParams);

      procedure Delete_SearchParams (this : access SearchParams);  -- /usr/include/opencv2/flann/miniflann.hpp:121
      pragma Import (CPP, Delete_SearchParams, "_ZN2cv5flann12SearchParamsD1Ev");

      function New_SearchParams
        (checks : int;
         eps : float;
         sorted : Extensions.bool) return SearchParams;  -- /usr/include/opencv2/flann/miniflann.hpp:123
      pragma CPP_Constructor (New_SearchParams, "_ZN2cv5flann12SearchParamsC1Eifb");


   end;
   use Class_SearchParams;
   package Class_Index is
      type Index is tagged limited record
         distType : aliased opencv2_flann_defines_h.flann_distance_t;  -- /usr/include/opencv2/flann/miniflann.hpp:148
         algo : aliased opencv2_flann_defines_h.flann_algorithm_t;  -- /usr/include/opencv2/flann/miniflann.hpp:149
         featureType : aliased int;  -- /usr/include/opencv2/flann/miniflann.hpp:150
         index : System.Address;  -- /usr/include/opencv2/flann/miniflann.hpp:151
      end record;
      pragma Import (CPP, Index);

      function New_Index return Index;  -- /usr/include/opencv2/flann/miniflann.hpp:129
      pragma CPP_Constructor (New_Index, "_ZN2cv5flann5IndexC1Ev");

      function New_Index
        (features : opencv2_core_core_hpp.InputArray;
         params : access constant IndexParams;
         distType : opencv2_flann_defines_h.flann_distance_t) return Index;  -- /usr/include/opencv2/flann/miniflann.hpp:130
      pragma CPP_Constructor (New_Index, "_ZN2cv5flann5IndexC1ERKNS_11_InputArrayERKNS0_11IndexParamsEN7cvflann16flann_distance_tE");

      procedure Delete_Index (this : access Index);  -- /usr/include/opencv2/flann/miniflann.hpp:131
      pragma Import (CPP, Delete_Index, "_ZN2cv5flann5IndexD1Ev");

      procedure deleting_dtor (this : access Index);  -- /usr/include/opencv2/flann/miniflann.hpp:131
      pragma Import (CPP, deleting_dtor, "_ZN2cv5flann5IndexD0Ev");

      procedure build
        (this : access Index;
         features : opencv2_core_core_hpp.InputArray'Class;
         params : access constant IndexParams;
         distType : opencv2_flann_defines_h.flann_distance_t);  -- /usr/include/opencv2/flann/miniflann.hpp:133
      pragma Import (CPP, build, "_ZN2cv5flann5Index5buildERKNS_11_InputArrayERKNS0_11IndexParamsEN7cvflann16flann_distance_tE");

      procedure knnSearch
        (this : access Index;
         query : opencv2_core_core_hpp.InputArray'Class;
         indices : opencv2_core_core_hpp.OutputArray'Class;
         dists : opencv2_core_core_hpp.OutputArray'Class;
         knn : int;
         params : access constant SearchParams);  -- /usr/include/opencv2/flann/miniflann.hpp:134
      pragma Import (CPP, knnSearch, "_ZN2cv5flann5Index9knnSearchERKNS_11_InputArrayERKNS_12_OutputArrayES7_iRKNS0_12SearchParamsE");

      function radiusSearch
        (this : access Index;
         query : opencv2_core_core_hpp.InputArray'Class;
         indices : opencv2_core_core_hpp.OutputArray'Class;
         dists : opencv2_core_core_hpp.OutputArray'Class;
         radius : double;
         maxResults : int;
         params : access constant SearchParams) return int;  -- /usr/include/opencv2/flann/miniflann.hpp:137
      pragma Import (CPP, radiusSearch, "_ZN2cv5flann5Index12radiusSearchERKNS_11_InputArrayERKNS_12_OutputArrayES7_diRKNS0_12SearchParamsE");

      procedure save (this : access constant Index; filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/flann/miniflann.hpp:141
      pragma Import (CPP, save, "_ZNK2cv5flann5Index4saveERKSs");

      function load
        (this : access Index;
         features : opencv2_core_core_hpp.InputArray'Class;
         filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return Extensions.bool;  -- /usr/include/opencv2/flann/miniflann.hpp:142
      pragma Import (CPP, load, "_ZN2cv5flann5Index4loadERKNS_11_InputArrayERKSs");

      procedure release (this : access Index);  -- /usr/include/opencv2/flann/miniflann.hpp:143
      pragma Import (CPP, release, "_ZN2cv5flann5Index7releaseEv");

      function getDistance (this : access constant Index'Class) return opencv2_flann_defines_h.flann_distance_t;  -- /usr/include/opencv2/flann/miniflann.hpp:144
      pragma Import (CPP, getDistance, "_ZNK2cv5flann5Index11getDistanceEv");

      function getAlgorithm (this : access constant Index'Class) return opencv2_flann_defines_h.flann_algorithm_t;  -- /usr/include/opencv2/flann/miniflann.hpp:145
      pragma Import (CPP, getAlgorithm, "_ZNK2cv5flann5Index12getAlgorithmEv");
   end;
   use Class_Index;
end opencv2_flann_miniflann_hpp;
