pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package xmmintrin_h is

   subtype uu_m128 is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/xmmintrin.h:43

   subtype uu_v4sf is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/xmmintrin.h:46

   subtype u_mm_hint is unsigned;
   u_MM_HINT_T0 : constant u_mm_hint := 3;
   u_MM_HINT_T1 : constant u_mm_hint := 2;
   u_MM_HINT_T2 : constant u_mm_hint := 1;
   u_MM_HINT_NTA : constant u_mm_hint := 0;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/xmmintrin.h:53

   --  skipped func _mm_setzero_ps

   --  skipped func _mm_add_ss

   --  skipped func _mm_sub_ss

   --  skipped func _mm_mul_ss

   --  skipped func _mm_div_ss

   --  skipped func _mm_sqrt_ss

   --  skipped func _mm_rcp_ss

   --  skipped func _mm_rsqrt_ss

   --  skipped func _mm_min_ss

   --  skipped func _mm_max_ss

   --  skipped func _mm_add_ps

   --  skipped func _mm_sub_ps

   --  skipped func _mm_mul_ps

   --  skipped func _mm_div_ps

   --  skipped func _mm_sqrt_ps

   --  skipped func _mm_rcp_ps

   --  skipped func _mm_rsqrt_ps

   --  skipped func _mm_min_ps

   --  skipped func _mm_max_ps

   --  skipped func _mm_and_ps

   --  skipped func _mm_andnot_ps

   --  skipped func _mm_or_ps

   --  skipped func _mm_xor_ps

   --  skipped func _mm_cmpeq_ss

   --  skipped func _mm_cmplt_ss

   --  skipped func _mm_cmple_ss

   --  skipped func _mm_cmpgt_ss

   --  skipped func _mm_cmpge_ss

   --  skipped func _mm_cmpneq_ss

   --  skipped func _mm_cmpnlt_ss

   --  skipped func _mm_cmpnle_ss

   --  skipped func _mm_cmpngt_ss

   --  skipped func _mm_cmpnge_ss

   --  skipped func _mm_cmpord_ss

   --  skipped func _mm_cmpunord_ss

   --  skipped func _mm_cmpeq_ps

   --  skipped func _mm_cmplt_ps

   --  skipped func _mm_cmple_ps

   --  skipped func _mm_cmpgt_ps

   --  skipped func _mm_cmpge_ps

   --  skipped func _mm_cmpneq_ps

   --  skipped func _mm_cmpnlt_ps

   --  skipped func _mm_cmpnle_ps

   --  skipped func _mm_cmpngt_ps

   --  skipped func _mm_cmpnge_ps

   --  skipped func _mm_cmpord_ps

   --  skipped func _mm_cmpunord_ps

   --  skipped func _mm_comieq_ss

   --  skipped func _mm_comilt_ss

   --  skipped func _mm_comile_ss

   --  skipped func _mm_comigt_ss

   --  skipped func _mm_comige_ss

   --  skipped func _mm_comineq_ss

   --  skipped func _mm_ucomieq_ss

   --  skipped func _mm_ucomilt_ss

   --  skipped func _mm_ucomile_ss

   --  skipped func _mm_ucomigt_ss

   --  skipped func _mm_ucomige_ss

   --  skipped func _mm_ucomineq_ss

   --  skipped func _mm_cvtss_si32

   --  skipped func _mm_cvt_ss2si

   --  skipped func _mm_cvtss_si64

   --  skipped func _mm_cvtss_si64x

   --  skipped func _mm_cvtps_pi32

   --  skipped func _mm_cvt_ps2pi

   --  skipped func _mm_cvttss_si32

   --  skipped func _mm_cvtt_ss2si

   --  skipped func _mm_cvttss_si64

   --  skipped func _mm_cvttss_si64x

   --  skipped func _mm_cvttps_pi32

   --  skipped func _mm_cvtt_ps2pi

   --  skipped func _mm_cvtsi32_ss

   --  skipped func _mm_cvt_si2ss

   --  skipped func _mm_cvtsi64_ss

   --  skipped func _mm_cvtsi64x_ss

   --  skipped func _mm_cvtpi32_ps

   --  skipped func _mm_cvt_pi2ps

   --  skipped func _mm_cvtpi16_ps

   --  skipped func _mm_cvtpu16_ps

   --  skipped func _mm_cvtpi8_ps

   --  skipped func _mm_cvtpu8_ps

   --  skipped func _mm_cvtpi32x2_ps

   --  skipped func _mm_cvtps_pi16

   --  skipped func _mm_cvtps_pi8

   --  skipped func _mm_unpackhi_ps

   --  skipped func _mm_unpacklo_ps

   --  skipped func _mm_loadh_pi

   --  skipped func _mm_storeh_pi

   --  skipped func _mm_movehl_ps

   --  skipped func _mm_movelh_ps

   --  skipped func _mm_loadl_pi

   --  skipped func _mm_storel_pi

   --  skipped func _mm_movemask_ps

   --  skipped func _mm_getcsr

   --  skipped func _MM_GET_EXCEPTION_STATE

   --  skipped func _MM_GET_EXCEPTION_MASK

   --  skipped func _MM_GET_ROUNDING_MODE

   --  skipped func _MM_GET_FLUSH_ZERO_MODE

   --  skipped func _mm_setcsr

   --  skipped func _MM_SET_EXCEPTION_STATE

   --  skipped func _MM_SET_EXCEPTION_MASK

   --  skipped func _MM_SET_ROUNDING_MODE

   --  skipped func _MM_SET_FLUSH_ZERO_MODE

   --  skipped func _mm_set_ss

   --  skipped func _mm_set1_ps

   --  skipped func _mm_set_ps1

   --  skipped func _mm_load_ss

   --  skipped func _mm_load1_ps

   --  skipped func _mm_load_ps1

   --  skipped func _mm_load_ps

   --  skipped func _mm_loadu_ps

   --  skipped func _mm_loadr_ps

   --  skipped func _mm_set_ps

   --  skipped func _mm_setr_ps

   --  skipped func _mm_store_ss

   --  skipped func _mm_cvtss_f32

   --  skipped func _mm_store_ps

   --  skipped func _mm_storeu_ps

   --  skipped func _mm_store1_ps

   --  skipped func _mm_store_ps1

   --  skipped func _mm_storer_ps

   --  skipped func _mm_move_ss

   --  skipped func _mm_max_pi16

   --  skipped func _m_pmaxsw

   --  skipped func _mm_max_pu8

   --  skipped func _m_pmaxub

   --  skipped func _mm_min_pi16

   --  skipped func _m_pminsw

   --  skipped func _mm_min_pu8

   --  skipped func _m_pminub

   --  skipped func _mm_movemask_pi8

   --  skipped func _m_pmovmskb

   --  skipped func _mm_mulhi_pu16

   --  skipped func _m_pmulhuw

   --  skipped func _mm_maskmove_si64

   --  skipped func _m_maskmovq

   --  skipped func _mm_avg_pu8

   --  skipped func _m_pavgb

   --  skipped func _mm_avg_pu16

   --  skipped func _m_pavgw

   --  skipped func _mm_sad_pu8

   --  skipped func _m_psadbw

   --  skipped func _mm_stream_pi

   --  skipped func _mm_stream_ps

   --  skipped func _mm_sfence

   --  skipped func _mm_pause

end xmmintrin_h;
