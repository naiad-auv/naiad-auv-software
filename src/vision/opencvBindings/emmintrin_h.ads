pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package emmintrin_h is

   subtype uu_v2df is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/emmintrin.h:39

   subtype uu_v2di is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/emmintrin.h:40

   subtype uu_v4si is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/emmintrin.h:41

   subtype uu_v8hi is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/emmintrin.h:42

   subtype uu_v16qi is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/emmintrin.h:43

   subtype uu_m128i is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/emmintrin.h:47

   subtype uu_m128d is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/emmintrin.h:48

   --  skipped func _mm_set_sd

   --  skipped func _mm_set1_pd

   --  skipped func _mm_set_pd1

   --  skipped func _mm_set_pd

   --  skipped func _mm_setr_pd

   --  skipped func _mm_setzero_pd

   --  skipped func _mm_move_sd

   --  skipped func _mm_load_pd

   --  skipped func _mm_loadu_pd

   --  skipped func _mm_load1_pd

   --  skipped func _mm_load_sd

   --  skipped func _mm_load_pd1

   --  skipped func _mm_loadr_pd

   --  skipped func _mm_store_pd

   --  skipped func _mm_storeu_pd

   --  skipped func _mm_store_sd

   --  skipped func _mm_cvtsd_f64

   --  skipped func _mm_storel_pd

   --  skipped func _mm_storeh_pd

   --  skipped func _mm_store1_pd

   --  skipped func _mm_store_pd1

   --  skipped func _mm_storer_pd

   --  skipped func _mm_cvtsi128_si32

   --  skipped func _mm_cvtsi128_si64

   --  skipped func _mm_cvtsi128_si64x

   --  skipped func _mm_add_pd

   --  skipped func _mm_add_sd

   --  skipped func _mm_sub_pd

   --  skipped func _mm_sub_sd

   --  skipped func _mm_mul_pd

   --  skipped func _mm_mul_sd

   --  skipped func _mm_div_pd

   --  skipped func _mm_div_sd

   --  skipped func _mm_sqrt_pd

   --  skipped func _mm_sqrt_sd

   --  skipped func _mm_min_pd

   --  skipped func _mm_min_sd

   --  skipped func _mm_max_pd

   --  skipped func _mm_max_sd

   --  skipped func _mm_and_pd

   --  skipped func _mm_andnot_pd

   --  skipped func _mm_or_pd

   --  skipped func _mm_xor_pd

   --  skipped func _mm_cmpeq_pd

   --  skipped func _mm_cmplt_pd

   --  skipped func _mm_cmple_pd

   --  skipped func _mm_cmpgt_pd

   --  skipped func _mm_cmpge_pd

   --  skipped func _mm_cmpneq_pd

   --  skipped func _mm_cmpnlt_pd

   --  skipped func _mm_cmpnle_pd

   --  skipped func _mm_cmpngt_pd

   --  skipped func _mm_cmpnge_pd

   --  skipped func _mm_cmpord_pd

   --  skipped func _mm_cmpunord_pd

   --  skipped func _mm_cmpeq_sd

   --  skipped func _mm_cmplt_sd

   --  skipped func _mm_cmple_sd

   --  skipped func _mm_cmpgt_sd

   --  skipped func _mm_cmpge_sd

   --  skipped func _mm_cmpneq_sd

   --  skipped func _mm_cmpnlt_sd

   --  skipped func _mm_cmpnle_sd

   --  skipped func _mm_cmpngt_sd

   --  skipped func _mm_cmpnge_sd

   --  skipped func _mm_cmpord_sd

   --  skipped func _mm_cmpunord_sd

   --  skipped func _mm_comieq_sd

   --  skipped func _mm_comilt_sd

   --  skipped func _mm_comile_sd

   --  skipped func _mm_comigt_sd

   --  skipped func _mm_comige_sd

   --  skipped func _mm_comineq_sd

   --  skipped func _mm_ucomieq_sd

   --  skipped func _mm_ucomilt_sd

   --  skipped func _mm_ucomile_sd

   --  skipped func _mm_ucomigt_sd

   --  skipped func _mm_ucomige_sd

   --  skipped func _mm_ucomineq_sd

   --  skipped func _mm_set_epi64x

   --  skipped func _mm_set_epi64

   --  skipped func _mm_set_epi32

   --  skipped func _mm_set_epi16

   --  skipped func _mm_set_epi8

   --  skipped func _mm_set1_epi64x

   --  skipped func _mm_set1_epi64

   --  skipped func _mm_set1_epi32

   --  skipped func _mm_set1_epi16

   --  skipped func _mm_set1_epi8

   --  skipped func _mm_setr_epi64

   --  skipped func _mm_setr_epi32

   --  skipped func _mm_setr_epi16

   --  skipped func _mm_setr_epi8

   --  skipped func _mm_load_si128

   --  skipped func _mm_loadu_si128

   --  skipped func _mm_loadl_epi64

   --  skipped func _mm_store_si128

   --  skipped func _mm_storeu_si128

   --  skipped func _mm_storel_epi64

   --  skipped func _mm_movepi64_pi64

   --  skipped func _mm_movpi64_epi64

   --  skipped func _mm_move_epi64

   --  skipped func _mm_setzero_si128

   --  skipped func _mm_cvtepi32_pd

   --  skipped func _mm_cvtepi32_ps

   --  skipped func _mm_cvtpd_epi32

   --  skipped func _mm_cvtpd_pi32

   --  skipped func _mm_cvtpd_ps

   --  skipped func _mm_cvttpd_epi32

   --  skipped func _mm_cvttpd_pi32

   --  skipped func _mm_cvtpi32_pd

   --  skipped func _mm_cvtps_epi32

   --  skipped func _mm_cvttps_epi32

   --  skipped func _mm_cvtps_pd

   --  skipped func _mm_cvtsd_si32

   --  skipped func _mm_cvtsd_si64

   --  skipped func _mm_cvtsd_si64x

   --  skipped func _mm_cvttsd_si32

   --  skipped func _mm_cvttsd_si64

   --  skipped func _mm_cvttsd_si64x

   --  skipped func _mm_cvtsd_ss

   --  skipped func _mm_cvtsi32_sd

   --  skipped func _mm_cvtsi64_sd

   --  skipped func _mm_cvtsi64x_sd

   --  skipped func _mm_cvtss_sd

   --  skipped func _mm_unpackhi_pd

   --  skipped func _mm_unpacklo_pd

   --  skipped func _mm_loadh_pd

   --  skipped func _mm_loadl_pd

   --  skipped func _mm_movemask_pd

   --  skipped func _mm_packs_epi16

   --  skipped func _mm_packs_epi32

   --  skipped func _mm_packus_epi16

   --  skipped func _mm_unpackhi_epi8

   --  skipped func _mm_unpackhi_epi16

   --  skipped func _mm_unpackhi_epi32

   --  skipped func _mm_unpackhi_epi64

   --  skipped func _mm_unpacklo_epi8

   --  skipped func _mm_unpacklo_epi16

   --  skipped func _mm_unpacklo_epi32

   --  skipped func _mm_unpacklo_epi64

   --  skipped func _mm_add_epi8

   --  skipped func _mm_add_epi16

   --  skipped func _mm_add_epi32

   --  skipped func _mm_add_epi64

   --  skipped func _mm_adds_epi8

   --  skipped func _mm_adds_epi16

   --  skipped func _mm_adds_epu8

   --  skipped func _mm_adds_epu16

   --  skipped func _mm_sub_epi8

   --  skipped func _mm_sub_epi16

   --  skipped func _mm_sub_epi32

   --  skipped func _mm_sub_epi64

   --  skipped func _mm_subs_epi8

   --  skipped func _mm_subs_epi16

   --  skipped func _mm_subs_epu8

   --  skipped func _mm_subs_epu16

   --  skipped func _mm_madd_epi16

   --  skipped func _mm_mulhi_epi16

   --  skipped func _mm_mullo_epi16

   --  skipped func _mm_mul_su32

   --  skipped func _mm_mul_epu32

   --  skipped func _mm_slli_epi16

   --  skipped func _mm_slli_epi32

   --  skipped func _mm_slli_epi64

   --  skipped func _mm_srai_epi16

   --  skipped func _mm_srai_epi32

   --  skipped func _mm_srli_epi16

   --  skipped func _mm_srli_epi32

   --  skipped func _mm_srli_epi64

   --  skipped func _mm_sll_epi16

   --  skipped func _mm_sll_epi32

   --  skipped func _mm_sll_epi64

   --  skipped func _mm_sra_epi16

   --  skipped func _mm_sra_epi32

   --  skipped func _mm_srl_epi16

   --  skipped func _mm_srl_epi32

   --  skipped func _mm_srl_epi64

   --  skipped func _mm_and_si128

   --  skipped func _mm_andnot_si128

   --  skipped func _mm_or_si128

   --  skipped func _mm_xor_si128

   --  skipped func _mm_cmpeq_epi8

   --  skipped func _mm_cmpeq_epi16

   --  skipped func _mm_cmpeq_epi32

   --  skipped func _mm_cmplt_epi8

   --  skipped func _mm_cmplt_epi16

   --  skipped func _mm_cmplt_epi32

   --  skipped func _mm_cmpgt_epi8

   --  skipped func _mm_cmpgt_epi16

   --  skipped func _mm_cmpgt_epi32

   --  skipped func _mm_max_epi16

   --  skipped func _mm_max_epu8

   --  skipped func _mm_min_epi16

   --  skipped func _mm_min_epu8

   --  skipped func _mm_movemask_epi8

   --  skipped func _mm_mulhi_epu16

   --  skipped func _mm_maskmoveu_si128

   --  skipped func _mm_avg_epu8

   --  skipped func _mm_avg_epu16

   --  skipped func _mm_sad_epu8

   --  skipped func _mm_stream_si32

   --  skipped func _mm_stream_si64

   --  skipped func _mm_stream_si128

   --  skipped func _mm_stream_pd

   --  skipped func _mm_clflush

   --  skipped func _mm_lfence

   --  skipped func _mm_mfence

   --  skipped func _mm_cvtsi32_si128

   --  skipped func _mm_cvtsi64_si128

   --  skipped func _mm_cvtsi64x_si128

   --  skipped func _mm_castpd_ps

   --  skipped func _mm_castpd_si128

   --  skipped func _mm_castps_pd

   --  skipped func _mm_castps_si128

   --  skipped func _mm_castsi128_ps

   --  skipped func _mm_castsi128_pd

end emmintrin_h;
