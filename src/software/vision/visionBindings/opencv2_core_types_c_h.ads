pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_types_h;
with stdint_h;
with System;
with Interfaces.C.Strings;

package opencv2_core_types_c_h is

   --  unsupported macro: CV_EXTERN_C extern "C"
   --  arg-macro: procedure CV_DEFAULT (val)
   --    := val
   --  arg-macro: procedure CV_EXTERN_C_FUNCPTR (x)
   --    extern "C" { typedef x; }
   --  unsupported macro: CV_INLINE inline
   --  arg-macro: procedure CVAPI (rettype)
   --    CV_EXTERN_C CV_EXPORTS rettype CV_CDECL
   --  unsupported macro: CV_BIG_INT(n) n ##LL
   --  unsupported macro: CV_BIG_UINT(n) n ##ULL
   --  unsupported macro: CV_EXPORTS_W CV_EXPORTS
   --  unsupported macro: CV_EXPORTS_W_SIMPLE CV_EXPORTS
   --  arg-macro: procedure CV_EXPORTS_AS (synonym)
   --    CV_EXPORTS
   --  unsupported macro: CV_EXPORTS_W_MAP CV_EXPORTS

   CV_PI : constant := 3.1415926535897932384626433832795;  --  /usr/include/opencv2/core/types_c.h:262
   CV_LOG2 : constant := 8#.69314718055994530941723212145818#;  --  /usr/include/opencv2/core/types_c.h:263
   --  arg-macro: function CV_SWAP (a, b, t)
   --    return (t) := (a), (a) := (b), (b) := (t);
   --  arg-macro: function MIN (a, b)
   --    return (a) > (b) ? (b) : (a);
   --  arg-macro: function MAX (a, b)
   --    return (a) < (b) ? (b) : (a);
   --  arg-macro: function CV_IMIN (a, b)
   --    return (a) xor (((a)xor(b)) and (((a) < (b)) - 1));
   --  arg-macro: function CV_IMAX (a, b)
   --    return (a) xor (((a)xor(b)) and (((a) > (b)) - 1));
   --  arg-macro: procedure CV_IABS (a)
   --    abs(a)
   --  arg-macro: function CV_CMP (a, b)
   --    return ((a) > (b)) - ((a) < (b));
   --  arg-macro: procedure CV_SIGN (a)
   --    CV_CMP((a),0)
   --  arg-macro: function cvInvSqrt (value)
   --    return (float)(1./sqrt(value));
   --  arg-macro: function cvSqrt (value)
   --    return (float)sqrt(value);

   CV_RNG_COEFF : constant := 4164903690;  --  /usr/include/opencv2/core/types_c.h:383

   IPL_DEPTH_SIGN : constant := 16#80000000#;  --  /usr/include/opencv2/core/types_c.h:417

   IPL_DEPTH_1U : constant := 1;  --  /usr/include/opencv2/core/types_c.h:419
   IPL_DEPTH_8U : constant := 8;  --  /usr/include/opencv2/core/types_c.h:420
   IPL_DEPTH_16U : constant := 16;  --  /usr/include/opencv2/core/types_c.h:421
   IPL_DEPTH_32F : constant := 32;  --  /usr/include/opencv2/core/types_c.h:422
   --  unsupported macro: IPL_DEPTH_8S (IPL_DEPTH_SIGN| 8)
   --  unsupported macro: IPL_DEPTH_16S (IPL_DEPTH_SIGN|16)
   --  unsupported macro: IPL_DEPTH_32S (IPL_DEPTH_SIGN|32)

   IPL_DATA_ORDER_PIXEL : constant := 0;  --  /usr/include/opencv2/core/types_c.h:428
   IPL_DATA_ORDER_PLANE : constant := 1;  --  /usr/include/opencv2/core/types_c.h:429

   IPL_ORIGIN_TL : constant := 0;  --  /usr/include/opencv2/core/types_c.h:431
   IPL_ORIGIN_BL : constant := 1;  --  /usr/include/opencv2/core/types_c.h:432

   IPL_ALIGN_4BYTES : constant := 4;  --  /usr/include/opencv2/core/types_c.h:434
   IPL_ALIGN_8BYTES : constant := 8;  --  /usr/include/opencv2/core/types_c.h:435
   IPL_ALIGN_16BYTES : constant := 16;  --  /usr/include/opencv2/core/types_c.h:436
   IPL_ALIGN_32BYTES : constant := 32;  --  /usr/include/opencv2/core/types_c.h:437
   --  unsupported macro: IPL_ALIGN_DWORD IPL_ALIGN_4BYTES
   --  unsupported macro: IPL_ALIGN_QWORD IPL_ALIGN_8BYTES

   IPL_BORDER_CONSTANT : constant := 0;  --  /usr/include/opencv2/core/types_c.h:442
   IPL_BORDER_REPLICATE : constant := 1;  --  /usr/include/opencv2/core/types_c.h:443
   IPL_BORDER_REFLECT : constant := 2;  --  /usr/include/opencv2/core/types_c.h:444
   IPL_BORDER_WRAP : constant := 3;  --  /usr/include/opencv2/core/types_c.h:445

   IPL_IMAGE_HEADER : constant := 1;  --  /usr/include/opencv2/core/types_c.h:515
   IPL_IMAGE_DATA : constant := 2;  --  /usr/include/opencv2/core/types_c.h:516
   IPL_IMAGE_ROI : constant := 4;  --  /usr/include/opencv2/core/types_c.h:517

   IPL_BORDER_REFLECT_101 : constant := 4;  --  /usr/include/opencv2/core/types_c.h:522
   IPL_BORDER_TRANSPARENT : constant := 5;  --  /usr/include/opencv2/core/types_c.h:523
   --  unsupported macro: IPL_IMAGE_MAGIC_VAL ((int)sizeof(IplImage))

   CV_TYPE_NAME_IMAGE : aliased constant String := "opencv-image" & ASCII.NUL;  --  /usr/include/opencv2/core/types_c.h:526
   --  arg-macro: function CV_IS_IMAGE_HDR (img)
   --    return (img) /= NULL  and then  ((const IplImage*)(img)).nSize = sizeof(IplImage);
   --  arg-macro: function CV_IS_IMAGE (img)
   --    return CV_IS_IMAGE_HDR(img)  and then  ((IplImage*)img).imageData /= NULL;

   IPL_DEPTH_64F : constant := 64;  --  /usr/include/opencv2/core/types_c.h:536
   --  arg-macro: function CV_IMAGE_ELEM (image, elemtype(((elemtype*)((image).imageData + (image).widthStep*(row)))((col))
   --    return ((elemtype*)((image).imageData + (image).widthStep*(row)))((col));

   CV_CN_MAX : constant := 512;  --  /usr/include/opencv2/core/types_c.h:547
   CV_CN_SHIFT : constant := 3;  --  /usr/include/opencv2/core/types_c.h:548
   --  unsupported macro: CV_DEPTH_MAX (1 << CV_CN_SHIFT)

   CV_8U : constant := 0;  --  /usr/include/opencv2/core/types_c.h:551
   CV_8S : constant := 1;  --  /usr/include/opencv2/core/types_c.h:552
   CV_16U : constant := 2;  --  /usr/include/opencv2/core/types_c.h:553
   CV_16S : constant := 3;  --  /usr/include/opencv2/core/types_c.h:554
   CV_32S : constant := 4;  --  /usr/include/opencv2/core/types_c.h:555
   CV_32F : constant := 5;  --  /usr/include/opencv2/core/types_c.h:556
   CV_64F : constant := 6;  --  /usr/include/opencv2/core/types_c.h:557
   CV_USRTYPE1 : constant := 7;  --  /usr/include/opencv2/core/types_c.h:558
   --  unsupported macro: CV_MAT_DEPTH_MASK (CV_DEPTH_MAX - 1)
   --  arg-macro: function CV_MAT_DEPTH (flags)
   --    return (flags) and CV_MAT_DEPTH_MASK;
   --  arg-macro: function CV_MAKETYPE (depth, cn)
   --    return CV_MAT_DEPTH(depth) + (((cn)-1) << CV_CN_SHIFT);
   --  unsupported macro: CV_MAKE_TYPE CV_MAKETYPE
   --  unsupported macro: CV_8UC1 CV_MAKETYPE(CV_8U,1)
   --  unsupported macro: CV_8UC2 CV_MAKETYPE(CV_8U,2)
   --  unsupported macro: CV_8UC3 CV_MAKETYPE(CV_8U,3)
   --  unsupported macro: CV_8UC4 CV_MAKETYPE(CV_8U,4)
   --  arg-macro: procedure CV_8UC (n)
   --    CV_MAKETYPE(CV_8U,(n))
   --  unsupported macro: CV_8SC1 CV_MAKETYPE(CV_8S,1)
   --  unsupported macro: CV_8SC2 CV_MAKETYPE(CV_8S,2)
   --  unsupported macro: CV_8SC3 CV_MAKETYPE(CV_8S,3)
   --  unsupported macro: CV_8SC4 CV_MAKETYPE(CV_8S,4)
   --  arg-macro: procedure CV_8SC (n)
   --    CV_MAKETYPE(CV_8S,(n))
   --  unsupported macro: CV_16UC1 CV_MAKETYPE(CV_16U,1)
   --  unsupported macro: CV_16UC2 CV_MAKETYPE(CV_16U,2)
   --  unsupported macro: CV_16UC3 CV_MAKETYPE(CV_16U,3)
   --  unsupported macro: CV_16UC4 CV_MAKETYPE(CV_16U,4)
   --  arg-macro: procedure CV_16UC (n)
   --    CV_MAKETYPE(CV_16U,(n))
   --  unsupported macro: CV_16SC1 CV_MAKETYPE(CV_16S,1)
   --  unsupported macro: CV_16SC2 CV_MAKETYPE(CV_16S,2)
   --  unsupported macro: CV_16SC3 CV_MAKETYPE(CV_16S,3)
   --  unsupported macro: CV_16SC4 CV_MAKETYPE(CV_16S,4)
   --  arg-macro: procedure CV_16SC (n)
   --    CV_MAKETYPE(CV_16S,(n))
   --  unsupported macro: CV_32SC1 CV_MAKETYPE(CV_32S,1)
   --  unsupported macro: CV_32SC2 CV_MAKETYPE(CV_32S,2)
   --  unsupported macro: CV_32SC3 CV_MAKETYPE(CV_32S,3)
   --  unsupported macro: CV_32SC4 CV_MAKETYPE(CV_32S,4)
   --  arg-macro: procedure CV_32SC (n)
   --    CV_MAKETYPE(CV_32S,(n))
   --  unsupported macro: CV_32FC1 CV_MAKETYPE(CV_32F,1)
   --  unsupported macro: CV_32FC2 CV_MAKETYPE(CV_32F,2)
   --  unsupported macro: CV_32FC3 CV_MAKETYPE(CV_32F,3)
   --  unsupported macro: CV_32FC4 CV_MAKETYPE(CV_32F,4)
   --  arg-macro: procedure CV_32FC (n)
   --    CV_MAKETYPE(CV_32F,(n))
   --  unsupported macro: CV_64FC1 CV_MAKETYPE(CV_64F,1)
   --  unsupported macro: CV_64FC2 CV_MAKETYPE(CV_64F,2)
   --  unsupported macro: CV_64FC3 CV_MAKETYPE(CV_64F,3)
   --  unsupported macro: CV_64FC4 CV_MAKETYPE(CV_64F,4)
   --  arg-macro: procedure CV_64FC (n)
   --    CV_MAKETYPE(CV_64F,(n))

   CV_AUTO_STEP : constant := 16#7fffffff#;  --  /usr/include/opencv2/core/types_c.h:608
   --  unsupported macro: CV_WHOLE_ARR cvSlice( 0, 0x3fffffff )
   --  unsupported macro: CV_MAT_CN_MASK ((CV_CN_MAX - 1) << CV_CN_SHIFT)
   --  arg-macro: function CV_MAT_CN (flags)
   --    return (((flags) and CV_MAT_CN_MASK) >> CV_CN_SHIFT) + 1;
   --  unsupported macro: CV_MAT_TYPE_MASK (CV_DEPTH_MAX*CV_CN_MAX - 1)
   --  arg-macro: function CV_MAT_TYPE (flags)
   --    return (flags) and CV_MAT_TYPE_MASK;

   CV_MAT_CONT_FLAG_SHIFT : constant := 14;  --  /usr/include/opencv2/core/types_c.h:615
   --  unsupported macro: CV_MAT_CONT_FLAG (1 << CV_MAT_CONT_FLAG_SHIFT)
   --  arg-macro: function CV_IS_MAT_CONT (flags)
   --    return (flags) and CV_MAT_CONT_FLAG;
   --  unsupported macro: CV_IS_CONT_MAT CV_IS_MAT_CONT

   CV_SUBMAT_FLAG_SHIFT : constant := 15;  --  /usr/include/opencv2/core/types_c.h:619
   --  unsupported macro: CV_SUBMAT_FLAG (1 << CV_SUBMAT_FLAG_SHIFT)
   --  arg-macro: function CV_IS_SUBMAT (flags)
   --    return (flags) and CV_MAT_SUBMAT_FLAG;

   CV_MAGIC_MASK : constant := 16#FFFF0000#;  --  /usr/include/opencv2/core/types_c.h:623
   CV_MAT_MAGIC_VAL : constant := 16#42420000#;  --  /usr/include/opencv2/core/types_c.h:624
   CV_TYPE_NAME_MAT : aliased constant String := "opencv-matrix" & ASCII.NUL;  --  /usr/include/opencv2/core/types_c.h:625
   --  arg-macro: function CV_IS_MAT_HDR (mat)
   --    return (mat) /= NULL  and then  (((const CvMat*)(mat)).type and CV_MAGIC_MASK) = CV_MAT_MAGIC_VAL  and then  ((const CvMat*)(mat)).cols > 0  and then  ((const CvMat*)(mat)).rows > 0;
   --  arg-macro: function CV_IS_MAT_HDR_Z (mat)
   --    return (mat) /= NULL  and then  (((const CvMat*)(mat)).type and CV_MAGIC_MASK) = CV_MAT_MAGIC_VAL  and then  ((const CvMat*)(mat)).cols >= 0  and then  ((const CvMat*)(mat)).rows >= 0;
   --  arg-macro: function CV_IS_MAT (mat)
   --    return CV_IS_MAT_HDR(mat)  and then  ((const CvMat*)(mat)).data.ptr /= NULL;
   --  arg-macro: function CV_IS_MASK_ARR (mat)
   --    return ((mat).type and (CV_MAT_TYPE_MASK and ~CV_8SC1)) = 0;
   --  arg-macro: function CV_ARE_TYPES_EQ (mat1, mat2)
   --    return (((mat1).type xor (mat2).type) and CV_MAT_TYPE_MASK) = 0;
   --  arg-macro: function CV_ARE_CNS_EQ (mat1, mat2)
   --    return (((mat1).type xor (mat2).type) and CV_MAT_CN_MASK) = 0;
   --  arg-macro: function CV_ARE_DEPTHS_EQ (mat1, mat2)
   --    return (((mat1).type xor (mat2).type) and CV_MAT_DEPTH_MASK) = 0;
   --  arg-macro: function CV_ARE_SIZES_EQ (mat1, mat2)
   --    return (mat1).rows = (mat2).rows  and then  (mat1).cols = (mat2).cols;
   --  arg-macro: function CV_IS_MAT_CONST (mat)
   --    return ((mat).rowsor(mat).cols) = 1;
   --  arg-macro: function CV_ELEM_SIZE1 (type)
   --    return (((sizeof(size_t)<<28)or16#8442211#) >> CV_MAT_DEPTH(type)*4) and 15;
   --  arg-macro: function CV_ELEM_SIZE (type)
   --    return CV_MAT_CN(type) << ((((sizeof(size_t)/4+1)*16384or16#3a50#) >> CV_MAT_DEPTH(type)*2) and 3);
   --  arg-macro: function IPL2CV_DEPTH (depth)
   --    return (((CV_8U)+(CV_16U<<4)+(CV_32F<<8)+(CV_64F<<16)+(CV_8S<<20)+ (CV_16S<<24)+(CV_32S<<28)) >> ((((depth) and 16#F0#) >> 2) + (((depth) and IPL_DEPTH_SIGN) ? 20 : 0))) and 15;
   --  arg-macro: function CV_MAT_ELEM_PTR_FAST (mat, row, col, (assert( (unsigned)(row) < (unsigned)(mat).rows  and then  (unsigned)(col) < (unsigned)(mat).cols ), (mat).data.ptr + (size_t)(mat).step*(row) + (pix_size)*(col)
   --    return assert( (unsigned)(row) < (unsigned)(mat).rows  and then  (unsigned)(col) < (unsigned)(mat).cols ), (mat).data.ptr + (size_t)(mat).step*(row) + (pix_size)*(col);
   --  arg-macro: procedure CV_MAT_ELEM_PTR (mat, row, col)
   --    CV_MAT_ELEM_PTR_FAST( mat, row, col, CV_ELEM_SIZE((mat).type) )
   --  arg-macro: function CV_MAT_ELEM (mat, elemtype, (*(elemtype*)CV_MAT_ELEM_PTR_FAST( mat, row, col, sizeof(elemtype))
   --    return *(elemtype*)CV_MAT_ELEM_PTR_FAST( mat, row, col, sizeof(elemtype));

   CV_MATND_MAGIC_VAL : constant := 16#42430000#;  --  /usr/include/opencv2/core/types_c.h:792
   CV_TYPE_NAME_MATND : aliased constant String := "opencv-nd-matrix" & ASCII.NUL;  --  /usr/include/opencv2/core/types_c.h:793

   CV_MAX_DIM : constant := 32;  --  /usr/include/opencv2/core/types_c.h:795
   CV_MAX_DIM_HEAP : constant := 1024;  --  /usr/include/opencv2/core/types_c.h:796
   --  arg-macro: function CV_IS_MATND_HDR (mat)
   --    return (mat) /= NULL  and then  (((const CvMatND*)(mat)).type and CV_MAGIC_MASK) = CV_MATND_MAGIC_VAL;
   --  arg-macro: function CV_IS_MATND (mat)
   --    return CV_IS_MATND_HDR(mat)  and then  ((const CvMatND*)(mat)).data.ptr /= NULL;

   CV_SPARSE_MAT_MAGIC_VAL : constant := 16#42440000#;  --  /usr/include/opencv2/core/types_c.h:835
   CV_TYPE_NAME_SPARSE_MAT : aliased constant String := "opencv-sparse-matrix" & ASCII.NUL;  --  /usr/include/opencv2/core/types_c.h:836
   --  arg-macro: function CV_IS_SPARSE_MAT_HDR (mat)
   --    return (mat) /= NULL  and then  (((const CvSparseMat*)(mat)).type and CV_MAGIC_MASK) = CV_SPARSE_MAT_MAGIC_VAL;
   --  arg-macro: procedure CV_IS_SPARSE_MAT (mat)
   --    CV_IS_SPARSE_MAT_HDR(mat)
   --  arg-macro: function CV_NODE_VAL (mat, node)
   --    return (void*)((uchar*)(node) + (mat).valoffset);
   --  arg-macro: function CV_NODE_IDX (mat, node)
   --    return (int*)((uchar*)(node) + (mat).idxoffset);

   CV_HIST_MAGIC_VAL : constant := 16#42450000#;  --  /usr/include/opencv2/core/types_c.h:889
   CV_HIST_UNIFORM_FLAG : constant := (2 ** 10);  --  /usr/include/opencv2/core/types_c.h:890

   CV_HIST_RANGES_FLAG : constant := (2 ** 11);  --  /usr/include/opencv2/core/types_c.h:893

   CV_HIST_ARRAY : constant := 0;  --  /usr/include/opencv2/core/types_c.h:895
   CV_HIST_SPARSE : constant := 1;  --  /usr/include/opencv2/core/types_c.h:896
   --  unsupported macro: CV_HIST_TREE CV_HIST_SPARSE

   CV_HIST_UNIFORM : constant := 1;  --  /usr/include/opencv2/core/types_c.h:901
   --  arg-macro: function CV_IS_HIST (hist)
   --    return (hist) /= NULL  and then  (((CvHistogram*)(hist)).type and CV_MAGIC_MASK) = CV_HIST_MAGIC_VAL  and then  (hist).bins /= NULL;
   --  arg-macro: function CV_IS_UNIFORM_HIST (hist)
   --    return ((hist).type and CV_HIST_UNIFORM_FLAG) /= 0;
   --  arg-macro: procedure CV_IS_SPARSE_HIST (hist)
   --    CV_IS_SPARSE_MAT((hist).bins)
   --  arg-macro: function CV_HIST_HAS_RANGES (hist)
   --    return ((hist).type and CV_HIST_RANGES_FLAG) /= 0;

   CV_TERMCRIT_ITER : constant := 1;  --  /usr/include/opencv2/core/types_c.h:975
   --  unsupported macro: CV_TERMCRIT_NUMBER CV_TERMCRIT_ITER

   CV_TERMCRIT_EPS : constant := 2;  --  /usr/include/opencv2/core/types_c.h:977

   CV_WHOLE_SEQ_END_INDEX : constant := 16#3fffffff#;  --  /usr/include/opencv2/core/types_c.h:1199
   --  unsupported macro: CV_WHOLE_SEQ cvSlice(0, CV_WHOLE_SEQ_END_INDEX)

   CV_STORAGE_MAGIC_VAL : constant := 16#42890000#;  --  /usr/include/opencv2/core/types_c.h:1252
   --  arg-macro: function CV_IS_STORAGE (storage)
   --    return (storage) /= NULL  and then  (((CvMemStorage*)(storage)).signature and CV_MAGIC_MASK) = CV_STORAGE_MAGIC_VAL;
   --  arg-macro: procedure CV_TREE_NODE_FIELDS (node_type)
   --    int flags; int header_size; struct node_type* h_prev; struct node_type* h_next; struct node_type* v_prev; struct node_type* v_next
   --  arg-macro: procedure CV_SEQUENCE_FIELDS ()
   --    CV_TREE_NODE_FIELDS(CvSeq); int total; int elem_size; schar* block_max; schar* ptr; int delta_elems; CvMemStorage* storage; CvSeqBlock* free_blocks; CvSeqBlock* first;

   CV_TYPE_NAME_SEQ : aliased constant String := "opencv-sequence" & ASCII.NUL;  --  /usr/include/opencv2/core/types_c.h:1321
   CV_TYPE_NAME_SEQ_TREE : aliased constant String := "opencv-sequence-tree" & ASCII.NUL;  --  /usr/include/opencv2/core/types_c.h:1322
   --  arg-macro: procedure CV_SET_ELEM_FIELDS (elem_type)
   --    int flags; struct elem_type* next_free;
   --  arg-macro: procedure CV_SET_FIELDS ()
   --    CV_SEQUENCE_FIELDS() CvSetElem* free_elems; int active_count;

   CV_SET_ELEM_IDX_MASK : constant := ((2 ** 26) - 1);  --  /usr/include/opencv2/core/types_c.h:1353
   --  unsupported macro: CV_SET_ELEM_FREE_FLAG (1 << (sizeof(int)*8-1))
   --  arg-macro: function CV_IS_SET_ELEM (ptr)
   --    return ((CvSetElem*)(ptr)).flags >= 0;
   --  arg-macro: procedure CV_GRAPH_EDGE_FIELDS ()
   --    int flags; float weight; struct CvGraphEdge* next(2); struct CvGraphVtx* vtx(2);
   --  arg-macro: procedure CV_GRAPH_VERTEX_FIELDS ()
   --    int flags; struct CvGraphEdge* first;
   --  arg-macro: procedure CV_GRAPH_FIELDS ()
   --    CV_SET_FIELDS() CvSet* edges;

   CV_TYPE_NAME_GRAPH : aliased constant String := "opencv-graph" & ASCII.NUL;  --  /usr/include/opencv2/core/types_c.h:1424
   --  arg-macro: procedure CV_CONTOUR_FIELDS ()
   --    CV_SEQUENCE_FIELDS() CvRect rect; int color; int reserved(3);

   CV_SEQ_MAGIC_VAL : constant := 16#42990000#;  --  /usr/include/opencv2/core/types_c.h:1453
   --  arg-macro: function CV_IS_SEQ (seq)
   --    return (seq) /= NULL  and then  (((CvSeq*)(seq)).flags and CV_MAGIC_MASK) = CV_SEQ_MAGIC_VAL;

   CV_SET_MAGIC_VAL : constant := 16#42980000#;  --  /usr/include/opencv2/core/types_c.h:1458
   --  arg-macro: function CV_IS_SET (set)
   --    return (set) /= NULL  and then  (((CvSeq*)(set)).flags and CV_MAGIC_MASK) = CV_SET_MAGIC_VAL;

   CV_SEQ_ELTYPE_BITS : constant := 12;  --  /usr/include/opencv2/core/types_c.h:1462
   --  unsupported macro: CV_SEQ_ELTYPE_MASK ((1 << CV_SEQ_ELTYPE_BITS) - 1)
   --  unsupported macro: CV_SEQ_ELTYPE_POINT CV_32SC2
   --  unsupported macro: CV_SEQ_ELTYPE_CODE CV_8UC1

   CV_SEQ_ELTYPE_GENERIC : constant := 0;  --  /usr/include/opencv2/core/types_c.h:1467
   --  unsupported macro: CV_SEQ_ELTYPE_PTR CV_USRTYPE1
   --  unsupported macro: CV_SEQ_ELTYPE_PPOINT CV_SEQ_ELTYPE_PTR
   --  unsupported macro: CV_SEQ_ELTYPE_INDEX CV_32SC1

   CV_SEQ_ELTYPE_GRAPH_EDGE : constant := 0;  --  /usr/include/opencv2/core/types_c.h:1471
   CV_SEQ_ELTYPE_GRAPH_VERTEX : constant := 0;  --  /usr/include/opencv2/core/types_c.h:1472
   CV_SEQ_ELTYPE_TRIAN_ATR : constant := 0;  --  /usr/include/opencv2/core/types_c.h:1473
   CV_SEQ_ELTYPE_CONNECTED_COMP : constant := 0;  --  /usr/include/opencv2/core/types_c.h:1474
   --  unsupported macro: CV_SEQ_ELTYPE_POINT3D CV_32FC3

   CV_SEQ_KIND_BITS : constant := 2;  --  /usr/include/opencv2/core/types_c.h:1477
   --  unsupported macro: CV_SEQ_KIND_MASK (((1 << CV_SEQ_KIND_BITS) - 1)<<CV_SEQ_ELTYPE_BITS)
   --  unsupported macro: CV_SEQ_KIND_GENERIC (0 << CV_SEQ_ELTYPE_BITS)
   --  unsupported macro: CV_SEQ_KIND_CURVE (1 << CV_SEQ_ELTYPE_BITS)
   --  unsupported macro: CV_SEQ_KIND_BIN_TREE (2 << CV_SEQ_ELTYPE_BITS)
   --  unsupported macro: CV_SEQ_KIND_GRAPH (1 << CV_SEQ_ELTYPE_BITS)
   --  unsupported macro: CV_SEQ_KIND_SUBDIV2D (2 << CV_SEQ_ELTYPE_BITS)
   --  unsupported macro: CV_SEQ_FLAG_SHIFT (CV_SEQ_KIND_BITS + CV_SEQ_ELTYPE_BITS)
   --  unsupported macro: CV_SEQ_FLAG_CLOSED (1 << CV_SEQ_FLAG_SHIFT)
   --  unsupported macro: CV_SEQ_FLAG_SIMPLE (0 << CV_SEQ_FLAG_SHIFT)
   --  unsupported macro: CV_SEQ_FLAG_CONVEX (0 << CV_SEQ_FLAG_SHIFT)
   --  unsupported macro: CV_SEQ_FLAG_HOLE (2 << CV_SEQ_FLAG_SHIFT)
   --  unsupported macro: CV_GRAPH_FLAG_ORIENTED (1 << CV_SEQ_FLAG_SHIFT)
   --  unsupported macro: CV_GRAPH CV_SEQ_KIND_GRAPH
   --  unsupported macro: CV_ORIENTED_GRAPH (CV_SEQ_KIND_GRAPH|CV_GRAPH_FLAG_ORIENTED)
   --  unsupported macro: CV_SEQ_POINT_SET (CV_SEQ_KIND_GENERIC| CV_SEQ_ELTYPE_POINT)
   --  unsupported macro: CV_SEQ_POINT3D_SET (CV_SEQ_KIND_GENERIC| CV_SEQ_ELTYPE_POINT3D)
   --  unsupported macro: CV_SEQ_POLYLINE (CV_SEQ_KIND_CURVE | CV_SEQ_ELTYPE_POINT)
   --  unsupported macro: CV_SEQ_POLYGON (CV_SEQ_FLAG_CLOSED | CV_SEQ_POLYLINE )
   --  unsupported macro: CV_SEQ_CONTOUR CV_SEQ_POLYGON
   --  unsupported macro: CV_SEQ_SIMPLE_POLYGON (CV_SEQ_FLAG_SIMPLE | CV_SEQ_POLYGON )
   --  unsupported macro: CV_SEQ_CHAIN (CV_SEQ_KIND_CURVE | CV_SEQ_ELTYPE_CODE)
   --  unsupported macro: CV_SEQ_CHAIN_CONTOUR (CV_SEQ_FLAG_CLOSED | CV_SEQ_CHAIN)
   --  unsupported macro: CV_SEQ_POLYGON_TREE (CV_SEQ_KIND_BIN_TREE | CV_SEQ_ELTYPE_TRIAN_ATR)
   --  unsupported macro: CV_SEQ_CONNECTED_COMP (CV_SEQ_KIND_GENERIC | CV_SEQ_ELTYPE_CONNECTED_COMP)
   --  unsupported macro: CV_SEQ_INDEX (CV_SEQ_KIND_GENERIC | CV_SEQ_ELTYPE_INDEX)
   --  arg-macro: function CV_SEQ_ELTYPE (seq)
   --    return (seq).flags and CV_SEQ_ELTYPE_MASK;
   --  arg-macro: function CV_SEQ_KIND (seq)
   --    return (seq).flags and CV_SEQ_KIND_MASK ;
   --  arg-macro: function CV_IS_SEQ_INDEX (seq)
   --    return (CV_SEQ_ELTYPE(seq) = CV_SEQ_ELTYPE_INDEX)  and then  (CV_SEQ_KIND(seq) = CV_SEQ_KIND_GENERIC);
   --  arg-macro: function CV_IS_SEQ_CURVE (seq)
   --    return CV_SEQ_KIND(seq) = CV_SEQ_KIND_CURVE;
   --  arg-macro: function CV_IS_SEQ_CLOSED (seq)
   --    return ((seq).flags and CV_SEQ_FLAG_CLOSED) /= 0;
   --  arg-macro: procedure CV_IS_SEQ_CONVEX (seq)
   --    0
   --  arg-macro: function CV_IS_SEQ_HOLE (seq)
   --    return ((seq).flags and CV_SEQ_FLAG_HOLE) /= 0;
   --  arg-macro: procedure CV_IS_SEQ_SIMPLE (seq)
   --    1
   --  arg-macro: function CV_IS_SEQ_POINT_SET (seq)
   --    return (CV_SEQ_ELTYPE(seq) = CV_32SC2  or else  CV_SEQ_ELTYPE(seq) = CV_32FC2);
   --  arg-macro: function CV_IS_SEQ_POINT_SUBSET (seq)
   --    return CV_IS_SEQ_INDEX( seq )  or else  CV_SEQ_ELTYPE(seq) = CV_SEQ_ELTYPE_PPOINT;
   --  arg-macro: function CV_IS_SEQ_POLYLINE (seq)
   --    return CV_SEQ_KIND(seq) = CV_SEQ_KIND_CURVE  and then  CV_IS_SEQ_POINT_SET(seq);
   --  arg-macro: function CV_IS_SEQ_POLYGON (seq)
   --    return CV_IS_SEQ_POLYLINE(seq)  and then  CV_IS_SEQ_CLOSED(seq);
   --  arg-macro: function CV_IS_SEQ_CHAIN (seq)
   --    return CV_SEQ_KIND(seq) = CV_SEQ_KIND_CURVE  and then  (seq).elem_size = 1;
   --  arg-macro: function CV_IS_SEQ_CONTOUR (seq)
   --    return CV_IS_SEQ_CLOSED(seq)  and then  (CV_IS_SEQ_POLYLINE(seq)  or else  CV_IS_SEQ_CHAIN(seq));
   --  arg-macro: function CV_IS_SEQ_CHAIN_CONTOUR (seq)
   --    return CV_IS_SEQ_CHAIN( seq )  and then  CV_IS_SEQ_CLOSED( seq );
   --  arg-macro: function CV_IS_SEQ_POLYGON_TREE (seq)
   --    return CV_SEQ_ELTYPE (seq) = CV_SEQ_ELTYPE_TRIAN_ATR  and then  CV_SEQ_KIND( seq ) = CV_SEQ_KIND_BIN_TREE ;
   --  arg-macro: function CV_IS_GRAPH (seq)
   --    return CV_IS_SET(seq)  and then  CV_SEQ_KIND((CvSet*)(seq)) = CV_SEQ_KIND_GRAPH;
   --  arg-macro: function CV_IS_GRAPH_ORIENTED (seq)
   --    return ((seq).flags and CV_GRAPH_FLAG_ORIENTED) /= 0;
   --  arg-macro: function CV_IS_SUBDIV2D (seq)
   --    return CV_IS_SET(seq)  and then  CV_SEQ_KIND((CvSet*)(seq)) = CV_SEQ_KIND_SUBDIV2D;
   --  arg-macro: procedure CV_SEQ_WRITER_FIELDS ()
   --    int header_size; CvSeq* seq; CvSeqBlock* block; schar* ptr; schar* block_min; schar* block_max;
   --  arg-macro: procedure CV_SEQ_READER_FIELDS ()
   --    int header_size; CvSeq* seq; CvSeqBlock* block; schar* ptr; schar* block_min; schar* block_max; int delta_index; schar* prev_elem;
   --  arg-macro: function CV_SEQ_ELEM (seq, elem_type,( assert(sizeof((seq).first(0)) = sizeof(CvSeqBlock)  and then  (seq).elem_size = sizeof(elem_type)), (elem_type*)((seq).first  and then  (unsigned)index < (unsigned)((seq).first.count) ? (seq).first.data + (index) * sizeof(elem_type) : cvGetSeqElem( (CvSeq*)(seq), (index) ))
   --    return  assert(sizeof((seq).first(0)) = sizeof(CvSeqBlock)  and then  (seq).elem_size = sizeof(elem_type)), (elem_type*)((seq).first  and then  (unsigned)index < (unsigned)((seq).first.count) ? (seq).first.data + (index) * sizeof(elem_type) : cvGetSeqElem( (CvSeq*)(seq), (index) ));
   --  arg-macro: procedure CV_GET_SEQ_ELEM (elem_type, seq,CV_SEQ_ELEM( (seq), elem_type, (index) )
   --    CV_SEQ_ELEM( (seq), elem_type, (index) )
   --  arg-macro: procedure CV_WRITE_SEQ_ELEM_VAR (elem_ptr, write{ if( (writer).ptr >= (writer).block_max ) { cvCreateSeqBlock( andwriter); } memcpy((writer).ptr, elem_ptr, (writer).seq.elem_size); (writer).ptr += (writer).seq.elem_size; }
   --    { if( (writer).ptr >= (writer).block_max ) { cvCreateSeqBlock( andwriter); } memcpy((writer).ptr, elem_ptr, (writer).seq.elem_size); (writer).ptr += (writer).seq.elem_size; }
   --  arg-macro: procedure CV_WRITE_SEQ_ELEM (elem, writer)
   --    { assert( (writer).seq.elem_size = sizeof(elem)); if( (writer).ptr >= (writer).block_max ) { cvCreateSeqBlock( andwriter); } assert( (writer).ptr <= (writer).block_max - sizeof(elem)); memcpy((writer).ptr, and(elem), sizeof(elem)); (writer).ptr += sizeof(elem); }
   --  arg-macro: procedure CV_NEXT_SEQ_ELEM (elem_size, read{ if( ((reader).ptr += (elem_size)) >= (reader).block_max ) { cvChangeSeqBlock( and(reader), 1 ); } }
   --    { if( ((reader).ptr += (elem_size)) >= (reader).block_max ) { cvChangeSeqBlock( and(reader), 1 ); } }
   --  arg-macro: procedure CV_PREV_SEQ_ELEM (elem_size, read{ if( ((reader).ptr -= (elem_size)) < (reader).block_min ) { cvChangeSeqBlock( and(reader), -1 ); } }
   --    { if( ((reader).ptr -= (elem_size)) < (reader).block_min ) { cvChangeSeqBlock( and(reader), -1 ); } }
   --  arg-macro: procedure CV_READ_SEQ_ELEM (elem, reader)
   --    { assert( (reader).seq.elem_size = sizeof(elem)); memcpy( and(elem), (reader).ptr, sizeof((elem))); CV_NEXT_SEQ_ELEM( sizeof(elem), reader ) }
   --  arg-macro: procedure CV_REV_READ_SEQ_ELEM (elem, reader)
   --    { assert( (reader).seq.elem_size = sizeof(elem)); memcpy(and(elem), (reader).ptr, sizeof((elem))); CV_PREV_SEQ_ELEM( sizeof(elem), reader ) }
   --  arg-macro: procedure CV_READ_CHAIN_POINT (_pt, reader)
   --    { (_pt) := (reader).pt; if( (reader).ptr ) { CV_READ_SEQ_ELEM( (reader).code, (reader)); assert( ((reader).code and ~7) = 0 ); (reader).pt.x += (reader).deltas((int)(reader).code)(0); (reader).pt.y += (reader).deltas((int)(reader).code)(1); } }
   --  arg-macro: function CV_CURRENT_POINT (reader)
   --    return *((CvPoint*)((reader).ptr));
   --  arg-macro: function CV_PREV_POINT (reader)
   --    return *((CvPoint*)((reader).prev_elem));
   --  arg-macro: procedure CV_READ_EDGE (pt1, pt2, reade{ assert( sizeof(pt1) = sizeof(CvPoint)  and then  sizeof(pt2) = sizeof(CvPoint)  and then  reader.seq.elem_size = sizeof(CvPoint)); (pt1) := CV_PREV_POINT( reader ); (pt2) := CV_CURRENT_POINT( reader ); (reader).prev_elem := (reader).ptr; CV_NEXT_SEQ_ELEM( sizeof(CvPoint), (reader)); }
   --    { assert( sizeof(pt1) = sizeof(CvPoint)  and then  sizeof(pt2) = sizeof(CvPoint)  and then  reader.seq.elem_size = sizeof(CvPoint)); (pt1) := CV_PREV_POINT( reader ); (pt2) := CV_CURRENT_POINT( reader ); (reader).prev_elem := (reader).ptr; CV_NEXT_SEQ_ELEM( sizeof(CvPoint), (reader)); }
   --  arg-macro: function CV_NEXT_GRAPH_EDGE (edge, vertex)
   --    return assert((edge).vtx(0) = (vertex)  or else  (edge).vtx(1) = (vertex)), (edge).next((edge).vtx(1) = (vertex));

   CV_STORAGE_READ : constant := 0;  --  /usr/include/opencv2/core/types_c.h:1725
   CV_STORAGE_WRITE : constant := 1;  --  /usr/include/opencv2/core/types_c.h:1726
   --  unsupported macro: CV_STORAGE_WRITE_TEXT CV_STORAGE_WRITE
   --  unsupported macro: CV_STORAGE_WRITE_BINARY CV_STORAGE_WRITE

   CV_STORAGE_APPEND : constant := 2;  --  /usr/include/opencv2/core/types_c.h:1729

   CV_NODE_NONE : constant := 0;  --  /usr/include/opencv2/core/types_c.h:1751
   CV_NODE_INT : constant := 1;  --  /usr/include/opencv2/core/types_c.h:1752
   --  unsupported macro: CV_NODE_INTEGER CV_NODE_INT

   CV_NODE_REAL : constant := 2;  --  /usr/include/opencv2/core/types_c.h:1754
   --  unsupported macro: CV_NODE_FLOAT CV_NODE_REAL

   CV_NODE_STR : constant := 3;  --  /usr/include/opencv2/core/types_c.h:1756
   --  unsupported macro: CV_NODE_STRING CV_NODE_STR

   CV_NODE_REF : constant := 4;  --  /usr/include/opencv2/core/types_c.h:1758
   CV_NODE_SEQ : constant := 5;  --  /usr/include/opencv2/core/types_c.h:1759
   CV_NODE_MAP : constant := 6;  --  /usr/include/opencv2/core/types_c.h:1760
   CV_NODE_TYPE_MASK : constant := 7;  --  /usr/include/opencv2/core/types_c.h:1761
   --  arg-macro: function CV_NODE_TYPE (flags)
   --    return (flags) and CV_NODE_TYPE_MASK;

   CV_NODE_FLOW : constant := 8;  --  /usr/include/opencv2/core/types_c.h:1766
   CV_NODE_USER : constant := 16;  --  /usr/include/opencv2/core/types_c.h:1767
   CV_NODE_EMPTY : constant := 32;  --  /usr/include/opencv2/core/types_c.h:1768
   CV_NODE_NAMED : constant := 64;  --  /usr/include/opencv2/core/types_c.h:1769
   --  arg-macro: function CV_NODE_IS_INT (flags)
   --    return CV_NODE_TYPE(flags) = CV_NODE_INT;
   --  arg-macro: function CV_NODE_IS_REAL (flags)
   --    return CV_NODE_TYPE(flags) = CV_NODE_REAL;
   --  arg-macro: function CV_NODE_IS_STRING (flags)
   --    return CV_NODE_TYPE(flags) = CV_NODE_STRING;
   --  arg-macro: function CV_NODE_IS_SEQ (flags)
   --    return CV_NODE_TYPE(flags) = CV_NODE_SEQ;
   --  arg-macro: function CV_NODE_IS_MAP (flags)
   --    return CV_NODE_TYPE(flags) = CV_NODE_MAP;
   --  arg-macro: function CV_NODE_IS_COLLECTION (flags)
   --    return CV_NODE_TYPE(flags) >= CV_NODE_SEQ;
   --  arg-macro: function CV_NODE_IS_FLOW (flags)
   --    return ((flags) and CV_NODE_FLOW) /= 0;
   --  arg-macro: function CV_NODE_IS_EMPTY (flags)
   --    return ((flags) and CV_NODE_EMPTY) /= 0;
   --  arg-macro: function CV_NODE_IS_USER (flags)
   --    return ((flags) and CV_NODE_USER) /= 0;
   --  arg-macro: function CV_NODE_HAS_NAME (flags)
   --    return ((flags) and CV_NODE_NAMED) /= 0;

   CV_NODE_SEQ_SIMPLE : constant := 256;  --  /usr/include/opencv2/core/types_c.h:1782
   --  arg-macro: function CV_NODE_SEQ_IS_SIMPLE (seq)
   --    return ((seq).flags and CV_NODE_SEQ_SIMPLE) /= 0;

   subtype int64 is sys_types_h.int64_t;  -- /usr/include/opencv2/core/types_c.h:151

   subtype uint64 is stdint_h.uint64_t;  -- /usr/include/opencv2/core/types_c.h:152

   subtype uchar is unsigned_char;  -- /usr/include/opencv2/core/types_c.h:158

   subtype ushort is unsigned_short;  -- /usr/include/opencv2/core/types_c.h:159

   subtype schar is signed_char;  -- /usr/include/opencv2/core/types_c.h:162

   subtype CvArr is System.Address;  -- /usr/include/opencv2/core/types_c.h:184

   type Cv32suf (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            i : aliased int;  -- /usr/include/opencv2/core/types_c.h:188
         when 1 =>
            u : aliased unsigned;  -- /usr/include/opencv2/core/types_c.h:189
         when others =>
            f : aliased float;  -- /usr/include/opencv2/core/types_c.h:190
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, Cv32suf);
   pragma Unchecked_Union (Cv32suf);  -- /usr/include/opencv2/core/types_c.h:186

   type Cv64suf (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            i : aliased int64;  -- /usr/include/opencv2/core/types_c.h:196
         when 1 =>
            u : aliased uint64;  -- /usr/include/opencv2/core/types_c.h:197
         when others =>
            f : aliased double;  -- /usr/include/opencv2/core/types_c.h:198
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, Cv64suf);
   pragma Unchecked_Union (Cv64suf);  -- /usr/include/opencv2/core/types_c.h:194

   subtype CVStatus is int;  -- /usr/include/opencv2/core/types_c.h:202

   function cvRound (value : double) return int;  -- /usr/include/opencv2/core/types_c.h:289
   pragma Import (CPP, cvRound, "_Z7cvRoundd");

   function cvFloor (value : double) return int;  -- /usr/include/opencv2/core/types_c.h:311
   pragma Import (CPP, cvFloor, "_Z7cvFloord");

   function cvCeil (value : double) return int;  -- /usr/include/opencv2/core/types_c.h:329
   pragma Import (CPP, cvCeil, "_Z6cvCeild");

   function cvIsNaN (value : double) return int;  -- /usr/include/opencv2/core/types_c.h:349
   pragma Import (CPP, cvIsNaN, "_Z7cvIsNaNd");

   function cvIsInf (value : double) return int;  -- /usr/include/opencv2/core/types_c.h:364
   pragma Import (CPP, cvIsInf, "_Z7cvIsInfd");

   subtype CvRNG is uint64;  -- /usr/include/opencv2/core/types_c.h:381

   function cvRNG (seed : int64) return CvRNG;  -- /usr/include/opencv2/core/types_c.h:385
   pragma Import (CPP, cvRNG, "_Z5cvRNGl");

   function cvRandInt (rng : access CvRNG) return unsigned;  -- /usr/include/opencv2/core/types_c.h:392
   pragma Import (CPP, cvRandInt, "_Z9cvRandIntPm");

   function cvRandReal (rng : access CvRNG) return double;  -- /usr/include/opencv2/core/types_c.h:401
   pragma Import (CPP, cvRandReal, "_Z10cvRandRealPm");

   subtype u_IplImage_colorModel_array is Interfaces.C.char_array (0 .. 3);
   subtype u_IplImage_channelSeq_array is Interfaces.C.char_array (0 .. 3);
   type u_IplROI;
   type u_IplImage_BorderMode_array is array (0 .. 3) of aliased int;
   type u_IplImage_BorderConst_array is array (0 .. 3) of aliased int;
   type u_IplImage is record
      nSize : aliased int;  -- /usr/include/opencv2/core/types_c.h:449
      ID : aliased int;  -- /usr/include/opencv2/core/types_c.h:450
      nChannels : aliased int;  -- /usr/include/opencv2/core/types_c.h:451
      alphaChannel : aliased int;  -- /usr/include/opencv2/core/types_c.h:452
      depth : aliased int;  -- /usr/include/opencv2/core/types_c.h:453
      colorModel : aliased u_IplImage_colorModel_array;  -- /usr/include/opencv2/core/types_c.h:455
      channelSeq : aliased u_IplImage_channelSeq_array;  -- /usr/include/opencv2/core/types_c.h:456
      dataOrder : aliased int;  -- /usr/include/opencv2/core/types_c.h:457
      origin : aliased int;  -- /usr/include/opencv2/core/types_c.h:459
      align : aliased int;  -- /usr/include/opencv2/core/types_c.h:461
      width : aliased int;  -- /usr/include/opencv2/core/types_c.h:463
      height : aliased int;  -- /usr/include/opencv2/core/types_c.h:464
      roi : access u_IplROI;  -- /usr/include/opencv2/core/types_c.h:465
      maskROI : access u_IplImage;  -- /usr/include/opencv2/core/types_c.h:466
      imageId : System.Address;  -- /usr/include/opencv2/core/types_c.h:467
      tileInfo : System.Address;  -- /usr/include/opencv2/core/types_c.h:468
      imageSize : aliased int;  -- /usr/include/opencv2/core/types_c.h:469
      imageData : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/types_c.h:472
      widthStep : aliased int;  -- /usr/include/opencv2/core/types_c.h:473
      BorderMode : aliased u_IplImage_BorderMode_array;  -- /usr/include/opencv2/core/types_c.h:474
      BorderConst : aliased u_IplImage_BorderConst_array;  -- /usr/include/opencv2/core/types_c.h:475
      imageDataOrigin : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/types_c.h:476
   end record;
   pragma Convention (C_Pass_By_Copy, u_IplImage);  -- /usr/include/opencv2/core/types_c.h:447

   --  skipped empty struct u_IplTileInfo

   subtype IplImage is u_IplImage;

   --  skipped empty struct IplTileInfo

   package Class_u_IplROI is
      type u_IplROI is limited record
         coi : aliased int;  -- /usr/include/opencv2/core/types_c.h:486
         xOffset : aliased int;  -- /usr/include/opencv2/core/types_c.h:487
         yOffset : aliased int;  -- /usr/include/opencv2/core/types_c.h:488
         width : aliased int;  -- /usr/include/opencv2/core/types_c.h:489
         height : aliased int;  -- /usr/include/opencv2/core/types_c.h:490
      end record;
      pragma Import (CPP, u_IplROI);

      --  skipped func _IplROI


   end;
   use Class_u_IplROI;
   subtype IplROI is u_IplROI;

   type u_IplConvKernel is record
      nCols : aliased int;  -- /usr/include/opencv2/core/types_c.h:496
      nRows : aliased int;  -- /usr/include/opencv2/core/types_c.h:497
      anchorX : aliased int;  -- /usr/include/opencv2/core/types_c.h:498
      anchorY : aliased int;  -- /usr/include/opencv2/core/types_c.h:499
      values : access int;  -- /usr/include/opencv2/core/types_c.h:500
      nShiftR : aliased int;  -- /usr/include/opencv2/core/types_c.h:501
   end record;
   pragma Convention (C_Pass_By_Copy, u_IplConvKernel);  -- /usr/include/opencv2/core/types_c.h:494

   subtype IplConvKernel is u_IplConvKernel;

   type u_IplConvKernelFP is record
      nCols : aliased int;  -- /usr/include/opencv2/core/types_c.h:507
      nRows : aliased int;  -- /usr/include/opencv2/core/types_c.h:508
      anchorX : aliased int;  -- /usr/include/opencv2/core/types_c.h:509
      anchorY : aliased int;  -- /usr/include/opencv2/core/types_c.h:510
      values : access float;  -- /usr/include/opencv2/core/types_c.h:511
   end record;
   pragma Convention (C_Pass_By_Copy, u_IplConvKernelFP);  -- /usr/include/opencv2/core/types_c.h:505

   subtype IplConvKernelFP is u_IplConvKernelFP;

   type anon_77 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr : access uchar;  -- /usr/include/opencv2/core/types_c.h:638
         when 1 =>
            s : access short;  -- /usr/include/opencv2/core/types_c.h:639
         when 2 =>
            i : access int;  -- /usr/include/opencv2/core/types_c.h:640
         when 3 =>
            fl : access float;  -- /usr/include/opencv2/core/types_c.h:641
         when others =>
            db : access double;  -- /usr/include/opencv2/core/types_c.h:642
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_77);
   pragma Unchecked_Union (anon_77);
   type anon_78 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            rows : aliased int;  -- /usr/include/opencv2/core/types_c.h:648
         when others =>
            height : aliased int;  -- /usr/include/opencv2/core/types_c.h:649
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_78);
   pragma Unchecked_Union (anon_78);
   type anon_79 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            cols : aliased int;  -- /usr/include/opencv2/core/types_c.h:654
         when others =>
            width : aliased int;  -- /usr/include/opencv2/core/types_c.h:655
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_79);
   pragma Unchecked_Union (anon_79);
   package Class_CvMat is
      type CvMat is limited record
         c_type : aliased int;  -- /usr/include/opencv2/core/types_c.h:629
         step : aliased int;  -- /usr/include/opencv2/core/types_c.h:630
         refcount : access int;  -- /usr/include/opencv2/core/types_c.h:633
         hdr_refcount : aliased int;  -- /usr/include/opencv2/core/types_c.h:634
         data : anon_77;  -- /usr/include/opencv2/core/types_c.h:643
         field_6 : aliased anon_78;
         field_7 : aliased anon_79;
      end record;
      pragma Import (CPP, CvMat);

      function New_CvMat return CvMat;  -- /usr/include/opencv2/core/types_c.h:627
      pragma CPP_Constructor (New_CvMat, "_ZN5CvMatC1Ev");


   end;
   use Class_CvMat;
   function cvMat
     (rows : int;
      cols : int;
      c_type : int;
      data : System.Address) return CvMat;  -- /usr/include/opencv2/core/types_c.h:715
   pragma Import (CPP, cvMat, "_Z5cvMatiiiPv");

   function cvmGet
     (mat : System.Address;
      row : int;
      col : int) return double;  -- /usr/include/opencv2/core/types_c.h:745
   pragma Import (CPP, cvmGet, "_Z6cvmGetPK5CvMatii");

   procedure cvmSet
     (mat : access CvMat;
      row : int;
      col : int;
      value : double);  -- /usr/include/opencv2/core/types_c.h:763
   pragma Import (CPP, cvmSet, "_Z6cvmSetP5CvMatiid");

   function cvIplDepth (c_type : int) return int;  -- /usr/include/opencv2/core/types_c.h:780
   pragma Import (CPP, cvIplDepth, "_Z10cvIplDepthi");

   type CvMatND_dim_array is array (0 .. 31) of aliased anon_81;
   type anon_80 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr : access uchar;  -- /usr/include/opencv2/core/types_c.h:808
         when 1 =>
            fl : access float;  -- /usr/include/opencv2/core/types_c.h:809
         when 2 =>
            db : access double;  -- /usr/include/opencv2/core/types_c.h:810
         when 3 =>
            i : access int;  -- /usr/include/opencv2/core/types_c.h:811
         when others =>
            s : access short;  -- /usr/include/opencv2/core/types_c.h:812
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_80);
   pragma Unchecked_Union (anon_80);
   type anon_81 is record
      size : aliased int;  -- /usr/include/opencv2/core/types_c.h:817
      step : aliased int;  -- /usr/include/opencv2/core/types_c.h:818
   end record;
   pragma Convention (C_Pass_By_Copy, anon_81);
   type CvMatND is record
      c_type : aliased int;  -- /usr/include/opencv2/core/types_c.h:800
      dims : aliased int;  -- /usr/include/opencv2/core/types_c.h:801
      refcount : access int;  -- /usr/include/opencv2/core/types_c.h:803
      hdr_refcount : aliased int;  -- /usr/include/opencv2/core/types_c.h:804
      data : anon_80;  -- /usr/include/opencv2/core/types_c.h:813
      dim : aliased CvMatND_dim_array;  -- /usr/include/opencv2/core/types_c.h:820
   end record;
   pragma Convention (C_Pass_By_Copy, CvMatND);  -- /usr/include/opencv2/core/types_c.h:798

   type CvSet;
   type CvSparseMat_size_array is array (0 .. 31) of aliased int;
   type CvSparseMat is record
      c_type : aliased int;  -- /usr/include/opencv2/core/types_c.h:842
      dims : aliased int;  -- /usr/include/opencv2/core/types_c.h:843
      refcount : access int;  -- /usr/include/opencv2/core/types_c.h:844
      hdr_refcount : aliased int;  -- /usr/include/opencv2/core/types_c.h:845
      heap : access CvSet;  -- /usr/include/opencv2/core/types_c.h:847
      hashtable : System.Address;  -- /usr/include/opencv2/core/types_c.h:848
      hashsize : aliased int;  -- /usr/include/opencv2/core/types_c.h:849
      valoffset : aliased int;  -- /usr/include/opencv2/core/types_c.h:850
      idxoffset : aliased int;  -- /usr/include/opencv2/core/types_c.h:851
      size : aliased CvSparseMat_size_array;  -- /usr/include/opencv2/core/types_c.h:852
   end record;
   pragma Convention (C_Pass_By_Copy, CvSparseMat);  -- /usr/include/opencv2/core/types_c.h:840

   type CvSparseNode is record
      hashval : aliased unsigned;  -- /usr/include/opencv2/core/types_c.h:867
      next : access CvSparseNode;  -- /usr/include/opencv2/core/types_c.h:868
   end record;
   pragma Convention (C_Pass_By_Copy, CvSparseNode);  -- /usr/include/opencv2/core/types_c.h:865

   type CvSparseMatIterator is record
      mat : access CvSparseMat;  -- /usr/include/opencv2/core/types_c.h:874
      node : access CvSparseNode;  -- /usr/include/opencv2/core/types_c.h:875
      curidx : aliased int;  -- /usr/include/opencv2/core/types_c.h:876
   end record;
   pragma Convention (C_Pass_By_Copy, CvSparseMatIterator);  -- /usr/include/opencv2/core/types_c.h:872

   subtype CvHistType is int;  -- /usr/include/opencv2/core/types_c.h:887

   type CvHistogram_thresh_array is array (0 .. 31, 0 .. 1) of aliased float;
   type CvHistogram is record
      c_type : aliased int;  -- /usr/include/opencv2/core/types_c.h:905
      bins : System.Address;  -- /usr/include/opencv2/core/types_c.h:906
      thresh : aliased CvHistogram_thresh_array;  -- /usr/include/opencv2/core/types_c.h:907
      thresh2 : System.Address;  -- /usr/include/opencv2/core/types_c.h:908
      mat : aliased CvMatND;  -- /usr/include/opencv2/core/types_c.h:909
   end record;
   pragma Convention (C_Pass_By_Copy, CvHistogram);  -- /usr/include/opencv2/core/types_c.h:903

   package Class_CvRect is
      type CvRect is limited record
         x : aliased int;  -- /usr/include/opencv2/core/types_c.h:935
         y : aliased int;  -- /usr/include/opencv2/core/types_c.h:936
         width : aliased int;  -- /usr/include/opencv2/core/types_c.h:937
         height : aliased int;  -- /usr/include/opencv2/core/types_c.h:938
      end record;
      pragma Import (CPP, CvRect);

      function New_CvRect return CvRect;  -- /usr/include/opencv2/core/types_c.h:933
      pragma CPP_Constructor (New_CvRect, "_ZN6CvRectC1Ev");


   end;
   use Class_CvRect;
   function cvRect
     (x : int;
      y : int;
      width : int;
      height : int) return CvRect;  -- /usr/include/opencv2/core/types_c.h:942
   pragma Import (CPP, cvRect, "_Z6cvRectiiii");

   function cvRectToROI (rect : CvRect; coi : int) return IplROI;  -- /usr/include/opencv2/core/types_c.h:955
   pragma Import (CPP, cvRectToROI, "_Z11cvRectToROI6CvRecti");

   function cvROIToRect (roi : IplROI) return CvRect;  -- /usr/include/opencv2/core/types_c.h:968
   pragma Import (CPP, cvROIToRect, "_Z11cvROIToRect7_IplROI");

   package Class_CvTermCriteria is
      type CvTermCriteria is limited record
         c_type : aliased int;  -- /usr/include/opencv2/core/types_c.h:981
         max_iter : aliased int;  -- /usr/include/opencv2/core/types_c.h:984
         epsilon : aliased double;  -- /usr/include/opencv2/core/types_c.h:985
      end record;
      pragma Import (CPP, CvTermCriteria);

      function New_CvTermCriteria return CvTermCriteria;  -- /usr/include/opencv2/core/types_c.h:979
      pragma CPP_Constructor (New_CvTermCriteria, "_ZN14CvTermCriteriaC1Ev");


   end;
   use Class_CvTermCriteria;
   function cvTermCriteria
     (c_type : int;
      max_iter : int;
      epsilon : double) return CvTermCriteria;  -- /usr/include/opencv2/core/types_c.h:989
   pragma Import (CPP, cvTermCriteria, "_Z14cvTermCriteriaiid");

   package Class_CvPoint is
      type CvPoint is limited record
         x : aliased int;  -- /usr/include/opencv2/core/types_c.h:1005
         y : aliased int;  -- /usr/include/opencv2/core/types_c.h:1006
      end record;
      pragma Import (CPP, CvPoint);

      function operator_as (this : access CvPoint; arg2 : access constant CvPoint) return access CvPoint;  -- /usr/include/opencv2/core/types_c.h:1003
      pragma Import (CPP, operator_as, "_ZN7CvPointaSERKS_");

      function New_CvPoint return CvPoint;  -- /usr/include/opencv2/core/types_c.h:1003
      pragma CPP_Constructor (New_CvPoint, "_ZN7CvPointC1Ev");


   end;
   use Class_CvPoint;
   function cvPoint (x : int; y : int) return CvPoint;  -- /usr/include/opencv2/core/types_c.h:1011
   pragma Import (CPP, cvPoint, "_Z7cvPointii");

   package Class_CvPoint2D32f is
      type CvPoint2D32f is limited record
         x : aliased float;  -- /usr/include/opencv2/core/types_c.h:1024
         y : aliased float;  -- /usr/include/opencv2/core/types_c.h:1025
      end record;
      pragma Import (CPP, CvPoint2D32f);

      function operator_as (this : access CvPoint2D32f; arg2 : access constant CvPoint2D32f) return access CvPoint2D32f;  -- /usr/include/opencv2/core/types_c.h:1022
      pragma Import (CPP, operator_as, "_ZN12CvPoint2D32faSERKS_");

      function New_CvPoint2D32f return CvPoint2D32f;  -- /usr/include/opencv2/core/types_c.h:1022
      pragma CPP_Constructor (New_CvPoint2D32f, "_ZN12CvPoint2D32fC1Ev");


   end;
   use Class_CvPoint2D32f;
   function cvPoint2D32f (x : double; y : double) return CvPoint2D32f;  -- /usr/include/opencv2/core/types_c.h:1030
   pragma Import (CPP, cvPoint2D32f, "_Z12cvPoint2D32fdd");

   function cvPointTo32f (point : CvPoint) return CvPoint2D32f;  -- /usr/include/opencv2/core/types_c.h:1041
   pragma Import (CPP, cvPointTo32f, "_Z12cvPointTo32f7CvPoint");

   function cvPointFrom32f (point : CvPoint2D32f) return CvPoint;  -- /usr/include/opencv2/core/types_c.h:1047
   pragma Import (CPP, cvPointFrom32f, "_Z14cvPointFrom32f12CvPoint2D32f");

   package Class_CvPoint3D32f is
      type CvPoint3D32f is limited record
         x : aliased float;  -- /usr/include/opencv2/core/types_c.h:1059
         y : aliased float;  -- /usr/include/opencv2/core/types_c.h:1060
         z : aliased float;  -- /usr/include/opencv2/core/types_c.h:1061
      end record;
      pragma Import (CPP, CvPoint3D32f);

      function New_CvPoint3D32f return CvPoint3D32f;  -- /usr/include/opencv2/core/types_c.h:1057
      pragma CPP_Constructor (New_CvPoint3D32f, "_ZN12CvPoint3D32fC1Ev");


   end;
   use Class_CvPoint3D32f;
   function cvPoint3D32f
     (x : double;
      y : double;
      z : double) return CvPoint3D32f;  -- /usr/include/opencv2/core/types_c.h:1066
   pragma Import (CPP, cvPoint3D32f, "_Z12cvPoint3D32fddd");

   package Class_CvPoint2D64f is
      type CvPoint2D64f is limited record
         x : aliased double;  -- /usr/include/opencv2/core/types_c.h:1080
         y : aliased double;  -- /usr/include/opencv2/core/types_c.h:1081
      end record;
      pragma Import (CPP, CvPoint2D64f);

      function New_CvPoint2D64f return CvPoint2D64f;  -- /usr/include/opencv2/core/types_c.h:1078
      pragma CPP_Constructor (New_CvPoint2D64f, "_ZN12CvPoint2D64fC1Ev");


   end;
   use Class_CvPoint2D64f;
   function cvPoint2D64f (x : double; y : double) return CvPoint2D64f;  -- /usr/include/opencv2/core/types_c.h:1086
   pragma Import (CPP, cvPoint2D64f, "_Z12cvPoint2D64fdd");

   package Class_CvPoint3D64f is
      type CvPoint3D64f is limited record
         x : aliased double;  -- /usr/include/opencv2/core/types_c.h:1099
         y : aliased double;  -- /usr/include/opencv2/core/types_c.h:1100
         z : aliased double;  -- /usr/include/opencv2/core/types_c.h:1101
      end record;
      pragma Import (CPP, CvPoint3D64f);

      function New_CvPoint3D64f return CvPoint3D64f;  -- /usr/include/opencv2/core/types_c.h:1097
      pragma CPP_Constructor (New_CvPoint3D64f, "_ZN12CvPoint3D64fC1Ev");


   end;
   use Class_CvPoint3D64f;
   function cvPoint3D64f
     (x : double;
      y : double;
      z : double) return CvPoint3D64f;  -- /usr/include/opencv2/core/types_c.h:1106
   pragma Import (CPP, cvPoint3D64f, "_Z12cvPoint3D64fddd");

   package Class_CvSize is
      type CvSize is limited record
         width : aliased int;  -- /usr/include/opencv2/core/types_c.h:1122
         height : aliased int;  -- /usr/include/opencv2/core/types_c.h:1123
      end record;
      pragma Import (CPP, CvSize);

      function New_CvSize return CvSize;  -- /usr/include/opencv2/core/types_c.h:1125
      pragma CPP_Constructor (New_CvSize, "_ZN6CvSizeC1Ev");


   end;
   use Class_CvSize;
   --  skipped anonymous struct anon_82

   function cvSize (width : int; height : int) return CvSize;  -- /usr/include/opencv2/core/types_c.h:1127
   pragma Import (CPP, cvSize, "_Z6cvSizeii");

   package Class_CvSize2D32f is
      type CvSize2D32f is limited record
         width : aliased float;  -- /usr/include/opencv2/core/types_c.h:1139
         height : aliased float;  -- /usr/include/opencv2/core/types_c.h:1140
      end record;
      pragma Import (CPP, CvSize2D32f);

      function operator_as (this : access CvSize2D32f; arg2 : access constant CvSize2D32f) return access CvSize2D32f;  -- /usr/include/opencv2/core/types_c.h:1137
      pragma Import (CPP, operator_as, "_ZN11CvSize2D32faSERKS_");

      function New_CvSize2D32f return CvSize2D32f;  -- /usr/include/opencv2/core/types_c.h:1137
      pragma CPP_Constructor (New_CvSize2D32f, "_ZN11CvSize2D32fC1Ev");


   end;
   use Class_CvSize2D32f;
   function cvSize2D32f (width : double; height : double) return CvSize2D32f;  -- /usr/include/opencv2/core/types_c.h:1145
   pragma Import (CPP, cvSize2D32f, "_Z11cvSize2D32fdd");

   package Class_CvBox2D is
      type CvBox2D is limited record
         center : aliased CvPoint2D32f;  -- /usr/include/opencv2/core/types_c.h:1157
         size : aliased CvSize2D32f;  -- /usr/include/opencv2/core/types_c.h:1158
         angle : aliased float;  -- /usr/include/opencv2/core/types_c.h:1159
      end record;
      pragma Import (CPP, CvBox2D);

      function New_CvBox2D return CvBox2D;  -- /usr/include/opencv2/core/types_c.h:1155
      pragma CPP_Constructor (New_CvBox2D, "_ZN7CvBox2DC1Ev");


   end;
   use Class_CvBox2D;
   type CvLineIterator is record
      ptr : access uchar;  -- /usr/include/opencv2/core/types_c.h:1169
      err : aliased int;  -- /usr/include/opencv2/core/types_c.h:1172
      plus_delta : aliased int;  -- /usr/include/opencv2/core/types_c.h:1173
      minus_delta : aliased int;  -- /usr/include/opencv2/core/types_c.h:1174
      plus_step : aliased int;  -- /usr/include/opencv2/core/types_c.h:1175
      minus_step : aliased int;  -- /usr/include/opencv2/core/types_c.h:1176
   end record;
   pragma Convention (C_Pass_By_Copy, CvLineIterator);  -- /usr/include/opencv2/core/types_c.h:1166

   package Class_CvSlice is
      type CvSlice is limited record
         start_index : aliased int;  -- /usr/include/opencv2/core/types_c.h:1186
         end_index : aliased int;  -- /usr/include/opencv2/core/types_c.h:1186
      end record;
      pragma Import (CPP, CvSlice);

      function New_CvSlice return CvSlice;  -- /usr/include/opencv2/core/types_c.h:1184
      pragma CPP_Constructor (New_CvSlice, "_ZN7CvSliceC1Ev");


   end;
   use Class_CvSlice;
   function cvSlice (start : int; c_end : int) return CvSlice;  -- /usr/include/opencv2/core/types_c.h:1190
   pragma Import (CPP, cvSlice, "_Z7cvSliceii");

   type CvScalar_val_array is array (0 .. 3) of aliased double;
   package Class_CvScalar is
      type CvScalar is limited record
         val : aliased CvScalar_val_array;  -- /usr/include/opencv2/core/types_c.h:1207
      end record;
      pragma Import (CPP, CvScalar);

      function New_CvScalar return CvScalar;  -- /usr/include/opencv2/core/types_c.h:1205
      pragma CPP_Constructor (New_CvScalar, "_ZN8CvScalarC1Ev");


   end;
   use Class_CvScalar;
   function cvScalar
     (val0 : double;
      val1 : double;
      val2 : double;
      val3 : double) return CvScalar;  -- /usr/include/opencv2/core/types_c.h:1211
   pragma Import (CPP, cvScalar, "_Z8cvScalardddd");

   function cvRealScalar (val0 : double) return CvScalar;  -- /usr/include/opencv2/core/types_c.h:1221
   pragma Import (CPP, cvRealScalar, "_Z12cvRealScalard");

   function cvScalarAll (val0123 : double) return CvScalar;  -- /usr/include/opencv2/core/types_c.h:1229
   pragma Import (CPP, cvScalarAll, "_Z11cvScalarAlld");

   type CvMemBlock is record
      prev : access CvMemBlock;  -- /usr/include/opencv2/core/types_c.h:1247
      next : access CvMemBlock;  -- /usr/include/opencv2/core/types_c.h:1248
   end record;
   pragma Convention (C_Pass_By_Copy, CvMemBlock);  -- /usr/include/opencv2/core/types_c.h:1245

   type CvMemStorage is record
      signature : aliased int;  -- /usr/include/opencv2/core/types_c.h:1256
      bottom : access CvMemBlock;  -- /usr/include/opencv2/core/types_c.h:1257
      top : access CvMemBlock;  -- /usr/include/opencv2/core/types_c.h:1258
      parent : access CvMemStorage;  -- /usr/include/opencv2/core/types_c.h:1259
      block_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1260
      free_space : aliased int;  -- /usr/include/opencv2/core/types_c.h:1261
   end record;
   pragma Convention (C_Pass_By_Copy, CvMemStorage);  -- /usr/include/opencv2/core/types_c.h:1254

   type CvMemStoragePos is record
      top : access CvMemBlock;  -- /usr/include/opencv2/core/types_c.h:1272
      free_space : aliased int;  -- /usr/include/opencv2/core/types_c.h:1273
   end record;
   pragma Convention (C_Pass_By_Copy, CvMemStoragePos);  -- /usr/include/opencv2/core/types_c.h:1270

   type CvSeqBlock is record
      prev : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1282
      next : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1283
      start_index : aliased int;  -- /usr/include/opencv2/core/types_c.h:1284
      count : aliased int;  -- /usr/include/opencv2/core/types_c.h:1286
      data : access schar;  -- /usr/include/opencv2/core/types_c.h:1287
   end record;
   pragma Convention (C_Pass_By_Copy, CvSeqBlock);  -- /usr/include/opencv2/core/types_c.h:1280

   type CvSeq is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1317
      header_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1317
      h_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1317
      h_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1317
      v_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1317
      v_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1317
      total : aliased int;  -- /usr/include/opencv2/core/types_c.h:1317
      elem_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1317
      block_max : access schar;  -- /usr/include/opencv2/core/types_c.h:1317
      ptr : access schar;  -- /usr/include/opencv2/core/types_c.h:1317
      delta_elems : aliased int;  -- /usr/include/opencv2/core/types_c.h:1317
      storage : access CvMemStorage;  -- /usr/include/opencv2/core/types_c.h:1317
      free_blocks : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1317
      first : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1317
   end record;
   pragma Convention (C_Pass_By_Copy, CvSeq);  -- /usr/include/opencv2/core/types_c.h:1315

   type CvSetElem is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1337
      next_free : access CvSetElem;  -- /usr/include/opencv2/core/types_c.h:1337
   end record;
   pragma Convention (C_Pass_By_Copy, CvSetElem);  -- /usr/include/opencv2/core/types_c.h:1335

   type CvSet is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1348
      header_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1348
      h_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1348
      h_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1348
      v_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1348
      v_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1348
      total : aliased int;  -- /usr/include/opencv2/core/types_c.h:1348
      elem_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1348
      block_max : access schar;  -- /usr/include/opencv2/core/types_c.h:1348
      ptr : access schar;  -- /usr/include/opencv2/core/types_c.h:1348
      delta_elems : aliased int;  -- /usr/include/opencv2/core/types_c.h:1348
      storage : access CvMemStorage;  -- /usr/include/opencv2/core/types_c.h:1348
      free_blocks : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1348
      first : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1348
      free_elems : access CvSetElem;  -- /usr/include/opencv2/core/types_c.h:1348
      active_count : aliased int;  -- /usr/include/opencv2/core/types_c.h:1348
   end record;
   pragma Convention (C_Pass_By_Copy, CvSet);  -- /usr/include/opencv2/core/types_c.h:1346

   type CvGraphEdge_next_array is array (0 .. 1) of System.Address;
   type CvGraphEdge_vtx_array is array (0 .. 1) of System.Address;
   type CvGraphEdge is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1393
      weight : aliased float;  -- /usr/include/opencv2/core/types_c.h:1393
      next : aliased CvGraphEdge_next_array;  -- /usr/include/opencv2/core/types_c.h:1393
      vtx : aliased CvGraphEdge_vtx_array;  -- /usr/include/opencv2/core/types_c.h:1393
   end record;
   pragma Convention (C_Pass_By_Copy, CvGraphEdge);  -- /usr/include/opencv2/core/types_c.h:1391

   type CvGraphVtx is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1399
      first : access CvGraphEdge;  -- /usr/include/opencv2/core/types_c.h:1399
   end record;
   pragma Convention (C_Pass_By_Copy, CvGraphVtx);  -- /usr/include/opencv2/core/types_c.h:1397

   type CvGraphVtx2D is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1405
      first : access CvGraphEdge;  -- /usr/include/opencv2/core/types_c.h:1405
      ptr : access CvPoint2D32f;  -- /usr/include/opencv2/core/types_c.h:1406
   end record;
   pragma Convention (C_Pass_By_Copy, CvGraphVtx2D);  -- /usr/include/opencv2/core/types_c.h:1403

   type CvGraph is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1420
      header_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1420
      h_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1420
      h_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1420
      v_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1420
      v_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1420
      total : aliased int;  -- /usr/include/opencv2/core/types_c.h:1420
      elem_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1420
      block_max : access schar;  -- /usr/include/opencv2/core/types_c.h:1420
      ptr : access schar;  -- /usr/include/opencv2/core/types_c.h:1420
      delta_elems : aliased int;  -- /usr/include/opencv2/core/types_c.h:1420
      storage : access CvMemStorage;  -- /usr/include/opencv2/core/types_c.h:1420
      free_blocks : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1420
      first : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1420
      free_elems : access CvSetElem;  -- /usr/include/opencv2/core/types_c.h:1420
      active_count : aliased int;  -- /usr/include/opencv2/core/types_c.h:1420
      edges : access CvSet;  -- /usr/include/opencv2/core/types_c.h:1420
   end record;
   pragma Convention (C_Pass_By_Copy, CvGraph);  -- /usr/include/opencv2/core/types_c.h:1418

   type CvChain is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1430
      header_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1430
      h_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1430
      h_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1430
      v_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1430
      v_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1430
      total : aliased int;  -- /usr/include/opencv2/core/types_c.h:1430
      elem_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1430
      block_max : access schar;  -- /usr/include/opencv2/core/types_c.h:1430
      ptr : access schar;  -- /usr/include/opencv2/core/types_c.h:1430
      delta_elems : aliased int;  -- /usr/include/opencv2/core/types_c.h:1430
      storage : access CvMemStorage;  -- /usr/include/opencv2/core/types_c.h:1430
      free_blocks : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1430
      first : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1430
      origin : aliased CvPoint;  -- /usr/include/opencv2/core/types_c.h:1431
   end record;
   pragma Convention (C_Pass_By_Copy, CvChain);  -- /usr/include/opencv2/core/types_c.h:1428

   type CvContour_reserved_array is array (0 .. 2) of aliased int;
   type CvContour is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1443
      header_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1443
      h_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1443
      h_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1443
      v_prev : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1443
      v_next : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1443
      total : aliased int;  -- /usr/include/opencv2/core/types_c.h:1443
      elem_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1443
      block_max : access schar;  -- /usr/include/opencv2/core/types_c.h:1443
      ptr : access schar;  -- /usr/include/opencv2/core/types_c.h:1443
      delta_elems : aliased int;  -- /usr/include/opencv2/core/types_c.h:1443
      storage : access CvMemStorage;  -- /usr/include/opencv2/core/types_c.h:1443
      free_blocks : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1443
      first : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1443
      rect : aliased CvRect;  -- /usr/include/opencv2/core/types_c.h:1443
      color : aliased int;  -- /usr/include/opencv2/core/types_c.h:1443
      reserved : aliased CvContour_reserved_array;  -- /usr/include/opencv2/core/types_c.h:1443
   end record;
   pragma Convention (C_Pass_By_Copy, CvContour);  -- /usr/include/opencv2/core/types_c.h:1441

   subtype CvPoint2DSeq is CvContour;

   type CvSeqWriter is record
      header_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1586
      seq : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1586
      block : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1586
      ptr : access schar;  -- /usr/include/opencv2/core/types_c.h:1586
      block_min : access schar;  -- /usr/include/opencv2/core/types_c.h:1586
      block_max : access schar;  -- /usr/include/opencv2/core/types_c.h:1586
   end record;
   pragma Convention (C_Pass_By_Copy, CvSeqWriter);  -- /usr/include/opencv2/core/types_c.h:1584

   type CvSeqReader is record
      header_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1604
      seq : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1604
      block : access CvSeqBlock;  -- /usr/include/opencv2/core/types_c.h:1604
      ptr : access schar;  -- /usr/include/opencv2/core/types_c.h:1604
      block_min : access schar;  -- /usr/include/opencv2/core/types_c.h:1604
      block_max : access schar;  -- /usr/include/opencv2/core/types_c.h:1604
      delta_index : aliased int;  -- /usr/include/opencv2/core/types_c.h:1604
      prev_elem : access schar;  -- /usr/include/opencv2/core/types_c.h:1604
   end record;
   pragma Convention (C_Pass_By_Copy, CvSeqReader);  -- /usr/include/opencv2/core/types_c.h:1602

   --  skipped empty struct CvFileStorage

   package Class_CvAttrList is
      type CvAttrList is limited record
         attr : System.Address;  -- /usr/include/opencv2/core/types_c.h:1734
         next : access CvAttrList;  -- /usr/include/opencv2/core/types_c.h:1735
      end record;
      pragma Import (CPP, CvAttrList);

      function New_CvAttrList return CvAttrList;  -- /usr/include/opencv2/core/types_c.h:1732
      pragma CPP_Constructor (New_CvAttrList, "_ZN10CvAttrListC1Ev");


   end;
   use Class_CvAttrList;
   function cvAttrList (attr : System.Address; next : access CvAttrList) return CvAttrList;  -- /usr/include/opencv2/core/types_c.h:1739
   pragma Import (CPP, cvAttrList, "_Z10cvAttrListPPKcP10CvAttrList");

   type CvString is record
      len : aliased int;  -- /usr/include/opencv2/core/types_c.h:1787
      ptr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/types_c.h:1788
   end record;
   pragma Convention (C_Pass_By_Copy, CvString);  -- /usr/include/opencv2/core/types_c.h:1785

   type CvStringHashNode is record
      hashval : aliased unsigned;  -- /usr/include/opencv2/core/types_c.h:1796
      str : aliased CvString;  -- /usr/include/opencv2/core/types_c.h:1797
      next : access CvStringHashNode;  -- /usr/include/opencv2/core/types_c.h:1798
   end record;
   pragma Convention (C_Pass_By_Copy, CvStringHashNode);  -- /usr/include/opencv2/core/types_c.h:1794

   --  skipped empty struct CvGenericHash

   --  skipped empty struct CvFileNodeHash

   type CvTypeInfo;
   type anon_83 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            f : aliased double;  -- /usr/include/opencv2/core/types_c.h:1812
         when 1 =>
            i : aliased int;  -- /usr/include/opencv2/core/types_c.h:1813
         when 2 =>
            str : aliased CvString;  -- /usr/include/opencv2/core/types_c.h:1814
         when 3 =>
            seq : access CvSeq;  -- /usr/include/opencv2/core/types_c.h:1815
         when others =>
            map : System.Address;  -- /usr/include/opencv2/core/types_c.h:1816
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_83);
   pragma Unchecked_Union (anon_83);
   type CvFileNode is record
      tag : aliased int;  -- /usr/include/opencv2/core/types_c.h:1807
      info : access CvTypeInfo;  -- /usr/include/opencv2/core/types_c.h:1808
      data : anon_83;  -- /usr/include/opencv2/core/types_c.h:1817
   end record;
   pragma Convention (C_Pass_By_Copy, CvFileNode);  -- /usr/include/opencv2/core/types_c.h:1805

   type CvIsInstanceFunc is access function (arg1 : System.Address) return int;
   pragma Convention (C, CvIsInstanceFunc);  -- /usr/include/opencv2/core/types_c.h:1824

   type CvReleaseFunc is access procedure (arg1 : System.Address);
   pragma Convention (C, CvReleaseFunc);  -- /usr/include/opencv2/core/types_c.h:1825

   type CvReadFunc is access function (arg1 : System.Address; arg2 : access CvFileNode) return System.Address;
   pragma Convention (C, CvReadFunc);  -- /usr/include/opencv2/core/types_c.h:1826

   type CvWriteFunc is access procedure
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address;
         arg4 : CvAttrList);
   pragma Convention (C, CvWriteFunc);  -- /usr/include/opencv2/core/types_c.h:1827

   type CvCloneFunc is access function (arg1 : System.Address) return System.Address;
   pragma Convention (C, CvCloneFunc);  -- /usr/include/opencv2/core/types_c.h:1829

   type CvTypeInfo is record
      flags : aliased int;  -- /usr/include/opencv2/core/types_c.h:1836
      header_size : aliased int;  -- /usr/include/opencv2/core/types_c.h:1837
      prev : access CvTypeInfo;  -- /usr/include/opencv2/core/types_c.h:1838
      next : access CvTypeInfo;  -- /usr/include/opencv2/core/types_c.h:1839
      type_name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/types_c.h:1840
      is_instance : CvIsInstanceFunc;  -- /usr/include/opencv2/core/types_c.h:1841
      release : CvReleaseFunc;  -- /usr/include/opencv2/core/types_c.h:1842
      read : CvReadFunc;  -- /usr/include/opencv2/core/types_c.h:1843
      write : CvWriteFunc;  -- /usr/include/opencv2/core/types_c.h:1844
      clone : CvCloneFunc;  -- /usr/include/opencv2/core/types_c.h:1845
   end record;
   pragma Convention (C_Pass_By_Copy, CvTypeInfo);  -- /usr/include/opencv2/core/types_c.h:1834

   type CvPluginFuncInfo is record
      func_addr : System.Address;  -- /usr/include/opencv2/core/types_c.h:1854
      default_func_addr : System.Address;  -- /usr/include/opencv2/core/types_c.h:1855
      func_names : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/types_c.h:1856
      search_modules : aliased int;  -- /usr/include/opencv2/core/types_c.h:1857
      loaded_from : aliased int;  -- /usr/include/opencv2/core/types_c.h:1858
   end record;
   pragma Convention (C_Pass_By_Copy, CvPluginFuncInfo);  -- /usr/include/opencv2/core/types_c.h:1852

   type CvModuleInfo is record
      next : access CvModuleInfo;  -- /usr/include/opencv2/core/types_c.h:1864
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/types_c.h:1865
      version : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/types_c.h:1866
      func_tab : access CvPluginFuncInfo;  -- /usr/include/opencv2/core/types_c.h:1867
   end record;
   pragma Convention (C_Pass_By_Copy, CvModuleInfo);  -- /usr/include/opencv2/core/types_c.h:1862

end opencv2_core_types_c_h;
