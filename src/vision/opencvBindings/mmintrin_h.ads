pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package mmintrin_h is

   subtype uu_m64 is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/mmintrin.h:36

   subtype uu_v2si is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/mmintrin.h:39

   subtype uu_v4hi is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/mmintrin.h:40

   subtype uu_v8qi is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/mmintrin.h:41

   subtype uu_v1di is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/mmintrin.h:42

   subtype uu_v2sf is <vector>;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/mmintrin.h:43

   --  skipped func _mm_empty

   --  skipped func _m_empty

   --  skipped func _mm_cvtsi32_si64

   --  skipped func _m_from_int

   --  skipped func _m_from_int64

   --  skipped func _mm_cvtsi64_m64

   --  skipped func _mm_cvtsi64x_si64

   --  skipped func _mm_set_pi64x

   --  skipped func _mm_cvtsi64_si32

   --  skipped func _m_to_int

   --  skipped func _m_to_int64

   --  skipped func _mm_cvtm64_si64

   --  skipped func _mm_cvtsi64_si64x

   --  skipped func _mm_packs_pi16

   --  skipped func _m_packsswb

   --  skipped func _mm_packs_pi32

   --  skipped func _m_packssdw

   --  skipped func _mm_packs_pu16

   --  skipped func _m_packuswb

   --  skipped func _mm_unpackhi_pi8

   --  skipped func _m_punpckhbw

   --  skipped func _mm_unpackhi_pi16

   --  skipped func _m_punpckhwd

   --  skipped func _mm_unpackhi_pi32

   --  skipped func _m_punpckhdq

   --  skipped func _mm_unpacklo_pi8

   --  skipped func _m_punpcklbw

   --  skipped func _mm_unpacklo_pi16

   --  skipped func _m_punpcklwd

   --  skipped func _mm_unpacklo_pi32

   --  skipped func _m_punpckldq

   --  skipped func _mm_add_pi8

   --  skipped func _m_paddb

   --  skipped func _mm_add_pi16

   --  skipped func _m_paddw

   --  skipped func _mm_add_pi32

   --  skipped func _m_paddd

   --  skipped func _mm_add_si64

   --  skipped func _mm_adds_pi8

   --  skipped func _m_paddsb

   --  skipped func _mm_adds_pi16

   --  skipped func _m_paddsw

   --  skipped func _mm_adds_pu8

   --  skipped func _m_paddusb

   --  skipped func _mm_adds_pu16

   --  skipped func _m_paddusw

   --  skipped func _mm_sub_pi8

   --  skipped func _m_psubb

   --  skipped func _mm_sub_pi16

   --  skipped func _m_psubw

   --  skipped func _mm_sub_pi32

   --  skipped func _m_psubd

   --  skipped func _mm_sub_si64

   --  skipped func _mm_subs_pi8

   --  skipped func _m_psubsb

   --  skipped func _mm_subs_pi16

   --  skipped func _m_psubsw

   --  skipped func _mm_subs_pu8

   --  skipped func _m_psubusb

   --  skipped func _mm_subs_pu16

   --  skipped func _m_psubusw

   --  skipped func _mm_madd_pi16

   --  skipped func _m_pmaddwd

   --  skipped func _mm_mulhi_pi16

   --  skipped func _m_pmulhw

   --  skipped func _mm_mullo_pi16

   --  skipped func _m_pmullw

   --  skipped func _mm_sll_pi16

   --  skipped func _m_psllw

   --  skipped func _mm_slli_pi16

   --  skipped func _m_psllwi

   --  skipped func _mm_sll_pi32

   --  skipped func _m_pslld

   --  skipped func _mm_slli_pi32

   --  skipped func _m_pslldi

   --  skipped func _mm_sll_si64

   --  skipped func _m_psllq

   --  skipped func _mm_slli_si64

   --  skipped func _m_psllqi

   --  skipped func _mm_sra_pi16

   --  skipped func _m_psraw

   --  skipped func _mm_srai_pi16

   --  skipped func _m_psrawi

   --  skipped func _mm_sra_pi32

   --  skipped func _m_psrad

   --  skipped func _mm_srai_pi32

   --  skipped func _m_psradi

   --  skipped func _mm_srl_pi16

   --  skipped func _m_psrlw

   --  skipped func _mm_srli_pi16

   --  skipped func _m_psrlwi

   --  skipped func _mm_srl_pi32

   --  skipped func _m_psrld

   --  skipped func _mm_srli_pi32

   --  skipped func _m_psrldi

   --  skipped func _mm_srl_si64

   --  skipped func _m_psrlq

   --  skipped func _mm_srli_si64

   --  skipped func _m_psrlqi

   --  skipped func _mm_and_si64

   --  skipped func _m_pand

   --  skipped func _mm_andnot_si64

   --  skipped func _m_pandn

   --  skipped func _mm_or_si64

   --  skipped func _m_por

   --  skipped func _mm_xor_si64

   --  skipped func _m_pxor

   --  skipped func _mm_cmpeq_pi8

   --  skipped func _m_pcmpeqb

   --  skipped func _mm_cmpgt_pi8

   --  skipped func _m_pcmpgtb

   --  skipped func _mm_cmpeq_pi16

   --  skipped func _m_pcmpeqw

   --  skipped func _mm_cmpgt_pi16

   --  skipped func _m_pcmpgtw

   --  skipped func _mm_cmpeq_pi32

   --  skipped func _m_pcmpeqd

   --  skipped func _mm_cmpgt_pi32

   --  skipped func _m_pcmpgtd

   --  skipped func _mm_setzero_si64

   --  skipped func _mm_set_pi32

   --  skipped func _mm_set_pi16

   --  skipped func _mm_set_pi8

   --  skipped func _mm_setr_pi32

   --  skipped func _mm_setr_pi16

   --  skipped func _mm_setr_pi8

   --  skipped func _mm_set1_pi32

   --  skipped func _mm_set1_pi16

   --  skipped func _mm_set1_pi8

end mmintrin_h;
