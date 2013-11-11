pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_types_c_h;
with cpp_4_7_4_bits_stl_vector_h;
with Interfaces.C.Extensions;
with opencv2_core_core_hpp;
with stddef_h;
limited with cpp_4_7_4_iosfwd;
with System;

package opencv2_contrib_contrib_hpp is

   type CvAdaptiveSkinDetector;
   type Histogram is record
      fHistogram : access opencv2_core_types_c_h.CvHistogram;  -- /usr/include/opencv2/contrib/contrib.hpp:77
   end record;
   pragma Convention (C_Pass_By_Copy, Histogram);
   package Class_CvAdaptiveSkinDetector is
      type CvAdaptiveSkinDetector is tagged limited record
         nStartCounter : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:85
         nFrameCount : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:85
         nSkinHueLowerBound : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:85
         nSkinHueUpperBound : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:85
         nMorphingMethod : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:85
         nSamplingDivider : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:85
         fHistogramMergeFactor : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:86
         fHuePercentCovered : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:86
         histogramHueMotion : aliased Histogram;  -- /usr/include/opencv2/contrib/contrib.hpp:87
         skinHueHistogram : aliased Histogram;  -- /usr/include/opencv2/contrib/contrib.hpp:87
         imgHueFrame : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:88
         imgSaturationFrame : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:88
         imgLastGrayFrame : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:88
         imgMotionFrame : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:88
         imgFilteredFrame : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:88
         imgShrinked : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:89
         imgTemp : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:89
         imgGrayFrame : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:89
         imgHSVFrame : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/contrib/contrib.hpp:89
      end record;
      pragma Import (CPP, CvAdaptiveSkinDetector);

      procedure initData
        (this : access CvAdaptiveSkinDetector'Class;
         src : access opencv2_core_types_c_h.IplImage;
         widthDivider : int;
         heightDivider : int);  -- /usr/include/opencv2/contrib/contrib.hpp:92
      pragma Import (CPP, initData, "_ZN22CvAdaptiveSkinDetector8initDataEP9_IplImageii");

      procedure adaptiveFilter (this : access CvAdaptiveSkinDetector'Class);  -- /usr/include/opencv2/contrib/contrib.hpp:93
      pragma Import (CPP, adaptiveFilter, "_ZN22CvAdaptiveSkinDetector14adaptiveFilterEv");

      function New_CvAdaptiveSkinDetector (samplingDivider : int; morphingMethod : int) return CvAdaptiveSkinDetector;  -- /usr/include/opencv2/contrib/contrib.hpp:104
      pragma CPP_Constructor (New_CvAdaptiveSkinDetector, "_ZN22CvAdaptiveSkinDetectorC1Eii");

      procedure Delete_CvAdaptiveSkinDetector (this : access CvAdaptiveSkinDetector);  -- /usr/include/opencv2/contrib/contrib.hpp:105
      pragma Import (CPP, Delete_CvAdaptiveSkinDetector, "_ZN22CvAdaptiveSkinDetectorD1Ev");

      procedure deleting_dtor (this : access CvAdaptiveSkinDetector);  -- /usr/include/opencv2/contrib/contrib.hpp:105
      pragma Import (CPP, deleting_dtor, "_ZN22CvAdaptiveSkinDetectorD0Ev");

      procedure process
        (this : access CvAdaptiveSkinDetector;
         inputBGRImage : access opencv2_core_types_c_h.IplImage;
         outputHueMask : access opencv2_core_types_c_h.IplImage);  -- /usr/include/opencv2/contrib/contrib.hpp:107
      pragma Import (CPP, process, "_ZN22CvAdaptiveSkinDetector7processEP9_IplImageS1_");
   end;
   use Class_CvAdaptiveSkinDetector;
   package Class_CvFuzzyPoint is
      type CvFuzzyPoint is limited record
         x : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:117
         y : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:117
         value : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:117
      end record;
      pragma Import (CPP, CvFuzzyPoint);

      function New_CvFuzzyPoint (u_x : double; u_y : double) return CvFuzzyPoint;  -- /usr/include/opencv2/contrib/contrib.hpp:119
      pragma CPP_Constructor (New_CvFuzzyPoint, "_ZN12CvFuzzyPointC1Edd");


   end;
   use Class_CvFuzzyPoint;
   package Class_CvFuzzyCurve is
      type CvFuzzyCurve is limited record
         points : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:124
         value : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:125
         centre : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:125
      end record;
      pragma Import (CPP, CvFuzzyCurve);

      function between
        (this : access CvFuzzyCurve;
         x : double;
         x1 : double;
         x2 : double) return Extensions.bool;  -- /usr/include/opencv2/contrib/contrib.hpp:127
      pragma Import (CPP, between, "_ZN12CvFuzzyCurve7betweenEddd");

      function New_CvFuzzyCurve return CvFuzzyCurve;  -- /usr/include/opencv2/contrib/contrib.hpp:130
      pragma CPP_Constructor (New_CvFuzzyCurve, "_ZN12CvFuzzyCurveC1Ev");

      procedure Delete_CvFuzzyCurve (this : access CvFuzzyCurve);  -- /usr/include/opencv2/contrib/contrib.hpp:131
      pragma Import (CPP, Delete_CvFuzzyCurve, "_ZN12CvFuzzyCurveD1Ev");

      procedure setCentre (this : access CvFuzzyCurve; u_centre : double);  -- /usr/include/opencv2/contrib/contrib.hpp:133
      pragma Import (CPP, setCentre, "_ZN12CvFuzzyCurve9setCentreEd");

      function getCentre (this : access CvFuzzyCurve) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:134
      pragma Import (CPP, getCentre, "_ZN12CvFuzzyCurve9getCentreEv");

      procedure clear (this : access CvFuzzyCurve);  -- /usr/include/opencv2/contrib/contrib.hpp:135
      pragma Import (CPP, clear, "_ZN12CvFuzzyCurve5clearEv");

      procedure addPoint
        (this : access CvFuzzyCurve;
         x : double;
         y : double);  -- /usr/include/opencv2/contrib/contrib.hpp:136
      pragma Import (CPP, addPoint, "_ZN12CvFuzzyCurve8addPointEdd");

      function calcValue (this : access CvFuzzyCurve; param : double) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:137
      pragma Import (CPP, calcValue, "_ZN12CvFuzzyCurve9calcValueEd");

      function getValue (this : access CvFuzzyCurve) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:138
      pragma Import (CPP, getValue, "_ZN12CvFuzzyCurve8getValueEv");

      procedure setValue (this : access CvFuzzyCurve; u_value : double);  -- /usr/include/opencv2/contrib/contrib.hpp:139
      pragma Import (CPP, setValue, "_ZN12CvFuzzyCurve8setValueEd");
   end;
   use Class_CvFuzzyCurve;
   package Class_CvFuzzyFunction is
      type CvFuzzyFunction is limited record
         curves : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:144
      end record;
      pragma Import (CPP, CvFuzzyFunction);

      function New_CvFuzzyFunction return CvFuzzyFunction;  -- /usr/include/opencv2/contrib/contrib.hpp:146
      pragma CPP_Constructor (New_CvFuzzyFunction, "_ZN15CvFuzzyFunctionC1Ev");

      procedure Delete_CvFuzzyFunction (this : access CvFuzzyFunction);  -- /usr/include/opencv2/contrib/contrib.hpp:147
      pragma Import (CPP, Delete_CvFuzzyFunction, "_ZN15CvFuzzyFunctionD1Ev");

      procedure addCurve
        (this : access CvFuzzyFunction;
         curve : access CvFuzzyCurve;
         value : double);  -- /usr/include/opencv2/contrib/contrib.hpp:148
      pragma Import (CPP, addCurve, "_ZN15CvFuzzyFunction8addCurveEP12CvFuzzyCurved");

      procedure resetValues (this : access CvFuzzyFunction);  -- /usr/include/opencv2/contrib/contrib.hpp:149
      pragma Import (CPP, resetValues, "_ZN15CvFuzzyFunction11resetValuesEv");

      function calcValue (this : access CvFuzzyFunction) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:150
      pragma Import (CPP, calcValue, "_ZN15CvFuzzyFunction9calcValueEv");

      function newCurve (this : access CvFuzzyFunction) return access CvFuzzyCurve;  -- /usr/include/opencv2/contrib/contrib.hpp:151
      pragma Import (CPP, newCurve, "_ZN15CvFuzzyFunction8newCurveEv");
   end;
   use Class_CvFuzzyFunction;
   package Class_CvFuzzyRule is
      type CvFuzzyRule is limited record
         fuzzyInput1 : access CvFuzzyCurve;  -- /usr/include/opencv2/contrib/contrib.hpp:156
         fuzzyInput2 : access CvFuzzyCurve;  -- /usr/include/opencv2/contrib/contrib.hpp:156
         fuzzyOutput : access CvFuzzyCurve;  -- /usr/include/opencv2/contrib/contrib.hpp:157
      end record;
      pragma Import (CPP, CvFuzzyRule);

      function New_CvFuzzyRule return CvFuzzyRule;  -- /usr/include/opencv2/contrib/contrib.hpp:159
      pragma CPP_Constructor (New_CvFuzzyRule, "_ZN11CvFuzzyRuleC1Ev");

      procedure Delete_CvFuzzyRule (this : access CvFuzzyRule);  -- /usr/include/opencv2/contrib/contrib.hpp:160
      pragma Import (CPP, Delete_CvFuzzyRule, "_ZN11CvFuzzyRuleD1Ev");

      procedure setRule
        (this : access CvFuzzyRule;
         c1 : access CvFuzzyCurve;
         c2 : access CvFuzzyCurve;
         o1 : access CvFuzzyCurve);  -- /usr/include/opencv2/contrib/contrib.hpp:161
      pragma Import (CPP, setRule, "_ZN11CvFuzzyRule7setRuleEP12CvFuzzyCurveS1_S1_");

      function calcValue
        (this : access CvFuzzyRule;
         param1 : double;
         param2 : double) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:162
      pragma Import (CPP, calcValue, "_ZN11CvFuzzyRule9calcValueEdd");

      function getOutputCurve (this : access CvFuzzyRule) return access CvFuzzyCurve;  -- /usr/include/opencv2/contrib/contrib.hpp:163
      pragma Import (CPP, getOutputCurve, "_ZN11CvFuzzyRule14getOutputCurveEv");
   end;
   use Class_CvFuzzyRule;
   package Class_CvFuzzyController is
      type CvFuzzyController is limited record
         rules : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:168
      end record;
      pragma Import (CPP, CvFuzzyController);

      function New_CvFuzzyController return CvFuzzyController;  -- /usr/include/opencv2/contrib/contrib.hpp:170
      pragma CPP_Constructor (New_CvFuzzyController, "_ZN17CvFuzzyControllerC1Ev");

      procedure Delete_CvFuzzyController (this : access CvFuzzyController);  -- /usr/include/opencv2/contrib/contrib.hpp:171
      pragma Import (CPP, Delete_CvFuzzyController, "_ZN17CvFuzzyControllerD1Ev");

      procedure addRule
        (this : access CvFuzzyController;
         c1 : access CvFuzzyCurve;
         c2 : access CvFuzzyCurve;
         o1 : access CvFuzzyCurve);  -- /usr/include/opencv2/contrib/contrib.hpp:172
      pragma Import (CPP, addRule, "_ZN17CvFuzzyController7addRuleEP12CvFuzzyCurveS1_S1_");

      function calcOutput
        (this : access CvFuzzyController;
         param1 : double;
         param2 : double) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:173
      pragma Import (CPP, calcOutput, "_ZN17CvFuzzyController10calcOutputEdd");
   end;
   use Class_CvFuzzyController;
   type CvFuzzyMeanShiftTracker;
   type FuzzyResizer is record
      iInput : aliased CvFuzzyFunction;  -- /usr/include/opencv2/contrib/contrib.hpp:182
      iOutput : aliased CvFuzzyFunction;  -- /usr/include/opencv2/contrib/contrib.hpp:182
      fuzzyController : aliased CvFuzzyController;  -- /usr/include/opencv2/contrib/contrib.hpp:183
   end record;
   pragma Convention (C_Pass_By_Copy, FuzzyResizer);
   type SearchWindow is record
      the_fuzzyResizer : access FuzzyResizer;  -- /usr/include/opencv2/contrib/contrib.hpp:192
      x : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:193
      y : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:193
      width : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:194
      height : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:194
      maxWidth : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:194
      maxHeight : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:194
      ellipseHeight : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:194
      ellipseWidth : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:194
      ldx : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:195
      ldy : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:195
      ldw : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:195
      ldh : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:195
      numShifts : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:195
      numIters : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:195
      xGc : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:196
      yGc : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:196
      m00 : aliased long;  -- /usr/include/opencv2/contrib/contrib.hpp:197
      m01 : aliased long;  -- /usr/include/opencv2/contrib/contrib.hpp:197
      m10 : aliased long;  -- /usr/include/opencv2/contrib/contrib.hpp:197
      m11 : aliased long;  -- /usr/include/opencv2/contrib/contrib.hpp:197
      m02 : aliased long;  -- /usr/include/opencv2/contrib/contrib.hpp:197
      m20 : aliased long;  -- /usr/include/opencv2/contrib/contrib.hpp:197
      ellipseAngle : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:198
      density : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:199
      depthLow : aliased unsigned;  -- /usr/include/opencv2/contrib/contrib.hpp:200
      depthHigh : aliased unsigned;  -- /usr/include/opencv2/contrib/contrib.hpp:200
      verticalEdgeLeft : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:201
      verticalEdgeRight : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:201
      horizontalEdgeTop : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:201
      horizontalEdgeBottom : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:201
   end record;
   pragma Convention (C_Pass_By_Copy, SearchWindow);
   package Class_CvFuzzyMeanShiftTracker is
      type CvFuzzyMeanShiftTracker is limited record
         kernel : aliased SearchWindow;  -- /usr/include/opencv2/contrib/contrib.hpp:235
         searchMode : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:236
      end record;
      pragma Import (CPP, CvFuzzyMeanShiftTracker);

      procedure findOptimumSearchWindow
        (this : access CvFuzzyMeanShiftTracker;
         searchWindow : access SearchWindow;
         maskImage : access opencv2_core_types_c_h.IplImage;
         depthMap : access opencv2_core_types_c_h.IplImage;
         maxIteration : int;
         resizeMethod : int;
         initDepth : Extensions.bool);  -- /usr/include/opencv2/contrib/contrib.hpp:245
      pragma Import (CPP, findOptimumSearchWindow, "_ZN23CvFuzzyMeanShiftTracker23findOptimumSearchWindowERNS_12SearchWindowEP9_IplImageS3_iib");

      function New_CvFuzzyMeanShiftTracker return CvFuzzyMeanShiftTracker;  -- /usr/include/opencv2/contrib/contrib.hpp:248
      pragma CPP_Constructor (New_CvFuzzyMeanShiftTracker, "_ZN23CvFuzzyMeanShiftTrackerC1Ev");

      procedure Delete_CvFuzzyMeanShiftTracker (this : access CvFuzzyMeanShiftTracker);  -- /usr/include/opencv2/contrib/contrib.hpp:249
      pragma Import (CPP, Delete_CvFuzzyMeanShiftTracker, "_ZN23CvFuzzyMeanShiftTrackerD1Ev");

      procedure track
        (this : access CvFuzzyMeanShiftTracker;
         maskImage : access opencv2_core_types_c_h.IplImage;
         depthMap : access opencv2_core_types_c_h.IplImage;
         resizeMethod : int;
         resetSearch : Extensions.bool;
         minKernelMass : int);  -- /usr/include/opencv2/contrib/contrib.hpp:251
      pragma Import (CPP, track, "_ZN23CvFuzzyMeanShiftTracker5trackEP9_IplImageS1_ibi");
   end;
   use Class_CvFuzzyMeanShiftTracker;
   type Octree;
   type Octree_children_array is array (0 .. 7) of aliased int;
   type Node is record
      c_begin : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:264
      c_end : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:264
      x_min : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:265
      x_max : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:265
      y_min : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:265
      y_max : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:265
      z_min : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:265
      z_max : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:265
      maxLevels : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:266
      isLeaf : aliased Extensions.bool;  -- /usr/include/opencv2/contrib/contrib.hpp:267
      children : aliased Octree_children_array;  -- /usr/include/opencv2/contrib/contrib.hpp:268
   end record;
   pragma Convention (C_Pass_By_Copy, Node);
   package Class_Octree is
      type Octree is tagged limited record
         minPoints : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:280
         points : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:281
         nodes : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:282
      end record;
      pragma Import (CPP, Octree);

      function New_Octree return Octree;  -- /usr/include/opencv2/contrib/contrib.hpp:271
      pragma CPP_Constructor (New_Octree, "_ZN2cv6OctreeC1Ev");

      function New_Octree
        (points : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxLevels : int;
         minPoints : int) return Octree;  -- /usr/include/opencv2/contrib/contrib.hpp:272
      pragma CPP_Constructor (New_Octree, "_ZN2cv6OctreeC1ERKSt6vectorINS_7Point3_IfEESaIS3_EEii");

      procedure Delete_Octree (this : access Octree);  -- /usr/include/opencv2/contrib/contrib.hpp:273
      pragma Import (CPP, Delete_Octree, "_ZN2cv6OctreeD1Ev");

      procedure deleting_dtor (this : access Octree);  -- /usr/include/opencv2/contrib/contrib.hpp:273
      pragma Import (CPP, deleting_dtor, "_ZN2cv6OctreeD0Ev");

      procedure buildTree
        (this : access Octree;
         points : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxLevels : int;
         minPoints : int);  -- /usr/include/opencv2/contrib/contrib.hpp:275
      pragma Import (CPP, buildTree, "_ZN2cv6Octree9buildTreeERKSt6vectorINS_7Point3_IfEESaIS3_EEii");

      procedure getPointsWithinSphere
        (this : access constant Octree;
         center : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         radius : float;
         points : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/contrib/contrib.hpp:276
      pragma Import (CPP, getPointsWithinSphere, "_ZNK2cv6Octree21getPointsWithinSphereERKNS_7Point3_IfEEfRSt6vectorIS2_SaIS2_EE");

      function getNodes (this : access constant Octree'Class) return access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:278
      pragma Import (CPP, getNodes, "_ZNK2cv6Octree8getNodesEv");

      procedure buildNext (this : access Octree; node_ind : stddef_h.size_t);  -- /usr/include/opencv2/contrib/contrib.hpp:284
      pragma Import (CPP, buildNext, "_ZN2cv6Octree9buildNextEm");
   end;
   use Class_Octree;
   type Mesh3D;
   type EmptyMeshException is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, EmptyMeshException);
   package Class_Mesh3D is
      type Mesh3D is limited record
         vtx : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:305
         normals : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:306
         resolution : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:307
         the_octree : aliased Octree;  -- /usr/include/opencv2/contrib/contrib.hpp:308
      end record;
      pragma Import (CPP, Mesh3D);

      function New_Mesh3D return Mesh3D;  -- /usr/include/opencv2/contrib/contrib.hpp:293
      pragma CPP_Constructor (New_Mesh3D, "_ZN2cv6Mesh3DC1Ev");

      function New_Mesh3D (vtx : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Mesh3D;  -- /usr/include/opencv2/contrib/contrib.hpp:294
      pragma CPP_Constructor (New_Mesh3D, "_ZN2cv6Mesh3DC1ERKSt6vectorINS_7Point3_IfEESaIS3_EE");

      procedure Delete_Mesh3D (this : access Mesh3D);  -- /usr/include/opencv2/contrib/contrib.hpp:295
      pragma Import (CPP, Delete_Mesh3D, "_ZN2cv6Mesh3DD1Ev");

      procedure buildOctree (this : access Mesh3D);  -- /usr/include/opencv2/contrib/contrib.hpp:297
      pragma Import (CPP, buildOctree, "_ZN2cv6Mesh3D11buildOctreeEv");

      procedure clearOctree (this : access Mesh3D);  -- /usr/include/opencv2/contrib/contrib.hpp:298
      pragma Import (CPP, clearOctree, "_ZN2cv6Mesh3D11clearOctreeEv");

      function estimateResolution (this : access Mesh3D; tryRatio : float) return float;  -- /usr/include/opencv2/contrib/contrib.hpp:299
      pragma Import (CPP, estimateResolution, "_ZN2cv6Mesh3D18estimateResolutionEf");

      procedure computeNormals
        (this : access Mesh3D;
         normalRadius : float;
         minNeighbors : int);  -- /usr/include/opencv2/contrib/contrib.hpp:300
      pragma Import (CPP, computeNormals, "_ZN2cv6Mesh3D14computeNormalsEfi");

      procedure computeNormals
        (this : access Mesh3D;
         subset : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         normalRadius : float;
         minNeighbors : int);  -- /usr/include/opencv2/contrib/contrib.hpp:301
      pragma Import (CPP, computeNormals, "_ZN2cv6Mesh3D14computeNormalsERKSt6vectorIiSaIiEEfi");

      procedure writeAsVrml
        (this : access constant Mesh3D;
         file : access constant opencv2_core_core_hpp.Class_String.String;
         colors : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/contrib/contrib.hpp:303
      pragma Import (CPP, writeAsVrml, "_ZNK2cv6Mesh3D11writeAsVrmlERKSsRKSt6vectorINS_7Scalar_IdEESaIS5_EE");

      allzero : aliased opencv2_core_core_hpp.Class_Point3f.Point3f;  -- /usr/include/opencv2/contrib/contrib.hpp:310
      pragma Import (CPP, allzero, "_ZN2cv6Mesh3D7allzeroE");
   end;
   use Class_Mesh3D;
   package Class_SpinImageModel is
      type SpinImageModel is limited record
         normalRadius : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:318
         minNeighbors : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:319
         binSize : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:321
         imageWidth : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:322
         lambda : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:324
         gamma : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:325
         T_GeometriccConsistency : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:327
         T_GroupingCorespondances : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:328
         subset : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/contrib/contrib.hpp:375
         mesh : aliased Mesh3D;  -- /usr/include/opencv2/contrib/contrib.hpp:376
         spinImages : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/contrib/contrib.hpp:377
         c_out : access cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/include/opencv2/contrib/contrib.hpp:378
      end record;
      pragma Import (CPP, SpinImageModel);

      function New_SpinImageModel return SpinImageModel;  -- /usr/include/opencv2/contrib/contrib.hpp:331
      pragma CPP_Constructor (New_SpinImageModel, "_ZN2cv14SpinImageModelC1Ev");

      function New_SpinImageModel (mesh : access constant Mesh3D) return SpinImageModel;  -- /usr/include/opencv2/contrib/contrib.hpp:332
      pragma CPP_Constructor (New_SpinImageModel, "_ZN2cv14SpinImageModelC1ERKNS_6Mesh3DE");

      procedure Delete_SpinImageModel (this : access SpinImageModel);  -- /usr/include/opencv2/contrib/contrib.hpp:333
      pragma Import (CPP, Delete_SpinImageModel, "_ZN2cv14SpinImageModelD1Ev");

      procedure setLogger (this : access SpinImageModel; log : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class);  -- /usr/include/opencv2/contrib/contrib.hpp:335
      pragma Import (CPP, setLogger, "_ZN2cv14SpinImageModel9setLoggerEPSo");

      procedure selectRandomSubset (this : access SpinImageModel; ratio : float);  -- /usr/include/opencv2/contrib/contrib.hpp:336
      pragma Import (CPP, selectRandomSubset, "_ZN2cv14SpinImageModel18selectRandomSubsetEf");

      procedure setSubset (this : access SpinImageModel; subset : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/contrib/contrib.hpp:337
      pragma Import (CPP, setSubset, "_ZN2cv14SpinImageModel9setSubsetERKSt6vectorIiSaIiEE");

      procedure compute (this : access SpinImageModel);  -- /usr/include/opencv2/contrib/contrib.hpp:338
      pragma Import (CPP, compute, "_ZN2cv14SpinImageModel7computeEv");

      procedure match
        (this : access SpinImageModel;
         scene : System.Address;
         result : System.Address);  -- /usr/include/opencv2/contrib/contrib.hpp:340
      pragma Import (CPP, match, "_ZN2cv14SpinImageModel5matchERKS0_RSt6vectorIS3_INS_3VecIiLi2EEESaIS5_EESaIS7_EE");

      function packRandomScaledSpins
        (this : access constant SpinImageModel;
         separateScale : Extensions.bool;
         xCount : stddef_h.size_t;
         yCount : stddef_h.size_t) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/contrib/contrib.hpp:342
      pragma Import (CPP, packRandomScaledSpins, "_ZNK2cv14SpinImageModel21packRandomScaledSpinsEbmm");

      function getSpinCount (this : access constant SpinImageModel) return stddef_h.size_t;  -- /usr/include/opencv2/contrib/contrib.hpp:344
      pragma Import (CPP, getSpinCount, "_ZNK2cv14SpinImageModel12getSpinCountEv");

      function getSpinImage (this : access constant SpinImageModel; index : stddef_h.size_t) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/contrib/contrib.hpp:345
      pragma Import (CPP, getSpinImage, "_ZNK2cv14SpinImageModel12getSpinImageEm");

      function getSpinVertex (this : access constant SpinImageModel; index : stddef_h.size_t) return access constant opencv2_core_core_hpp.Class_Point3f.Point3f;  -- /usr/include/opencv2/contrib/contrib.hpp:346
      pragma Import (CPP, getSpinVertex, "_ZNK2cv14SpinImageModel13getSpinVertexEm");

      function getSpinNormal (this : access constant SpinImageModel; index : stddef_h.size_t) return access constant opencv2_core_core_hpp.Class_Point3f.Point3f;  -- /usr/include/opencv2/contrib/contrib.hpp:347
      pragma Import (CPP, getSpinNormal, "_ZNK2cv14SpinImageModel13getSpinNormalEm");

      function getMesh (this : access constant SpinImageModel) return access constant Mesh3D;  -- /usr/include/opencv2/contrib/contrib.hpp:349
      pragma Import (CPP, getMesh, "_ZNK2cv14SpinImageModel7getMeshEv");

      function getMesh (this : access SpinImageModel) return access Mesh3D;  -- /usr/include/opencv2/contrib/contrib.hpp:350
      pragma Import (CPP, getMesh, "_ZN2cv14SpinImageModel7getMeshEv");

      function spinCorrelation
        (spin1 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         spin2 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         lambda : float;
         result : access float) return Extensions.bool;  -- /usr/include/opencv2/contrib/contrib.hpp:353
      pragma Import (CPP, spinCorrelation, "_ZN2cv14SpinImageModel15spinCorrelationERKNS_3MatES3_fRf");

      function calcSpinMapCoo
        (point : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         vertex : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normal : access constant opencv2_core_core_hpp.Class_Point3f.Point3f) return opencv2_core_core_hpp.Class_Point2f.Point2f;  -- /usr/include/opencv2/contrib/contrib.hpp:355
      pragma Import (CPP, calcSpinMapCoo, "_ZN2cv14SpinImageModel14calcSpinMapCooERKNS_7Point3_IfEES4_S4_");

      function geometricConsistency
        (pointScene1 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normalScene1 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         pointModel1 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normalModel1 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         pointScene2 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normalScene2 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         pointModel2 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normalModel2 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f) return float;  -- /usr/include/opencv2/contrib/contrib.hpp:357
      pragma Import (CPP, geometricConsistency, "_ZN2cv14SpinImageModel20geometricConsistencyERKNS_7Point3_IfEES4_S4_S4_S4_S4_S4_S4_");

      function groupingCreteria
        (pointScene1 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normalScene1 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         pointModel1 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normalModel1 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         pointScene2 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normalScene2 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         pointModel2 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         normalModel2 : access constant opencv2_core_core_hpp.Class_Point3f.Point3f;
         gamma : float) return float;  -- /usr/include/opencv2/contrib/contrib.hpp:362
      pragma Import (CPP, groupingCreteria, "_ZN2cv14SpinImageModel16groupingCreteriaERKNS_7Point3_IfEES4_S4_S4_S4_S4_S4_S4_f");

      procedure defaultParams (this : access SpinImageModel);  -- /usr/include/opencv2/contrib/contrib.hpp:368
      pragma Import (CPP, defaultParams, "_ZN2cv14SpinImageModel13defaultParamsEv");

      procedure matchSpinToModel
        (this : access constant SpinImageModel;
         spin : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         indeces : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         corrCoeffs : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         useExtremeOutliers : Extensions.bool);  -- /usr/include/opencv2/contrib/contrib.hpp:370
      pragma Import (CPP, matchSpinToModel, "_ZNK2cv14SpinImageModel16matchSpinToModelERKNS_3MatERSt6vectorIiSaIiEERS4_IfSaIfEEb");

      procedure repackSpinImages
        (this : access constant SpinImageModel;
         mask : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         spinImages : access opencv2_core_core_hpp.Class_Mat.Mat;
         reAlloc : Extensions.bool);  -- /usr/include/opencv2/contrib/contrib.hpp:373
      pragma Import (CPP, repackSpinImages, "_ZNK2cv14SpinImageModel16repackSpinImagesERKSt6vectorIhSaIhEERNS_3MatEb");
   end;
   use Class_SpinImageModel;
   package Class_TickMeter is
      type TickMeter is limited record
         counter : aliased opencv2_core_types_c_h.int64;  -- /usr/include/opencv2/contrib/contrib.hpp:396
         sumTime : aliased opencv2_core_types_c_h.int64;  -- /usr/include/opencv2/contrib/contrib.hpp:397
         startTime : aliased opencv2_core_types_c_h.int64;  -- /usr/include/opencv2/contrib/contrib.hpp:398
      end record;
      pragma Import (CPP, TickMeter);

      function New_TickMeter return TickMeter;  -- /usr/include/opencv2/contrib/contrib.hpp:384
      pragma CPP_Constructor (New_TickMeter, "_ZN2cv9TickMeterC1Ev");

      procedure start (this : access TickMeter);  -- /usr/include/opencv2/contrib/contrib.hpp:385
      pragma Import (CPP, start, "_ZN2cv9TickMeter5startEv");

      procedure stop (this : access TickMeter);  -- /usr/include/opencv2/contrib/contrib.hpp:386
      pragma Import (CPP, stop, "_ZN2cv9TickMeter4stopEv");

      function getTimeTicks (this : access constant TickMeter) return opencv2_core_types_c_h.int64;  -- /usr/include/opencv2/contrib/contrib.hpp:388
      pragma Import (CPP, getTimeTicks, "_ZNK2cv9TickMeter12getTimeTicksEv");

      function getTimeMicro (this : access constant TickMeter) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:389
      pragma Import (CPP, getTimeMicro, "_ZNK2cv9TickMeter12getTimeMicroEv");

      function getTimeMilli (this : access constant TickMeter) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:390
      pragma Import (CPP, getTimeMilli, "_ZNK2cv9TickMeter12getTimeMilliEv");

      function getTimeSec (this : access constant TickMeter) return double;  -- /usr/include/opencv2/contrib/contrib.hpp:391
      pragma Import (CPP, getTimeSec, "_ZNK2cv9TickMeter10getTimeSecEv");

      function getCounter (this : access constant TickMeter) return opencv2_core_types_c_h.int64;  -- /usr/include/opencv2/contrib/contrib.hpp:392
      pragma Import (CPP, getCounter, "_ZNK2cv9TickMeter10getCounterEv");

      procedure reset (this : access TickMeter);  -- /usr/include/opencv2/contrib/contrib.hpp:394
      pragma Import (CPP, reset, "_ZN2cv9TickMeter5resetEv");
   end;
   use Class_TickMeter;
   function operator_sl (c_out : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class; tm : access constant TickMeter) return access cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/include/opencv2/contrib/contrib.hpp:401
   pragma Import (CPP, operator_sl, "_ZN2cvlsERSoRKNS_9TickMeterE");

   package Class_SelfSimDescriptor is
      type SelfSimDescriptor is tagged limited record
         smallSize : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:423
         largeSize : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:424
         startDistanceBucket : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:425
         numberOfDistanceBuckets : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:426
         numberOfAngles : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:427
      end record;
      pragma Import (CPP, SelfSimDescriptor);

      function New_SelfSimDescriptor return SelfSimDescriptor;  -- /usr/include/opencv2/contrib/contrib.hpp:406
      pragma CPP_Constructor (New_SelfSimDescriptor, "_ZN2cv17SelfSimDescriptorC1Ev");

      function New_SelfSimDescriptor
        (u_ssize : int;
         u_lsize : int;
         u_startDistanceBucket : int;
         u_numberOfDistanceBuckets : int;
         u_nangles : int) return SelfSimDescriptor;  -- /usr/include/opencv2/contrib/contrib.hpp:407
      pragma CPP_Constructor (New_SelfSimDescriptor, "_ZN2cv17SelfSimDescriptorC1Eiiiii");

      procedure Delete_SelfSimDescriptor (this : access SelfSimDescriptor);  -- /usr/include/opencv2/contrib/contrib.hpp:412
      pragma Import (CPP, Delete_SelfSimDescriptor, "_ZN2cv17SelfSimDescriptorD1Ev");

      procedure deleting_dtor (this : access SelfSimDescriptor);  -- /usr/include/opencv2/contrib/contrib.hpp:412
      pragma Import (CPP, deleting_dtor, "_ZN2cv17SelfSimDescriptorD0Ev");

      function operator_as (this : access SelfSimDescriptor'Class; ss : access constant SelfSimDescriptor'Class) return access SelfSimDescriptor;  -- /usr/include/opencv2/contrib/contrib.hpp:413
      pragma Import (CPP, operator_as, "_ZN2cv17SelfSimDescriptoraSERKS0_");

      function getDescriptorSize (this : access constant SelfSimDescriptor'Class) return stddef_h.size_t;  -- /usr/include/opencv2/contrib/contrib.hpp:415
      pragma Import (CPP, getDescriptorSize, "_ZNK2cv17SelfSimDescriptor17getDescriptorSizeEv");

      function getGridSize
        (this : access constant SelfSimDescriptor'Class;
         imgsize : opencv2_core_core_hpp.Class_Size.Size;
         winStride : opencv2_core_core_hpp.Class_Size.Size) return opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/contrib/contrib.hpp:416
      pragma Import (CPP, getGridSize, "_ZNK2cv17SelfSimDescriptor11getGridSizeENS_5Size_IiEES2_");

      procedure compute
        (this : access constant SelfSimDescriptor;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         descriptors : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         winStride : opencv2_core_core_hpp.Class_Size.Size;
         locations : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/contrib/contrib.hpp:418
      pragma Import (CPP, compute, "_ZNK2cv17SelfSimDescriptor7computeERKNS_3MatERSt6vectorIfSaIfEENS_5Size_IiEERKS4_INS_6Point_IiEESaISB_EE");

      procedure computeLogPolarMapping (this : access constant SelfSimDescriptor; mappingMask : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/contrib/contrib.hpp:420
      pragma Import (CPP, computeLogPolarMapping, "_ZNK2cv17SelfSimDescriptor22computeLogPolarMappingERNS_3MatE");

      procedure SSD
        (this : access constant SelfSimDescriptor;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         pt : opencv2_core_core_hpp.Class_Point.Point;
         ssd : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/contrib/contrib.hpp:421
      pragma Import (CPP, SSD, "_ZNK2cv17SelfSimDescriptor3SSDERKNS_3MatENS_6Point_IiEERS1_");
   end;
   use Class_SelfSimDescriptor;
   type BundleAdjustCallback is access function
        (arg1 : int;
         arg2 : double;
         arg3 : System.Address) return Extensions.bool;
   pragma Convention (C, BundleAdjustCallback);  -- /usr/include/opencv2/contrib/contrib.hpp:435

   package Class_LevMarqSparse is
      type LevMarqSparse is tagged limited record
         err : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:507
         prevErrNorm : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:508
         errNorm : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:508
         lambda : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:509
         criteria : aliased opencv2_core_types_c_h.CvTermCriteria;  -- /usr/include/opencv2/contrib/contrib.hpp:510
         iters : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:511
         U : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:513
         V : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:514
         inv_V_star : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:515
         A : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:517
         B : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:518
         W : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:519
         X : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:521
         hX : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:522
         prevP : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:524
         P : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:525
         deltaP : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:528
         ea : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:530
         eb : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:532
         Yj : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:535
         S : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:537
         JtJ_diag : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:539
         Vis_index : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/contrib/contrib.hpp:541
         num_cams : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:543
         num_points : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:544
         num_err_param : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:545
         num_cam_param : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:546
         num_point_param : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:547
         fjac : access procedure
              (arg1 : int;
               arg2 : int;
               arg3 : access opencv2_core_core_hpp.Class_Mat.Mat;
               arg4 : access opencv2_core_core_hpp.Class_Mat.Mat;
               arg5 : access opencv2_core_core_hpp.Class_Mat.Mat;
               arg6 : access opencv2_core_core_hpp.Class_Mat.Mat;
               arg7 : System.Address);  -- /usr/include/opencv2/contrib/contrib.hpp:550
         func : access procedure
              (arg1 : int;
               arg2 : int;
               arg3 : access opencv2_core_core_hpp.Class_Mat.Mat;
               arg4 : access opencv2_core_core_hpp.Class_Mat.Mat;
               arg5 : access opencv2_core_core_hpp.Class_Mat.Mat;
               arg6 : System.Address);  -- /usr/include/opencv2/contrib/contrib.hpp:551
         data : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:553
         cb : BundleAdjustCallback;  -- /usr/include/opencv2/contrib/contrib.hpp:555
         user_data : System.Address;  -- /usr/include/opencv2/contrib/contrib.hpp:556
      end record;
      pragma Import (CPP, LevMarqSparse);

      function New_LevMarqSparse return LevMarqSparse;  -- /usr/include/opencv2/contrib/contrib.hpp:439
      pragma CPP_Constructor (New_LevMarqSparse, "_ZN2cv13LevMarqSparseC1Ev");

      function New_LevMarqSparse
        (npoints : int;
         ncameras : int;
         nPointParams : int;
         nCameraParams : int;
         nErrParams : int;
         visibility : access opencv2_core_core_hpp.Class_Mat.Mat;
         P0 : access opencv2_core_core_hpp.Class_Mat.Mat;
         X : access opencv2_core_core_hpp.Class_Mat.Mat;
         criteria : opencv2_core_core_hpp.Class_TermCriteria.TermCriteria;
         fjac : access procedure
           (arg1 : int;
            arg2 : int;
            arg3 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg4 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg5 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg6 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg7 : System.Address);
         func : access procedure
           (arg1 : int;
            arg2 : int;
            arg3 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg4 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg5 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg6 : System.Address);
         data : System.Address;
         cb : BundleAdjustCallback;
         user_data : System.Address) return LevMarqSparse;  -- /usr/include/opencv2/contrib/contrib.hpp:440
      pragma CPP_Constructor (New_LevMarqSparse, "_ZN2cv13LevMarqSparseC1EiiiiiRNS_3MatES2_S2_NS_12TermCriteriaEPFviiS2_S2_S2_S2_PvEPFviiS2_S2_S2_S4_ES4_PFbidS4_ES4_");

      procedure Delete_LevMarqSparse (this : access LevMarqSparse);  -- /usr/include/opencv2/contrib/contrib.hpp:462
      pragma Import (CPP, Delete_LevMarqSparse, "_ZN2cv13LevMarqSparseD1Ev");

      procedure deleting_dtor (this : access LevMarqSparse);  -- /usr/include/opencv2/contrib/contrib.hpp:462
      pragma Import (CPP, deleting_dtor, "_ZN2cv13LevMarqSparseD0Ev");

      procedure run
        (this : access LevMarqSparse;
         npoints : int;
         ncameras : int;
         nPointParams : int;
         nCameraParams : int;
         nErrParams : int;
         visibility : access opencv2_core_core_hpp.Class_Mat.Mat;
         P0 : access opencv2_core_core_hpp.Class_Mat.Mat;
         X : access opencv2_core_core_hpp.Class_Mat.Mat;
         criteria : opencv2_core_core_hpp.Class_TermCriteria.TermCriteria;
         fjac : access procedure
           (arg1 : int;
            arg2 : int;
            arg3 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg4 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg5 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg6 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg7 : System.Address);
         func : access procedure
           (arg1 : int;
            arg2 : int;
            arg3 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg4 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg5 : access opencv2_core_core_hpp.Class_Mat.Mat;
            arg6 : System.Address);
         data : System.Address);  -- /usr/include/opencv2/contrib/contrib.hpp:464
      pragma Import (CPP, run, "_ZN2cv13LevMarqSparse3runEiiiiiRNS_3MatES2_S2_NS_12TermCriteriaEPFviiS2_S2_S2_S2_PvEPFviiS2_S2_S2_S4_ES4_");

      procedure clear (this : access LevMarqSparse);  -- /usr/include/opencv2/contrib/contrib.hpp:485
      pragma Import (CPP, clear, "_ZN2cv13LevMarqSparse5clearEv");

      procedure bundleAdjust
        (points : System.Address;
         imagePoints : System.Address;
         visibility : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         cameraMatrix : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         R : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         T : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         distCoeffs : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         criteria : access constant opencv2_core_core_hpp.Class_TermCriteria.TermCriteria;
         cb : BundleAdjustCallback;
         user_data : System.Address);  -- /usr/include/opencv2/contrib/contrib.hpp:488
      pragma Import (CPP, bundleAdjust, "_ZN2cv13LevMarqSparse12bundleAdjustERSt6vectorINS_7Point3_IdEESaIS3_EERKS1_IS1_INS_6Point_IdEESaIS8_EESaISA_EERKS1_IS1_IiSaIiEESaISG_EERS1_INS_3MatESaISL_EESO_SO_SO_RKNS_12TermCriteriaEPFbidPvESS_");

      procedure optimize (this : access LevMarqSparse; u_vis : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/contrib/contrib.hpp:500
      pragma Import (CPP, optimize, "_ZN2cv13LevMarqSparse8optimizeER5CvMat");

      procedure ask_for_proj
        (this : access LevMarqSparse'Class;
         u_vis : access opencv2_core_types_c_h.CvMat;
         once : Extensions.bool);  -- /usr/include/opencv2/contrib/contrib.hpp:503
      pragma Import (CPP, ask_for_proj, "_ZN2cv13LevMarqSparse12ask_for_projER5CvMatb");

      procedure ask_for_projac (this : access LevMarqSparse'Class; u_vis : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/contrib/contrib.hpp:505
      pragma Import (CPP, ask_for_projac, "_ZN2cv13LevMarqSparse14ask_for_projacER5CvMat");
   end;
   use Class_LevMarqSparse;
   function chamerMatching
     (img : access opencv2_core_core_hpp.Class_Mat.Mat;
      templ : access opencv2_core_core_hpp.Class_Mat.Mat;
      results : System.Address;
      cost : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      templScale : double;
      maxMatches : int;
      minMatchDistance : double;
      padX : int;
      padY : int;
      scales : int;
      minScale : double;
      maxScale : double;
      orientationWeight : double;
      truncate : double) return int;  -- /usr/include/opencv2/contrib/contrib.hpp:559
   pragma Import (CPP, chamerMatching, "_ZN2cv14chamerMatchingERNS_3MatES1_RSt6vectorIS2_INS_6Point_IiEESaIS4_EESaIS6_EERS2_IfSaIfEEdidiiidddd");

   package Class_StereoVar is
      type StereoVar is tagged limited record
         levels : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:587
         pyrScale : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:588
         nIt : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:589
         minDisp : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:590
         maxDisp : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:591
         poly_n : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:592
         poly_sigma : aliased double;  -- /usr/include/opencv2/contrib/contrib.hpp:593
         fi : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:594
         lambda : aliased float;  -- /usr/include/opencv2/contrib/contrib.hpp:595
         penalization : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:596
         cycle : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:597
         flags : aliased int;  -- /usr/include/opencv2/contrib/contrib.hpp:598
      end record;
      pragma Import (CPP, StereoVar);

      function New_StereoVar return StereoVar;  -- /usr/include/opencv2/contrib/contrib.hpp:576
      pragma CPP_Constructor (New_StereoVar, "_ZN2cv9StereoVarC1Ev");

      function New_StereoVar
        (levels : int;
         pyrScale : double;
         nIt : int;
         minDisp : int;
         maxDisp : int;
         poly_n : int;
         poly_sigma : double;
         fi : float;
         lambda : float;
         penalization : int;
         cycle : int;
         flags : int) return StereoVar;  -- /usr/include/opencv2/contrib/contrib.hpp:579
      pragma CPP_Constructor (New_StereoVar, "_ZN2cv9StereoVarC1Eidiiiidffiii");

      procedure Delete_StereoVar (this : access StereoVar);  -- /usr/include/opencv2/contrib/contrib.hpp:582
      pragma Import (CPP, Delete_StereoVar, "_ZN2cv9StereoVarD1Ev");

      procedure deleting_dtor (this : access StereoVar);  -- /usr/include/opencv2/contrib/contrib.hpp:582
      pragma Import (CPP, deleting_dtor, "_ZN2cv9StereoVarD0Ev");

      procedure operator_op
        (this : access StereoVar;
         left : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         right : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         disp : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/contrib/contrib.hpp:585
      pragma Import (CPP, operator_op, "_ZN2cv9StereoVarclERKNS_3MatES3_RS1_");

      procedure autoParams (this : access StereoVar'Class);  -- /usr/include/opencv2/contrib/contrib.hpp:601
      pragma Import (CPP, autoParams, "_ZN2cv9StereoVar10autoParamsEv");

      procedure FMG
        (this : access StereoVar'Class;
         I1 : access opencv2_core_core_hpp.Class_Mat.Mat;
         I2 : access opencv2_core_core_hpp.Class_Mat.Mat;
         I2x : access opencv2_core_core_hpp.Class_Mat.Mat;
         u : access opencv2_core_core_hpp.Class_Mat.Mat;
         level : int);  -- /usr/include/opencv2/contrib/contrib.hpp:602
      pragma Import (CPP, FMG, "_ZN2cv9StereoVar3FMGERNS_3MatES2_S2_S2_i");

      procedure VCycle_MyFAS
        (this : access StereoVar'Class;
         I1_h : access opencv2_core_core_hpp.Class_Mat.Mat;
         I2_h : access opencv2_core_core_hpp.Class_Mat.Mat;
         I2x_h : access opencv2_core_core_hpp.Class_Mat.Mat;
         u_h : access opencv2_core_core_hpp.Class_Mat.Mat;
         level : int);  -- /usr/include/opencv2/contrib/contrib.hpp:603
      pragma Import (CPP, VCycle_MyFAS, "_ZN2cv9StereoVar12VCycle_MyFASERNS_3MatES2_S2_S2_i");

      procedure VariationalSolver
        (this : access StereoVar'Class;
         I1_h : access opencv2_core_core_hpp.Class_Mat.Mat;
         I2_h : access opencv2_core_core_hpp.Class_Mat.Mat;
         I2x_h : access opencv2_core_core_hpp.Class_Mat.Mat;
         u_h : access opencv2_core_core_hpp.Class_Mat.Mat;
         level : int);  -- /usr/include/opencv2/contrib/contrib.hpp:604
      pragma Import (CPP, VariationalSolver, "_ZN2cv9StereoVar17VariationalSolverERNS_3MatES2_S2_S2_i");
   end;
   use Class_StereoVar;
   procedure polyfit
     (srcx : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      srcy : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      dst : access opencv2_core_core_hpp.Class_Mat.Mat;
      order : int);  -- /usr/include/opencv2/contrib/contrib.hpp:607
   pragma Import (CPP, polyfit, "_ZN2cv7polyfitERKNS_3MatES2_RS0_i");

end opencv2_contrib_contrib_hpp;
