pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with cpp_4_7_4_bits_stringfwd_h;
with opencv2_core_core_hpp;
with opencv2_core_core_c_h;
with System;
with opencv2_highgui_highgui_c_h;
with Interfaces.C.Extensions;
limited with cpp_4_7_4_bits_stl_vector_h;

package opencv2_highgui_highgui_hpp is

   procedure namedWindow (winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string; flags : int);  -- /usr/include/opencv2/highgui/highgui.hpp:59
   pragma Import (CPP, namedWindow, "_ZN2cv11namedWindowERKSsi");

   procedure destroyWindow (winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/highgui/highgui.hpp:60
   pragma Import (CPP, destroyWindow, "_ZN2cv13destroyWindowERKSs");

   procedure destroyAllWindows;  -- /usr/include/opencv2/highgui/highgui.hpp:61
   pragma Import (CPP, destroyAllWindows, "_ZN2cv17destroyAllWindowsEv");

   function startWindowThread return int;  -- /usr/include/opencv2/highgui/highgui.hpp:62
   pragma Import (CPP, startWindowThread, "_ZN2cv17startWindowThreadEv");

   procedure setWindowProperty
     (winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      prop_id : int;
      prop_value : double);  -- /usr/include/opencv2/highgui/highgui.hpp:64
   pragma Import (CPP, setWindowProperty, "_ZN2cv17setWindowPropertyERKSsid");

   function getWindowProperty (winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string; prop_id : int) return double;  -- /usr/include/opencv2/highgui/highgui.hpp:65
   pragma Import (CPP, getWindowProperty, "_ZN2cv17getWindowPropertyERKSsi");

   function fontQt
     (nameFont : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      pointSize : int;
      color : opencv2_core_core_hpp.Class_Scalar.Scalar;
      weight : int;
      style : int;
      spacing : int) return opencv2_core_core_c_h.CvFont;  -- /usr/include/opencv2/highgui/highgui.hpp:70
   pragma Import (CPP, fontQt, "_ZN2cv6fontQtERKSsiNS_7Scalar_IdEEiii");

   procedure addText
     (img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      text : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      org : opencv2_core_core_hpp.Class_Point.Point;
      font : opencv2_core_core_c_h.CvFont);  -- /usr/include/opencv2/highgui/highgui.hpp:73
   pragma Import (CPP, addText, "_ZN2cv7addTextERKNS_3MatERKSsNS_6Point_IiEE6CvFont");

   procedure displayOverlay
     (winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      text : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      delayms : int);  -- /usr/include/opencv2/highgui/highgui.hpp:75
   pragma Import (CPP, displayOverlay, "_ZN2cv14displayOverlayERKSsS1_i");

   procedure displayStatusBar
     (winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      text : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      delayms : int);  -- /usr/include/opencv2/highgui/highgui.hpp:76
   pragma Import (CPP, displayStatusBar, "_ZN2cv16displayStatusBarERKSsS1_i");

   type OpenGLCallback is access procedure (arg1 : System.Address);
   pragma Convention (C, OpenGLCallback);  -- /usr/include/opencv2/highgui/highgui.hpp:78

   procedure createOpenGLCallback
     (winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      callbackOpenGL : opencv2_highgui_highgui_c_h.CvOpenGLCallback;
      userdata : System.Address);  -- /usr/include/opencv2/highgui/highgui.hpp:79
   pragma Import (CPP, createOpenGLCallback, "_ZN2cv20createOpenGLCallbackERKSsPFvPvES2_");

   procedure saveWindowParameters (windowName : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/highgui/highgui.hpp:81
   pragma Import (CPP, saveWindowParameters, "_ZN2cv20saveWindowParametersERKSs");

   procedure loadWindowParameters (windowName : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/highgui/highgui.hpp:82
   pragma Import (CPP, loadWindowParameters, "_ZN2cv20loadWindowParametersERKSs");

   function startLoop
     (pt2Func : access function (arg1 : int; arg2 : System.Address) return int;
      argc : int;
      argv : System.Address) return int;  -- /usr/include/opencv2/highgui/highgui.hpp:83
   pragma Import (CPP, startLoop, "_ZN2cv9startLoopEPFiiPPcEiS1_");

   procedure stopLoop;  -- /usr/include/opencv2/highgui/highgui.hpp:84
   pragma Import (CPP, stopLoop, "_ZN2cv8stopLoopEv");

   type ButtonCallback is access procedure (arg1 : int; arg2 : System.Address);
   pragma Convention (C, ButtonCallback);  -- /usr/include/opencv2/highgui/highgui.hpp:86

   function createButton
     (bar_name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      on_change : ButtonCallback;
      userdata : System.Address;
      c_type : int;
      initial_button_state : Extensions.bool) return int;  -- /usr/include/opencv2/highgui/highgui.hpp:87
   pragma Import (CPP, createButton, "_ZN2cv12createButtonERKSsPFviPvES2_ib");

   procedure imshow (winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string; mat : opencv2_core_core_hpp.InputArray'Class);  -- /usr/include/opencv2/highgui/highgui.hpp:92
   pragma Import (CPP, imshow, "_ZN2cv6imshowERKSsRKNS_11_InputArrayE");

   type TrackbarCallback is access procedure (arg1 : int; arg2 : System.Address);
   pragma Convention (C, TrackbarCallback);  -- /usr/include/opencv2/highgui/highgui.hpp:94

   function createTrackbar
     (trackbarname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      value : access int;
      count : int;
      onChange : TrackbarCallback;
      userdata : System.Address) return int;  -- /usr/include/opencv2/highgui/highgui.hpp:96
   pragma Import (CPP, createTrackbar, "_ZN2cv14createTrackbarERKSsS1_PiiPFviPvES3_");

   function getTrackbarPos (trackbarname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string; winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return int;  -- /usr/include/opencv2/highgui/highgui.hpp:101
   pragma Import (CPP, getTrackbarPos, "_ZN2cv14getTrackbarPosERKSsS1_");

   procedure setTrackbarPos
     (trackbarname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      winname : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      pos : int);  -- /usr/include/opencv2/highgui/highgui.hpp:102
   pragma Import (CPP, setTrackbarPos, "_ZN2cv14setTrackbarPosERKSsS1_i");

   type MouseCallback is access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address);
   pragma Convention (C, MouseCallback);  -- /usr/include/opencv2/highgui/highgui.hpp:128

   procedure setMouseCallback
     (windowName : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      onMouse : MouseCallback;
      param : System.Address);  -- /usr/include/opencv2/highgui/highgui.hpp:131
   pragma Import (CPP, setMouseCallback, "_ZN2cv16setMouseCallbackERKSsPFviiiiPvES2_");

   function imread (filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string; flags : int) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/highgui/highgui.hpp:133
   pragma Import (CPP, imread, "_ZN2cv6imreadERKSsi");

   function imwrite
     (filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      img : opencv2_core_core_hpp.InputArray'Class;
      params : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:134
   pragma Import (CPP, imwrite, "_ZN2cv7imwriteERKSsRKNS_11_InputArrayERKSt6vectorIiSaIiEE");

   function imdecode (buf : opencv2_core_core_hpp.InputArray'Class; flags : int) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/highgui/highgui.hpp:136
   pragma Import (CPP, imdecode, "_ZN2cv8imdecodeERKNS_11_InputArrayEi");

   function imencode
     (ext : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      img : opencv2_core_core_hpp.InputArray'Class;
      buf : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      params : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:137
   pragma Import (CPP, imencode, "_ZN2cv8imencodeERKSsRKNS_11_InputArrayERSt6vectorIhSaIhEERKS5_IiSaIiEE");

   function waitKey (c_delay : int) return int;  -- /usr/include/opencv2/highgui/highgui.hpp:141
   pragma Import (CPP, waitKey, "_ZN2cv7waitKeyEi");

   package Class_VideoCapture is
      type VideoCapture is tagged limited record
         cap : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/highgui/highgui.hpp:170
      end record;
      pragma Import (CPP, VideoCapture);

      function New_VideoCapture return VideoCapture;  -- /usr/include/opencv2/highgui/highgui.hpp:151
      pragma CPP_Constructor (New_VideoCapture, "_ZN2cv12VideoCaptureC1Ev");

      function New_VideoCapture (filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return VideoCapture;  -- /usr/include/opencv2/highgui/highgui.hpp:152
      pragma CPP_Constructor (New_VideoCapture, "_ZN2cv12VideoCaptureC1ERKSs");

      function New_VideoCapture (device : int) return VideoCapture;  -- /usr/include/opencv2/highgui/highgui.hpp:153
      pragma CPP_Constructor (New_VideoCapture, "_ZN2cv12VideoCaptureC1Ei");

      procedure Delete_VideoCapture (this : access VideoCapture);  -- /usr/include/opencv2/highgui/highgui.hpp:155
      pragma Import (CPP, Delete_VideoCapture, "_ZN2cv12VideoCaptureD1Ev");

      procedure deleting_dtor (this : access VideoCapture);  -- /usr/include/opencv2/highgui/highgui.hpp:155
      pragma Import (CPP, deleting_dtor, "_ZN2cv12VideoCaptureD0Ev");

      function open (this : access VideoCapture; filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:156
      pragma Import (CPP, open, "_ZN2cv12VideoCapture4openERKSs");

      function open (this : access VideoCapture; device : int) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:157
      pragma Import (CPP, open, "_ZN2cv12VideoCapture4openEi");

      function isOpened (this : access constant VideoCapture) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:158
      pragma Import (CPP, isOpened, "_ZNK2cv12VideoCapture8isOpenedEv");

      procedure release (this : access VideoCapture);  -- /usr/include/opencv2/highgui/highgui.hpp:159
      pragma Import (CPP, release, "_ZN2cv12VideoCapture7releaseEv");

      function grab (this : access VideoCapture) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:161
      pragma Import (CPP, grab, "_ZN2cv12VideoCapture4grabEv");

      function retrieve
        (this : access VideoCapture;
         image : access opencv2_core_core_hpp.Class_Mat.Mat;
         channel : int) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:162
      pragma Import (CPP, retrieve, "_ZN2cv12VideoCapture8retrieveERNS_3MatEi");

      function operator_sr (this : access VideoCapture; image : access opencv2_core_core_hpp.Class_Mat.Mat) return access VideoCapture;  -- /usr/include/opencv2/highgui/highgui.hpp:163
      pragma Import (CPP, operator_sr, "_ZN2cv12VideoCapturersERNS_3MatE");

      function read (this : access VideoCapture; image : access opencv2_core_core_hpp.Class_Mat.Mat) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:164
      pragma Import (CPP, read, "_ZN2cv12VideoCapture4readERNS_3MatE");

      function set
        (this : access VideoCapture;
         propId : int;
         value : double) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:166
      pragma Import (CPP, set, "_ZN2cv12VideoCapture3setEid");

      function get (this : access VideoCapture; propId : int) return double;  -- /usr/include/opencv2/highgui/highgui.hpp:167
      pragma Import (CPP, get, "_ZN2cv12VideoCapture3getEi");
   end;
   use Class_VideoCapture;
   package Class_VideoWriter is
      type VideoWriter is tagged limited record
         writer : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/highgui/highgui.hpp:189
      end record;
      pragma Import (CPP, VideoWriter);

      function New_VideoWriter return VideoWriter;  -- /usr/include/opencv2/highgui/highgui.hpp:177
      pragma CPP_Constructor (New_VideoWriter, "_ZN2cv11VideoWriterC1Ev");

      function New_VideoWriter
        (filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         fourcc : int;
         fps : double;
         frameSize : opencv2_core_core_hpp.Class_Size.Size;
         isColor : Extensions.bool) return VideoWriter;  -- /usr/include/opencv2/highgui/highgui.hpp:178
      pragma CPP_Constructor (New_VideoWriter, "_ZN2cv11VideoWriterC1ERKSsidNS_5Size_IiEEb");

      procedure Delete_VideoWriter (this : access VideoWriter);  -- /usr/include/opencv2/highgui/highgui.hpp:181
      pragma Import (CPP, Delete_VideoWriter, "_ZN2cv11VideoWriterD1Ev");

      procedure deleting_dtor (this : access VideoWriter);  -- /usr/include/opencv2/highgui/highgui.hpp:181
      pragma Import (CPP, deleting_dtor, "_ZN2cv11VideoWriterD0Ev");

      function open
        (this : access VideoWriter;
         filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         fourcc : int;
         fps : double;
         frameSize : opencv2_core_core_hpp.Class_Size.Size;
         isColor : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:182
      pragma Import (CPP, open, "_ZN2cv11VideoWriter4openERKSsidNS_5Size_IiEEb");

      function isOpened (this : access constant VideoWriter) return Extensions.bool;  -- /usr/include/opencv2/highgui/highgui.hpp:184
      pragma Import (CPP, isOpened, "_ZNK2cv11VideoWriter8isOpenedEv");

      function operator_sl (this : access VideoWriter; image : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access VideoWriter;  -- /usr/include/opencv2/highgui/highgui.hpp:185
      pragma Import (CPP, operator_sl, "_ZN2cv11VideoWriterlsERKNS_3MatE");

      procedure write (this : access VideoWriter; image : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/highgui/highgui.hpp:186
      pragma Import (CPP, write, "_ZN2cv11VideoWriter5writeERKNS_3MatE");
   end;
   use Class_VideoWriter;
end opencv2_highgui_highgui_hpp;
