pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_stl_vector_h;
with opencv2_highgui_highgui_hpp;
with cpp_4_7_4_bits_stl_queue_h;

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

   imageName : aliased int;  -- visionBindings.cpp:19
   pragma Import (C, imageName, "imageName");

end visionBindings_cpp;
