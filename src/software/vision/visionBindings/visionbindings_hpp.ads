pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package visionBindings_hpp is


   IMAGE_BUFFER_SIZE : constant := 10;  --  visionBindings.hpp:6

   package Class_Core_Wrap is
      type Core_Wrap is tagged limited record
         null;
      end record;
      pragma Import (CPP, Core_Wrap);

      procedure push_back (this : access Core_Wrap; src : Interfaces.C.Strings.chars_ptr);  -- visionBindings.hpp:11
      pragma Import (CPP, push_back, "_ZN9Core_Wrap9push_backEPc");

      procedure imread (this : access Core_Wrap; name : Interfaces.C.Strings.chars_ptr);  -- visionBindings.hpp:13
      pragma Import (CPP, imread, "_ZN9Core_Wrap6imreadEPc");

      function imwrite
        (this : access Core_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         src : int) return int;  -- visionBindings.hpp:15
      pragma Import (CPP, imwrite, "_ZN9Core_Wrap7imwriteEPci");

      procedure imshow
        (this : access Core_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         src : int);  -- visionBindings.hpp:17
      pragma Import (CPP, imshow, "_ZN9Core_Wrap6imshowEPci");

      procedure waitKey (this : access Core_Wrap; time : int);  -- visionBindings.hpp:19
      pragma Import (CPP, waitKey, "_ZN9Core_Wrap7waitKeyEi");

      function size (this : access Core_Wrap) return int;  -- visionBindings.hpp:21
      pragma Import (CPP, size, "_ZN9Core_Wrap4sizeEv");

      procedure test_func (this : access Core_Wrap);  -- visionBindings.hpp:23
      pragma Import (CPP, test_func, "_ZN9Core_Wrap9test_funcEv");

      function New_Core_Wrap return Core_Wrap;  -- visionBindings.hpp:25
      pragma CPP_Constructor (New_Core_Wrap, "_ZN9Core_WrapC1Ev");


   end;
   use Class_Core_Wrap;
   package Class_Processing_Wrap is
      type Processing_Wrap is tagged limited record
         null;
      end record;
      pragma Import (CPP, Processing_Wrap);

      procedure cvtColor
        (this : access Processing_Wrap;
         src : int;
         dst : int;
         filter : int);  -- visionBindings.hpp:31
      pragma Import (CPP, cvtColor, "_ZN15Processing_Wrap8cvtColorEiii");

      procedure Canny
        (this : access Processing_Wrap;
         src : int;
         dst : int;
         lThresh : int;
         hThresh : int;
         kernelSize : int);  -- visionBindings.hpp:33
      pragma Import (CPP, Canny, "_ZN15Processing_Wrap5CannyEiiiii");

      procedure HoughCircles
        (this : access Processing_Wrap;
         src : int;
         inverseRatioOfResolution : int;
         minDistBetweenCenters : int;
         cannyUpThres : int;
         centerDetectionThreshold : int;
         minRadius : int;
         maxRadius : int);  -- visionBindings.hpp:36
      pragma Import (CPP, HoughCircles, "_ZN15Processing_Wrap12HoughCirclesEiiiiiii");

      procedure DrawHoughCircles (this : access Processing_Wrap; src : int);  -- visionBindings.hpp:37
      pragma Import (CPP, DrawHoughCircles, "_ZN15Processing_Wrap16DrawHoughCirclesEi");

      procedure HoughLines
        (this : access Processing_Wrap;
         src : int;
         rho : int;
         theta : float;
         intersectionThreshold : int);  -- visionBindings.hpp:40
      pragma Import (CPP, HoughLines, "_ZN15Processing_Wrap10HoughLinesEiifi");

      procedure DrawHoughLines (this : access Processing_Wrap; cdst : int);  -- visionBindings.hpp:41
      pragma Import (CPP, DrawHoughLines, "_ZN15Processing_Wrap14DrawHoughLinesEi");

      procedure Contours (this : access Processing_Wrap; src : int);  -- visionBindings.hpp:44
      pragma Import (CPP, Contours, "_ZN15Processing_Wrap8ContoursEi");

      procedure showContours
        (this : access Processing_Wrap;
         contourOut : int;
         contourId : int;
         thickness : int);  -- visionBindings.hpp:45
      pragma Import (CPP, showContours, "_ZN15Processing_Wrap12showContoursEiii");

      procedure splitChannels (this : access Processing_Wrap; src : int);  -- visionBindings.hpp:48
      pragma Import (CPP, splitChannels, "_ZN15Processing_Wrap13splitChannelsEi");

      procedure showBlueChannel (this : access Processing_Wrap);  -- visionBindings.hpp:49
      pragma Import (CPP, showBlueChannel, "_ZN15Processing_Wrap15showBlueChannelEv");

      procedure showGreenChannel (this : access Processing_Wrap);  -- visionBindings.hpp:50
      pragma Import (CPP, showGreenChannel, "_ZN15Processing_Wrap16showGreenChannelEv");

      procedure showRedChannel (this : access Processing_Wrap);  -- visionBindings.hpp:51
      pragma Import (CPP, showRedChannel, "_ZN15Processing_Wrap14showRedChannelEv");

      procedure LabelPoints (this : access Processing_Wrap; src : int);  -- visionBindings.hpp:53
      pragma Import (CPP, LabelPoints, "_ZN15Processing_Wrap11LabelPointsEi");

      function New_Processing_Wrap return Processing_Wrap;  -- visionBindings.hpp:55
      pragma CPP_Constructor (New_Processing_Wrap, "_ZN15Processing_WrapC1Ev");


   end;
   use Class_Processing_Wrap;
   package Class_Preprocessing_Wrap is
      type Preprocessing_Wrap is tagged limited record
         null;
      end record;
      pragma Import (CPP, Preprocessing_Wrap);

      procedure VideoCaptureOpen (this : access Preprocessing_Wrap);  -- visionBindings.hpp:62
      pragma Import (CPP, VideoCaptureOpen, "_ZN18Preprocessing_Wrap16VideoCaptureOpenEv");

      procedure namedWindow
        (this : access Preprocessing_Wrap;
         name : Interfaces.C.Strings.chars_ptr;
         num : int);  -- visionBindings.hpp:64
      pragma Import (CPP, namedWindow, "_ZN18Preprocessing_Wrap11namedWindowEPci");

      procedure nextFrame (this : access Preprocessing_Wrap; dst : int);  -- visionBindings.hpp:66
      pragma Import (CPP, nextFrame, "_ZN18Preprocessing_Wrap9nextFrameEi");

      function New_Preprocessing_Wrap return Preprocessing_Wrap;  -- visionBindings.hpp:68
      pragma CPP_Constructor (New_Preprocessing_Wrap, "_ZN18Preprocessing_WrapC1Ev");


   end;
   use Class_Preprocessing_Wrap;
end visionBindings_hpp;
