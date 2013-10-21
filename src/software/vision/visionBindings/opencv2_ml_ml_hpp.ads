pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with opencv2_core_types_c_h;
with Interfaces.C.Extensions;
with opencv2_core_core_hpp;
limited with cpp_4_7_4_bits_stl_vector_h;
with cpp_4_7_4_bits_stl_map_h;

package opencv2_ml_ml_hpp is


   CV_LOG2PI : constant := (1.8378770664093454835606594728112);  --  /usr/include/opencv2/ml/ml.hpp:58

   CV_COL_SAMPLE : constant := 0;  --  /usr/include/opencv2/ml/ml.hpp:61

   CV_ROW_SAMPLE : constant := 1;  --  /usr/include/opencv2/ml/ml.hpp:64
   --  arg-macro: function CV_IS_ROW_SAMPLE (flags)
   --    return (flags) and CV_ROW_SAMPLE;

   CV_VAR_NUMERICAL : constant := 0;  --  /usr/include/opencv2/ml/ml.hpp:111
   CV_VAR_ORDERED : constant := 0;  --  /usr/include/opencv2/ml/ml.hpp:112
   CV_VAR_CATEGORICAL : constant := 1;  --  /usr/include/opencv2/ml/ml.hpp:113

   CV_TYPE_NAME_ML_SVM : aliased constant String := "opencv-ml-svm" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:115
   CV_TYPE_NAME_ML_KNN : aliased constant String := "opencv-ml-knn" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:116
   CV_TYPE_NAME_ML_NBAYES : aliased constant String := "opencv-ml-bayesian" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:117
   CV_TYPE_NAME_ML_EM : aliased constant String := "opencv-ml-em" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:118
   CV_TYPE_NAME_ML_BOOSTING : aliased constant String := "opencv-ml-boost-tree" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:119
   CV_TYPE_NAME_ML_TREE : aliased constant String := "opencv-ml-tree" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:120
   CV_TYPE_NAME_ML_ANN_MLP : aliased constant String := "opencv-ml-ann-mlp" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:121
   CV_TYPE_NAME_ML_CNN : aliased constant String := "opencv-ml-cnn" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:122
   CV_TYPE_NAME_ML_RTREES : aliased constant String := "opencv-ml-random-trees" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:123
   CV_TYPE_NAME_ML_GBT : aliased constant String := "opencv-ml-gradient-boosting-trees" & ASCII.NUL;  --  /usr/include/opencv2/ml/ml.hpp:124

   CV_TRAIN_ERROR : constant := 0;  --  /usr/include/opencv2/ml/ml.hpp:126
   CV_TEST_ERROR : constant := 1;  --  /usr/include/opencv2/ml/ml.hpp:127
   --  arg-macro: function CV_DTREE_CAT_DIR (idx, subset)
   --    return 2*((subset((idx)>>5)and(2 ** ((idx) and 31)))=0)-1;

   CV_TS_CONCENTRIC_SPHERES : constant := 0;  --  /usr/include/opencv2/ml/ml.hpp:2006

   CV_COUNT : constant := 0;  --  /usr/include/opencv2/ml/ml.hpp:2026
   CV_PORTION : constant := 1;  --  /usr/include/opencv2/ml/ml.hpp:2027

   type anon_232 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:75
         when 1 =>
            fl : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:76
         when others =>
            db : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:77
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_232);
   pragma Unchecked_Union (anon_232);
   type CvVectors is record
      c_type : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:70
      dims : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:71
      count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:71
      next : access CvVectors;  -- /usr/include/opencv2/ml/ml.hpp:72
      data : anon_232;  -- /usr/include/opencv2/ml/ml.hpp:78
   end record;
   pragma Convention (C_Pass_By_Copy, CvVectors);  -- /usr/include/opencv2/ml/ml.hpp:68

   package Class_CvStatModel is
      type CvStatModel is tagged limited record
         default_model_name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/ml/ml.hpp:144
      end record;
      pragma Import (CPP, CvStatModel);

      function New_CvStatModel return CvStatModel;  -- /usr/include/opencv2/ml/ml.hpp:132
      pragma CPP_Constructor (New_CvStatModel, "_ZN11CvStatModelC1Ev");

      procedure Delete_CvStatModel (this : access CvStatModel);  -- /usr/include/opencv2/ml/ml.hpp:133
      pragma Import (CPP, Delete_CvStatModel, "_ZN11CvStatModelD1Ev");

      procedure deleting_dtor (this : access CvStatModel);  -- /usr/include/opencv2/ml/ml.hpp:133
      pragma Import (CPP, deleting_dtor, "_ZN11CvStatModelD0Ev");

      procedure clear (this : access CvStatModel);  -- /usr/include/opencv2/ml/ml.hpp:135
      pragma Import (CPP, clear, "_ZN11CvStatModel5clearEv");

      procedure save
        (this : access constant CvStatModel;
         filename : Interfaces.C.Strings.chars_ptr;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:137
      pragma Import (CPP, save, "_ZNK11CvStatModel4saveEPKcS1_");

      procedure load
        (this : access CvStatModel;
         filename : Interfaces.C.Strings.chars_ptr;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:138
      pragma Import (CPP, load, "_ZN11CvStatModel4loadEPKcS1_");

      procedure write
        (this : access constant CvStatModel;
         storage : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:140
      pragma Import (CPP, write, "_ZNK11CvStatModel5writeEP13CvFileStoragePKc");

      procedure read
        (this : access CvStatModel;
         storage : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:141
      pragma Import (CPP, read, "_ZN11CvStatModel4readEP13CvFileStorageP10CvFileNode");
   end;
   use Class_CvStatModel;
   package Class_CvParamGrid is
      type CvParamGrid is limited record
         min_val : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:177
         max_val : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:178
         step : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:179
      end record;
      pragma Import (CPP, CvParamGrid);

      function New_CvParamGrid return CvParamGrid;  -- /usr/include/opencv2/ml/ml.hpp:163
      pragma CPP_Constructor (New_CvParamGrid, "_ZN11CvParamGridC1Ev");

      function New_CvParamGrid
        (u_min_val : double;
         u_max_val : double;
         log_step : double) return CvParamGrid;  -- /usr/include/opencv2/ml/ml.hpp:168
      pragma CPP_Constructor (New_CvParamGrid, "_ZN11CvParamGridC1Eddd");

      function check (this : access constant CvParamGrid) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:175
      pragma Import (CPP, check, "_ZNK11CvParamGrid5checkEv");
   end;
   use Class_CvParamGrid;
   package Class_CvNormalBayesClassifier is
      type CvNormalBayesClassifier is limited new CvStatModel with record
         var_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:210
         var_all : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:210
         var_idx : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:211
         cls_labels : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:212
         count : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:213
         sum : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:214
         productsum : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:215
         avg : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:216
         inv_eigen_values : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:217
         cov_rotate_mats : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:218
         c : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:219
      end record;
      pragma Import (CPP, CvNormalBayesClassifier);

      function New_CvNormalBayesClassifier return CvNormalBayesClassifier;  -- /usr/include/opencv2/ml/ml.hpp:185
      pragma CPP_Constructor (New_CvNormalBayesClassifier, "_ZN23CvNormalBayesClassifierC1Ev");

      procedure Delete_CvNormalBayesClassifier (this : access CvNormalBayesClassifier);  -- /usr/include/opencv2/ml/ml.hpp:186
      pragma Import (CPP, Delete_CvNormalBayesClassifier, "_ZN23CvNormalBayesClassifierD1Ev");

      procedure deleting_dtor (this : access CvNormalBayesClassifier);  -- /usr/include/opencv2/ml/ml.hpp:186
      pragma Import (CPP, deleting_dtor, "_ZN23CvNormalBayesClassifierD0Ev");

      function New_CvNormalBayesClassifier
        (trainData : access constant opencv2_core_types_c_h.CvMat;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat) return CvNormalBayesClassifier;  -- /usr/include/opencv2/ml/ml.hpp:188
      pragma CPP_Constructor (New_CvNormalBayesClassifier, "_ZN23CvNormalBayesClassifierC1EPK5CvMatS2_S2_S2_");

      function train
        (this : access CvNormalBayesClassifier;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         update : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:191
      pragma Import (CPP, train, "_ZN23CvNormalBayesClassifier5trainEPK5CvMatS2_S2_S2_b");

      function predict
        (this : access constant CvNormalBayesClassifier;
         samples : access constant opencv2_core_types_c_h.CvMat;
         results : access opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:194
      pragma Import (CPP, predict, "_ZNK23CvNormalBayesClassifier7predictEPK5CvMatPS0_");

      procedure clear (this : access CvNormalBayesClassifier);  -- /usr/include/opencv2/ml/ml.hpp:195
      pragma Import (CPP, clear, "_ZN23CvNormalBayesClassifier5clearEv");

      function New_CvNormalBayesClassifier
        (trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat) return CvNormalBayesClassifier;  -- /usr/include/opencv2/ml/ml.hpp:198
      pragma CPP_Constructor (New_CvNormalBayesClassifier, "_ZN23CvNormalBayesClassifierC1ERKN2cv3MatES3_S3_S3_");

      function train
        (this : access CvNormalBayesClassifier;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         update : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:200
      pragma Import (CPP, train, "_ZN23CvNormalBayesClassifier5trainERKN2cv3MatES3_S3_S3_b");

      function predict
        (this : access constant CvNormalBayesClassifier;
         samples : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         results : access opencv2_core_core_hpp.Class_Mat.Mat) return float;  -- /usr/include/opencv2/ml/ml.hpp:203
      pragma Import (CPP, predict, "_ZNK23CvNormalBayesClassifier7predictERKN2cv3MatEPS1_");

      procedure write
        (this : access constant CvNormalBayesClassifier;
         storage : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:206
      pragma Import (CPP, write, "_ZNK23CvNormalBayesClassifier5writeEP13CvFileStoragePKc");

      procedure read
        (this : access CvNormalBayesClassifier;
         storage : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:207
      pragma Import (CPP, read, "_ZN23CvNormalBayesClassifier4readEP13CvFileStorageP10CvFileNode");
   end;
   use Class_CvNormalBayesClassifier;
   package Class_CvKNearest is
      type CvKNearest is limited new CvStatModel with record
         max_k : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:275
         var_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:275
         total : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:276
         regression : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:277
         samples : access CvVectors;  -- /usr/include/opencv2/ml/ml.hpp:278
      end record;
      pragma Import (CPP, CvKNearest);

      function New_CvKNearest return CvKNearest;  -- /usr/include/opencv2/ml/ml.hpp:232
      pragma CPP_Constructor (New_CvKNearest, "_ZN10CvKNearestC1Ev");

      procedure Delete_CvKNearest (this : access CvKNearest);  -- /usr/include/opencv2/ml/ml.hpp:233
      pragma Import (CPP, Delete_CvKNearest, "_ZN10CvKNearestD1Ev");

      procedure deleting_dtor (this : access CvKNearest);  -- /usr/include/opencv2/ml/ml.hpp:233
      pragma Import (CPP, deleting_dtor, "_ZN10CvKNearestD0Ev");

      function New_CvKNearest
        (trainData : access constant opencv2_core_types_c_h.CvMat;
         responses : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         isRegression : Extensions.bool;
         max_k : int) return CvKNearest;  -- /usr/include/opencv2/ml/ml.hpp:235
      pragma CPP_Constructor (New_CvKNearest, "_ZN10CvKNearestC1EPK5CvMatS2_S2_bi");

      function train
        (this : access CvKNearest;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         responses : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         is_regression : Extensions.bool;
         maxK : int;
         updateBase : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:238
      pragma Import (CPP, train, "_ZN10CvKNearest5trainEPK5CvMatS2_S2_bib");

      function find_nearest
        (this : access constant CvKNearest;
         samples : access constant opencv2_core_types_c_h.CvMat;
         k : int;
         results : access opencv2_core_types_c_h.CvMat;
         neighbors : System.Address;
         neighborResponses : access opencv2_core_types_c_h.CvMat;
         dist : access opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:242
      pragma Import (CPP, find_nearest, "_ZNK10CvKNearest12find_nearestEPK5CvMatiPS0_PPKfS3_S3_");

      function New_CvKNearest
        (trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         isRegression : Extensions.bool;
         max_k : int) return CvKNearest;  -- /usr/include/opencv2/ml/ml.hpp:246
      pragma CPP_Constructor (New_CvKNearest, "_ZN10CvKNearestC1ERKN2cv3MatES3_S3_bi");

      function train
        (this : access CvKNearest;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         isRegression : Extensions.bool;
         maxK : int;
         updateBase : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:249
      pragma Import (CPP, train, "_ZN10CvKNearest5trainERKN2cv3MatES3_S3_bib");

      function find_nearest
        (this : access constant CvKNearest;
         samples : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         k : int;
         results : access opencv2_core_core_hpp.Class_Mat.Mat;
         neighbors : System.Address;
         neighborResponses : access opencv2_core_core_hpp.Class_Mat.Mat;
         dist : access opencv2_core_core_hpp.Class_Mat.Mat) return float;  -- /usr/include/opencv2/ml/ml.hpp:253
      pragma Import (CPP, find_nearest, "_ZNK10CvKNearest12find_nearestERKN2cv3MatEiPS1_PPKfS4_S4_");

      function find_nearest
        (this : access constant CvKNearest;
         samples : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         k : int;
         results : access opencv2_core_core_hpp.Class_Mat.Mat;
         neighborResponses : access opencv2_core_core_hpp.Class_Mat.Mat;
         dists : access opencv2_core_core_hpp.Class_Mat.Mat) return float;  -- /usr/include/opencv2/ml/ml.hpp:256
      pragma Import (CPP, find_nearest, "_ZNK10CvKNearest12find_nearestERKN2cv3MatEiRS1_S4_S4_");

      procedure clear (this : access CvKNearest);  -- /usr/include/opencv2/ml/ml.hpp:260
      pragma Import (CPP, clear, "_ZN10CvKNearest5clearEv");

      function get_max_k (this : access constant CvKNearest'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:261
      pragma Import (CPP, get_max_k, "_ZNK10CvKNearest9get_max_kEv");

      function get_var_count (this : access constant CvKNearest'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:262
      pragma Import (CPP, get_var_count, "_ZNK10CvKNearest13get_var_countEv");

      function get_sample_count (this : access constant CvKNearest'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:263
      pragma Import (CPP, get_sample_count, "_ZNK10CvKNearest16get_sample_countEv");

      function is_regression (this : access constant CvKNearest'Class) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:264
      pragma Import (CPP, is_regression, "_ZNK10CvKNearest13is_regressionEv");

      function write_results
        (this : access constant CvKNearest;
         k : int;
         k1 : int;
         start : int;
         c_end : int;
         neighbor_responses : access float;
         dist : access float;
         u_results : access opencv2_core_types_c_h.CvMat;
         u_neighbor_responses : access opencv2_core_types_c_h.CvMat;
         u_dist : access opencv2_core_types_c_h.CvMat;
         sort_buf : access opencv2_core_types_c_h.Cv32suf) return float;  -- /usr/include/opencv2/ml/ml.hpp:266
      pragma Import (CPP, write_results, "_ZNK10CvKNearest13write_resultsEiiiiPKfS1_P5CvMatS3_S3_P7Cv32suf");

      procedure find_neighbors_direct
        (this : access constant CvKNearest;
         u_samples : access constant opencv2_core_types_c_h.CvMat;
         k : int;
         start : int;
         c_end : int;
         neighbor_responses : access float;
         neighbors : System.Address;
         dist : access float);  -- /usr/include/opencv2/ml/ml.hpp:270
      pragma Import (CPP, find_neighbors_direct, "_ZNK10CvKNearest21find_neighbors_directEPK5CvMatiiiPfPPKfS3_");
   end;
   use Class_CvKNearest;
   package Class_CvSVMParams is
      type CvSVMParams is limited record
         svm_type : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:294
         kernel_type : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:295
         degree : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:296
         gamma : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:297
         coef0 : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:298
         C : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:300
         nu : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:301
         p : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:302
         class_weights : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:303
         term_crit : aliased opencv2_core_types_c_h.CvTermCriteria;  -- /usr/include/opencv2/ml/ml.hpp:304
      end record;
      pragma Import (CPP, CvSVMParams);

      function New_CvSVMParams return CvSVMParams;  -- /usr/include/opencv2/ml/ml.hpp:288
      pragma CPP_Constructor (New_CvSVMParams, "_ZN11CvSVMParamsC1Ev");

      function New_CvSVMParams
        (u_svm_type : int;
         u_kernel_type : int;
         u_degree : double;
         u_gamma : double;
         u_coef0 : double;
         Cvalue : double;
         u_nu : double;
         u_p : double;
         u_class_weights : access opencv2_core_types_c_h.CvMat;
         u_term_crit : opencv2_core_types_c_h.CvTermCriteria) return CvSVMParams;  -- /usr/include/opencv2/ml/ml.hpp:289
      pragma CPP_Constructor (New_CvSVMParams, "_ZN11CvSVMParamsC1EiiddddddP5CvMat14CvTermCriteria");


   end;
   use Class_CvSVMParams;
   type CvSVMKernel;
   type Calc is record
      uu_pfn : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:311
      uu_delta : aliased long;  -- /usr/include/opencv2/ml/ml.hpp:311
   end record;
   pragma Convention (C_Pass_By_Copy, Calc);
   package Class_CvSVMKernel is
      type CvSVMKernel is tagged limited record
         params : access constant CvSVMParams;  -- /usr/include/opencv2/ml/ml.hpp:320
         calc_func : aliased Calc;  -- /usr/include/opencv2/ml/ml.hpp:321
      end record;
      pragma Import (CPP, CvSVMKernel);

      function New_CvSVMKernel return CvSVMKernel;  -- /usr/include/opencv2/ml/ml.hpp:312
      pragma CPP_Constructor (New_CvSVMKernel, "_ZN11CvSVMKernelC1Ev");

      function New_CvSVMKernel (params : access constant CvSVMParams; u_calc_func : Calc) return CvSVMKernel;  -- /usr/include/opencv2/ml/ml.hpp:313
      pragma CPP_Constructor (New_CvSVMKernel, "_ZN11CvSVMKernelC1EPK11CvSVMParamsMS_FviiPPKfS4_PfE");

      function create
        (this : access CvSVMKernel;
         params : access constant CvSVMParams;
         u_calc_func : Calc) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:314
      pragma Import (CPP, create, "_ZN11CvSVMKernel6createEPK11CvSVMParamsMS_FviiPPKfS4_PfE");

      procedure Delete_CvSVMKernel (this : access CvSVMKernel);  -- /usr/include/opencv2/ml/ml.hpp:315
      pragma Import (CPP, Delete_CvSVMKernel, "_ZN11CvSVMKernelD1Ev");

      procedure deleting_dtor (this : access CvSVMKernel);  -- /usr/include/opencv2/ml/ml.hpp:315
      pragma Import (CPP, deleting_dtor, "_ZN11CvSVMKernelD0Ev");

      procedure clear (this : access CvSVMKernel);  -- /usr/include/opencv2/ml/ml.hpp:317
      pragma Import (CPP, clear, "_ZN11CvSVMKernel5clearEv");

      procedure calc
        (this : access CvSVMKernel;
         vcount : int;
         n : int;
         vecs : System.Address;
         another : access float;
         results : access float);  -- /usr/include/opencv2/ml/ml.hpp:318
      pragma Import (CPP, calc, "_ZN11CvSVMKernel4calcEiiPPKfS1_Pf");

      procedure calc_non_rbf_base
        (this : access CvSVMKernel;
         vec_count : int;
         vec_size : int;
         vecs : System.Address;
         another : access float;
         results : access float;
         alpha : double;
         beta : double);  -- /usr/include/opencv2/ml/ml.hpp:323
      pragma Import (CPP, calc_non_rbf_base, "_ZN11CvSVMKernel17calc_non_rbf_baseEiiPPKfS1_Pfdd");

      procedure calc_linear
        (this : access CvSVMKernel;
         vec_count : int;
         vec_size : int;
         vecs : System.Address;
         another : access float;
         results : access float);  -- /usr/include/opencv2/ml/ml.hpp:327
      pragma Import (CPP, calc_linear, "_ZN11CvSVMKernel11calc_linearEiiPPKfS1_Pf");

      procedure calc_rbf
        (this : access CvSVMKernel;
         vec_count : int;
         vec_size : int;
         vecs : System.Address;
         another : access float;
         results : access float);  -- /usr/include/opencv2/ml/ml.hpp:329
      pragma Import (CPP, calc_rbf, "_ZN11CvSVMKernel8calc_rbfEiiPPKfS1_Pf");

      procedure calc_poly
        (this : access CvSVMKernel;
         vec_count : int;
         vec_size : int;
         vecs : System.Address;
         another : access float;
         results : access float);  -- /usr/include/opencv2/ml/ml.hpp:331
      pragma Import (CPP, calc_poly, "_ZN11CvSVMKernel9calc_polyEiiPPKfS1_Pf");

      procedure calc_sigmoid
        (this : access CvSVMKernel;
         vec_count : int;
         vec_size : int;
         vecs : System.Address;
         another : access float;
         results : access float);  -- /usr/include/opencv2/ml/ml.hpp:333
      pragma Import (CPP, calc_sigmoid, "_ZN11CvSVMKernel12calc_sigmoidEiiPPKfS1_Pf");
   end;
   use Class_CvSVMKernel;
   type CvSVMKernelRow is record
      prev : access CvSVMKernelRow;  -- /usr/include/opencv2/ml/ml.hpp:340
      next : access CvSVMKernelRow;  -- /usr/include/opencv2/ml/ml.hpp:341
      data : access float;  -- /usr/include/opencv2/ml/ml.hpp:342
   end record;
   pragma Convention (C_Pass_By_Copy, CvSVMKernelRow);  -- /usr/include/opencv2/ml/ml.hpp:338

   type CvSVMSolutionInfo is record
      obj : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:348
      rho : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:349
      upper_bound_p : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:350
      upper_bound_n : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:351
      r : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:352
   end record;
   pragma Convention (C_Pass_By_Copy, CvSVMSolutionInfo);  -- /usr/include/opencv2/ml/ml.hpp:346

   type CvSVMSolver_buf_array is array (0 .. 1) of access float;
   type CvSVMSolver_C_array is array (0 .. 1) of aliased double;
   type CvSVMSolver;
   type SelectWorkingSet is record
      uu_pfn : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:358
      uu_delta : aliased long;  -- /usr/include/opencv2/ml/ml.hpp:358
   end record;
   pragma Convention (C_Pass_By_Copy, SelectWorkingSet);
   type GetRow is record
      uu_pfn : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:359
      uu_delta : aliased long;  -- /usr/include/opencv2/ml/ml.hpp:359
   end record;
   pragma Convention (C_Pass_By_Copy, GetRow);
   type CalcRho is record
      uu_pfn : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:360
      uu_delta : aliased long;  -- /usr/include/opencv2/ml/ml.hpp:360
   end record;
   pragma Convention (C_Pass_By_Copy, CalcRho);
   package Class_CvSVMSolver is
      type CvSVMSolver is tagged limited record
         sample_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:398
         var_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:399
         cache_size : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:400
         cache_line_size : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:401
         samples : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:402
         params : access constant CvSVMParams;  -- /usr/include/opencv2/ml/ml.hpp:403
         storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/ml/ml.hpp:404
         lru_list : aliased CvSVMKernelRow;  -- /usr/include/opencv2/ml/ml.hpp:405
         rows : access CvSVMKernelRow;  -- /usr/include/opencv2/ml/ml.hpp:406
         alpha_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:408
         G : access double;  -- /usr/include/opencv2/ml/ml.hpp:410
         alpha : access double;  -- /usr/include/opencv2/ml/ml.hpp:411
         alpha_status : access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/ml/ml.hpp:414
         y : access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/ml/ml.hpp:416
         b : access double;  -- /usr/include/opencv2/ml/ml.hpp:417
         buf : aliased CvSVMSolver_buf_array;  -- /usr/include/opencv2/ml/ml.hpp:418
         eps : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:419
         max_iter : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:420
         C : aliased CvSVMSolver_C_array;  -- /usr/include/opencv2/ml/ml.hpp:421
         kernel : access CvSVMKernel;  -- /usr/include/opencv2/ml/ml.hpp:422
         select_working_set_func : aliased SelectWorkingSet;  -- /usr/include/opencv2/ml/ml.hpp:424
         calc_rho_func : aliased CalcRho;  -- /usr/include/opencv2/ml/ml.hpp:425
         get_row_func : aliased GetRow;  -- /usr/include/opencv2/ml/ml.hpp:426
      end record;
      pragma Import (CPP, CvSVMSolver);

      function New_CvSVMSolver return CvSVMSolver;  -- /usr/include/opencv2/ml/ml.hpp:362
      pragma CPP_Constructor (New_CvSVMSolver, "_ZN11CvSVMSolverC1Ev");

      function New_CvSVMSolver
        (count : int;
         var_count : int;
         samples : System.Address;
         y : access opencv2_core_types_c_h.schar;
         alpha_count : int;
         alpha : access double;
         Cp : double;
         Cn : double;
         storage : access opencv2_core_types_c_h.CvMemStorage;
         kernel : access CvSVMKernel'Class;
         get_row : GetRow;
         select_working_set : SelectWorkingSet;
         calc_rho : CalcRho) return CvSVMSolver;  -- /usr/include/opencv2/ml/ml.hpp:364
      pragma CPP_Constructor (New_CvSVMSolver, "_ZN11CvSVMSolverC1EiiPPKfPaiPdddP12CvMemStorageP11CvSVMKernelMS_FPfiS9_S9_bEMS_FbRiSC_EMS_FvRdSF_E");

      function create
        (this : access CvSVMSolver;
         count : int;
         var_count : int;
         samples : System.Address;
         y : access opencv2_core_types_c_h.schar;
         alpha_count : int;
         alpha : access double;
         Cp : double;
         Cn : double;
         storage : access opencv2_core_types_c_h.CvMemStorage;
         kernel : access CvSVMKernel'Class;
         get_row : GetRow;
         select_working_set : SelectWorkingSet;
         calc_rho : CalcRho) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:368
      pragma Import (CPP, create, "_ZN11CvSVMSolver6createEiiPPKfPaiPdddP12CvMemStorageP11CvSVMKernelMS_FPfiS9_S9_bEMS_FbRiSC_EMS_FvRdSF_E");

      procedure Delete_CvSVMSolver (this : access CvSVMSolver);  -- /usr/include/opencv2/ml/ml.hpp:372
      pragma Import (CPP, Delete_CvSVMSolver, "_ZN11CvSVMSolverD1Ev");

      procedure deleting_dtor (this : access CvSVMSolver);  -- /usr/include/opencv2/ml/ml.hpp:372
      pragma Import (CPP, deleting_dtor, "_ZN11CvSVMSolverD0Ev");

      procedure clear (this : access CvSVMSolver);  -- /usr/include/opencv2/ml/ml.hpp:374
      pragma Import (CPP, clear, "_ZN11CvSVMSolver5clearEv");

      function solve_generic (this : access CvSVMSolver; si : access CvSVMSolutionInfo) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:375
      pragma Import (CPP, solve_generic, "_ZN11CvSVMSolver13solve_genericER17CvSVMSolutionInfo");

      function solve_c_svc
        (this : access CvSVMSolver;
         count : int;
         var_count : int;
         samples : System.Address;
         y : access opencv2_core_types_c_h.schar;
         Cp : double;
         Cn : double;
         storage : access opencv2_core_types_c_h.CvMemStorage;
         kernel : access CvSVMKernel'Class;
         alpha : access double;
         si : access CvSVMSolutionInfo) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:377
      pragma Import (CPP, solve_c_svc, "_ZN11CvSVMSolver11solve_c_svcEiiPPKfPaddP12CvMemStorageP11CvSVMKernelPdR17CvSVMSolutionInfo");

      function solve_nu_svc
        (this : access CvSVMSolver;
         count : int;
         var_count : int;
         samples : System.Address;
         y : access opencv2_core_types_c_h.schar;
         storage : access opencv2_core_types_c_h.CvMemStorage;
         kernel : access CvSVMKernel'Class;
         alpha : access double;
         si : access CvSVMSolutionInfo) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:380
      pragma Import (CPP, solve_nu_svc, "_ZN11CvSVMSolver12solve_nu_svcEiiPPKfPaP12CvMemStorageP11CvSVMKernelPdR17CvSVMSolutionInfo");

      function solve_one_class
        (this : access CvSVMSolver;
         count : int;
         var_count : int;
         samples : System.Address;
         storage : access opencv2_core_types_c_h.CvMemStorage;
         kernel : access CvSVMKernel'Class;
         alpha : access double;
         si : access CvSVMSolutionInfo) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:383
      pragma Import (CPP, solve_one_class, "_ZN11CvSVMSolver15solve_one_classEiiPPKfP12CvMemStorageP11CvSVMKernelPdR17CvSVMSolutionInfo");

      function solve_eps_svr
        (this : access CvSVMSolver;
         count : int;
         var_count : int;
         samples : System.Address;
         y : access float;
         storage : access opencv2_core_types_c_h.CvMemStorage;
         kernel : access CvSVMKernel'Class;
         alpha : access double;
         si : access CvSVMSolutionInfo) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:387
      pragma Import (CPP, solve_eps_svr, "_ZN11CvSVMSolver13solve_eps_svrEiiPPKfS1_P12CvMemStorageP11CvSVMKernelPdR17CvSVMSolutionInfo");

      function solve_nu_svr
        (this : access CvSVMSolver;
         count : int;
         var_count : int;
         samples : System.Address;
         y : access float;
         storage : access opencv2_core_types_c_h.CvMemStorage;
         kernel : access CvSVMKernel'Class;
         alpha : access double;
         si : access CvSVMSolutionInfo) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:391
      pragma Import (CPP, solve_nu_svr, "_ZN11CvSVMSolver12solve_nu_svrEiiPPKfS1_P12CvMemStorageP11CvSVMKernelPdR17CvSVMSolutionInfo");

      function get_row_base
        (this : access CvSVMSolver;
         i : int;
         u_existed : access Extensions.bool) return access float;  -- /usr/include/opencv2/ml/ml.hpp:395
      pragma Import (CPP, get_row_base, "_ZN11CvSVMSolver12get_row_baseEiPb");

      function get_row
        (this : access CvSVMSolver;
         i : int;
         dst : access float) return access float;  -- /usr/include/opencv2/ml/ml.hpp:396
      pragma Import (CPP, get_row, "_ZN11CvSVMSolver7get_rowEiPf");

      function select_working_set
        (this : access CvSVMSolver;
         i : access int;
         j : access int) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:428
      pragma Import (CPP, select_working_set, "_ZN11CvSVMSolver18select_working_setERiS0_");

      function select_working_set_nu_svm
        (this : access CvSVMSolver;
         i : access int;
         j : access int) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:429
      pragma Import (CPP, select_working_set_nu_svm, "_ZN11CvSVMSolver25select_working_set_nu_svmERiS0_");

      procedure calc_rho
        (this : access CvSVMSolver;
         rho : access double;
         r : access double);  -- /usr/include/opencv2/ml/ml.hpp:430
      pragma Import (CPP, calc_rho, "_ZN11CvSVMSolver8calc_rhoERdS0_");

      procedure calc_rho_nu_svm
        (this : access CvSVMSolver;
         rho : access double;
         r : access double);  -- /usr/include/opencv2/ml/ml.hpp:431
      pragma Import (CPP, calc_rho_nu_svm, "_ZN11CvSVMSolver15calc_rho_nu_svmERdS0_");

      function get_row_svc
        (this : access CvSVMSolver;
         i : int;
         row : access float;
         dst : access float;
         existed : Extensions.bool) return access float;  -- /usr/include/opencv2/ml/ml.hpp:433
      pragma Import (CPP, get_row_svc, "_ZN11CvSVMSolver11get_row_svcEiPfS0_b");

      function get_row_one_class
        (this : access CvSVMSolver;
         i : int;
         row : access float;
         dst : access float;
         existed : Extensions.bool) return access float;  -- /usr/include/opencv2/ml/ml.hpp:434
      pragma Import (CPP, get_row_one_class, "_ZN11CvSVMSolver17get_row_one_classEiPfS0_b");

      function get_row_svr
        (this : access CvSVMSolver;
         i : int;
         row : access float;
         dst : access float;
         existed : Extensions.bool) return access float;  -- /usr/include/opencv2/ml/ml.hpp:435
      pragma Import (CPP, get_row_svr, "_ZN11CvSVMSolver11get_row_svrEiPfS0_b");
   end;
   use Class_CvSVMSolver;
   type CvSVMDecisionFunc is record
      rho : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:441
      sv_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:442
      alpha : access double;  -- /usr/include/opencv2/ml/ml.hpp:443
      sv_index : access int;  -- /usr/include/opencv2/ml/ml.hpp:444
   end record;
   pragma Convention (C_Pass_By_Copy, CvSVMDecisionFunc);  -- /usr/include/opencv2/ml/ml.hpp:439

   package Class_CvSVM is
      type CvSVM is limited new CvStatModel with record
         params : aliased CvSVMParams;  -- /usr/include/opencv2/ml/ml.hpp:535
         class_labels : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:536
         var_all : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:537
         sv : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:538
         sv_total : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:539
         var_idx : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:540
         class_weights : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:541
         decision_func : access CvSVMDecisionFunc;  -- /usr/include/opencv2/ml/ml.hpp:542
         storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/ml/ml.hpp:543
         solver : access CvSVMSolver;  -- /usr/include/opencv2/ml/ml.hpp:545
         kernel : access CvSVMKernel;  -- /usr/include/opencv2/ml/ml.hpp:546
      end record;
      pragma Import (CPP, CvSVM);

      function New_CvSVM return CvSVM;  -- /usr/include/opencv2/ml/ml.hpp:461
      pragma CPP_Constructor (New_CvSVM, "_ZN5CvSVMC1Ev");

      procedure Delete_CvSVM (this : access CvSVM);  -- /usr/include/opencv2/ml/ml.hpp:462
      pragma Import (CPP, Delete_CvSVM, "_ZN5CvSVMD1Ev");

      procedure deleting_dtor (this : access CvSVM);  -- /usr/include/opencv2/ml/ml.hpp:462
      pragma Import (CPP, deleting_dtor, "_ZN5CvSVMD0Ev");

      function New_CvSVM
        (trainData : access constant opencv2_core_types_c_h.CvMat;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         params : CvSVMParams) return CvSVM;  -- /usr/include/opencv2/ml/ml.hpp:464
      pragma CPP_Constructor (New_CvSVM, "_ZN5CvSVMC1EPK5CvMatS2_S2_S2_11CvSVMParams");

      function train
        (this : access CvSVM;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         params : CvSVMParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:468
      pragma Import (CPP, train, "_ZN5CvSVM5trainEPK5CvMatS2_S2_S2_11CvSVMParams");

      function train_auto
        (this : access CvSVM;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         params : CvSVMParams;
         kfold : int;
         Cgrid : CvParamGrid;
         gammaGrid : CvParamGrid;
         pGrid : CvParamGrid;
         nuGrid : CvParamGrid;
         coeffGrid : CvParamGrid;
         degreeGrid : CvParamGrid;
         balanced : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:472
      pragma Import (CPP, train_auto, "_ZN5CvSVM10train_autoEPK5CvMatS2_S2_S2_11CvSVMParamsi11CvParamGridS4_S4_S4_S4_S4_b");

      function predict
        (this : access constant CvSVM;
         sample : access constant opencv2_core_types_c_h.CvMat;
         returnDFVal : Extensions.bool) return float;  -- /usr/include/opencv2/ml/ml.hpp:483
      pragma Import (CPP, predict, "_ZNK5CvSVM7predictEPK5CvMatb");

      function predict
        (this : access constant CvSVM;
         samples : access constant opencv2_core_types_c_h.CvMat;
         results : access opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:484
      pragma Import (CPP, predict, "_ZNK5CvSVM7predictEPK5CvMatPS0_");

      function New_CvSVM
        (trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvSVMParams) return CvSVM;  -- /usr/include/opencv2/ml/ml.hpp:487
      pragma CPP_Constructor (New_CvSVM, "_ZN5CvSVMC1ERKN2cv3MatES3_S3_S3_11CvSVMParams");

      function train
        (this : access CvSVM;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvSVMParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:491
      pragma Import (CPP, train, "_ZN5CvSVM5trainERKN2cv3MatES3_S3_S3_11CvSVMParams");

      function train_auto
        (this : access CvSVM;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvSVMParams;
         k_fold : int;
         Cgrid : CvParamGrid;
         gammaGrid : CvParamGrid;
         pGrid : CvParamGrid;
         nuGrid : CvParamGrid;
         coeffGrid : CvParamGrid;
         degreeGrid : CvParamGrid;
         balanced : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:495
      pragma Import (CPP, train_auto, "_ZN5CvSVM10train_autoERKN2cv3MatES3_S3_S3_11CvSVMParamsi11CvParamGridS5_S5_S5_S5_S5_b");

      function predict
        (this : access constant CvSVM;
         sample : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         returnDFVal : Extensions.bool) return float;  -- /usr/include/opencv2/ml/ml.hpp:505
      pragma Import (CPP, predict, "_ZNK5CvSVM7predictERKN2cv3MatEb");

      function get_support_vector_count (this : access constant CvSVM) return int;  -- /usr/include/opencv2/ml/ml.hpp:508
      pragma Import (CPP, get_support_vector_count, "_ZNK5CvSVM24get_support_vector_countEv");

      function get_support_vector (this : access constant CvSVM; i : int) return access float;  -- /usr/include/opencv2/ml/ml.hpp:509
      pragma Import (CPP, get_support_vector, "_ZNK5CvSVM18get_support_vectorEi");

      function get_params (this : access constant CvSVM) return CvSVMParams;  -- /usr/include/opencv2/ml/ml.hpp:510
      pragma Import (CPP, get_params, "_ZNK5CvSVM10get_paramsEv");

      procedure clear (this : access CvSVM);  -- /usr/include/opencv2/ml/ml.hpp:511
      pragma Import (CPP, clear, "_ZN5CvSVM5clearEv");

      function get_default_grid (param_id : int) return CvParamGrid;  -- /usr/include/opencv2/ml/ml.hpp:513
      pragma Import (CPP, get_default_grid, "_ZN5CvSVM16get_default_gridEi");

      procedure write
        (this : access constant CvSVM;
         storage : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:515
      pragma Import (CPP, write, "_ZNK5CvSVM5writeEP13CvFileStoragePKc");

      procedure read
        (this : access CvSVM;
         storage : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:516
      pragma Import (CPP, read, "_ZN5CvSVM4readEP13CvFileStorageP10CvFileNode");

      function get_var_count (this : access constant CvSVM'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:517
      pragma Import (CPP, get_var_count, "_ZNK5CvSVM13get_var_countEv");

      function set_params (this : access CvSVM; params : access constant CvSVMParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:521
      pragma Import (CPP, set_params, "_ZN5CvSVM10set_paramsERK11CvSVMParams");

      function train1
        (this : access CvSVM;
         sample_count : int;
         var_count : int;
         samples : System.Address;
         responses : System.Address;
         Cp : double;
         Cn : double;
         u_storage : access opencv2_core_types_c_h.CvMemStorage;
         alpha : access double;
         rho : access double) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:522
      pragma Import (CPP, train1, "_ZN5CvSVM6train1EiiPPKfPKvddP12CvMemStoragePdRd");

      function do_train
        (this : access CvSVM;
         svm_type : int;
         sample_count : int;
         var_count : int;
         samples : System.Address;
         responses : access constant opencv2_core_types_c_h.CvMat;
         u_storage : access opencv2_core_types_c_h.CvMemStorage;
         alpha : access double) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:525
      pragma Import (CPP, do_train, "_ZN5CvSVM8do_trainEiiiPPKfPK5CvMatP12CvMemStoragePd");

      procedure create_kernel (this : access CvSVM);  -- /usr/include/opencv2/ml/ml.hpp:527
      pragma Import (CPP, create_kernel, "_ZN5CvSVM13create_kernelEv");

      procedure create_solver (this : access CvSVM);  -- /usr/include/opencv2/ml/ml.hpp:528
      pragma Import (CPP, create_solver, "_ZN5CvSVM13create_solverEv");

      function predict
        (this : access constant CvSVM;
         row_sample : access float;
         row_len : int;
         returnDFVal : Extensions.bool) return float;  -- /usr/include/opencv2/ml/ml.hpp:530
      pragma Import (CPP, predict, "_ZNK5CvSVM7predictEPKfib");

      procedure write_params (this : access constant CvSVM; fs : System.Address);  -- /usr/include/opencv2/ml/ml.hpp:532
      pragma Import (CPP, write_params, "_ZNK5CvSVM12write_paramsEP13CvFileStorage");

      procedure read_params
        (this : access CvSVM;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:533
      pragma Import (CPP, read_params, "_ZN5CvSVM11read_paramsEP13CvFileStorageP10CvFileNode");
   end;
   use Class_CvSVM;
   package Class_CvEMParams is
      type CvEMParams is limited record
         nclusters : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:561
         cov_mat_type : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:562
         start_step : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:563
         probs : access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:564
         weights : access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:565
         means : access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:566
         covs : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:567
         term_crit : aliased opencv2_core_types_c_h.CvTermCriteria;  -- /usr/include/opencv2/ml/ml.hpp:568
      end record;
      pragma Import (CPP, CvEMParams);

      function New_CvEMParams return CvEMParams;  -- /usr/include/opencv2/ml/ml.hpp:555
      pragma CPP_Constructor (New_CvEMParams, "_ZN10CvEMParamsC1Ev");

      function New_CvEMParams
        (nclusters : int;
         cov_mat_type : int;
         start_step : int;
         term_crit : opencv2_core_types_c_h.CvTermCriteria;
         probs : access constant opencv2_core_types_c_h.CvMat;
         weights : access constant opencv2_core_types_c_h.CvMat;
         means : access constant opencv2_core_types_c_h.CvMat;
         covs : System.Address) return CvEMParams;  -- /usr/include/opencv2/ml/ml.hpp:556
      pragma CPP_Constructor (New_CvEMParams, "_ZN10CvEMParamsC1Eiii14CvTermCriteriaPK5CvMatS3_S3_PS3_");


   end;
   use Class_CvEMParams;
   package Class_CvEM is
      type CvEM is limited new CvStatModel with record
         params : aliased CvEMParams;  -- /usr/include/opencv2/ml/ml.hpp:647
         log_likelihood : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:648
         log_likelihood_delta : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:649
         means : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:651
         covs : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:652
         weights : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:653
         probs : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:654
         log_weight_div_det : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:656
         inv_eigen_values : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:657
         cov_rotate_mats : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:658
      end record;
      pragma Import (CPP, CvEM);

      function New_CvEM return CvEM;  -- /usr/include/opencv2/ml/ml.hpp:581
      pragma CPP_Constructor (New_CvEM, "_ZN4CvEMC1Ev");

      function New_CvEM
        (samples : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         params : CvEMParams;
         labels : access opencv2_core_types_c_h.CvMat) return CvEM;  -- /usr/include/opencv2/ml/ml.hpp:582
      pragma CPP_Constructor (New_CvEM, "_ZN4CvEMC1EPK5CvMatS2_10CvEMParamsPS0_");

      procedure Delete_CvEM (this : access CvEM);  -- /usr/include/opencv2/ml/ml.hpp:587
      pragma Import (CPP, Delete_CvEM, "_ZN4CvEMD1Ev");

      procedure deleting_dtor (this : access CvEM);  -- /usr/include/opencv2/ml/ml.hpp:587
      pragma Import (CPP, deleting_dtor, "_ZN4CvEMD0Ev");

      function train
        (this : access CvEM;
         samples : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         params : CvEMParams;
         labels : access opencv2_core_types_c_h.CvMat) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:589
      pragma Import (CPP, train, "_ZN4CvEM5trainEPK5CvMatS2_10CvEMParamsPS0_");

      function predict
        (this : access constant CvEM;
         sample : access constant opencv2_core_types_c_h.CvMat;
         probs : access opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:592
      pragma Import (CPP, predict, "_ZNK4CvEM7predictEPK5CvMatPS0_");

      function New_CvEM
        (samples : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvEMParams) return CvEM;  -- /usr/include/opencv2/ml/ml.hpp:595
      pragma CPP_Constructor (New_CvEM, "_ZN4CvEMC1ERKN2cv3MatES3_10CvEMParams");

      function train
        (this : access CvEM;
         samples : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvEMParams;
         labels : access opencv2_core_core_hpp.Class_Mat.Mat) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:598
      pragma Import (CPP, train, "_ZN4CvEM5trainERKN2cv3MatES3_10CvEMParamsPS1_");

      function predict
        (this : access constant CvEM;
         sample : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         probs : access opencv2_core_core_hpp.Class_Mat.Mat) return float;  -- /usr/include/opencv2/ml/ml.hpp:603
      pragma Import (CPP, predict, "_ZNK4CvEM7predictERKN2cv3MatEPS1_");

      function calcLikelihood (this : access constant CvEM; sample : access constant opencv2_core_core_hpp.Class_Mat.Mat) return double;  -- /usr/include/opencv2/ml/ml.hpp:604
      pragma Import (CPP, calcLikelihood, "_ZNK4CvEM14calcLikelihoodERKN2cv3MatE");

      function getNClusters (this : access constant CvEM'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:606
      pragma Import (CPP, getNClusters, "_ZNK4CvEM12getNClustersEv");

      function getMeans (this : access constant CvEM'Class) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/ml/ml.hpp:607
      pragma Import (CPP, getMeans, "_ZNK4CvEM8getMeansEv");

      procedure getCovs (this : access constant CvEM'Class; covs : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/ml/ml.hpp:608
      pragma Import (CPP, getCovs, "_ZNK4CvEM7getCovsERSt6vectorIN2cv3MatESaIS2_EE");

      function getWeights (this : access constant CvEM'Class) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/ml/ml.hpp:609
      pragma Import (CPP, getWeights, "_ZNK4CvEM10getWeightsEv");

      function getProbs (this : access constant CvEM'Class) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/ml/ml.hpp:610
      pragma Import (CPP, getProbs, "_ZNK4CvEM8getProbsEv");

      function getLikelihood (this : access constant CvEM'Class) return double;  -- /usr/include/opencv2/ml/ml.hpp:612
      pragma Import (CPP, getLikelihood, "_ZNK4CvEM13getLikelihoodEv");

      function getLikelihoodDelta (this : access constant CvEM'Class) return double;  -- /usr/include/opencv2/ml/ml.hpp:613
      pragma Import (CPP, getLikelihoodDelta, "_ZNK4CvEM18getLikelihoodDeltaEv");

      procedure clear (this : access CvEM);  -- /usr/include/opencv2/ml/ml.hpp:616
      pragma Import (CPP, clear, "_ZN4CvEM5clearEv");

      function get_nclusters (this : access constant CvEM'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:618
      pragma Import (CPP, get_nclusters, "_ZNK4CvEM13get_nclustersEv");

      function get_means (this : access constant CvEM'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:619
      pragma Import (CPP, get_means, "_ZNK4CvEM9get_meansEv");

      function get_covs (this : access constant CvEM'Class) return System.Address;  -- /usr/include/opencv2/ml/ml.hpp:620
      pragma Import (CPP, get_covs, "_ZNK4CvEM8get_covsEv");

      function get_weights (this : access constant CvEM'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:621
      pragma Import (CPP, get_weights, "_ZNK4CvEM11get_weightsEv");

      function get_probs (this : access constant CvEM'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:622
      pragma Import (CPP, get_probs, "_ZNK4CvEM9get_probsEv");

      function get_log_likelihood (this : access constant CvEM'Class) return double;  -- /usr/include/opencv2/ml/ml.hpp:624
      pragma Import (CPP, get_log_likelihood, "_ZNK4CvEM18get_log_likelihoodEv");

      function get_log_likelihood_delta (this : access constant CvEM'Class) return double;  -- /usr/include/opencv2/ml/ml.hpp:625
      pragma Import (CPP, get_log_likelihood_delta, "_ZNK4CvEM24get_log_likelihood_deltaEv");

      procedure read
        (this : access CvEM;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:631
      pragma Import (CPP, read, "_ZN4CvEM4readEP13CvFileStorageP10CvFileNode");

      procedure write
        (this : access constant CvEM;
         fs : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:632
      pragma Import (CPP, write, "_ZNK4CvEM5writeEP13CvFileStoragePKc");

      procedure write_params (this : access constant CvEM; fs : System.Address);  -- /usr/include/opencv2/ml/ml.hpp:634
      pragma Import (CPP, write_params, "_ZNK4CvEM12write_paramsEP13CvFileStorage");

      procedure read_params
        (this : access CvEM;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:635
      pragma Import (CPP, read_params, "_ZN4CvEM11read_paramsEP13CvFileStorageP10CvFileNode");

      procedure set_params
        (this : access CvEM;
         params : access constant CvEMParams;
         train_data : access constant CvVectors);  -- /usr/include/opencv2/ml/ml.hpp:639
      pragma Import (CPP, set_params, "_ZN4CvEM10set_paramsERK10CvEMParamsRK9CvVectors");

      procedure init_em (this : access CvEM; train_data : access constant CvVectors);  -- /usr/include/opencv2/ml/ml.hpp:641
      pragma Import (CPP, init_em, "_ZN4CvEM7init_emERK9CvVectors");

      function run_em (this : access CvEM; train_data : access constant CvVectors) return double;  -- /usr/include/opencv2/ml/ml.hpp:642
      pragma Import (CPP, run_em, "_ZN4CvEM6run_emERK9CvVectors");

      procedure init_auto (this : access CvEM; samples : access constant CvVectors);  -- /usr/include/opencv2/ml/ml.hpp:643
      pragma Import (CPP, init_auto, "_ZN4CvEM9init_autoERK9CvVectors");

      procedure kmeans
        (this : access CvEM;
         train_data : access constant CvVectors;
         nclusters : int;
         labels : access opencv2_core_types_c_h.CvMat;
         criteria : opencv2_core_types_c_h.CvTermCriteria;
         means : access constant opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/ml/ml.hpp:644
      pragma Import (CPP, kmeans, "_ZN4CvEM6kmeansERK9CvVectorsiP5CvMat14CvTermCriteriaPKS3_");
   end;
   use Class_CvEM;
   type CvPair16u32s is record
      u : access unsigned_short;  -- /usr/include/opencv2/ml/ml.hpp:666
      i : access int;  -- /usr/include/opencv2/ml/ml.hpp:667
   end record;
   pragma Convention (C_Pass_By_Copy, CvPair16u32s);  -- /usr/include/opencv2/ml/ml.hpp:664

   type CvDTreeSplit_subset_array is array (0 .. 1) of aliased int;
   type anon_239;
   type anon_240 is record
      c : aliased float;  -- /usr/include/opencv2/ml/ml.hpp:686
      split_point : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:687
   end record;
   pragma Convention (C_Pass_By_Copy, anon_240);
   type anon_239 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            subset : aliased CvDTreeSplit_subset_array;  -- /usr/include/opencv2/ml/ml.hpp:683
         when others =>
            ord : aliased anon_240;  -- /usr/include/opencv2/ml/ml.hpp:689
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_239);
   pragma Unchecked_Union (anon_239);
   type CvDTreeSplit is record
      var_idx : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:676
      condensed_idx : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:677
      inversed : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:678
      quality : aliased float;  -- /usr/include/opencv2/ml/ml.hpp:679
      next : access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:680
      field_6 : aliased anon_239;
   end record;
   pragma Convention (C_Pass_By_Copy, CvDTreeSplit);  -- /usr/include/opencv2/ml/ml.hpp:674

   package Class_CvDTreeNode is
      type CvDTreeNode is limited record
         class_idx : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:695
         Tn : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:696
         value : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:697
         parent : access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:699
         left : access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:700
         right : access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:701
         split : access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:703
         sample_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:705
         depth : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:706
         num_valid : access int;  -- /usr/include/opencv2/ml/ml.hpp:707
         offset : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:708
         buf_idx : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:709
         maxlr : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:710
         complexity : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:713
         alpha : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:714
         node_risk : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:715
         tree_risk : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:715
         tree_error : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:715
         cv_Tn : access int;  -- /usr/include/opencv2/ml/ml.hpp:718
         cv_node_risk : access double;  -- /usr/include/opencv2/ml/ml.hpp:719
         cv_node_error : access double;  -- /usr/include/opencv2/ml/ml.hpp:720
      end record;
      pragma Import (CPP, CvDTreeNode);

      function get_num_valid (this : access CvDTreeNode; vi : int) return int;  -- /usr/include/opencv2/ml/ml.hpp:722
      pragma Import (CPP, get_num_valid, "_ZN11CvDTreeNode13get_num_validEi");

      procedure set_num_valid
        (this : access CvDTreeNode;
         vi : int;
         n : int);  -- /usr/include/opencv2/ml/ml.hpp:723
      pragma Import (CPP, set_num_valid, "_ZN11CvDTreeNode13set_num_validEii");
   end;
   use Class_CvDTreeNode;
   package Class_CvDTreeParams is
      type CvDTreeParams is limited record
         max_categories : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:729
         max_depth : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:730
         min_sample_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:731
         cv_folds : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:732
         use_surrogates : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:733
         use_1se_rule : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:734
         truncate_pruned_tree : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:735
         regression_accuracy : aliased float;  -- /usr/include/opencv2/ml/ml.hpp:736
         priors : access float;  -- /usr/include/opencv2/ml/ml.hpp:737
      end record;
      pragma Import (CPP, CvDTreeParams);

      function New_CvDTreeParams return CvDTreeParams;  -- /usr/include/opencv2/ml/ml.hpp:739
      pragma CPP_Constructor (New_CvDTreeParams, "_ZN13CvDTreeParamsC1Ev");

      function New_CvDTreeParams
        (max_depth : int;
         min_sample_count : int;
         regression_accuracy : float;
         use_surrogates : Extensions.bool;
         max_categories : int;
         cv_folds : int;
         use_1se_rule : Extensions.bool;
         truncate_pruned_tree : Extensions.bool;
         priors : access float) return CvDTreeParams;  -- /usr/include/opencv2/ml/ml.hpp:740
      pragma CPP_Constructor (New_CvDTreeParams, "_ZN13CvDTreeParamsC1EiifbiibbPKf");


   end;
   use Class_CvDTreeParams;
   package Class_CvDTreeTrainData is
      type CvDTreeTrainData is tagged limited record
         sample_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:805
         var_all : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:805
         var_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:805
         max_c_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:805
         ord_var_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:806
         cat_var_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:806
         work_var_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:806
         have_labels : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:807
         have_priors : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:807
         is_classifier : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:808
         tflag : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:809
         train_data : access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:811
         responses : access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:812
         responses_copy : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:813
         buf_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:815
         buf_size : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:815
         shared : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:816
         is_buf_16u : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:817
         cat_count : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:819
         cat_ofs : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:820
         cat_map : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:821
         counts : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:823
         buf : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:824
         direction : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:825
         split_buf : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:826
         var_idx : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:828
         var_type : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:829
         priors : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:832
         priors_mult : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:833
         params : aliased CvDTreeParams;  -- /usr/include/opencv2/ml/ml.hpp:835
         tree_storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/ml/ml.hpp:837
         temp_storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/ml/ml.hpp:838
         data_root : access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:840
         node_heap : access opencv2_core_types_c_h.CvSet;  -- /usr/include/opencv2/ml/ml.hpp:842
         split_heap : access opencv2_core_types_c_h.CvSet;  -- /usr/include/opencv2/ml/ml.hpp:843
         cv_heap : access opencv2_core_types_c_h.CvSet;  -- /usr/include/opencv2/ml/ml.hpp:844
         nv_heap : access opencv2_core_types_c_h.CvSet;  -- /usr/include/opencv2/ml/ml.hpp:845
         the_rng : access opencv2_core_core_hpp.Class_RNG.RNG;  -- /usr/include/opencv2/ml/ml.hpp:847
      end record;
      pragma Import (CPP, CvDTreeTrainData);

      function New_CvDTreeTrainData return CvDTreeTrainData;  -- /usr/include/opencv2/ml/ml.hpp:750
      pragma CPP_Constructor (New_CvDTreeTrainData, "_ZN16CvDTreeTrainDataC1Ev");

      function New_CvDTreeTrainData
        (trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : access constant CvDTreeParams;
         u_shared : Extensions.bool;
         u_add_labels : Extensions.bool) return CvDTreeTrainData;  -- /usr/include/opencv2/ml/ml.hpp:751
      pragma CPP_Constructor (New_CvDTreeTrainData, "_ZN16CvDTreeTrainDataC1EPK5CvMatiS2_S2_S2_S2_S2_RK13CvDTreeParamsbb");

      procedure Delete_CvDTreeTrainData (this : access CvDTreeTrainData);  -- /usr/include/opencv2/ml/ml.hpp:757
      pragma Import (CPP, Delete_CvDTreeTrainData, "_ZN16CvDTreeTrainDataD1Ev");

      procedure deleting_dtor (this : access CvDTreeTrainData);  -- /usr/include/opencv2/ml/ml.hpp:757
      pragma Import (CPP, deleting_dtor, "_ZN16CvDTreeTrainDataD0Ev");

      procedure set_data
        (this : access CvDTreeTrainData;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : access constant CvDTreeParams;
         u_shared : Extensions.bool;
         u_add_labels : Extensions.bool;
         u_update_data : Extensions.bool);  -- /usr/include/opencv2/ml/ml.hpp:759
      pragma Import (CPP, set_data, "_ZN16CvDTreeTrainData8set_dataEPK5CvMatiS2_S2_S2_S2_S2_RK13CvDTreeParamsbbb");

      procedure do_responses_copy (this : access CvDTreeTrainData);  -- /usr/include/opencv2/ml/ml.hpp:766
      pragma Import (CPP, do_responses_copy, "_ZN16CvDTreeTrainData17do_responses_copyEv");

      procedure get_vectors
        (this : access CvDTreeTrainData;
         u_subsample_idx : access constant opencv2_core_types_c_h.CvMat;
         values : access float;
         missing : access opencv2_core_types_c_h.uchar;
         responses : access float;
         get_class_idx : Extensions.bool);  -- /usr/include/opencv2/ml/ml.hpp:768
      pragma Import (CPP, get_vectors, "_ZN16CvDTreeTrainData11get_vectorsEPK5CvMatPfPhS3_b");

      function subsample_data (this : access CvDTreeTrainData; u_subsample_idx : access constant opencv2_core_types_c_h.CvMat) return access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:771
      pragma Import (CPP, subsample_data, "_ZN16CvDTreeTrainData14subsample_dataEPK5CvMat");

      procedure write_params (this : access constant CvDTreeTrainData; fs : System.Address);  -- /usr/include/opencv2/ml/ml.hpp:773
      pragma Import (CPP, write_params, "_ZNK16CvDTreeTrainData12write_paramsEP13CvFileStorage");

      procedure read_params
        (this : access CvDTreeTrainData;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:774
      pragma Import (CPP, read_params, "_ZN16CvDTreeTrainData11read_paramsEP13CvFileStorageP10CvFileNode");

      procedure clear (this : access CvDTreeTrainData);  -- /usr/include/opencv2/ml/ml.hpp:777
      pragma Import (CPP, clear, "_ZN16CvDTreeTrainData5clearEv");

      function get_num_classes (this : access constant CvDTreeTrainData'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:779
      pragma Import (CPP, get_num_classes, "_ZNK16CvDTreeTrainData15get_num_classesEv");

      function get_var_type (this : access constant CvDTreeTrainData'Class; vi : int) return int;  -- /usr/include/opencv2/ml/ml.hpp:780
      pragma Import (CPP, get_var_type, "_ZNK16CvDTreeTrainData12get_var_typeEi");

      function get_work_var_count (this : access constant CvDTreeTrainData'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:781
      pragma Import (CPP, get_work_var_count, "_ZNK16CvDTreeTrainData18get_work_var_countEv");

      function get_ord_responses
        (this : access CvDTreeTrainData;
         n : access CvDTreeNode;
         values_buf : access float;
         sample_indices_buf : access int) return access float;  -- /usr/include/opencv2/ml/ml.hpp:783
      pragma Import (CPP, get_ord_responses, "_ZN16CvDTreeTrainData17get_ord_responsesEP11CvDTreeNodePfPi");

      function get_class_labels
        (this : access CvDTreeTrainData;
         n : access CvDTreeNode;
         labels_buf : access int) return access int;  -- /usr/include/opencv2/ml/ml.hpp:784
      pragma Import (CPP, get_class_labels, "_ZN16CvDTreeTrainData16get_class_labelsEP11CvDTreeNodePi");

      function get_cv_labels
        (this : access CvDTreeTrainData;
         n : access CvDTreeNode;
         labels_buf : access int) return access int;  -- /usr/include/opencv2/ml/ml.hpp:785
      pragma Import (CPP, get_cv_labels, "_ZN16CvDTreeTrainData13get_cv_labelsEP11CvDTreeNodePi");

      function get_sample_indices
        (this : access CvDTreeTrainData;
         n : access CvDTreeNode;
         indices_buf : access int) return access int;  -- /usr/include/opencv2/ml/ml.hpp:786
      pragma Import (CPP, get_sample_indices, "_ZN16CvDTreeTrainData18get_sample_indicesEP11CvDTreeNodePi");

      function get_cat_var_data
        (this : access CvDTreeTrainData;
         n : access CvDTreeNode;
         vi : int;
         cat_values_buf : access int) return access int;  -- /usr/include/opencv2/ml/ml.hpp:787
      pragma Import (CPP, get_cat_var_data, "_ZN16CvDTreeTrainData16get_cat_var_dataEP11CvDTreeNodeiPi");

      procedure get_ord_var_data
        (this : access CvDTreeTrainData;
         n : access CvDTreeNode;
         vi : int;
         ord_values_buf : access float;
         sorted_indices_buf : access int;
         ord_values : System.Address;
         sorted_indices : System.Address;
         sample_indices_buf : access int);  -- /usr/include/opencv2/ml/ml.hpp:788
      pragma Import (CPP, get_ord_var_data, "_ZN16CvDTreeTrainData16get_ord_var_dataEP11CvDTreeNodeiPfPiPPKfPPKiS3_");

      function get_child_buf_idx (this : access CvDTreeTrainData; n : access CvDTreeNode) return int;  -- /usr/include/opencv2/ml/ml.hpp:790
      pragma Import (CPP, get_child_buf_idx, "_ZN16CvDTreeTrainData17get_child_buf_idxEP11CvDTreeNode");

      function set_params (this : access CvDTreeTrainData; params : access constant CvDTreeParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:794
      pragma Import (CPP, set_params, "_ZN16CvDTreeTrainData10set_paramsERK13CvDTreeParams");

      function new_node
        (this : access CvDTreeTrainData;
         parent : access CvDTreeNode;
         count : int;
         storage_idx : int;
         offset : int) return access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:795
      pragma Import (CPP, new_node, "_ZN16CvDTreeTrainData8new_nodeEP11CvDTreeNodeiii");

      function new_split_ord
        (this : access CvDTreeTrainData;
         vi : int;
         cmp_val : float;
         split_point : int;
         inversed : int;
         quality : float) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:798
      pragma Import (CPP, new_split_ord, "_ZN16CvDTreeTrainData13new_split_ordEifiif");

      function new_split_cat
        (this : access CvDTreeTrainData;
         vi : int;
         quality : float) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:800
      pragma Import (CPP, new_split_cat, "_ZN16CvDTreeTrainData13new_split_catEif");

      procedure free_node_data (this : access CvDTreeTrainData; node : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:801
      pragma Import (CPP, free_node_data, "_ZN16CvDTreeTrainData14free_node_dataEP11CvDTreeNode");

      procedure free_train_data (this : access CvDTreeTrainData);  -- /usr/include/opencv2/ml/ml.hpp:802
      pragma Import (CPP, free_train_data, "_ZN16CvDTreeTrainData15free_train_dataEv");

      procedure free_node (this : access CvDTreeTrainData; node : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:803
      pragma Import (CPP, free_node, "_ZN16CvDTreeTrainData9free_nodeEP11CvDTreeNode");
   end;
   use Class_CvDTreeTrainData;
   --  skipped empty struct DTreeBestSplitFinder

   --  skipped empty struct ForestTreeBestSplitFinder

   package Class_CvDTree is
      type CvDTree is limited new CvStatModel with record
         root : access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:946
         var_importance : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:947
         data : access CvDTreeTrainData;  -- /usr/include/opencv2/ml/ml.hpp:948
         pruned_tree_idx : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:951
      end record;
      pragma Import (CPP, CvDTree);

      function New_CvDTree return CvDTree;  -- /usr/include/opencv2/ml/ml.hpp:862
      pragma CPP_Constructor (New_CvDTree, "_ZN7CvDTreeC1Ev");

      procedure Delete_CvDTree (this : access CvDTree);  -- /usr/include/opencv2/ml/ml.hpp:863
      pragma Import (CPP, Delete_CvDTree, "_ZN7CvDTreeD1Ev");

      procedure deleting_dtor (this : access CvDTree);  -- /usr/include/opencv2/ml/ml.hpp:863
      pragma Import (CPP, deleting_dtor, "_ZN7CvDTreeD0Ev");

      function train
        (this : access CvDTree;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvDTreeParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:865
      pragma Import (CPP, train, "_ZN7CvDTree5trainEPK5CvMatiS2_S2_S2_S2_S2_13CvDTreeParams");

      function train
        (this : access CvDTree;
         trainData : access CvMLData'Class;
         params : CvDTreeParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:871
      pragma Import (CPP, train, "_ZN7CvDTree5trainEP8CvMLData13CvDTreeParams");

      function calc_error
        (this : access CvDTree;
         trainData : access CvMLData'Class;
         c_type : int;
         resp : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return float;  -- /usr/include/opencv2/ml/ml.hpp:874
      pragma Import (CPP, calc_error, "_ZN7CvDTree10calc_errorEP8CvMLDataiPSt6vectorIfSaIfEE");

      function train
        (this : access CvDTree;
         trainData : access CvDTreeTrainData'Class;
         subsampleIdx : access constant opencv2_core_types_c_h.CvMat) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:876
      pragma Import (CPP, train, "_ZN7CvDTree5trainEP16CvDTreeTrainDataPK5CvMat");

      function predict
        (this : access constant CvDTree;
         sample : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         preprocessedInput : Extensions.bool) return access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:878
      pragma Import (CPP, predict, "_ZNK7CvDTree7predictEPK5CvMatS2_b");

      function train
        (this : access CvDTree;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         tflag : int;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varType : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missingDataMask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvDTreeParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:882
      pragma Import (CPP, train, "_ZN7CvDTree5trainERKN2cv3MatEiS3_S3_S3_S3_S3_13CvDTreeParams");

      function predict
        (this : access constant CvDTree;
         sample : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missingDataMask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         preprocessedInput : Extensions.bool) return access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:888
      pragma Import (CPP, predict, "_ZNK7CvDTree7predictERKN2cv3MatES3_b");

      function getVarImportance (this : access CvDTree) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/ml/ml.hpp:890
      pragma Import (CPP, getVarImportance, "_ZN7CvDTree16getVarImportanceEv");

      function get_var_importance (this : access CvDTree) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:893
      pragma Import (CPP, get_var_importance, "_ZN7CvDTree18get_var_importanceEv");

      procedure clear (this : access CvDTree);  -- /usr/include/opencv2/ml/ml.hpp:894
      pragma Import (CPP, clear, "_ZN7CvDTree5clearEv");

      procedure read
        (this : access CvDTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:896
      pragma Import (CPP, read, "_ZN7CvDTree4readEP13CvFileStorageP10CvFileNode");

      procedure write
        (this : access constant CvDTree;
         fs : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:897
      pragma Import (CPP, write, "_ZNK7CvDTree5writeEP13CvFileStoragePKc");

      procedure read
        (this : access CvDTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode;
         data : access CvDTreeTrainData'Class);  -- /usr/include/opencv2/ml/ml.hpp:900
      pragma Import (CPP, read, "_ZN7CvDTree4readEP13CvFileStorageP10CvFileNodeP16CvDTreeTrainData");

      procedure write (this : access constant CvDTree; fs : System.Address);  -- /usr/include/opencv2/ml/ml.hpp:902
      pragma Import (CPP, write, "_ZNK7CvDTree5writeEP13CvFileStorage");

      function get_root (this : access constant CvDTree'Class) return access constant CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:904
      pragma Import (CPP, get_root, "_ZNK7CvDTree8get_rootEv");

      function get_pruned_tree_idx (this : access constant CvDTree'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:905
      pragma Import (CPP, get_pruned_tree_idx, "_ZNK7CvDTree19get_pruned_tree_idxEv");

      function get_data (this : access CvDTree'Class) return access CvDTreeTrainData;  -- /usr/include/opencv2/ml/ml.hpp:906
      pragma Import (CPP, get_data, "_ZN7CvDTree8get_dataEv");

      function do_train (this : access CvDTree; u_subsample_idx : access constant opencv2_core_types_c_h.CvMat) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:911
      pragma Import (CPP, do_train, "_ZN7CvDTree8do_trainEPK5CvMat");

      procedure try_split_node (this : access CvDTree; n : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:913
      pragma Import (CPP, try_split_node, "_ZN7CvDTree14try_split_nodeEP11CvDTreeNode");

      procedure split_node_data (this : access CvDTree; n : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:914
      pragma Import (CPP, split_node_data, "_ZN7CvDTree15split_node_dataEP11CvDTreeNode");

      function find_best_split (this : access CvDTree; n : access CvDTreeNode) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:915
      pragma Import (CPP, find_best_split, "_ZN7CvDTree15find_best_splitEP11CvDTreeNode");

      function find_split_ord_class
        (this : access CvDTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:916
      pragma Import (CPP, find_split_ord_class, "_ZN7CvDTree20find_split_ord_classEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_cat_class
        (this : access CvDTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:918
      pragma Import (CPP, find_split_cat_class, "_ZN7CvDTree20find_split_cat_classEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_ord_reg
        (this : access CvDTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:920
      pragma Import (CPP, find_split_ord_reg, "_ZN7CvDTree18find_split_ord_regEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_cat_reg
        (this : access CvDTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:922
      pragma Import (CPP, find_split_cat_reg, "_ZN7CvDTree18find_split_cat_regEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_surrogate_split_ord
        (this : access CvDTree;
         n : access CvDTreeNode;
         vi : int;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:924
      pragma Import (CPP, find_surrogate_split_ord, "_ZN7CvDTree24find_surrogate_split_ordEP11CvDTreeNodeiPh");

      function find_surrogate_split_cat
        (this : access CvDTree;
         n : access CvDTreeNode;
         vi : int;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:925
      pragma Import (CPP, find_surrogate_split_cat, "_ZN7CvDTree24find_surrogate_split_catEP11CvDTreeNodeiPh");

      function calc_node_dir (this : access CvDTree; node : access CvDTreeNode) return double;  -- /usr/include/opencv2/ml/ml.hpp:926
      pragma Import (CPP, calc_node_dir, "_ZN7CvDTree13calc_node_dirEP11CvDTreeNode");

      procedure complete_node_dir (this : access CvDTree; node : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:927
      pragma Import (CPP, complete_node_dir, "_ZN7CvDTree17complete_node_dirEP11CvDTreeNode");

      procedure cluster_categories
        (this : access CvDTree;
         vectors : access int;
         vector_count : int;
         var_count : int;
         sums : access int;
         k : int;
         cluster_labels : access int);  -- /usr/include/opencv2/ml/ml.hpp:928
      pragma Import (CPP, cluster_categories, "_ZN7CvDTree18cluster_categoriesEPKiiiPiiS2_");

      procedure calc_node_value (this : access CvDTree; node : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:931
      pragma Import (CPP, calc_node_value, "_ZN7CvDTree15calc_node_valueEP11CvDTreeNode");

      procedure prune_cv (this : access CvDTree);  -- /usr/include/opencv2/ml/ml.hpp:933
      pragma Import (CPP, prune_cv, "_ZN7CvDTree8prune_cvEv");

      function update_tree_rnc
        (this : access CvDTree;
         T : int;
         fold : int) return double;  -- /usr/include/opencv2/ml/ml.hpp:934
      pragma Import (CPP, update_tree_rnc, "_ZN7CvDTree15update_tree_rncEii");

      function cut_tree
        (this : access CvDTree;
         T : int;
         fold : int;
         min_alpha : double) return int;  -- /usr/include/opencv2/ml/ml.hpp:935
      pragma Import (CPP, cut_tree, "_ZN7CvDTree8cut_treeEiid");

      procedure free_prune_data (this : access CvDTree; cut_tree : Extensions.bool);  -- /usr/include/opencv2/ml/ml.hpp:936
      pragma Import (CPP, free_prune_data, "_ZN7CvDTree15free_prune_dataEb");

      procedure free_tree (this : access CvDTree);  -- /usr/include/opencv2/ml/ml.hpp:937
      pragma Import (CPP, free_tree, "_ZN7CvDTree9free_treeEv");

      procedure write_node
        (this : access constant CvDTree;
         fs : System.Address;
         node : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:939
      pragma Import (CPP, write_node, "_ZNK7CvDTree10write_nodeEP13CvFileStorageP11CvDTreeNode");

      procedure write_split
        (this : access constant CvDTree;
         fs : System.Address;
         split : access CvDTreeSplit);  -- /usr/include/opencv2/ml/ml.hpp:940
      pragma Import (CPP, write_split, "_ZNK7CvDTree11write_splitEP13CvFileStorageP12CvDTreeSplit");

      function read_node
        (this : access CvDTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode;
         parent : access CvDTreeNode) return access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:941
      pragma Import (CPP, read_node, "_ZN7CvDTree9read_nodeEP13CvFileStorageP10CvFileNodeP11CvDTreeNode");

      function read_split
        (this : access CvDTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:942
      pragma Import (CPP, read_split, "_ZN7CvDTree10read_splitEP13CvFileStorageP10CvFileNode");

      procedure write_tree_nodes (this : access constant CvDTree; fs : System.Address);  -- /usr/include/opencv2/ml/ml.hpp:943
      pragma Import (CPP, write_tree_nodes, "_ZNK7CvDTree16write_tree_nodesEP13CvFileStorage");

      procedure read_tree_nodes
        (this : access CvDTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:944
      pragma Import (CPP, read_tree_nodes, "_ZN7CvDTree15read_tree_nodesEP13CvFileStorageP10CvFileNode");
   end;
   use Class_CvDTree;
   type CvRTrees;
   package Class_CvForestTree is
      type CvForestTree is limited new CvDTree with record
         forest : access CvRTrees;  -- /usr/include/opencv2/ml/ml.hpp:989
      end record;
      pragma Import (CPP, CvForestTree);

      function New_CvForestTree return CvForestTree;  -- /usr/include/opencv2/ml/ml.hpp:964
      pragma CPP_Constructor (New_CvForestTree, "_ZN12CvForestTreeC1Ev");

      procedure Delete_CvForestTree (this : access CvForestTree);  -- /usr/include/opencv2/ml/ml.hpp:965
      pragma Import (CPP, Delete_CvForestTree, "_ZN12CvForestTreeD1Ev");

      procedure deleting_dtor (this : access CvForestTree);  -- /usr/include/opencv2/ml/ml.hpp:965
      pragma Import (CPP, deleting_dtor, "_ZN12CvForestTreeD0Ev");

      function train
        (this : access CvForestTree;
         trainData : access CvDTreeTrainData'Class;
         u_subsample_idx : access constant opencv2_core_types_c_h.CvMat;
         forest : access CvRTrees'Class) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:967
      pragma Import (CPP, train, "_ZN12CvForestTree5trainEP16CvDTreeTrainDataPK5CvMatP8CvRTrees");

      function get_var_count (this : access constant CvForestTree) return int;  -- /usr/include/opencv2/ml/ml.hpp:969
      pragma Import (CPP, get_var_count, "_ZNK12CvForestTree13get_var_countEv");

      procedure read
        (this : access CvForestTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode;
         forest : access CvRTrees'Class;
         u_data : access CvDTreeTrainData'Class);  -- /usr/include/opencv2/ml/ml.hpp:970
      pragma Import (CPP, read, "_ZN12CvForestTree4readEP13CvFileStorageP10CvFileNodeP8CvRTreesP16CvDTreeTrainData");

      function train
        (this : access CvForestTree;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvDTreeParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:973
      pragma Import (CPP, train, "_ZN12CvForestTree5trainEPK5CvMatiS2_S2_S2_S2_S2_13CvDTreeParams");

      function train
        (this : access CvForestTree;
         trainData : access CvDTreeTrainData'Class;
         u_subsample_idx : access constant opencv2_core_types_c_h.CvMat) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:979
      pragma Import (CPP, train, "_ZN12CvForestTree5trainEP16CvDTreeTrainDataPK5CvMat");

      procedure read
        (this : access CvForestTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:980
      pragma Import (CPP, read, "_ZN12CvForestTree4readEP13CvFileStorageP10CvFileNode");

      procedure read
        (this : access CvForestTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode;
         data : access CvDTreeTrainData'Class);  -- /usr/include/opencv2/ml/ml.hpp:981
      pragma Import (CPP, read, "_ZN12CvForestTree4readEP13CvFileStorageP10CvFileNodeP16CvDTreeTrainData");

      function find_best_split (this : access CvForestTree; n : access CvDTreeNode) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:988
      pragma Import (CPP, find_best_split, "_ZN12CvForestTree15find_best_splitEP11CvDTreeNode");
   end;
   use Class_CvForestTree;
   package Class_CvRTParams is
      type CvRTParams is limited record
         parent : aliased CvDTreeParams;
         calc_var_importance : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:996
         nactive_vars : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:997
         term_crit : aliased opencv2_core_types_c_h.CvTermCriteria;  -- /usr/include/opencv2/ml/ml.hpp:998
      end record;
      pragma Import (CPP, CvRTParams);

      function New_CvRTParams return CvRTParams;  -- /usr/include/opencv2/ml/ml.hpp:1000
      pragma CPP_Constructor (New_CvRTParams, "_ZN10CvRTParamsC1Ev");

      function New_CvRTParams
        (max_depth : int;
         min_sample_count : int;
         regression_accuracy : float;
         use_surrogates : Extensions.bool;
         max_categories : int;
         priors : access float;
         calc_var_importance : Extensions.bool;
         nactive_vars : int;
         max_num_of_trees_in_the_forest : int;
         forest_accuracy : float;
         termcrit_type : int) return CvRTParams;  -- /usr/include/opencv2/ml/ml.hpp:1001
      pragma CPP_Constructor (New_CvRTParams, "_ZN10CvRTParamsC1EiifbiPKfbiifi");


   end;
   use Class_CvRTParams;
   package Class_CvRTrees is
      type CvRTrees is limited new CvStatModel with record
         trees : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:1059
         data : access CvDTreeTrainData;  -- /usr/include/opencv2/ml/ml.hpp:1060
         ntrees : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1061
         nclasses : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1062
         oob_error : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1063
         var_importance : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1064
         nsamples : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1065
         the_rng : access opencv2_core_core_hpp.Class_RNG.RNG;  -- /usr/include/opencv2/ml/ml.hpp:1067
         active_var_mask : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1068
      end record;
      pragma Import (CPP, CvRTrees);

      function New_CvRTrees return CvRTrees;  -- /usr/include/opencv2/ml/ml.hpp:1012
      pragma CPP_Constructor (New_CvRTrees, "_ZN8CvRTreesC1Ev");

      procedure Delete_CvRTrees (this : access CvRTrees);  -- /usr/include/opencv2/ml/ml.hpp:1013
      pragma Import (CPP, Delete_CvRTrees, "_ZN8CvRTreesD1Ev");

      procedure deleting_dtor (this : access CvRTrees);  -- /usr/include/opencv2/ml/ml.hpp:1013
      pragma Import (CPP, deleting_dtor, "_ZN8CvRTreesD0Ev");

      function train
        (this : access CvRTrees;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvRTParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1014
      pragma Import (CPP, train, "_ZN8CvRTrees5trainEPK5CvMatiS2_S2_S2_S2_S2_10CvRTParams");

      function train
        (this : access CvRTrees;
         data : access CvMLData'Class;
         params : CvRTParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1020
      pragma Import (CPP, train, "_ZN8CvRTrees5trainEP8CvMLData10CvRTParams");

      function predict
        (this : access constant CvRTrees;
         sample : access constant opencv2_core_types_c_h.CvMat;
         missing : access constant opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:1021
      pragma Import (CPP, predict, "_ZNK8CvRTrees7predictEPK5CvMatS2_");

      function predict_prob
        (this : access constant CvRTrees;
         sample : access constant opencv2_core_types_c_h.CvMat;
         missing : access constant opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:1022
      pragma Import (CPP, predict_prob, "_ZNK8CvRTrees12predict_probEPK5CvMatS2_");

      function train
        (this : access CvRTrees;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         tflag : int;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varType : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missingDataMask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvRTParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1025
      pragma Import (CPP, train, "_ZN8CvRTrees5trainERKN2cv3MatEiS3_S3_S3_S3_S3_10CvRTParams");

      function predict
        (this : access constant CvRTrees;
         sample : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missing : access constant opencv2_core_core_hpp.Class_Mat.Mat) return float;  -- /usr/include/opencv2/ml/ml.hpp:1030
      pragma Import (CPP, predict, "_ZNK8CvRTrees7predictERKN2cv3MatES3_");

      function predict_prob
        (this : access constant CvRTrees;
         sample : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missing : access constant opencv2_core_core_hpp.Class_Mat.Mat) return float;  -- /usr/include/opencv2/ml/ml.hpp:1031
      pragma Import (CPP, predict_prob, "_ZNK8CvRTrees12predict_probERKN2cv3MatES3_");

      function getVarImportance (this : access CvRTrees) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/ml/ml.hpp:1032
      pragma Import (CPP, getVarImportance, "_ZN8CvRTrees16getVarImportanceEv");

      procedure clear (this : access CvRTrees);  -- /usr/include/opencv2/ml/ml.hpp:1035
      pragma Import (CPP, clear, "_ZN8CvRTrees5clearEv");

      function get_var_importance (this : access CvRTrees) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1037
      pragma Import (CPP, get_var_importance, "_ZN8CvRTrees18get_var_importanceEv");

      function get_proximity
        (this : access constant CvRTrees;
         sample1 : access constant opencv2_core_types_c_h.CvMat;
         sample2 : access constant opencv2_core_types_c_h.CvMat;
         missing1 : access constant opencv2_core_types_c_h.CvMat;
         missing2 : access constant opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:1038
      pragma Import (CPP, get_proximity, "_ZNK8CvRTrees13get_proximityEPK5CvMatS2_S2_S2_");

      function calc_error
        (this : access CvRTrees;
         u_data : access CvMLData'Class;
         c_type : int;
         resp : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return float;  -- /usr/include/opencv2/ml/ml.hpp:1041
      pragma Import (CPP, calc_error, "_ZN8CvRTrees10calc_errorEP8CvMLDataiPSt6vectorIfSaIfEE");

      function get_train_error (this : access CvRTrees) return float;  -- /usr/include/opencv2/ml/ml.hpp:1043
      pragma Import (CPP, get_train_error, "_ZN8CvRTrees15get_train_errorEv");

      procedure read
        (this : access CvRTrees;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:1045
      pragma Import (CPP, read, "_ZN8CvRTrees4readEP13CvFileStorageP10CvFileNode");

      procedure write
        (this : access constant CvRTrees;
         fs : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:1046
      pragma Import (CPP, write, "_ZNK8CvRTrees5writeEP13CvFileStoragePKc");

      function get_active_var_mask (this : access CvRTrees'Class) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1048
      pragma Import (CPP, get_active_var_mask, "_ZN8CvRTrees19get_active_var_maskEv");

      function get_rng (this : access CvRTrees'Class) return access opencv2_core_types_c_h.CvRNG;  -- /usr/include/opencv2/ml/ml.hpp:1049
      pragma Import (CPP, get_rng, "_ZN8CvRTrees7get_rngEv");

      function get_tree_count (this : access constant CvRTrees'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:1051
      pragma Import (CPP, get_tree_count, "_ZNK8CvRTrees14get_tree_countEv");

      function get_tree (this : access constant CvRTrees'Class; i : int) return access CvForestTree;  -- /usr/include/opencv2/ml/ml.hpp:1052
      pragma Import (CPP, get_tree, "_ZNK8CvRTrees8get_treeEi");

      function grow_forest (this : access CvRTrees; term_crit : opencv2_core_types_c_h.CvTermCriteria) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1056
      pragma Import (CPP, grow_forest, "_ZN8CvRTrees11grow_forestE14CvTermCriteria");
   end;
   use Class_CvRTrees;
   package Class_CvERTreeTrainData is
      type CvERTreeTrainData is limited new CvDTreeTrainData with record
         missing_mask : access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1091
      end record;
      pragma Import (CPP, CvERTreeTrainData);

      procedure set_data
        (this : access CvERTreeTrainData;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : access constant CvDTreeParams;
         u_shared : Extensions.bool;
         u_add_labels : Extensions.bool;
         u_update_data : Extensions.bool);  -- /usr/include/opencv2/ml/ml.hpp:1076
      pragma Import (CPP, set_data, "_ZN17CvERTreeTrainData8set_dataEPK5CvMatiS2_S2_S2_S2_S2_RK13CvDTreeParamsbbb");

      procedure get_ord_var_data
        (this : access CvERTreeTrainData;
         n : access CvDTreeNode;
         vi : int;
         ord_values_buf : access float;
         missing_buf : access int;
         ord_values : System.Address;
         missing : System.Address;
         sample_buf : access int);  -- /usr/include/opencv2/ml/ml.hpp:1083
      pragma Import (CPP, get_ord_var_data, "_ZN17CvERTreeTrainData16get_ord_var_dataEP11CvDTreeNodeiPfPiPPKfPPKiS3_");

      function get_sample_indices
        (this : access CvERTreeTrainData;
         n : access CvDTreeNode;
         indices_buf : access int) return access int;  -- /usr/include/opencv2/ml/ml.hpp:1085
      pragma Import (CPP, get_sample_indices, "_ZN17CvERTreeTrainData18get_sample_indicesEP11CvDTreeNodePi");

      function get_cv_labels
        (this : access CvERTreeTrainData;
         n : access CvDTreeNode;
         labels_buf : access int) return access int;  -- /usr/include/opencv2/ml/ml.hpp:1086
      pragma Import (CPP, get_cv_labels, "_ZN17CvERTreeTrainData13get_cv_labelsEP11CvDTreeNodePi");

      function get_cat_var_data
        (this : access CvERTreeTrainData;
         n : access CvDTreeNode;
         vi : int;
         cat_values_buf : access int) return access int;  -- /usr/include/opencv2/ml/ml.hpp:1087
      pragma Import (CPP, get_cat_var_data, "_ZN17CvERTreeTrainData16get_cat_var_dataEP11CvDTreeNodeiPi");

      procedure get_vectors
        (this : access CvERTreeTrainData;
         u_subsample_idx : access constant opencv2_core_types_c_h.CvMat;
         values : access float;
         missing : access opencv2_core_types_c_h.uchar;
         responses : access float;
         get_class_idx : Extensions.bool);  -- /usr/include/opencv2/ml/ml.hpp:1088
      pragma Import (CPP, get_vectors, "_ZN17CvERTreeTrainData11get_vectorsEPK5CvMatPfPhS3_b");

      function subsample_data (this : access CvERTreeTrainData; u_subsample_idx : access constant opencv2_core_types_c_h.CvMat) return access CvDTreeNode;  -- /usr/include/opencv2/ml/ml.hpp:1090
      pragma Import (CPP, subsample_data, "_ZN17CvERTreeTrainData14subsample_dataEPK5CvMat");

      procedure Delete_CvERTreeTrainData (this : access CvERTreeTrainData);  -- /usr/include/opencv2/ml/ml.hpp:1074
      pragma Import (CPP, Delete_CvERTreeTrainData, "_ZN17CvERTreeTrainDataD1Ev");

      procedure deleting_dtor (this : access CvERTreeTrainData);  -- /usr/include/opencv2/ml/ml.hpp:1074
      pragma Import (CPP, deleting_dtor, "_ZN17CvERTreeTrainDataD0Ev");
   end;
   use Class_CvERTreeTrainData;
   package Class_CvForestERTree is
      type CvForestERTree is limited new CvForestTree with record
         null;
      end record;
      pragma Import (CPP, CvForestERTree);

      function calc_node_dir (this : access CvForestERTree; node : access CvDTreeNode) return double;  -- /usr/include/opencv2/ml/ml.hpp:1097
      pragma Import (CPP, calc_node_dir, "_ZN14CvForestERTree13calc_node_dirEP11CvDTreeNode");

      function find_split_ord_class
        (this : access CvForestERTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1098
      pragma Import (CPP, find_split_ord_class, "_ZN14CvForestERTree20find_split_ord_classEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_cat_class
        (this : access CvForestERTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1100
      pragma Import (CPP, find_split_cat_class, "_ZN14CvForestERTree20find_split_cat_classEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_ord_reg
        (this : access CvForestERTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1102
      pragma Import (CPP, find_split_ord_reg, "_ZN14CvForestERTree18find_split_ord_regEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_cat_reg
        (this : access CvForestERTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1104
      pragma Import (CPP, find_split_cat_reg, "_ZN14CvForestERTree18find_split_cat_regEP11CvDTreeNodeifP12CvDTreeSplitPh");

      procedure split_node_data (this : access CvForestERTree; n : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:1106
      pragma Import (CPP, split_node_data, "_ZN14CvForestERTree15split_node_dataEP11CvDTreeNode");

      procedure Delete_CvForestERTree (this : access CvForestERTree);  -- /usr/include/opencv2/ml/ml.hpp:1094
      pragma Import (CPP, Delete_CvForestERTree, "_ZN14CvForestERTreeD1Ev");

      procedure deleting_dtor (this : access CvForestERTree);  -- /usr/include/opencv2/ml/ml.hpp:1094
      pragma Import (CPP, deleting_dtor, "_ZN14CvForestERTreeD0Ev");
   end;
   use Class_CvForestERTree;
   package Class_CvERTrees is
      type CvERTrees is limited new CvRTrees with record
         null;
      end record;
      pragma Import (CPP, CvERTrees);

      function New_CvERTrees return CvERTrees;  -- /usr/include/opencv2/ml/ml.hpp:1112
      pragma CPP_Constructor (New_CvERTrees, "_ZN9CvERTreesC1Ev");

      procedure Delete_CvERTrees (this : access CvERTrees);  -- /usr/include/opencv2/ml/ml.hpp:1113
      pragma Import (CPP, Delete_CvERTrees, "_ZN9CvERTreesD1Ev");

      procedure deleting_dtor (this : access CvERTrees);  -- /usr/include/opencv2/ml/ml.hpp:1113
      pragma Import (CPP, deleting_dtor, "_ZN9CvERTreesD0Ev");

      function train
        (this : access CvERTrees;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvRTParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1114
      pragma Import (CPP, train, "_ZN9CvERTrees5trainEPK5CvMatiS2_S2_S2_S2_S2_10CvRTParams");

      function train
        (this : access CvERTrees;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         tflag : int;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varType : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missingDataMask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvRTParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1120
      pragma Import (CPP, train, "_ZN9CvERTrees5trainERKN2cv3MatEiS3_S3_S3_S3_S3_10CvRTParams");

      function train
        (this : access CvERTrees;
         data : access CvMLData'Class;
         params : CvRTParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1126
      pragma Import (CPP, train, "_ZN9CvERTrees5trainEP8CvMLData10CvRTParams");

      function grow_forest (this : access CvERTrees; term_crit : opencv2_core_types_c_h.CvTermCriteria) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1128
      pragma Import (CPP, grow_forest, "_ZN9CvERTrees11grow_forestE14CvTermCriteria");
   end;
   use Class_CvERTrees;
   package Class_CvBoostParams is
      type CvBoostParams is limited record
         parent : aliased CvDTreeParams;
         boost_type : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1138
         weak_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1139
         split_criteria : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1140
         weight_trim_rate : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1141
      end record;
      pragma Import (CPP, CvBoostParams);

      function New_CvBoostParams return CvBoostParams;  -- /usr/include/opencv2/ml/ml.hpp:1143
      pragma CPP_Constructor (New_CvBoostParams, "_ZN13CvBoostParamsC1Ev");

      function New_CvBoostParams
        (boost_type : int;
         weak_count : int;
         weight_trim_rate : double;
         max_depth : int;
         use_surrogates : Extensions.bool;
         priors : access float) return CvBoostParams;  -- /usr/include/opencv2/ml/ml.hpp:1144
      pragma CPP_Constructor (New_CvBoostParams, "_ZN13CvBoostParamsC1EiidibPKf");


   end;
   use Class_CvBoostParams;
   type CvBoost;
   package Class_CvBoostTree is
      type CvBoostTree is limited new CvDTree with record
         ensemble : access CvBoost;  -- /usr/include/opencv2/ml/ml.hpp:1194
      end record;
      pragma Import (CPP, CvBoostTree);

      function New_CvBoostTree return CvBoostTree;  -- /usr/include/opencv2/ml/ml.hpp:1154
      pragma CPP_Constructor (New_CvBoostTree, "_ZN11CvBoostTreeC1Ev");

      procedure Delete_CvBoostTree (this : access CvBoostTree);  -- /usr/include/opencv2/ml/ml.hpp:1155
      pragma Import (CPP, Delete_CvBoostTree, "_ZN11CvBoostTreeD1Ev");

      procedure deleting_dtor (this : access CvBoostTree);  -- /usr/include/opencv2/ml/ml.hpp:1155
      pragma Import (CPP, deleting_dtor, "_ZN11CvBoostTreeD0Ev");

      function train
        (this : access CvBoostTree;
         trainData : access CvDTreeTrainData'Class;
         subsample_idx : access constant opencv2_core_types_c_h.CvMat;
         ensemble : access CvBoost'Class) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1157
      pragma Import (CPP, train, "_ZN11CvBoostTree5trainEP16CvDTreeTrainDataPK5CvMatP7CvBoost");

      procedure scale (this : access CvBoostTree; s : double);  -- /usr/include/opencv2/ml/ml.hpp:1160
      pragma Import (CPP, scale, "_ZN11CvBoostTree5scaleEd");

      procedure read
        (this : access CvBoostTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode;
         ensemble : access CvBoost'Class;
         u_data : access CvDTreeTrainData'Class);  -- /usr/include/opencv2/ml/ml.hpp:1161
      pragma Import (CPP, read, "_ZN11CvBoostTree4readEP13CvFileStorageP10CvFileNodeP7CvBoostP16CvDTreeTrainData");

      procedure clear (this : access CvBoostTree);  -- /usr/include/opencv2/ml/ml.hpp:1163
      pragma Import (CPP, clear, "_ZN11CvBoostTree5clearEv");

      function train
        (this : access CvBoostTree;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvDTreeParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1166
      pragma Import (CPP, train, "_ZN11CvBoostTree5trainEPK5CvMatiS2_S2_S2_S2_S2_13CvDTreeParams");

      function train
        (this : access CvBoostTree;
         trainData : access CvDTreeTrainData'Class;
         u_subsample_idx : access constant opencv2_core_types_c_h.CvMat) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1171
      pragma Import (CPP, train, "_ZN11CvBoostTree5trainEP16CvDTreeTrainDataPK5CvMat");

      procedure read
        (this : access CvBoostTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:1173
      pragma Import (CPP, read, "_ZN11CvBoostTree4readEP13CvFileStorageP10CvFileNode");

      procedure read
        (this : access CvBoostTree;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode;
         data : access CvDTreeTrainData'Class);  -- /usr/include/opencv2/ml/ml.hpp:1174
      pragma Import (CPP, read, "_ZN11CvBoostTree4readEP13CvFileStorageP10CvFileNodeP16CvDTreeTrainData");

      procedure try_split_node (this : access CvBoostTree; n : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:1180
      pragma Import (CPP, try_split_node, "_ZN11CvBoostTree14try_split_nodeEP11CvDTreeNode");

      function find_surrogate_split_ord
        (this : access CvBoostTree;
         n : access CvDTreeNode;
         vi : int;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1181
      pragma Import (CPP, find_surrogate_split_ord, "_ZN11CvBoostTree24find_surrogate_split_ordEP11CvDTreeNodeiPh");

      function find_surrogate_split_cat
        (this : access CvBoostTree;
         n : access CvDTreeNode;
         vi : int;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1182
      pragma Import (CPP, find_surrogate_split_cat, "_ZN11CvBoostTree24find_surrogate_split_catEP11CvDTreeNodeiPh");

      function find_split_ord_class
        (this : access CvBoostTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1183
      pragma Import (CPP, find_split_ord_class, "_ZN11CvBoostTree20find_split_ord_classEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_cat_class
        (this : access CvBoostTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1185
      pragma Import (CPP, find_split_cat_class, "_ZN11CvBoostTree20find_split_cat_classEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_ord_reg
        (this : access CvBoostTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1187
      pragma Import (CPP, find_split_ord_reg, "_ZN11CvBoostTree18find_split_ord_regEP11CvDTreeNodeifP12CvDTreeSplitPh");

      function find_split_cat_reg
        (this : access CvBoostTree;
         n : access CvDTreeNode;
         vi : int;
         init_quality : float;
         u_split : access CvDTreeSplit;
         ext_buf : access opencv2_core_types_c_h.uchar) return access CvDTreeSplit;  -- /usr/include/opencv2/ml/ml.hpp:1189
      pragma Import (CPP, find_split_cat_reg, "_ZN11CvBoostTree18find_split_cat_regEP11CvDTreeNodeifP12CvDTreeSplitPh");

      procedure calc_node_value (this : access CvBoostTree; n : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:1191
      pragma Import (CPP, calc_node_value, "_ZN11CvBoostTree15calc_node_valueEP11CvDTreeNode");

      function calc_node_dir (this : access CvBoostTree; n : access CvDTreeNode) return double;  -- /usr/include/opencv2/ml/ml.hpp:1192
      pragma Import (CPP, calc_node_dir, "_ZN11CvBoostTree13calc_node_dirEP11CvDTreeNode");
   end;
   use Class_CvBoostTree;
   package Class_CvBoost is
      type CvBoost is limited new CvStatModel with record
         data : access CvDTreeTrainData;  -- /usr/include/opencv2/ml/ml.hpp:1276
         params : aliased CvBoostParams;  -- /usr/include/opencv2/ml/ml.hpp:1277
         weak : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/ml/ml.hpp:1278
         active_vars : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1280
         active_vars_abs : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1281
         have_active_cat_vars : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1282
         orig_response : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1284
         sum_response : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1285
         weak_eval : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1286
         subsample_mask : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1287
         weights : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1288
         subtree_weights : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1289
         have_subsample : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1290
      end record;
      pragma Import (CPP, CvBoost);

      function New_CvBoost return CvBoost;  -- /usr/include/opencv2/ml/ml.hpp:1207
      pragma CPP_Constructor (New_CvBoost, "_ZN7CvBoostC1Ev");

      procedure Delete_CvBoost (this : access CvBoost);  -- /usr/include/opencv2/ml/ml.hpp:1208
      pragma Import (CPP, Delete_CvBoost, "_ZN7CvBoostD1Ev");

      procedure deleting_dtor (this : access CvBoost);  -- /usr/include/opencv2/ml/ml.hpp:1208
      pragma Import (CPP, deleting_dtor, "_ZN7CvBoostD0Ev");

      function New_CvBoost
        (trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvBoostParams) return CvBoost;  -- /usr/include/opencv2/ml/ml.hpp:1210
      pragma CPP_Constructor (New_CvBoost, "_ZN7CvBoostC1EPK5CvMatiS2_S2_S2_S2_S2_13CvBoostParams");

      function train
        (this : access CvBoost;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvBoostParams;
         update : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1216
      pragma Import (CPP, train, "_ZN7CvBoost5trainEPK5CvMatiS2_S2_S2_S2_S2_13CvBoostParamsb");

      function train
        (this : access CvBoost;
         data : access CvMLData'Class;
         params : CvBoostParams;
         update : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1223
      pragma Import (CPP, train, "_ZN7CvBoost5trainEP8CvMLData13CvBoostParamsb");

      function predict
        (this : access constant CvBoost;
         sample : access constant opencv2_core_types_c_h.CvMat;
         missing : access constant opencv2_core_types_c_h.CvMat;
         weak_responses : access opencv2_core_types_c_h.CvMat;
         slice : opencv2_core_types_c_h.CvSlice;
         raw_mode : Extensions.bool;
         return_sum : Extensions.bool) return float;  -- /usr/include/opencv2/ml/ml.hpp:1227
      pragma Import (CPP, predict, "_ZNK7CvBoost7predictEPK5CvMatS2_PS0_7CvSlicebb");

      function New_CvBoost
        (trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         tflag : int;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varType : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missingDataMask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvBoostParams) return CvBoost;  -- /usr/include/opencv2/ml/ml.hpp:1232
      pragma CPP_Constructor (New_CvBoost, "_ZN7CvBoostC1ERKN2cv3MatEiS3_S3_S3_S3_S3_13CvBoostParams");

      function train
        (this : access CvBoost;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         tflag : int;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varType : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missingDataMask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvBoostParams;
         update : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1238
      pragma Import (CPP, train, "_ZN7CvBoost5trainERKN2cv3MatEiS3_S3_S3_S3_S3_13CvBoostParamsb");

      function predict
        (this : access constant CvBoost;
         sample : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missing : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         slice : access constant opencv2_core_core_hpp.Class_c_Range.c_Range;
         rawMode : Extensions.bool;
         returnSum : Extensions.bool) return float;  -- /usr/include/opencv2/ml/ml.hpp:1245
      pragma Import (CPP, predict, "_ZNK7CvBoost7predictERKN2cv3MatES3_RKNS0_5RangeEbb");

      function calc_error
        (this : access CvBoost;
         u_data : access CvMLData'Class;
         c_type : int;
         resp : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return float;  -- /usr/include/opencv2/ml/ml.hpp:1250
      pragma Import (CPP, calc_error, "_ZN7CvBoost10calc_errorEP8CvMLDataiPSt6vectorIfSaIfEE");

      procedure prune (this : access CvBoost; slice : opencv2_core_types_c_h.CvSlice);  -- /usr/include/opencv2/ml/ml.hpp:1252
      pragma Import (CPP, prune, "_ZN7CvBoost5pruneE7CvSlice");

      procedure clear (this : access CvBoost);  -- /usr/include/opencv2/ml/ml.hpp:1254
      pragma Import (CPP, clear, "_ZN7CvBoost5clearEv");

      procedure write
        (this : access constant CvBoost;
         storage : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:1256
      pragma Import (CPP, write, "_ZNK7CvBoost5writeEP13CvFileStoragePKc");

      procedure read
        (this : access CvBoost;
         storage : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:1257
      pragma Import (CPP, read, "_ZN7CvBoost4readEP13CvFileStorageP10CvFileNode");

      function get_active_vars (this : access CvBoost; absolute_idx : Extensions.bool) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1258
      pragma Import (CPP, get_active_vars, "_ZN7CvBoost15get_active_varsEb");

      function get_weak_predictors (this : access CvBoost'Class) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/ml/ml.hpp:1260
      pragma Import (CPP, get_weak_predictors, "_ZN7CvBoost19get_weak_predictorsEv");

      function get_weights (this : access CvBoost'Class) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1262
      pragma Import (CPP, get_weights, "_ZN7CvBoost11get_weightsEv");

      function get_subtree_weights (this : access CvBoost'Class) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1263
      pragma Import (CPP, get_subtree_weights, "_ZN7CvBoost19get_subtree_weightsEv");

      function get_weak_response (this : access CvBoost'Class) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1264
      pragma Import (CPP, get_weak_response, "_ZN7CvBoost17get_weak_responseEv");

      function get_params (this : access constant CvBoost'Class) return access constant CvBoostParams;  -- /usr/include/opencv2/ml/ml.hpp:1265
      pragma Import (CPP, get_params, "_ZNK7CvBoost10get_paramsEv");

      function get_data (this : access constant CvBoost'Class) return access constant CvDTreeTrainData;  -- /usr/include/opencv2/ml/ml.hpp:1266
      pragma Import (CPP, get_data, "_ZNK7CvBoost8get_dataEv");

      function set_params (this : access CvBoost; params : access constant CvBoostParams) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1270
      pragma Import (CPP, set_params, "_ZN7CvBoost10set_paramsERK13CvBoostParams");

      procedure update_weights (this : access CvBoost; tree : access CvBoostTree'Class);  -- /usr/include/opencv2/ml/ml.hpp:1271
      pragma Import (CPP, update_weights, "_ZN7CvBoost14update_weightsEP11CvBoostTree");

      procedure trim_weights (this : access CvBoost);  -- /usr/include/opencv2/ml/ml.hpp:1272
      pragma Import (CPP, trim_weights, "_ZN7CvBoost12trim_weightsEv");

      procedure write_params (this : access constant CvBoost; fs : System.Address);  -- /usr/include/opencv2/ml/ml.hpp:1273
      pragma Import (CPP, write_params, "_ZNK7CvBoost12write_paramsEP13CvFileStorage");

      procedure read_params
        (this : access CvBoost;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:1274
      pragma Import (CPP, read_params, "_ZN7CvBoost11read_paramsEP13CvFileStorageP10CvFileNode");
   end;
   use Class_CvBoost;
   package Class_CvGBTreesParams is
      type CvGBTreesParams is limited record
         parent : aliased CvDTreeParams;
         weak_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1317
         loss_function_type : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1318
         subsample_portion : aliased float;  -- /usr/include/opencv2/ml/ml.hpp:1319
         shrinkage : aliased float;  -- /usr/include/opencv2/ml/ml.hpp:1320
      end record;
      pragma Import (CPP, CvGBTreesParams);

      function New_CvGBTreesParams return CvGBTreesParams;  -- /usr/include/opencv2/ml/ml.hpp:1322
      pragma CPP_Constructor (New_CvGBTreesParams, "_ZN15CvGBTreesParamsC1Ev");

      function New_CvGBTreesParams
        (loss_function_type : int;
         weak_count : int;
         shrinkage : float;
         subsample_portion : float;
         max_depth : int;
         use_surrogates : Extensions.bool) return CvGBTreesParams;  -- /usr/include/opencv2/ml/ml.hpp:1323
      pragma CPP_Constructor (New_CvGBTreesParams, "_ZN15CvGBTreesParamsC1Eiiffib");


   end;
   use Class_CvGBTreesParams;
   package Class_CvGBTrees is
      type CvGBTrees is limited new CvStatModel with record
         data : access CvDTreeTrainData;  -- /usr/include/opencv2/ml/ml.hpp:1846
         params : aliased CvGBTreesParams;  -- /usr/include/opencv2/ml/ml.hpp:1847
         weak : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:1849
         orig_response : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1850
         sum_response : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1851
         sum_response_tmp : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1852
         sample_idx : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1853
         subsample_train : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1854
         subsample_test : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1855
         missing : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1856
         class_labels : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1857
         the_rng : access opencv2_core_core_hpp.Class_RNG.RNG;  -- /usr/include/opencv2/ml/ml.hpp:1859
         class_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1861
         c_delta : aliased float;  -- /usr/include/opencv2/ml/ml.hpp:1862
         base_value : aliased float;  -- /usr/include/opencv2/ml/ml.hpp:1863
      end record;
      pragma Import (CPP, CvGBTrees);

      function New_CvGBTrees return CvGBTrees;  -- /usr/include/opencv2/ml/ml.hpp:1416
      pragma CPP_Constructor (New_CvGBTrees, "_ZN9CvGBTreesC1Ev");

      function New_CvGBTrees
        (trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvGBTreesParams) return CvGBTrees;  -- /usr/include/opencv2/ml/ml.hpp:1456
      pragma CPP_Constructor (New_CvGBTrees, "_ZN9CvGBTreesC1EPK5CvMatiS2_S2_S2_S2_S2_15CvGBTreesParams");

      procedure Delete_CvGBTrees (this : access CvGBTrees);  -- /usr/include/opencv2/ml/ml.hpp:1466
      pragma Import (CPP, Delete_CvGBTrees, "_ZN9CvGBTreesD1Ev");

      procedure deleting_dtor (this : access CvGBTrees);  -- /usr/include/opencv2/ml/ml.hpp:1466
      pragma Import (CPP, deleting_dtor, "_ZN9CvGBTreesD0Ev");

      function train
        (this : access CvGBTrees;
         trainData : access constant opencv2_core_types_c_h.CvMat;
         tflag : int;
         responses : access constant opencv2_core_types_c_h.CvMat;
         varIdx : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         varType : access constant opencv2_core_types_c_h.CvMat;
         missingDataMask : access constant opencv2_core_types_c_h.CvMat;
         params : CvGBTreesParams;
         update : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1508
      pragma Import (CPP, train, "_ZN9CvGBTrees5trainEPK5CvMatiS2_S2_S2_S2_S2_15CvGBTreesParamsb");

      function train
        (this : access CvGBTrees;
         data : access CvMLData'Class;
         params : CvGBTreesParams;
         update : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1532
      pragma Import (CPP, train, "_ZN9CvGBTrees5trainEP8CvMLData15CvGBTreesParamsb");

      function predict_serial
        (this : access constant CvGBTrees;
         sample : access constant opencv2_core_types_c_h.CvMat;
         missing : access constant opencv2_core_types_c_h.CvMat;
         weakResponses : access opencv2_core_types_c_h.CvMat;
         slice : opencv2_core_types_c_h.CvSlice;
         k : int) return float;  -- /usr/include/opencv2/ml/ml.hpp:1564
      pragma Import (CPP, predict_serial, "_ZNK9CvGBTrees14predict_serialEPK5CvMatS2_PS0_7CvSlicei");

      function predict
        (this : access constant CvGBTrees;
         sample : access constant opencv2_core_types_c_h.CvMat;
         missing : access constant opencv2_core_types_c_h.CvMat;
         weakResponses : access opencv2_core_types_c_h.CvMat;
         slice : opencv2_core_types_c_h.CvSlice;
         k : int) return float;  -- /usr/include/opencv2/ml/ml.hpp:1596
      pragma Import (CPP, predict, "_ZNK9CvGBTrees7predictEPK5CvMatS2_PS0_7CvSlicei");

      procedure clear (this : access CvGBTrees);  -- /usr/include/opencv2/ml/ml.hpp:1614
      pragma Import (CPP, clear, "_ZN9CvGBTrees5clearEv");

      function calc_error
        (this : access CvGBTrees;
         u_data : access CvMLData'Class;
         c_type : int;
         resp : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return float;  -- /usr/include/opencv2/ml/ml.hpp:1632
      pragma Import (CPP, calc_error, "_ZN9CvGBTrees10calc_errorEP8CvMLDataiPSt6vectorIfSaIfEE");

      procedure write
        (this : access constant CvGBTrees;
         fs : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:1648
      pragma Import (CPP, write, "_ZNK9CvGBTrees5writeEP13CvFileStoragePKc");

      procedure read
        (this : access CvGBTrees;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:1664
      pragma Import (CPP, read, "_ZN9CvGBTrees4readEP13CvFileStorageP10CvFileNode");

      function New_CvGBTrees
        (trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         tflag : int;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varType : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missingDataMask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvGBTreesParams) return CvGBTrees;  -- /usr/include/opencv2/ml/ml.hpp:1668
      pragma CPP_Constructor (New_CvGBTrees, "_ZN9CvGBTreesC1ERKN2cv3MatEiS3_S3_S3_S3_S3_15CvGBTreesParams");

      function train
        (this : access CvGBTrees;
         trainData : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         tflag : int;
         responses : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         varType : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missingDataMask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvGBTreesParams;
         update : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1674
      pragma Import (CPP, train, "_ZN9CvGBTrees5trainERKN2cv3MatEiS3_S3_S3_S3_S3_15CvGBTreesParamsb");

      function predict
        (this : access constant CvGBTrees;
         sample : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         missing : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         slice : access constant opencv2_core_core_hpp.Class_c_Range.c_Range;
         k : int) return float;  -- /usr/include/opencv2/ml/ml.hpp:1681
      pragma Import (CPP, predict, "_ZNK9CvGBTrees7predictERKN2cv3MatES3_RKNS0_5RangeEi");

      procedure find_gradient (this : access CvGBTrees; k : int);  -- /usr/include/opencv2/ml/ml.hpp:1702
      pragma Import (CPP, find_gradient, "_ZN9CvGBTrees13find_gradientEi");

      procedure change_values
        (this : access CvGBTrees;
         tree : access CvDTree'Class;
         k : int);  -- /usr/include/opencv2/ml/ml.hpp:1721
      pragma Import (CPP, change_values, "_ZN9CvGBTrees13change_valuesEP7CvDTreei");

      function find_optimal_value (this : access CvGBTrees; u_Idx : access constant opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:1740
      pragma Import (CPP, find_optimal_value, "_ZN9CvGBTrees18find_optimal_valueEPK5CvMat");

      procedure do_subsample (this : access CvGBTrees);  -- /usr/include/opencv2/ml/ml.hpp:1757
      pragma Import (CPP, do_subsample, "_ZN9CvGBTrees12do_subsampleEv");

      procedure leaves_get
        (this : access CvGBTrees'Class;
         leaves : System.Address;
         count : access int;
         node : access CvDTreeNode);  -- /usr/include/opencv2/ml/ml.hpp:1774
      pragma Import (CPP, leaves_get, "_ZN9CvGBTrees10leaves_getEPP11CvDTreeNodeRiS1_");

      function GetLeaves
        (this : access CvGBTrees'Class;
         dtree : access constant CvDTree'Class;
         len : access int) return System.Address;  -- /usr/include/opencv2/ml/ml.hpp:1791
      pragma Import (CPP, GetLeaves, "_ZN9CvGBTrees9GetLeavesEPK7CvDTreeRi");

      function problem_type (this : access constant CvGBTrees) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1807
      pragma Import (CPP, problem_type, "_ZNK9CvGBTrees12problem_typeEv");

      procedure write_params (this : access constant CvGBTrees; fs : System.Address);  -- /usr/include/opencv2/ml/ml.hpp:1822
      pragma Import (CPP, write_params, "_ZNK9CvGBTrees12write_paramsEP13CvFileStorage");

      procedure read_params
        (this : access CvGBTrees;
         fs : System.Address;
         fnode : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:1842
      pragma Import (CPP, read_params, "_ZN9CvGBTrees11read_paramsEP13CvFileStorageP10CvFileNode");

      function get_len (this : access constant CvGBTrees'Class; mat : access constant opencv2_core_types_c_h.CvMat) return int;  -- /usr/include/opencv2/ml/ml.hpp:1843
      pragma Import (CPP, get_len, "_ZNK9CvGBTrees7get_lenEPK5CvMat");
   end;
   use Class_CvGBTrees;
   package Class_CvANN_MLP_TrainParams is
      type CvANN_MLP_TrainParams is limited record
         term_crit : aliased opencv2_core_types_c_h.CvTermCriteria;  -- /usr/include/opencv2/ml/ml.hpp:1884
         train_method : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1885
         bp_dw_scale : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1888
         bp_moment_scale : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1888
         rp_dw0 : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1891
         rp_dw_plus : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1891
         rp_dw_minus : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1891
         rp_dw_min : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1891
         rp_dw_max : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1891
      end record;
      pragma Import (CPP, CvANN_MLP_TrainParams);

      function New_CvANN_MLP_TrainParams return CvANN_MLP_TrainParams;  -- /usr/include/opencv2/ml/ml.hpp:1877
      pragma CPP_Constructor (New_CvANN_MLP_TrainParams, "_ZN21CvANN_MLP_TrainParamsC1Ev");

      function New_CvANN_MLP_TrainParams
        (term_crit : opencv2_core_types_c_h.CvTermCriteria;
         train_method : int;
         param1 : double;
         param2 : double) return CvANN_MLP_TrainParams;  -- /usr/include/opencv2/ml/ml.hpp:1878
      pragma CPP_Constructor (New_CvANN_MLP_TrainParams, "_ZN21CvANN_MLP_TrainParamsC1E14CvTermCriteriaidd");

      procedure Delete_CvANN_MLP_TrainParams (this : access CvANN_MLP_TrainParams);  -- /usr/include/opencv2/ml/ml.hpp:1880
      pragma Import (CPP, Delete_CvANN_MLP_TrainParams, "_ZN21CvANN_MLP_TrainParamsD1Ev");


   end;
   use Class_CvANN_MLP_TrainParams;
   package Class_CvANN_MLP is
      type CvANN_MLP is limited new CvStatModel with record
         layer_sizes : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1977
         wbuf : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1978
         sample_weights : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1979
         weights : System.Address;  -- /usr/include/opencv2/ml/ml.hpp:1980
         f_param1 : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1981
         f_param2 : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1981
         min_val : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1982
         max_val : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1982
         min_val1 : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1982
         max_val1 : aliased double;  -- /usr/include/opencv2/ml/ml.hpp:1982
         activ_func : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1983
         max_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1984
         max_buf_sz : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:1984
         params : aliased CvANN_MLP_TrainParams;  -- /usr/include/opencv2/ml/ml.hpp:1985
         the_rng : access opencv2_core_core_hpp.Class_RNG.RNG;  -- /usr/include/opencv2/ml/ml.hpp:1986
      end record;
      pragma Import (CPP, CvANN_MLP);

      function New_CvANN_MLP return CvANN_MLP;  -- /usr/include/opencv2/ml/ml.hpp:1898
      pragma CPP_Constructor (New_CvANN_MLP, "_ZN9CvANN_MLPC1Ev");

      function New_CvANN_MLP
        (layerSizes : access constant opencv2_core_types_c_h.CvMat;
         activateFunc : int;
         fparam1 : double;
         fparam2 : double) return CvANN_MLP;  -- /usr/include/opencv2/ml/ml.hpp:1899
      pragma CPP_Constructor (New_CvANN_MLP, "_ZN9CvANN_MLPC1EPK5CvMatidd");

      procedure Delete_CvANN_MLP (this : access CvANN_MLP);  -- /usr/include/opencv2/ml/ml.hpp:1903
      pragma Import (CPP, Delete_CvANN_MLP, "_ZN9CvANN_MLPD1Ev");

      procedure deleting_dtor (this : access CvANN_MLP);  -- /usr/include/opencv2/ml/ml.hpp:1903
      pragma Import (CPP, deleting_dtor, "_ZN9CvANN_MLPD0Ev");

      procedure create
        (this : access CvANN_MLP;
         layerSizes : access constant opencv2_core_types_c_h.CvMat;
         activateFunc : int;
         fparam1 : double;
         fparam2 : double);  -- /usr/include/opencv2/ml/ml.hpp:1905
      pragma Import (CPP, create, "_ZN9CvANN_MLP6createEPK5CvMatidd");

      function train
        (this : access CvANN_MLP;
         inputs : access constant opencv2_core_types_c_h.CvMat;
         outputs : access constant opencv2_core_types_c_h.CvMat;
         sampleWeights : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         params : CvANN_MLP_TrainParams;
         flags : int) return int;  -- /usr/include/opencv2/ml/ml.hpp:1909
      pragma Import (CPP, train, "_ZN9CvANN_MLP5trainEPK5CvMatS2_S2_S2_21CvANN_MLP_TrainParamsi");

      function predict
        (this : access constant CvANN_MLP;
         inputs : access constant opencv2_core_types_c_h.CvMat;
         outputs : access opencv2_core_types_c_h.CvMat) return float;  -- /usr/include/opencv2/ml/ml.hpp:1913
      pragma Import (CPP, predict, "_ZNK9CvANN_MLP7predictEPK5CvMatPS0_");

      function New_CvANN_MLP
        (layerSizes : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         activateFunc : int;
         fparam1 : double;
         fparam2 : double) return CvANN_MLP;  -- /usr/include/opencv2/ml/ml.hpp:1916
      pragma CPP_Constructor (New_CvANN_MLP, "_ZN9CvANN_MLPC1ERKN2cv3MatEidd");

      procedure create
        (this : access CvANN_MLP;
         layerSizes : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         activateFunc : int;
         fparam1 : double;
         fparam2 : double);  -- /usr/include/opencv2/ml/ml.hpp:1920
      pragma Import (CPP, create, "_ZN9CvANN_MLP6createERKN2cv3MatEidd");

      function train
        (this : access CvANN_MLP;
         inputs : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         outputs : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleWeights : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         sampleIdx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         params : CvANN_MLP_TrainParams;
         flags : int) return int;  -- /usr/include/opencv2/ml/ml.hpp:1924
      pragma Import (CPP, train, "_ZN9CvANN_MLP5trainERKN2cv3MatES3_S3_S3_21CvANN_MLP_TrainParamsi");

      function predict
        (this : access constant CvANN_MLP;
         inputs : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         outputs : access opencv2_core_core_hpp.Class_Mat.Mat) return float;  -- /usr/include/opencv2/ml/ml.hpp:1929
      pragma Import (CPP, predict, "_ZNK9CvANN_MLP7predictERKN2cv3MatERS1_");

      procedure clear (this : access CvANN_MLP);  -- /usr/include/opencv2/ml/ml.hpp:1932
      pragma Import (CPP, clear, "_ZN9CvANN_MLP5clearEv");

      procedure read
        (this : access CvANN_MLP;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:1940
      pragma Import (CPP, read, "_ZN9CvANN_MLP4readEP13CvFileStorageP10CvFileNode");

      procedure write
        (this : access constant CvANN_MLP;
         storage : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:1941
      pragma Import (CPP, write, "_ZNK9CvANN_MLP5writeEP13CvFileStoragePKc");

      function get_layer_count (this : access CvANN_MLP'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:1943
      pragma Import (CPP, get_layer_count, "_ZN9CvANN_MLP15get_layer_countEv");

      function get_layer_sizes (this : access CvANN_MLP'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:1944
      pragma Import (CPP, get_layer_sizes, "_ZN9CvANN_MLP15get_layer_sizesEv");

      function get_weights (this : access CvANN_MLP'Class; layer : int) return access double;  -- /usr/include/opencv2/ml/ml.hpp:1945
      pragma Import (CPP, get_weights, "_ZN9CvANN_MLP11get_weightsEi");

      procedure calc_activ_func_deriv
        (this : access constant CvANN_MLP;
         xf : access opencv2_core_types_c_h.CvMat;
         deriv : access opencv2_core_types_c_h.CvMat;
         bias : access double);  -- /usr/include/opencv2/ml/ml.hpp:1951
      pragma Import (CPP, calc_activ_func_deriv, "_ZNK9CvANN_MLP21calc_activ_func_derivEP5CvMatS1_PKd");

      function prepare_to_train
        (this : access CvANN_MLP;
         u_inputs : access constant opencv2_core_types_c_h.CvMat;
         u_outputs : access constant opencv2_core_types_c_h.CvMat;
         u_sample_weights : access constant opencv2_core_types_c_h.CvMat;
         sampleIdx : access constant opencv2_core_types_c_h.CvMat;
         u_ivecs : access CvVectors;
         u_ovecs : access CvVectors;
         u_sw : System.Address;
         u_flags : int) return Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:1955
      pragma Import (CPP, prepare_to_train, "_ZN9CvANN_MLP16prepare_to_trainEPK5CvMatS2_S2_S2_P9CvVectorsS4_PPdi");

      function train_backprop
        (this : access CvANN_MLP;
         u_ivecs : CvVectors;
         u_ovecs : CvVectors;
         u_sw : access double) return int;  -- /usr/include/opencv2/ml/ml.hpp:1960
      pragma Import (CPP, train_backprop, "_ZN9CvANN_MLP14train_backpropE9CvVectorsS0_PKd");

      function train_rprop
        (this : access CvANN_MLP;
         u_ivecs : CvVectors;
         u_ovecs : CvVectors;
         u_sw : access double) return int;  -- /usr/include/opencv2/ml/ml.hpp:1963
      pragma Import (CPP, train_rprop, "_ZN9CvANN_MLP11train_rpropE9CvVectorsS0_PKd");

      procedure calc_activ_func
        (this : access constant CvANN_MLP;
         xf : access opencv2_core_types_c_h.CvMat;
         bias : access double);  -- /usr/include/opencv2/ml/ml.hpp:1965
      pragma Import (CPP, calc_activ_func, "_ZNK9CvANN_MLP15calc_activ_funcEP5CvMatPKd");

      procedure set_activ_func
        (this : access CvANN_MLP;
         u_activ_func : int;
         u_f_param1 : double;
         u_f_param2 : double);  -- /usr/include/opencv2/ml/ml.hpp:1966
      pragma Import (CPP, set_activ_func, "_ZN9CvANN_MLP14set_activ_funcEidd");

      procedure init_weights (this : access CvANN_MLP);  -- /usr/include/opencv2/ml/ml.hpp:1968
      pragma Import (CPP, init_weights, "_ZN9CvANN_MLP12init_weightsEv");

      procedure scale_input
        (this : access constant CvANN_MLP;
         u_src : access constant opencv2_core_types_c_h.CvMat;
         u_dst : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/ml/ml.hpp:1969
      pragma Import (CPP, scale_input, "_ZNK9CvANN_MLP11scale_inputEPK5CvMatPS0_");

      procedure scale_output
        (this : access constant CvANN_MLP;
         u_src : access constant opencv2_core_types_c_h.CvMat;
         u_dst : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/ml/ml.hpp:1970
      pragma Import (CPP, scale_output, "_ZNK9CvANN_MLP12scale_outputEPK5CvMatPS0_");

      procedure calc_input_scale
        (this : access CvANN_MLP;
         vecs : access constant CvVectors;
         flags : int);  -- /usr/include/opencv2/ml/ml.hpp:1971
      pragma Import (CPP, calc_input_scale, "_ZN9CvANN_MLP16calc_input_scaleEPK9CvVectorsi");

      procedure calc_output_scale
        (this : access CvANN_MLP;
         vecs : access constant CvVectors;
         flags : int);  -- /usr/include/opencv2/ml/ml.hpp:1972
      pragma Import (CPP, calc_output_scale, "_ZN9CvANN_MLP17calc_output_scaleEPK9CvVectorsi");

      procedure write_params (this : access constant CvANN_MLP; fs : System.Address);  -- /usr/include/opencv2/ml/ml.hpp:1974
      pragma Import (CPP, write_params, "_ZNK9CvANN_MLP12write_paramsEP13CvFileStorage");

      procedure read_params
        (this : access CvANN_MLP;
         fs : System.Address;
         node : access opencv2_core_types_c_h.CvFileNode);  -- /usr/include/opencv2/ml/ml.hpp:1975
      pragma Import (CPP, read_params, "_ZN9CvANN_MLP11read_paramsEP13CvFileStorageP10CvFileNode");
   end;
   use Class_CvANN_MLP;
   procedure cvRandMVNormal
     (mean : access opencv2_core_types_c_h.CvMat;
      cov : access opencv2_core_types_c_h.CvMat;
      sample : access opencv2_core_types_c_h.CvMat;
      rng : access opencv2_core_types_c_h.CvRNG);  -- /usr/include/opencv2/ml/ml.hpp:1995
   pragma Import (C, cvRandMVNormal, "cvRandMVNormal");

   procedure cvRandGaussMixture
     (means : System.Address;
      covs : System.Address;
      weights : access float;
      clsnum : int;
      sample : access opencv2_core_types_c_h.CvMat;
      sampClasses : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/ml/ml.hpp:1999
   pragma Import (C, cvRandGaussMixture, "cvRandGaussMixture");

   procedure cvCreateTestSet
     (c_type : int;
      samples : System.Address;
      num_samples : int;
      num_features : int;
      responses : System.Address;
      num_classes : int  -- , ...
      );  -- /usr/include/opencv2/ml/ml.hpp:2009
   pragma Import (C, cvCreateTestSet, "cvCreateTestSet");

   type anon_247 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:2037
         when others =>
            portion : aliased float;  -- /usr/include/opencv2/ml/ml.hpp:2038
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_247);
   pragma Unchecked_Union (anon_247);
   package Class_CvTrainTestSplit is
      type CvTrainTestSplit is limited record
         train_sample_part : anon_247;  -- /usr/include/opencv2/ml/ml.hpp:2039
         train_sample_part_mode : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:2040
         mix : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:2042
      end record;
      pragma Import (CPP, CvTrainTestSplit);

      function New_CvTrainTestSplit return CvTrainTestSplit;  -- /usr/include/opencv2/ml/ml.hpp:2031
      pragma CPP_Constructor (New_CvTrainTestSplit, "_ZN16CvTrainTestSplitC1Ev");

      function New_CvTrainTestSplit (train_sample_count : int; mix : Extensions.bool) return CvTrainTestSplit;  -- /usr/include/opencv2/ml/ml.hpp:2032
      pragma CPP_Constructor (New_CvTrainTestSplit, "_ZN16CvTrainTestSplitC1Eib");

      function New_CvTrainTestSplit (train_sample_portion : float; mix : Extensions.bool) return CvTrainTestSplit;  -- /usr/include/opencv2/ml/ml.hpp:2033
      pragma CPP_Constructor (New_CvTrainTestSplit, "_ZN16CvTrainTestSplitC1Efb");


   end;
   use Class_CvTrainTestSplit;
   package Class_CvMLData is
      type CvMLData is tagged limited record
         delimiter : aliased char;  -- /usr/include/opencv2/ml/ml.hpp:2096
         miss_ch : aliased char;  -- /usr/include/opencv2/ml/ml.hpp:2097
         values : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2100
         missing : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2101
         var_types : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2102
         var_idx_mask : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2103
         response_out : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2105
         var_idx_out : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2106
         var_types_out : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2107
         response_idx : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:2109
         train_sample_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:2111
         mix : aliased Extensions.bool;  -- /usr/include/opencv2/ml/ml.hpp:2112
         total_class_count : aliased int;  -- /usr/include/opencv2/ml/ml.hpp:2114
         class_map : aliased cpp_4_7_4_bits_stl_map_h.Class_map.map;  -- /usr/include/opencv2/ml/ml.hpp:2115
         train_sample_idx : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2117
         test_sample_idx : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2118
         sample_idx : access int;  -- /usr/include/opencv2/ml/ml.hpp:2119
         the_rng : access opencv2_core_core_hpp.Class_RNG.RNG;  -- /usr/include/opencv2/ml/ml.hpp:2121
      end record;
      pragma Import (CPP, CvMLData);

      function New_CvMLData return CvMLData;  -- /usr/include/opencv2/ml/ml.hpp:2048
      pragma CPP_Constructor (New_CvMLData, "_ZN8CvMLDataC1Ev");

      procedure Delete_CvMLData (this : access CvMLData);  -- /usr/include/opencv2/ml/ml.hpp:2049
      pragma Import (CPP, Delete_CvMLData, "_ZN8CvMLDataD1Ev");

      procedure deleting_dtor (this : access CvMLData);  -- /usr/include/opencv2/ml/ml.hpp:2049
      pragma Import (CPP, deleting_dtor, "_ZN8CvMLDataD0Ev");

      function read_csv (this : access CvMLData'Class; filename : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/opencv2/ml/ml.hpp:2054
      pragma Import (CPP, read_csv, "_ZN8CvMLData8read_csvEPKc");

      function get_values (this : access constant CvMLData'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2056
      pragma Import (CPP, get_values, "_ZNK8CvMLData10get_valuesEv");

      function get_responses (this : access CvMLData'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2057
      pragma Import (CPP, get_responses, "_ZN8CvMLData13get_responsesEv");

      function get_missing (this : access constant CvMLData'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2058
      pragma Import (CPP, get_missing, "_ZNK8CvMLData11get_missingEv");

      procedure set_response_idx (this : access CvMLData'Class; idx : int);  -- /usr/include/opencv2/ml/ml.hpp:2060
      pragma Import (CPP, set_response_idx, "_ZN8CvMLData16set_response_idxEi");

      function get_response_idx (this : access constant CvMLData'Class) return int;  -- /usr/include/opencv2/ml/ml.hpp:2062
      pragma Import (CPP, get_response_idx, "_ZNK8CvMLData16get_response_idxEv");

      procedure set_train_test_split (this : access CvMLData'Class; spl : access constant CvTrainTestSplit);  -- /usr/include/opencv2/ml/ml.hpp:2064
      pragma Import (CPP, set_train_test_split, "_ZN8CvMLData20set_train_test_splitEPK16CvTrainTestSplit");

      function get_train_sample_idx (this : access constant CvMLData'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2065
      pragma Import (CPP, get_train_sample_idx, "_ZNK8CvMLData20get_train_sample_idxEv");

      function get_test_sample_idx (this : access constant CvMLData'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2066
      pragma Import (CPP, get_test_sample_idx, "_ZNK8CvMLData19get_test_sample_idxEv");

      procedure mix_train_and_test_idx (this : access CvMLData'Class);  -- /usr/include/opencv2/ml/ml.hpp:2067
      pragma Import (CPP, mix_train_and_test_idx, "_ZN8CvMLData22mix_train_and_test_idxEv");

      function get_var_idx (this : access CvMLData'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2069
      pragma Import (CPP, get_var_idx, "_ZN8CvMLData11get_var_idxEv");

      procedure chahge_var_idx
        (this : access CvMLData'Class;
         vi : int;
         state : Extensions.bool);  -- /usr/include/opencv2/ml/ml.hpp:2070
      pragma Import (CPP, chahge_var_idx, "_ZN8CvMLData14chahge_var_idxEib");

      function get_var_types (this : access CvMLData'Class) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/ml/ml.hpp:2072
      pragma Import (CPP, get_var_types, "_ZN8CvMLData13get_var_typesEv");

      function get_var_type (this : access constant CvMLData'Class; var_idx : int) return int;  -- /usr/include/opencv2/ml/ml.hpp:2073
      pragma Import (CPP, get_var_type, "_ZNK8CvMLData12get_var_typeEi");

      procedure set_var_types (this : access CvMLData'Class; str : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/ml/ml.hpp:2077
      pragma Import (CPP, set_var_types, "_ZN8CvMLData13set_var_typesEPKc");

      procedure change_var_type
        (this : access CvMLData'Class;
         var_idx : int;
         c_type : int);  -- /usr/include/opencv2/ml/ml.hpp:2080
      pragma Import (CPP, change_var_type, "_ZN8CvMLData15change_var_typeEii");

      procedure set_delimiter (this : access CvMLData'Class; ch : char);  -- /usr/include/opencv2/ml/ml.hpp:2082
      pragma Import (CPP, set_delimiter, "_ZN8CvMLData13set_delimiterEc");

      function get_delimiter (this : access constant CvMLData'Class) return char;  -- /usr/include/opencv2/ml/ml.hpp:2083
      pragma Import (CPP, get_delimiter, "_ZNK8CvMLData13get_delimiterEv");

      procedure set_miss_ch (this : access CvMLData'Class; ch : char);  -- /usr/include/opencv2/ml/ml.hpp:2085
      pragma Import (CPP, set_miss_ch, "_ZN8CvMLData11set_miss_chEc");

      function get_miss_ch (this : access constant CvMLData'Class) return char;  -- /usr/include/opencv2/ml/ml.hpp:2086
      pragma Import (CPP, get_miss_ch, "_ZNK8CvMLData11get_miss_chEv");

      function get_class_labels_map (this : access constant CvMLData'Class) return access constant cpp_4_7_4_bits_stl_map_h.Class_map.map;  -- /usr/include/opencv2/ml/ml.hpp:2088
      pragma Import (CPP, get_class_labels_map, "_ZNK8CvMLData20get_class_labels_mapEv");

      procedure clear (this : access CvMLData);  -- /usr/include/opencv2/ml/ml.hpp:2091
      pragma Import (CPP, clear, "_ZN8CvMLData5clearEv");

      procedure str_to_flt_elem
        (this : access CvMLData'Class;
         token : Interfaces.C.Strings.chars_ptr;
         flt_elem : access float;
         c_type : access int);  -- /usr/include/opencv2/ml/ml.hpp:2093
      pragma Import (CPP, str_to_flt_elem, "_ZN8CvMLData15str_to_flt_elemEPKcRfRi");

      procedure free_train_test_idx (this : access CvMLData'Class);  -- /usr/include/opencv2/ml/ml.hpp:2094
      pragma Import (CPP, free_train_test_idx, "_ZN8CvMLData19free_train_test_idxEv");
   end;
   use Class_CvMLData;
   subtype StatModel is CvStatModel;

   subtype ParamGrid is CvParamGrid;

   subtype NormalBayesClassifier is CvNormalBayesClassifier;

   subtype KNearest is CvKNearest;

   subtype SVMParams is CvSVMParams;

   subtype SVMKernel is CvSVMKernel;

   subtype SVMSolver is CvSVMSolver;

   subtype SVM is CvSVM;

   subtype EMParams is CvEMParams;

   subtype ExpectationMaximization is CvEM;

   subtype DTreeParams is CvDTreeParams;

   subtype TrainData is CvMLData;

   subtype DecisionTree is CvDTree;

   subtype ForestTree is CvForestTree;

   subtype RandomTreeParams is CvRTParams;

   subtype RandomTrees is CvRTrees;

   subtype ERTreeTRainData is CvERTreeTrainData;

   subtype ERTree is CvForestERTree;

   subtype ERTrees is CvERTrees;

   subtype BoostParams is CvBoostParams;

   subtype BoostTree is CvBoostTree;

   subtype Boost is CvBoost;

   subtype ANN_MLP_TrainParams is CvANN_MLP_TrainParams;

   subtype NeuralNet_MLP is CvANN_MLP;

   subtype GradientBoostingTreeParams is CvGBTreesParams;

   subtype GradientBoostingTrees is CvGBTrees;

end opencv2_ml_ml_hpp;
