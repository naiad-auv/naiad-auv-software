pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with opencv2_core_types_c_h;
with opencv2_core_core_hpp;
with Interfaces.C.Extensions;

package opencv2_video_background_segm_hpp is


   CV_BG_MODEL_FGD : constant := 0;  --  /usr/include/opencv2/video/background_segm.hpp:86
   CV_BG_MODEL_MOG : constant := 1;  --  /usr/include/opencv2/video/background_segm.hpp:87
   CV_BG_MODEL_FGD_SIMPLE : constant := 2;  --  /usr/include/opencv2/video/background_segm.hpp:88
   --  arg-macro: procedure CV_BG_STAT_MODEL_FIELDS ()
   --    int type; CvReleaseBGStatModel release; CvUpdateBGStatModel update; IplImage* background; IplImage* foreground; IplImage** layers; int layer_count; CvMemStorage* storage; CvSeq* foreground_regions

   CV_BGFG_FGD_LC : constant := 128;  --  /usr/include/opencv2/video/background_segm.hpp:138
   CV_BGFG_FGD_N1C : constant := 15;  --  /usr/include/opencv2/video/background_segm.hpp:139
   CV_BGFG_FGD_N2C : constant := 25;  --  /usr/include/opencv2/video/background_segm.hpp:140

   CV_BGFG_FGD_LCC : constant := 64;  --  /usr/include/opencv2/video/background_segm.hpp:142
   CV_BGFG_FGD_N1CC : constant := 25;  --  /usr/include/opencv2/video/background_segm.hpp:143
   CV_BGFG_FGD_N2CC : constant := 40;  --  /usr/include/opencv2/video/background_segm.hpp:144

   CV_BGFG_FGD_ALPHA_1 : constant := 8#.1f#;  --  /usr/include/opencv2/video/background_segm.hpp:147

   CV_BGFG_FGD_ALPHA_2 : constant := 8#.005f#;  --  /usr/include/opencv2/video/background_segm.hpp:152

   CV_BGFG_FGD_ALPHA_3 : constant := 8#.1f#;  --  /usr/include/opencv2/video/background_segm.hpp:155

   CV_BGFG_FGD_DELTA : constant := 2;  --  /usr/include/opencv2/video/background_segm.hpp:157

   CV_BGFG_FGD_T : constant := 8#.9f#;  --  /usr/include/opencv2/video/background_segm.hpp:159

   CV_BGFG_FGD_MINAREA : constant := 15.f;  --  /usr/include/opencv2/video/background_segm.hpp:161

   CV_BGFG_FGD_BG_UPDATE_TRESH : constant := 8#.5f#;  --  /usr/include/opencv2/video/background_segm.hpp:163

   CV_BGFG_MOG_MAX_NGAUSSIANS : constant := 500;  --  /usr/include/opencv2/video/background_segm.hpp:251

   CV_BGFG_MOG_BACKGROUND_THRESHOLD : constant := 8#.7#;  --  /usr/include/opencv2/video/background_segm.hpp:254
   CV_BGFG_MOG_STD_THRESHOLD : constant := 2.5;  --  /usr/include/opencv2/video/background_segm.hpp:255
   CV_BGFG_MOG_WINDOW_SIZE : constant := 200;  --  /usr/include/opencv2/video/background_segm.hpp:256
   CV_BGFG_MOG_NGAUSSIANS : constant := 5;  --  /usr/include/opencv2/video/background_segm.hpp:257
   CV_BGFG_MOG_WEIGHT_INIT : constant := 8#.05#;  --  /usr/include/opencv2/video/background_segm.hpp:258
   CV_BGFG_MOG_SIGMA_INIT : constant := 30;  --  /usr/include/opencv2/video/background_segm.hpp:259
   CV_BGFG_MOG_MINAREA : constant := 15.f;  --  /usr/include/opencv2/video/background_segm.hpp:260

   CV_BGFG_MOG_NCOLORS : constant := 3;  --  /usr/include/opencv2/video/background_segm.hpp:263

   type CvReleaseBGStatModel is access procedure (arg1 : System.Address);
   pragma Convention (C, CvReleaseBGStatModel);  -- /usr/include/opencv2/video/background_segm.hpp:92

   type CvUpdateBGStatModel is access function
        (arg1 : access opencv2_core_types_c_h.IplImage;
         arg2 : System.Address;
         arg3 : double) return int;
   pragma Convention (C, CvUpdateBGStatModel);  -- /usr/include/opencv2/video/background_segm.hpp:93

   type CvBGStatModel is record
      c_type : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:109
      release : CvReleaseBGStatModel;  -- /usr/include/opencv2/video/background_segm.hpp:109
      update : CvUpdateBGStatModel;  -- /usr/include/opencv2/video/background_segm.hpp:109
      background : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:109
      foreground : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:109
      layers : System.Address;  -- /usr/include/opencv2/video/background_segm.hpp:109
      layer_count : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:109
      storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/video/background_segm.hpp:109
      foreground_regions : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/video/background_segm.hpp:109
   end record;
   pragma Convention (C_Pass_By_Copy, CvBGStatModel);  -- /usr/include/opencv2/video/background_segm.hpp:107

   procedure cvReleaseBGStatModel (bg_model : System.Address);  -- /usr/include/opencv2/video/background_segm.hpp:115
   pragma Import (C, cvReleaseBGStatModel, "cvReleaseBGStatModel");

   function cvUpdateBGStatModel
     (current_frame : access opencv2_core_types_c_h.IplImage;
      bg_model : access CvBGStatModel;
      learningRate : double) return int;  -- /usr/include/opencv2/video/background_segm.hpp:118
   pragma Import (C, cvUpdateBGStatModel, "cvUpdateBGStatModel");

   procedure cvRefineForegroundMaskBySegm (segments : access opencv2_core_types_c_h.CvSeq; bg_model : access CvBGStatModel);  -- /usr/include/opencv2/video/background_segm.hpp:126
   pragma Import (C, cvRefineForegroundMaskBySegm, "cvRefineForegroundMaskBySegm");

   function cvChangeDetection
     (prev_frame : access opencv2_core_types_c_h.IplImage;
      curr_frame : access opencv2_core_types_c_h.IplImage;
      change_mask : access opencv2_core_types_c_h.IplImage) return int;  -- /usr/include/opencv2/video/background_segm.hpp:129
   pragma Import (C, cvChangeDetection, "cvChangeDetection");

   type CvFGDStatModelParams is record
      Lc : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:180
      N1c : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:181
      N2c : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:182
      Lcc : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:185
      N1cc : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:186
      N2cc : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:187
      is_obj_without_holes : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:190
      perform_morphing : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:191
      alpha1 : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:194
      alpha2 : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:195
      alpha3 : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:196
      c_delta : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:198
      T : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:199
      minArea : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:200
   end record;
   pragma Convention (C_Pass_By_Copy, CvFGDStatModelParams);  -- /usr/include/opencv2/video/background_segm.hpp:178

   type CvBGPixelCStatTable_v_array is array (0 .. 2) of aliased opencv2_core_types_c_h.uchar;
   type CvBGPixelCStatTable is record
      Pv : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:205
      Pvb : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:205
      v : aliased CvBGPixelCStatTable_v_array;  -- /usr/include/opencv2/video/background_segm.hpp:206
   end record;
   pragma Convention (C_Pass_By_Copy, CvBGPixelCStatTable);  -- /usr/include/opencv2/video/background_segm.hpp:203

   type CvBGPixelCCStatTable_v_array is array (0 .. 5) of aliased opencv2_core_types_c_h.uchar;
   type CvBGPixelCCStatTable is record
      Pv : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:211
      Pvb : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:211
      v : aliased CvBGPixelCCStatTable_v_array;  -- /usr/include/opencv2/video/background_segm.hpp:212
   end record;
   pragma Convention (C_Pass_By_Copy, CvBGPixelCCStatTable);  -- /usr/include/opencv2/video/background_segm.hpp:209

   type CvBGPixelStat is record
      Pbc : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:217
      Pbcc : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:218
      ctable : access CvBGPixelCStatTable;  -- /usr/include/opencv2/video/background_segm.hpp:219
      cctable : access CvBGPixelCCStatTable;  -- /usr/include/opencv2/video/background_segm.hpp:220
      is_trained_st_model : aliased opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/video/background_segm.hpp:221
      is_trained_dyn_model : aliased opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/video/background_segm.hpp:222
   end record;
   pragma Convention (C_Pass_By_Copy, CvBGPixelStat);  -- /usr/include/opencv2/video/background_segm.hpp:215

   type CvFGDStatModel is record
      c_type : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:228
      release : CvReleaseBGStatModel;  -- /usr/include/opencv2/video/background_segm.hpp:228
      update : CvUpdateBGStatModel;  -- /usr/include/opencv2/video/background_segm.hpp:228
      background : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:228
      foreground : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:228
      layers : System.Address;  -- /usr/include/opencv2/video/background_segm.hpp:228
      layer_count : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:228
      storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/video/background_segm.hpp:228
      foreground_regions : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/video/background_segm.hpp:228
      pixel_stat : access CvBGPixelStat;  -- /usr/include/opencv2/video/background_segm.hpp:229
      Ftd : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:230
      Fbd : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:231
      prev_frame : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:232
      params : aliased CvFGDStatModelParams;  -- /usr/include/opencv2/video/background_segm.hpp:233
   end record;
   pragma Convention (C_Pass_By_Copy, CvFGDStatModel);  -- /usr/include/opencv2/video/background_segm.hpp:226

   function cvCreateFGDStatModel (first_frame : access opencv2_core_types_c_h.IplImage; parameters : access CvFGDStatModelParams) return access CvBGStatModel;  -- /usr/include/opencv2/video/background_segm.hpp:237
   pragma Import (C, cvCreateFGDStatModel, "cvCreateFGDStatModel");

   type CvGaussBGStatModelParams is record
      win_size : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:267
      n_gauss : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:268
      bg_threshold : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:269
      std_threshold : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:269
      minArea : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:269
      weight_init : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:270
      variance_init : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:270
   end record;
   pragma Convention (C_Pass_By_Copy, CvGaussBGStatModelParams);  -- /usr/include/opencv2/video/background_segm.hpp:265

   type CvGaussBGValues_variance_array is array (0 .. 2) of aliased double;
   type CvGaussBGValues_mean_array is array (0 .. 2) of aliased double;
   type CvGaussBGValues is record
      match_sum : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:275
      weight : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:276
      variance : aliased CvGaussBGValues_variance_array;  -- /usr/include/opencv2/video/background_segm.hpp:277
      mean : aliased CvGaussBGValues_mean_array;  -- /usr/include/opencv2/video/background_segm.hpp:278
   end record;
   pragma Convention (C_Pass_By_Copy, CvGaussBGValues);  -- /usr/include/opencv2/video/background_segm.hpp:273

   type CvGaussBGPoint is record
      g_values : access CvGaussBGValues;  -- /usr/include/opencv2/video/background_segm.hpp:283
   end record;
   pragma Convention (C_Pass_By_Copy, CvGaussBGPoint);  -- /usr/include/opencv2/video/background_segm.hpp:281

   type CvGaussBGModel is record
      c_type : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:289
      release : CvReleaseBGStatModel;  -- /usr/include/opencv2/video/background_segm.hpp:289
      update : CvUpdateBGStatModel;  -- /usr/include/opencv2/video/background_segm.hpp:289
      background : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:289
      foreground : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/video/background_segm.hpp:289
      layers : System.Address;  -- /usr/include/opencv2/video/background_segm.hpp:289
      layer_count : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:289
      storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/video/background_segm.hpp:289
      foreground_regions : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/video/background_segm.hpp:289
      params : aliased CvGaussBGStatModelParams;  -- /usr/include/opencv2/video/background_segm.hpp:290
      g_point : access CvGaussBGPoint;  -- /usr/include/opencv2/video/background_segm.hpp:291
      countFrames : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:292
   end record;
   pragma Convention (C_Pass_By_Copy, CvGaussBGModel);  -- /usr/include/opencv2/video/background_segm.hpp:287

   function cvCreateGaussianBGModel (first_frame : access opencv2_core_types_c_h.IplImage; parameters : access CvGaussBGStatModelParams) return access CvBGStatModel;  -- /usr/include/opencv2/video/background_segm.hpp:297
   pragma Import (C, cvCreateGaussianBGModel, "cvCreateGaussianBGModel");

   type CvBGCodeBookElem_boxMin_array is array (0 .. 2) of aliased opencv2_core_types_c_h.uchar;
   type CvBGCodeBookElem_boxMax_array is array (0 .. 2) of aliased opencv2_core_types_c_h.uchar;
   type CvBGCodeBookElem_learnMin_array is array (0 .. 2) of aliased opencv2_core_types_c_h.uchar;
   type CvBGCodeBookElem_learnMax_array is array (0 .. 2) of aliased opencv2_core_types_c_h.uchar;
   type CvBGCodeBookElem is record
      next : access CvBGCodeBookElem;  -- /usr/include/opencv2/video/background_segm.hpp:303
      tLastUpdate : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:304
      stale : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:305
      boxMin : aliased CvBGCodeBookElem_boxMin_array;  -- /usr/include/opencv2/video/background_segm.hpp:306
      boxMax : aliased CvBGCodeBookElem_boxMax_array;  -- /usr/include/opencv2/video/background_segm.hpp:307
      learnMin : aliased CvBGCodeBookElem_learnMin_array;  -- /usr/include/opencv2/video/background_segm.hpp:308
      learnMax : aliased CvBGCodeBookElem_learnMax_array;  -- /usr/include/opencv2/video/background_segm.hpp:309
   end record;
   pragma Convention (C_Pass_By_Copy, CvBGCodeBookElem);  -- /usr/include/opencv2/video/background_segm.hpp:301

   type CvBGCodeBookModel_cbBounds_array is array (0 .. 2) of aliased opencv2_core_types_c_h.uchar;
   type CvBGCodeBookModel_modMin_array is array (0 .. 2) of aliased opencv2_core_types_c_h.uchar;
   type CvBGCodeBookModel_modMax_array is array (0 .. 2) of aliased opencv2_core_types_c_h.uchar;
   type CvBGCodeBookModel is record
      size : aliased opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/video/background_segm.hpp:314
      t : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:315
      cbBounds : aliased CvBGCodeBookModel_cbBounds_array;  -- /usr/include/opencv2/video/background_segm.hpp:316
      modMin : aliased CvBGCodeBookModel_modMin_array;  -- /usr/include/opencv2/video/background_segm.hpp:317
      modMax : aliased CvBGCodeBookModel_modMax_array;  -- /usr/include/opencv2/video/background_segm.hpp:318
      cbmap : System.Address;  -- /usr/include/opencv2/video/background_segm.hpp:319
      storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/video/background_segm.hpp:320
      freeList : access CvBGCodeBookElem;  -- /usr/include/opencv2/video/background_segm.hpp:321
   end record;
   pragma Convention (C_Pass_By_Copy, CvBGCodeBookModel);  -- /usr/include/opencv2/video/background_segm.hpp:312

   function cvCreateBGCodeBookModel return access CvBGCodeBookModel;  -- /usr/include/opencv2/video/background_segm.hpp:324
   pragma Import (C, cvCreateBGCodeBookModel, "cvCreateBGCodeBookModel");

   procedure cvReleaseBGCodeBookModel (model : System.Address);  -- /usr/include/opencv2/video/background_segm.hpp:325
   pragma Import (C, cvReleaseBGCodeBookModel, "cvReleaseBGCodeBookModel");

   procedure cvBGCodeBookUpdate
     (model : access CvBGCodeBookModel;
      image : System.Address;
      roi : opencv2_core_types_c_h.CvRect;
      mask : System.Address);  -- /usr/include/opencv2/video/background_segm.hpp:327
   pragma Import (C, cvBGCodeBookUpdate, "cvBGCodeBookUpdate");

   function cvBGCodeBookDiff
     (model : System.Address;
      image : System.Address;
      fgmask : System.Address;
      roi : opencv2_core_types_c_h.CvRect) return int;  -- /usr/include/opencv2/video/background_segm.hpp:331
   pragma Import (C, cvBGCodeBookDiff, "cvBGCodeBookDiff");

   procedure cvBGCodeBookClearStale
     (model : access CvBGCodeBookModel;
      staleThresh : int;
      roi : opencv2_core_types_c_h.CvRect;
      mask : System.Address);  -- /usr/include/opencv2/video/background_segm.hpp:334
   pragma Import (C, cvBGCodeBookClearStale, "cvBGCodeBookClearStale");

   function cvSegmentFGMask
     (fgmask : System.Address;
      poly1Hull0 : int;
      perimScale : float;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      offset : opencv2_core_types_c_h.CvPoint) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/video/background_segm.hpp:338
   pragma Import (C, cvSegmentFGMask, "cvSegmentFGMask");

   package Class_BackgroundSubtractor is
      type BackgroundSubtractor is tagged limited record
         null;
      end record;
      pragma Import (CPP, BackgroundSubtractor);

      procedure Delete_BackgroundSubtractor (this : access BackgroundSubtractor);  -- /usr/include/opencv2/video/background_segm.hpp:359
      pragma Import (CPP, Delete_BackgroundSubtractor, "_ZN2cv20BackgroundSubtractorD1Ev");

      procedure deleting_dtor (this : access BackgroundSubtractor);  -- /usr/include/opencv2/video/background_segm.hpp:359
      pragma Import (CPP, deleting_dtor, "_ZN2cv20BackgroundSubtractorD0Ev");

      procedure operator_op
        (this : access BackgroundSubtractor;
         image : opencv2_core_core_hpp.InputArray'Class;
         fgmask : opencv2_core_core_hpp.OutputArray'Class;
         learningRate : double);  -- /usr/include/opencv2/video/background_segm.hpp:361
      pragma Import (CPP, operator_op, "_ZN2cv20BackgroundSubtractorclERKNS_11_InputArrayERKNS_12_OutputArrayEd");

      procedure getBackgroundImage (this : access constant BackgroundSubtractor; backgroundImage : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/video/background_segm.hpp:365
      pragma Import (CPP, getBackgroundImage, "_ZNK2cv20BackgroundSubtractor18getBackgroundImageERKNS_12_OutputArrayE");
   end;
   use Class_BackgroundSubtractor;
   package Class_BackgroundSubtractorMOG is
      type BackgroundSubtractorMOG is limited new BackgroundSubtractor with record
         frameSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/video/background_segm.hpp:394
         frameType : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:395
         bgmodel : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/background_segm.hpp:396
         nframes : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:397
         history : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:398
         nmixtures : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:399
         varThreshold : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:400
         backgroundRatio : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:401
         noiseSigma : aliased double;  -- /usr/include/opencv2/video/background_segm.hpp:402
      end record;
      pragma Import (CPP, BackgroundSubtractorMOG);

      function New_BackgroundSubtractorMOG return BackgroundSubtractorMOG;  -- /usr/include/opencv2/video/background_segm.hpp:383
      pragma CPP_Constructor (New_BackgroundSubtractorMOG, "_ZN2cv23BackgroundSubtractorMOGC1Ev");

      function New_BackgroundSubtractorMOG
        (history : int;
         nmixtures : int;
         backgroundRatio : double;
         noiseSigma : double) return BackgroundSubtractorMOG;  -- /usr/include/opencv2/video/background_segm.hpp:385
      pragma CPP_Constructor (New_BackgroundSubtractorMOG, "_ZN2cv23BackgroundSubtractorMOGC1Eiidd");

      procedure Delete_BackgroundSubtractorMOG (this : access BackgroundSubtractorMOG);  -- /usr/include/opencv2/video/background_segm.hpp:387
      pragma Import (CPP, Delete_BackgroundSubtractorMOG, "_ZN2cv23BackgroundSubtractorMOGD1Ev");

      procedure deleting_dtor (this : access BackgroundSubtractorMOG);  -- /usr/include/opencv2/video/background_segm.hpp:387
      pragma Import (CPP, deleting_dtor, "_ZN2cv23BackgroundSubtractorMOGD0Ev");

      procedure operator_op
        (this : access BackgroundSubtractorMOG;
         image : opencv2_core_core_hpp.InputArray'Class;
         fgmask : opencv2_core_core_hpp.OutputArray'Class;
         learningRate : double);  -- /usr/include/opencv2/video/background_segm.hpp:389
      pragma Import (CPP, operator_op, "_ZN2cv23BackgroundSubtractorMOGclERKNS_11_InputArrayERKNS_12_OutputArrayEd");

      procedure initialize
        (this : access BackgroundSubtractorMOG;
         frameSize : opencv2_core_core_hpp.Class_Size.Size;
         frameType : int);  -- /usr/include/opencv2/video/background_segm.hpp:392
      pragma Import (CPP, initialize, "_ZN2cv23BackgroundSubtractorMOG10initializeENS_5Size_IiEEi");
   end;
   use Class_BackgroundSubtractorMOG;
   package Class_BackgroundSubtractorMOG2 is
      type BackgroundSubtractorMOG2 is limited new BackgroundSubtractor with record
         frameSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/video/background_segm.hpp:424
         frameType : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:425
         bgmodel : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/background_segm.hpp:426
         bgmodelUsedModes : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/background_segm.hpp:427
         nframes : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:428
         history : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:429
         nmixtures : aliased int;  -- /usr/include/opencv2/video/background_segm.hpp:430
         varThreshold : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:433
         backgroundRatio : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:442
         varThresholdGen : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:449
         fVarInit : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:455
         fVarMin : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:456
         fVarMax : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:457
         fCT : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:463
         bShadowDetection : aliased Extensions.bool;  -- /usr/include/opencv2/video/background_segm.hpp:469
         nShadowDetection : aliased unsigned_char;  -- /usr/include/opencv2/video/background_segm.hpp:470
         fTau : aliased float;  -- /usr/include/opencv2/video/background_segm.hpp:471
      end record;
      pragma Import (CPP, BackgroundSubtractorMOG2);

      function New_BackgroundSubtractorMOG2 return BackgroundSubtractorMOG2;  -- /usr/include/opencv2/video/background_segm.hpp:410
      pragma CPP_Constructor (New_BackgroundSubtractorMOG2, "_ZN2cv24BackgroundSubtractorMOG2C1Ev");

      function New_BackgroundSubtractorMOG2
        (history : int;
         varThreshold : float;
         bShadowDetection : Extensions.bool) return BackgroundSubtractorMOG2;  -- /usr/include/opencv2/video/background_segm.hpp:412
      pragma CPP_Constructor (New_BackgroundSubtractorMOG2, "_ZN2cv24BackgroundSubtractorMOG2C1Eifb");

      procedure Delete_BackgroundSubtractorMOG2 (this : access BackgroundSubtractorMOG2);  -- /usr/include/opencv2/video/background_segm.hpp:414
      pragma Import (CPP, Delete_BackgroundSubtractorMOG2, "_ZN2cv24BackgroundSubtractorMOG2D1Ev");

      procedure deleting_dtor (this : access BackgroundSubtractorMOG2);  -- /usr/include/opencv2/video/background_segm.hpp:414
      pragma Import (CPP, deleting_dtor, "_ZN2cv24BackgroundSubtractorMOG2D0Ev");

      procedure operator_op
        (this : access BackgroundSubtractorMOG2;
         image : opencv2_core_core_hpp.InputArray'Class;
         fgmask : opencv2_core_core_hpp.OutputArray'Class;
         learningRate : double);  -- /usr/include/opencv2/video/background_segm.hpp:416
      pragma Import (CPP, operator_op, "_ZN2cv24BackgroundSubtractorMOG2clERKNS_11_InputArrayERKNS_12_OutputArrayEd");

      procedure getBackgroundImage (this : access constant BackgroundSubtractorMOG2; backgroundImage : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/video/background_segm.hpp:419
      pragma Import (CPP, getBackgroundImage, "_ZNK2cv24BackgroundSubtractorMOG218getBackgroundImageERKNS_12_OutputArrayE");

      procedure initialize
        (this : access BackgroundSubtractorMOG2;
         frameSize : opencv2_core_core_hpp.Class_Size.Size;
         frameType : int);  -- /usr/include/opencv2/video/background_segm.hpp:422
      pragma Import (CPP, initialize, "_ZN2cv24BackgroundSubtractorMOG210initializeENS_5Size_IiEEi");
   end;
   use Class_BackgroundSubtractorMOG2;
end opencv2_video_background_segm_hpp;
