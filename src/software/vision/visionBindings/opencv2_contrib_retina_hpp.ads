pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_core_hpp;
with cpp_4_7_4_bits_stringfwd_h;
with cpp_4_7_4_valarray;
with System;
with Interfaces.C.Extensions;

package opencv2_contrib_retina_hpp is

   type RETINA_COLORSAMPLINGMETHOD is 
     (RETINA_COLOR_RANDOM,
      RETINA_COLOR_DIAGONAL,
      RETINA_COLOR_BAYER);
   pragma Convention (C, RETINA_COLORSAMPLINGMETHOD);  -- /usr/include/opencv2/contrib/retina.hpp:81

   --  skipped empty struct RetinaFilter

   package Class_Retina is
      type Retina is tagged limited record
         u_parametersSaveFile : aliased opencv2_core_core_hpp.Class_FileStorage.FileStorage;  -- /usr/include/opencv2/contrib/retina.hpp:195
         u_parametersSaveFileName : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/contrib/retina.hpp:196
         u_inputBuffer : aliased cpp_4_7_4_valarray.Class_valarray.valarray;  -- /usr/include/opencv2/contrib/retina.hpp:199
         u_retinaFilter : System.Address;  -- /usr/include/opencv2/contrib/retina.hpp:202
      end record;
      pragma Import (CPP, Retina);

      function New_Retina (parametersSaveFile : cpp_4_7_4_bits_stringfwd_h.Class_string.string; inputSize : opencv2_core_core_hpp.Class_Size.Size) return Retina;  -- /usr/include/opencv2/contrib/retina.hpp:112
      pragma CPP_Constructor (New_Retina, "_ZN2cv6RetinaC1ESsNS_5Size_IiEE");

      function New_Retina
        (parametersSaveFile : cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         inputSize : opencv2_core_core_hpp.Class_Size.Size;
         colorMode : Extensions.bool;
         colorSamplingMethod : RETINA_COLORSAMPLINGMETHOD;
         useRetinaLogSampling : Extensions.bool;
         reductionFactor : double;
         samplingStrenght : double) return Retina;  -- /usr/include/opencv2/contrib/retina.hpp:123
      pragma CPP_Constructor (New_Retina, "_ZN2cv6RetinaC1ESsNS_5Size_IiEEbNS_26RETINA_COLORSAMPLINGMETHODEbdd");

      procedure Delete_Retina (this : access Retina);  -- /usr/include/opencv2/contrib/retina.hpp:125
      pragma Import (CPP, Delete_Retina, "_ZN2cv6RetinaD1Ev");

      procedure deleting_dtor (this : access Retina);  -- /usr/include/opencv2/contrib/retina.hpp:125
      pragma Import (CPP, deleting_dtor, "_ZN2cv6RetinaD0Ev");

      procedure setup
        (this : access Retina'Class;
         retinaParameterFile : cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         applyDefaultSetupOnFailure : Extensions.bool);  -- /usr/include/opencv2/contrib/retina.hpp:133
      pragma Import (CPP, setup, "_ZN2cv6Retina5setupESsb");

      function printSetup (this : access Retina'Class) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/contrib/retina.hpp:139
      pragma Import (CPP, printSetup, "_ZN2cv6Retina10printSetupEv");

      procedure setupOPLandIPLParvoChannel
        (this : access Retina'Class;
         colorMode : Extensions.bool;
         normaliseOutput : Extensions.bool;
         photoreceptorsLocalAdaptationSensitivity : double;
         photoreceptorsTemporalConstant : double;
         photoreceptorsSpatialConstant : double;
         horizontalCellsGain : double;
         HcellsTemporalConstant : double;
         HcellsSpatialConstant : double;
         ganglionCellsSensitivity : double);  -- /usr/include/opencv2/contrib/retina.hpp:156
      pragma Import (CPP, setupOPLandIPLParvoChannel, "_ZN2cv6Retina26setupOPLandIPLParvoChannelEbbddddddd");

      procedure setupIPLMagnoChannel
        (this : access Retina'Class;
         normaliseOutput : Extensions.bool;
         parasolCells_beta : double;
         parasolCells_tau : double;
         parasolCells_k : double;
         amacrinCellsTemporalCutFrequency : double;
         V0CompressionParameter : double;
         localAdaptintegration_tau : double;
         localAdaptintegration_k : double);  -- /usr/include/opencv2/contrib/retina.hpp:170
      pragma Import (CPP, setupIPLMagnoChannel, "_ZN2cv6Retina20setupIPLMagnoChannelEbddddddd");

      procedure run (this : access Retina'Class; inputImage : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/contrib/retina.hpp:177
      pragma Import (CPP, run, "_ZN2cv6Retina3runERKNS_3MatE");

      procedure getParvo (this : access Retina'Class; retinaOutput_parvo : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/contrib/retina.hpp:182
      pragma Import (CPP, getParvo, "_ZN2cv6Retina8getParvoERNS_3MatE");

      procedure getMagno (this : access Retina'Class; retinaOutput_magno : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/contrib/retina.hpp:188
      pragma Import (CPP, getMagno, "_ZN2cv6Retina8getMagnoERNS_3MatE");

      procedure clearBuffers (this : access Retina'Class);  -- /usr/include/opencv2/contrib/retina.hpp:190
      pragma Import (CPP, clearBuffers, "_ZN2cv6Retina12clearBuffersEv");

      --  skipped func _convertValarrayGrayBuffer2cvMat

      --  skipped func _init
   end;
   use Class_Retina;
end opencv2_contrib_retina_hpp;
