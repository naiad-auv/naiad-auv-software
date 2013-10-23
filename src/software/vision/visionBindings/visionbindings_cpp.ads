pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_stl_vector_h;
with opencv2_highgui_highgui_hpp;
with cpp_4_7_4_bits_stl_queue_h;
with opencv2_core_core_hpp;

package visionBindings_cpp is

   img : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:11
   pragma Import (C, img, "img");

   circles : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:12
   pragma Import (C, circles, "circles");

   lines : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:13
   pragma Import (C, lines, "lines");

   contours : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:14
   pragma Import (C, contours, "contours");

   cap : aliased opencv2_highgui_highgui_hpp.Class_VideoCapture.VideoCapture;  -- visionBindings.cpp:15
   pragma Import (C, cap, "cap");

   channels : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:16
   pragma Import (C, channels, "channels");

   imageBuf : aliased cpp_4_7_4_bits_stl_queue_h.Class_queue.queue;  -- visionBindings.cpp:18
   pragma Import (C, imageBuf, "imageBuf");

   imageName : aliased int;  -- visionBindings.cpp:20
   pragma Import (C, imageName, "imageName");

   BGR : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- visionBindings.cpp:23
   pragma Import (C, BGR, "BGR");

   blueHistVals : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- visionBindings.cpp:24
   pragma Import (C, blueHistVals, "blueHistVals");

   greenHistVals : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- visionBindings.cpp:25
   pragma Import (C, greenHistVals, "greenHistVals");

   redHistVals : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- visionBindings.cpp:26
   pragma Import (C, redHistVals, "redHistVals");

   hist : aliased opencv2_core_core_hpp.Class_MatND.MatND;  -- visionBindings.cpp:28
   pragma Import (C, hist, "hist");

end visionBindings_cpp;
