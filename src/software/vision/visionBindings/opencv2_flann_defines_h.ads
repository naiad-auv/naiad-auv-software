pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package opencv2_flann_defines_h is

   --  unsupported macro: FLANN_DEPRECATED __attribute__ ((deprecated))
   --  arg-macro: function FLANN_ARRAY_LEN (a)
   --    return sizeof(a)/sizeof(a(0));
   subtype flann_algorithm_t is unsigned;
   FLANN_INDEX_LINEAR : constant flann_algorithm_t := 0;
   FLANN_INDEX_KDTREE : constant flann_algorithm_t := 1;
   FLANN_INDEX_KMEANS : constant flann_algorithm_t := 2;
   FLANN_INDEX_COMPOSITE : constant flann_algorithm_t := 3;
   FLANN_INDEX_KDTREE_SINGLE : constant flann_algorithm_t := 4;
   FLANN_INDEX_HIERARCHICAL : constant flann_algorithm_t := 5;
   FLANN_INDEX_LSH : constant flann_algorithm_t := 6;
   FLANN_INDEX_SAVED : constant flann_algorithm_t := 254;
   FLANN_INDEX_AUTOTUNED : constant flann_algorithm_t := 255;
   LINEAR : constant flann_algorithm_t := 0;
   KDTREE : constant flann_algorithm_t := 1;
   KMEANS : constant flann_algorithm_t := 2;
   COMPOSITE : constant flann_algorithm_t := 3;
   KDTREE_SINGLE : constant flann_algorithm_t := 4;
   SAVED : constant flann_algorithm_t := 254;
   AUTOTUNED : constant flann_algorithm_t := 255;  -- /usr/include/opencv2/flann/defines.h:81

   subtype flann_centers_init_t is unsigned;
   FLANN_CENTERS_RANDOM : constant flann_centers_init_t := 0;
   FLANN_CENTERS_GONZALES : constant flann_centers_init_t := 1;
   FLANN_CENTERS_KMEANSPP : constant flann_centers_init_t := 2;
   CENTERS_RANDOM : constant flann_centers_init_t := 0;
   CENTERS_GONZALES : constant flann_centers_init_t := 1;
   CENTERS_KMEANSPP : constant flann_centers_init_t := 2;  -- /usr/include/opencv2/flann/defines.h:105

   type flann_log_level_t is 
     (FLANN_LOG_NONE,
      FLANN_LOG_FATAL,
      FLANN_LOG_ERROR,
      FLANN_LOG_WARN,
      FLANN_LOG_INFO);
   pragma Convention (C, flann_log_level_t);  -- /usr/include/opencv2/flann/defines.h:117

   subtype flann_distance_t is unsigned;
   FLANN_DIST_EUCLIDEAN : constant flann_distance_t := 1;
   FLANN_DIST_L2 : constant flann_distance_t := 1;
   FLANN_DIST_MANHATTAN : constant flann_distance_t := 2;
   FLANN_DIST_L1 : constant flann_distance_t := 2;
   FLANN_DIST_MINKOWSKI : constant flann_distance_t := 3;
   FLANN_DIST_MAX : constant flann_distance_t := 4;
   FLANN_DIST_HIST_INTERSECT : constant flann_distance_t := 5;
   FLANN_DIST_HELLINGER : constant flann_distance_t := 6;
   FLANN_DIST_CHI_SQUARE : constant flann_distance_t := 7;
   FLANN_DIST_CS : constant flann_distance_t := 7;
   FLANN_DIST_KULLBACK_LEIBLER : constant flann_distance_t := 8;
   FLANN_DIST_KL : constant flann_distance_t := 8;
   EUCLIDEAN : constant flann_distance_t := 1;
   MANHATTAN : constant flann_distance_t := 2;
   MINKOWSKI : constant flann_distance_t := 3;
   MAX_DIST : constant flann_distance_t := 4;
   HIST_INTERSECT : constant flann_distance_t := 5;
   HELLINGER : constant flann_distance_t := 6;
   CS : constant flann_distance_t := 7;
   KL : constant flann_distance_t := 8;
   KULLBACK_LEIBLER : constant flann_distance_t := 8;  -- /usr/include/opencv2/flann/defines.h:126

   type flann_datatype_t is 
     (FLANN_INT8,
      FLANN_INT16,
      FLANN_INT32,
      FLANN_INT64,
      FLANN_UINT8,
      FLANN_UINT16,
      FLANN_UINT32,
      FLANN_UINT64,
      FLANN_FLOAT32,
      FLANN_FLOAT64);
   pragma Convention (C, flann_datatype_t);  -- /usr/include/opencv2/flann/defines.h:153

end opencv2_flann_defines_h;
