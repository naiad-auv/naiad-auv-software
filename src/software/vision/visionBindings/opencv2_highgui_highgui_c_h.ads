pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with opencv2_core_types_c_h;
with opencv2_core_core_c_h;
with System;

package opencv2_highgui_highgui_c_h is


   CV_FOURCC_PROMPT : constant := -1;  --  /usr/include/opencv2/highgui/highgui_c.h:450
   --  unsupported macro: CV_FOURCC_DEFAULT CV_FOURCC('I', 'Y', 'U', 'V')
   --  unsupported macro: cvCaptureFromFile cvCreateFileCapture
   --  unsupported macro: cvCaptureFromCAM cvCreateCameraCapture
   --  unsupported macro: cvCaptureFromAVI cvCaptureFromFile
   --  unsupported macro: cvCreateAVIWriter cvCreateVideoWriter
   --  unsupported macro: cvWriteToAVI cvWriteFrame
   --  unsupported macro: cvvInitSystem cvInitSystem
   --  unsupported macro: cvvNamedWindow cvNamedWindow
   --  unsupported macro: cvvShowImage cvShowImage
   --  unsupported macro: cvvResizeWindow cvResizeWindow
   --  unsupported macro: cvvDestroyWindow cvDestroyWindow
   --  unsupported macro: cvvCreateTrackbar cvCreateTrackbar
   --  arg-macro: procedure cvvLoadImage (name)
   --    cvLoadImage((name),1)
   --  unsupported macro: cvvSaveImage cvSaveImage
   --  unsupported macro: cvvAddSearchPath cvAddSearchPath
   --  arg-macro: procedure cvvWaitKey (name)
   --    cvWaitKey(0)
   --  arg-macro: procedure cvvWaitKeyEx (name, delay)
   --    cvWaitKey(delay)
   --  unsupported macro: cvvConvertImage cvConvertImage
   --  unsupported macro: HG_AUTOSIZE CV_WINDOW_AUTOSIZE
   --  unsupported macro: set_preprocess_func cvSetPreprocessFuncWin32
   --  unsupported macro: set_postprocess_func cvSetPostprocessFuncWin32

   function cvFontQt
     (nameFont : Interfaces.C.Strings.chars_ptr;
      pointSize : int;
      color : opencv2_core_types_c_h.CvScalar;
      weight : int;
      style : int;
      spacing : int) return opencv2_core_core_c_h.CvFont;  -- /usr/include/opencv2/highgui/highgui_c.h:72
   pragma Import (C, cvFontQt, "cvFontQt");

   procedure cvAddText
     (img : System.Address;
      text : Interfaces.C.Strings.chars_ptr;
      org : opencv2_core_types_c_h.CvPoint;
      arg2 : access opencv2_core_core_c_h.CvFont);  -- /usr/include/opencv2/highgui/highgui_c.h:74
   pragma Import (C, cvAddText, "cvAddText");

   procedure cvDisplayOverlay
     (name : Interfaces.C.Strings.chars_ptr;
      text : Interfaces.C.Strings.chars_ptr;
      delayms : int);  -- /usr/include/opencv2/highgui/highgui_c.h:76
   pragma Import (C, cvDisplayOverlay, "cvDisplayOverlay");

   procedure cvDisplayStatusBar
     (name : Interfaces.C.Strings.chars_ptr;
      text : Interfaces.C.Strings.chars_ptr;
      delayms : int);  -- /usr/include/opencv2/highgui/highgui_c.h:77
   pragma Import (C, cvDisplayStatusBar, "cvDisplayStatusBar");

   type CvOpenGLCallback is access procedure (arg1 : System.Address);
   pragma Convention (C, CvOpenGLCallback);  -- /usr/include/opencv2/highgui/highgui_c.h:79

   procedure cvCreateOpenGLCallback
     (window_name : Interfaces.C.Strings.chars_ptr;
      callbackOpenGL : CvOpenGLCallback;
      userdata : System.Address;
      angle : double;
      zmin : double;
      zmax : double);  -- /usr/include/opencv2/highgui/highgui_c.h:80
   pragma Import (C, cvCreateOpenGLCallback, "cvCreateOpenGLCallback");

   procedure cvSaveWindowParameters (name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/highgui/highgui_c.h:82
   pragma Import (C, cvSaveWindowParameters, "cvSaveWindowParameters");

   procedure cvLoadWindowParameters (name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/highgui/highgui_c.h:83
   pragma Import (C, cvLoadWindowParameters, "cvLoadWindowParameters");

   function cvStartLoop
     (pt2Func : access function (arg1 : int; arg2 : System.Address) return int;
      argc : int;
      argv : System.Address) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:84
   pragma Import (C, cvStartLoop, "cvStartLoop");

   procedure cvStopLoop;  -- /usr/include/opencv2/highgui/highgui_c.h:85
   pragma Import (C, cvStopLoop, "cvStopLoop");

   type CvButtonCallback is access procedure (arg1 : int; arg2 : System.Address);
   pragma Convention (C, CvButtonCallback);  -- /usr/include/opencv2/highgui/highgui_c.h:87

   function cvCreateButton
     (button_name : Interfaces.C.Strings.chars_ptr;
      on_change : CvButtonCallback;
      userdata : System.Address;
      button_type : int;
      initial_button_state : int) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:89
   pragma Import (C, cvCreateButton, "cvCreateButton");

   function cvInitSystem (argc : int; argv : System.Address) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:94
   pragma Import (C, cvInitSystem, "cvInitSystem");

   function cvStartWindowThread return int;  -- /usr/include/opencv2/highgui/highgui_c.h:96
   pragma Import (C, cvStartWindowThread, "cvStartWindowThread");

   function cvNamedWindow (name : Interfaces.C.Strings.chars_ptr; flags : int) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:121
   pragma Import (C, cvNamedWindow, "cvNamedWindow");

   procedure cvSetWindowProperty
     (name : Interfaces.C.Strings.chars_ptr;
      prop_id : int;
      prop_value : double);  -- /usr/include/opencv2/highgui/highgui_c.h:124
   pragma Import (C, cvSetWindowProperty, "cvSetWindowProperty");

   function cvGetWindowProperty (name : Interfaces.C.Strings.chars_ptr; prop_id : int) return double;  -- /usr/include/opencv2/highgui/highgui_c.h:125
   pragma Import (C, cvGetWindowProperty, "cvGetWindowProperty");

   procedure cvShowImage (name : Interfaces.C.Strings.chars_ptr; image : System.Address);  -- /usr/include/opencv2/highgui/highgui_c.h:128
   pragma Import (C, cvShowImage, "cvShowImage");

   procedure cvResizeWindow
     (name : Interfaces.C.Strings.chars_ptr;
      width : int;
      height : int);  -- /usr/include/opencv2/highgui/highgui_c.h:131
   pragma Import (C, cvResizeWindow, "cvResizeWindow");

   procedure cvMoveWindow
     (name : Interfaces.C.Strings.chars_ptr;
      x : int;
      y : int);  -- /usr/include/opencv2/highgui/highgui_c.h:132
   pragma Import (C, cvMoveWindow, "cvMoveWindow");

   procedure cvDestroyWindow (name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/highgui/highgui_c.h:136
   pragma Import (C, cvDestroyWindow, "cvDestroyWindow");

   procedure cvDestroyAllWindows;  -- /usr/include/opencv2/highgui/highgui_c.h:138
   pragma Import (C, cvDestroyAllWindows, "cvDestroyAllWindows");

   function cvGetWindowHandle (name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/include/opencv2/highgui/highgui_c.h:141
   pragma Import (C, cvGetWindowHandle, "cvGetWindowHandle");

   function cvGetWindowName (window_handle : System.Address) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/highgui/highgui_c.h:144
   pragma Import (C, cvGetWindowName, "cvGetWindowName");

   type CvTrackbarCallback is access procedure (arg1 : int);
   pragma Convention (C, CvTrackbarCallback);  -- /usr/include/opencv2/highgui/highgui_c.h:147

   function cvCreateTrackbar
     (trackbar_name : Interfaces.C.Strings.chars_ptr;
      window_name : Interfaces.C.Strings.chars_ptr;
      value : access int;
      count : int;
      on_change : CvTrackbarCallback) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:150
   pragma Import (C, cvCreateTrackbar, "cvCreateTrackbar");

   type CvTrackbarCallback2 is access procedure (arg1 : int; arg2 : System.Address);
   pragma Convention (C, CvTrackbarCallback2);  -- /usr/include/opencv2/highgui/highgui_c.h:153

   function cvCreateTrackbar2
     (trackbar_name : Interfaces.C.Strings.chars_ptr;
      window_name : Interfaces.C.Strings.chars_ptr;
      value : access int;
      count : int;
      on_change : CvTrackbarCallback2;
      userdata : System.Address) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:155
   pragma Import (C, cvCreateTrackbar2, "cvCreateTrackbar2");

   function cvGetTrackbarPos (trackbar_name : Interfaces.C.Strings.chars_ptr; window_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:160
   pragma Import (C, cvGetTrackbarPos, "cvGetTrackbarPos");

   procedure cvSetTrackbarPos
     (trackbar_name : Interfaces.C.Strings.chars_ptr;
      window_name : Interfaces.C.Strings.chars_ptr;
      pos : int);  -- /usr/include/opencv2/highgui/highgui_c.h:161
   pragma Import (C, cvSetTrackbarPos, "cvSetTrackbarPos");

   type CvMouseCallback is access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address);
   pragma Convention (C, CvMouseCallback);  -- /usr/include/opencv2/highgui/highgui_c.h:187

   procedure cvSetMouseCallback
     (window_name : Interfaces.C.Strings.chars_ptr;
      on_mouse : CvMouseCallback;
      param : System.Address);  -- /usr/include/opencv2/highgui/highgui_c.h:190
   pragma Import (C, cvSetMouseCallback, "cvSetMouseCallback");

   function cvLoadImage (filename : Interfaces.C.Strings.chars_ptr; iscolor : int) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/highgui/highgui_c.h:213
   pragma Import (C, cvLoadImage, "cvLoadImage");

   function cvLoadImageM (filename : Interfaces.C.Strings.chars_ptr; iscolor : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/highgui/highgui_c.h:214
   pragma Import (C, cvLoadImageM, "cvLoadImageM");

   function cvSaveImage
     (filename : Interfaces.C.Strings.chars_ptr;
      image : System.Address;
      params : access int) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:224
   pragma Import (C, cvSaveImage, "cvSaveImage");

   function cvDecodeImage (buf : access constant opencv2_core_types_c_h.CvMat; iscolor : int) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/highgui/highgui_c.h:228
   pragma Import (C, cvDecodeImage, "cvDecodeImage");

   function cvDecodeImageM (buf : access constant opencv2_core_types_c_h.CvMat; iscolor : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/highgui/highgui_c.h:229
   pragma Import (C, cvDecodeImageM, "cvDecodeImageM");

   function cvEncodeImage
     (ext : Interfaces.C.Strings.chars_ptr;
      image : System.Address;
      params : access int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/highgui/highgui_c.h:232
   pragma Import (C, cvEncodeImage, "cvEncodeImage");

   procedure cvConvertImage
     (src : System.Address;
      dst : System.Address;
      flags : int);  -- /usr/include/opencv2/highgui/highgui_c.h:242
   pragma Import (C, cvConvertImage, "cvConvertImage");

   function cvWaitKey (c_delay : int) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:245
   pragma Import (C, cvWaitKey, "cvWaitKey");

   --  skipped empty struct CvCapture

   function cvCreateFileCapture (filename : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/include/opencv2/highgui/highgui_c.h:255
   pragma Import (C, cvCreateFileCapture, "cvCreateFileCapture");

   function cvCreateCameraCapture (index : int) return System.Address;  -- /usr/include/opencv2/highgui/highgui_c.h:296
   pragma Import (C, cvCreateCameraCapture, "cvCreateCameraCapture");

   function cvGrabFrame (capture : System.Address) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:300
   pragma Import (C, cvGrabFrame, "cvGrabFrame");

   function cvRetrieveFrame (capture : System.Address; streamIdx : int) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/highgui/highgui_c.h:306
   pragma Import (C, cvRetrieveFrame, "cvRetrieveFrame");

   function cvQueryFrame (capture : System.Address) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/highgui/highgui_c.h:310
   pragma Import (C, cvQueryFrame, "cvQueryFrame");

   procedure cvReleaseCapture (capture : System.Address);  -- /usr/include/opencv2/highgui/highgui_c.h:313
   pragma Import (C, cvReleaseCapture, "cvReleaseCapture");

   function cvGetCaptureProperty (capture : System.Address; property_id : int) return double;  -- /usr/include/opencv2/highgui/highgui_c.h:436
   pragma Import (C, cvGetCaptureProperty, "cvGetCaptureProperty");

   function cvSetCaptureProperty
     (capture : System.Address;
      property_id : int;
      value : double) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:437
   pragma Import (C, cvSetCaptureProperty, "cvSetCaptureProperty");

   function cvGetCaptureDomain (capture : System.Address) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:440
   pragma Import (C, cvGetCaptureDomain, "cvGetCaptureDomain");

   --  skipped empty struct CvVideoWriter

   function CV_FOURCC
     (c1 : char;
      c2 : char;
      c3 : char;
      c4 : char) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:445
   pragma Import (C, CV_FOURCC, "CV_FOURCC");

   function cvCreateVideoWriter
     (filename : Interfaces.C.Strings.chars_ptr;
      fourcc : int;
      fps : double;
      frame_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      is_color : int) return System.Address;  -- /usr/include/opencv2/highgui/highgui_c.h:454
   pragma Import (C, cvCreateVideoWriter, "cvCreateVideoWriter");

   function cvWriteFrame (writer : System.Address; image : access constant opencv2_core_types_c_h.IplImage) return int;  -- /usr/include/opencv2/highgui/highgui_c.h:462
   pragma Import (C, cvWriteFrame, "cvWriteFrame");

   procedure cvReleaseVideoWriter (writer : System.Address);  -- /usr/include/opencv2/highgui/highgui_c.h:465
   pragma Import (C, cvReleaseVideoWriter, "cvReleaseVideoWriter");

end opencv2_highgui_highgui_c_h;
