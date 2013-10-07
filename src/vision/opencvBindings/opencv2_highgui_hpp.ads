pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with opencv2_core_cvstd_hpp;
with opencv2_core_mat_hpp;
with Interfaces.C.Strings;
with opencv2_core_types_hpp;
with Interfaces.C.Extensions;
limited with cpp_4_7_4_bits_stl_vector_h;

package opencv2_highgui_hpp is

   type MouseCallback is access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address);
   pragma Convention (C, MouseCallback);  -- /usr/local/include/opencv2/highgui.hpp:111

   type TrackbarCallback is access procedure (arg1 : int; arg2 : System.Address);
   pragma Convention (C, TrackbarCallback);  -- /usr/local/include/opencv2/highgui.hpp:112

   type OpenGlDrawCallback is access procedure (arg1 : System.Address);
   pragma Convention (C, OpenGlDrawCallback);  -- /usr/local/include/opencv2/highgui.hpp:113

   type ButtonCallback is access procedure (arg1 : int; arg2 : System.Address);
   pragma Convention (C, ButtonCallback);  -- /usr/local/include/opencv2/highgui.hpp:114

   procedure namedWindow (winname : access constant opencv2_core_cvstd_hpp.Class_String.String; flags : int);  -- /usr/local/include/opencv2/highgui.hpp:117
   pragma Import (CPP, namedWindow, "_ZN2cv11namedWindowERKNS_6StringEi");

   procedure destroyWindow (winname : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/highgui.hpp:119
   pragma Import (CPP, destroyWindow, "_ZN2cv13destroyWindowERKNS_6StringE");

   procedure destroyAllWindows;  -- /usr/local/include/opencv2/highgui.hpp:121
   pragma Import (CPP, destroyAllWindows, "_ZN2cv17destroyAllWindowsEv");

   function startWindowThread return int;  -- /usr/local/include/opencv2/highgui.hpp:123
   pragma Import (CPP, startWindowThread, "_ZN2cv17startWindowThreadEv");

   function waitKey (c_delay : int) return int;  -- /usr/local/include/opencv2/highgui.hpp:125
   pragma Import (CPP, waitKey, "_ZN2cv7waitKeyEi");

   procedure imshow (winname : access constant opencv2_core_cvstd_hpp.Class_String.String; mat : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/highgui.hpp:127
   pragma Import (CPP, imshow, "_ZN2cv6imshowERKNS_6StringERKNS_11_InputArrayE");

   procedure resizeWindow
     (winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      width : int;
      height : int);  -- /usr/local/include/opencv2/highgui.hpp:129
   pragma Import (CPP, resizeWindow, "_ZN2cv12resizeWindowERKNS_6StringEii");

   procedure moveWindow
     (winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      x : int;
      y : int);  -- /usr/local/include/opencv2/highgui.hpp:131
   pragma Import (CPP, moveWindow, "_ZN2cv10moveWindowERKNS_6StringEii");

   procedure setWindowProperty
     (winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      prop_id : int;
      prop_value : double);  -- /usr/local/include/opencv2/highgui.hpp:133
   pragma Import (CPP, setWindowProperty, "_ZN2cv17setWindowPropertyERKNS_6StringEid");

   function getWindowProperty (winname : access constant opencv2_core_cvstd_hpp.Class_String.String; prop_id : int) return double;  -- /usr/local/include/opencv2/highgui.hpp:135
   pragma Import (CPP, getWindowProperty, "_ZN2cv17getWindowPropertyERKNS_6StringEi");

   procedure setMouseCallback
     (winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      onMouse : MouseCallback;
      userdata : System.Address);  -- /usr/local/include/opencv2/highgui.hpp:138
   pragma Import (CPP, setMouseCallback, "_ZN2cv16setMouseCallbackERKNS_6StringEPFviiiiPvES3_");

   function createTrackbar
     (trackbarname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      value : access int;
      count : int;
      onChange : TrackbarCallback;
      userdata : System.Address) return int;  -- /usr/local/include/opencv2/highgui.hpp:140
   pragma Import (CPP, createTrackbar, "_ZN2cv14createTrackbarERKNS_6StringES2_PiiPFviPvES4_");

   function getTrackbarPos (trackbarname : access constant opencv2_core_cvstd_hpp.Class_String.String; winname : access constant opencv2_core_cvstd_hpp.Class_String.String) return int;  -- /usr/local/include/opencv2/highgui.hpp:145
   pragma Import (CPP, getTrackbarPos, "_ZN2cv14getTrackbarPosERKNS_6StringES2_");

   procedure setTrackbarPos
     (trackbarname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      pos : int);  -- /usr/local/include/opencv2/highgui.hpp:147
   pragma Import (CPP, setTrackbarPos, "_ZN2cv14setTrackbarPosERKNS_6StringES2_i");

   procedure imshow (winname : access constant opencv2_core_cvstd_hpp.Class_String.String; tex : System.Address);  -- /usr/local/include/opencv2/highgui.hpp:151
   pragma Import (CPP, imshow, "_ZN2cv6imshowERKNS_6StringERKNS_3ogl9Texture2DE");

   procedure setOpenGlDrawCallback
     (winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      onOpenGlDraw : OpenGlDrawCallback;
      userdata : System.Address);  -- /usr/local/include/opencv2/highgui.hpp:153
   pragma Import (CPP, setOpenGlDrawCallback, "_ZN2cv21setOpenGlDrawCallbackERKNS_6StringEPFvPvES3_");

   procedure setOpenGlContext (winname : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/highgui.hpp:155
   pragma Import (CPP, setOpenGlContext, "_ZN2cv16setOpenGlContextERKNS_6StringE");

   procedure updateWindow (winname : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/highgui.hpp:157
   pragma Import (CPP, updateWindow, "_ZN2cv12updateWindowERKNS_6StringE");

   type QtFont is record
      nameFont : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/opencv2/highgui.hpp:164
      color : aliased opencv2_core_types_hpp.Class_Scalar.Scalar;  -- /usr/local/include/opencv2/highgui.hpp:165
      font_face : aliased int;  -- /usr/local/include/opencv2/highgui.hpp:166
      ascii : access int;  -- /usr/local/include/opencv2/highgui.hpp:167
      greek : access int;  -- /usr/local/include/opencv2/highgui.hpp:168
      cyrillic : access int;  -- /usr/local/include/opencv2/highgui.hpp:169
      hscale : aliased float;  -- /usr/local/include/opencv2/highgui.hpp:170
      vscale : aliased float;  -- /usr/local/include/opencv2/highgui.hpp:170
      shear : aliased float;  -- /usr/local/include/opencv2/highgui.hpp:171
      thickness : aliased int;  -- /usr/local/include/opencv2/highgui.hpp:172
      dx : aliased float;  -- /usr/local/include/opencv2/highgui.hpp:173
      line_type : aliased int;  -- /usr/local/include/opencv2/highgui.hpp:174
   end record;
   pragma Convention (C_Pass_By_Copy, QtFont);  -- /usr/local/include/opencv2/highgui.hpp:162

   function fontQt
     (nameFont : access constant opencv2_core_cvstd_hpp.Class_String.String;
      pointSize : int;
      color : opencv2_core_types_hpp.Class_Scalar.Scalar;
      weight : int;
      style : int;
      spacing : int) return QtFont;  -- /usr/local/include/opencv2/highgui.hpp:177
   pragma Import (CPP, fontQt, "_ZN2cv6fontQtERKNS_6StringEiNS_7Scalar_IdEEiii");

   procedure addText
     (img : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      text : access constant opencv2_core_cvstd_hpp.Class_String.String;
      org : opencv2_core_types_hpp.Class_Point.Point;
      font : access constant QtFont);  -- /usr/local/include/opencv2/highgui.hpp:181
   pragma Import (CPP, addText, "_ZN2cv7addTextERKNS_3MatERKNS_6StringENS_6Point_IiEERKNS_6QtFontE");

   procedure displayOverlay
     (winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      text : access constant opencv2_core_cvstd_hpp.Class_String.String;
      delayms : int);  -- /usr/local/include/opencv2/highgui.hpp:183
   pragma Import (CPP, displayOverlay, "_ZN2cv14displayOverlayERKNS_6StringES2_i");

   procedure displayStatusBar
     (winname : access constant opencv2_core_cvstd_hpp.Class_String.String;
      text : access constant opencv2_core_cvstd_hpp.Class_String.String;
      delayms : int);  -- /usr/local/include/opencv2/highgui.hpp:185
   pragma Import (CPP, displayStatusBar, "_ZN2cv16displayStatusBarERKNS_6StringES2_i");

   procedure saveWindowParameters (windowName : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/highgui.hpp:187
   pragma Import (CPP, saveWindowParameters, "_ZN2cv20saveWindowParametersERKNS_6StringE");

   procedure loadWindowParameters (windowName : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/highgui.hpp:189
   pragma Import (CPP, loadWindowParameters, "_ZN2cv20loadWindowParametersERKNS_6StringE");

   function startLoop
     (pt2Func : access function (arg1 : int; arg2 : System.Address) return int;
      argc : int;
      argv : System.Address) return int;  -- /usr/local/include/opencv2/highgui.hpp:191
   pragma Import (CPP, startLoop, "_ZN2cv9startLoopEPFiiPPcEiS1_");

   procedure stopLoop;  -- /usr/local/include/opencv2/highgui.hpp:193
   pragma Import (CPP, stopLoop, "_ZN2cv8stopLoopEv");

   function createButton
     (bar_name : access constant opencv2_core_cvstd_hpp.Class_String.String;
      on_change : ButtonCallback;
      userdata : System.Address;
      c_type : int;
      initial_button_state : Extensions.bool) return int;  -- /usr/local/include/opencv2/highgui.hpp:195
   pragma Import (CPP, createButton, "_ZN2cv12createButtonERKNS_6StringEPFviPvES3_ib");

   function imread (filename : access constant opencv2_core_cvstd_hpp.Class_String.String; flags : int) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/highgui.hpp:229
   pragma Import (CPP, imread, "_ZN2cv6imreadERKNS_6StringEi");

   function imwrite
     (filename : access constant opencv2_core_cvstd_hpp.Class_String.String;
      img : opencv2_core_mat_hpp.InputArray'Class;
      params : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:231
   pragma Import (CPP, imwrite, "_ZN2cv7imwriteERKNS_6StringERKNS_11_InputArrayERKSt6vectorIiSaIiEE");

   function imdecode (buf : opencv2_core_mat_hpp.InputArray'Class; flags : int) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/highgui.hpp:234
   pragma Import (CPP, imdecode, "_ZN2cv8imdecodeERKNS_11_InputArrayEi");

   function imdecode
     (buf : opencv2_core_mat_hpp.InputArray'Class;
      flags : int;
      dst : access opencv2_core_mat_hpp.Class_Mat.Mat) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/highgui.hpp:236
   pragma Import (CPP, imdecode, "_ZN2cv8imdecodeERKNS_11_InputArrayEiPNS_3MatE");

   function imencode
     (ext : access constant opencv2_core_cvstd_hpp.Class_String.String;
      img : opencv2_core_mat_hpp.InputArray'Class;
      buf : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      params : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:238
   pragma Import (CPP, imencode, "_ZN2cv8imencodeERKNS_6StringERKNS_11_InputArrayERSt6vectorIhSaIhEERKS6_IiSaIiEE");

   --  skipped empty struct CvCapture

   --  skipped empty struct CvVideoWriter

   package Class_VideoCapture is
      type VideoCapture is tagged limited record
         cap : aliased opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/highgui.hpp:522
      end record;
      pragma Import (CPP, VideoCapture);

      function New_VideoCapture return VideoCapture;  -- /usr/local/include/opencv2/highgui.hpp:503
      pragma CPP_Constructor (New_VideoCapture, "_ZN2cv12VideoCaptureC1Ev");

      function New_VideoCapture (filename : access constant opencv2_core_cvstd_hpp.Class_String.String) return VideoCapture;  -- /usr/local/include/opencv2/highgui.hpp:504
      pragma CPP_Constructor (New_VideoCapture, "_ZN2cv12VideoCaptureC1ERKNS_6StringE");

      function New_VideoCapture (device : int) return VideoCapture;  -- /usr/local/include/opencv2/highgui.hpp:505
      pragma CPP_Constructor (New_VideoCapture, "_ZN2cv12VideoCaptureC1Ei");

      procedure Delete_VideoCapture (this : access VideoCapture);  -- /usr/local/include/opencv2/highgui.hpp:507
      pragma Import (CPP, Delete_VideoCapture, "_ZN2cv12VideoCaptureD1Ev");

      procedure deleting_dtor (this : access VideoCapture);  -- /usr/local/include/opencv2/highgui.hpp:507
      pragma Import (CPP, deleting_dtor, "_ZN2cv12VideoCaptureD0Ev");

      function open (this : access VideoCapture; filename : access constant opencv2_core_cvstd_hpp.Class_String.String) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:508
      pragma Import (CPP, open, "_ZN2cv12VideoCapture4openERKNS_6StringE");

      function open (this : access VideoCapture; device : int) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:509
      pragma Import (CPP, open, "_ZN2cv12VideoCapture4openEi");

      function isOpened (this : access constant VideoCapture) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:510
      pragma Import (CPP, isOpened, "_ZNK2cv12VideoCapture8isOpenedEv");

      procedure release (this : access VideoCapture);  -- /usr/local/include/opencv2/highgui.hpp:511
      pragma Import (CPP, release, "_ZN2cv12VideoCapture7releaseEv");

      function grab (this : access VideoCapture) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:513
      pragma Import (CPP, grab, "_ZN2cv12VideoCapture4grabEv");

      function retrieve
        (this : access VideoCapture;
         image : access opencv2_core_mat_hpp.Class_Mat.Mat;
         flag : int) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:514
      pragma Import (CPP, retrieve, "_ZN2cv12VideoCapture8retrieveERNS_3MatEi");

      function operator_sr (this : access VideoCapture; image : access opencv2_core_mat_hpp.Class_Mat.Mat) return access VideoCapture;  -- /usr/local/include/opencv2/highgui.hpp:515
      pragma Import (CPP, operator_sr, "_ZN2cv12VideoCapturersERNS_3MatE");

      function read (this : access VideoCapture; image : access opencv2_core_mat_hpp.Class_Mat.Mat) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:516
      pragma Import (CPP, read, "_ZN2cv12VideoCapture4readERNS_3MatE");

      function set
        (this : access VideoCapture;
         propId : int;
         value : double) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:518
      pragma Import (CPP, set, "_ZN2cv12VideoCapture3setEid");

      function get (this : access VideoCapture; propId : int) return double;  -- /usr/local/include/opencv2/highgui.hpp:519
      pragma Import (CPP, get, "_ZN2cv12VideoCapture3getEi");
   end;
   use Class_VideoCapture;
   package Class_VideoWriter is
      type VideoWriter is tagged limited record
         writer : aliased opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/highgui.hpp:544
      end record;
      pragma Import (CPP, VideoWriter);

      function New_VideoWriter return VideoWriter;  -- /usr/local/include/opencv2/highgui.hpp:529
      pragma CPP_Constructor (New_VideoWriter, "_ZN2cv11VideoWriterC1Ev");

      function New_VideoWriter
        (filename : access constant opencv2_core_cvstd_hpp.Class_String.String;
         fourcc : int;
         fps : double;
         frameSize : opencv2_core_types_hpp.Class_Size.Size;
         isColor : Extensions.bool) return VideoWriter;  -- /usr/local/include/opencv2/highgui.hpp:530
      pragma CPP_Constructor (New_VideoWriter, "_ZN2cv11VideoWriterC1ERKNS_6StringEidNS_5Size_IiEEb");

      procedure Delete_VideoWriter (this : access VideoWriter);  -- /usr/local/include/opencv2/highgui.hpp:533
      pragma Import (CPP, Delete_VideoWriter, "_ZN2cv11VideoWriterD1Ev");

      procedure deleting_dtor (this : access VideoWriter);  -- /usr/local/include/opencv2/highgui.hpp:533
      pragma Import (CPP, deleting_dtor, "_ZN2cv11VideoWriterD0Ev");

      function open
        (this : access VideoWriter;
         filename : access constant opencv2_core_cvstd_hpp.Class_String.String;
         fourcc : int;
         fps : double;
         frameSize : opencv2_core_types_hpp.Class_Size.Size;
         isColor : Extensions.bool) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:534
      pragma Import (CPP, open, "_ZN2cv11VideoWriter4openERKNS_6StringEidNS_5Size_IiEEb");

      function isOpened (this : access constant VideoWriter) return Extensions.bool;  -- /usr/local/include/opencv2/highgui.hpp:536
      pragma Import (CPP, isOpened, "_ZNK2cv11VideoWriter8isOpenedEv");

      procedure release (this : access VideoWriter);  -- /usr/local/include/opencv2/highgui.hpp:537
      pragma Import (CPP, release, "_ZN2cv11VideoWriter7releaseEv");

      function operator_sl (this : access VideoWriter; image : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access VideoWriter;  -- /usr/local/include/opencv2/highgui.hpp:538
      pragma Import (CPP, operator_sl, "_ZN2cv11VideoWriterlsERKNS_3MatE");

      procedure write (this : access VideoWriter; image : access constant opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/highgui.hpp:539
      pragma Import (CPP, write, "_ZN2cv11VideoWriter5writeERKNS_3MatE");

      function fourcc
        (c1 : char;
         c2 : char;
         c3 : char;
         c4 : char) return int;  -- /usr/local/include/opencv2/highgui.hpp:541
      pragma Import (CPP, fourcc, "_ZN2cv11VideoWriter6fourccEcccc");
   end;
   use Class_VideoWriter;
end opencv2_highgui_hpp;
