pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;
with cpp_4_7_4_ostream;
with System;
with cpp_4_7_4_bits_slice_array_h;
with cpp_4_7_4_bits_valarray_after_h;
limited with cpp_4_7_4_bits_gslice_h;
with cpp_4_7_4_bits_gslice_array_h;
with cpp_4_7_4_bits_mask_array_h;
with cpp_4_7_4_bits_indirect_array_h;

package cpp_4_7_4_valarray is

   package valarray_Class_basic_ostream.basic_ostream is
      type valarray is limited record
         u_M_size : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:562
         u_M_data : access cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:563
      end record;
      pragma Import (CPP, valarray);

      function New_valarray return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:607
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayISoEC1Ev");

      function New_valarray (uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:611
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayISoEC1Em");

      function New_valarray (uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream; uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:617
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayISoEC1ERKSom");

      function New_valarray (uu_p : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream; uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:623
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayISoEC1EPKSom");

      function New_valarray (uu_sa : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:650
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayISoEC1ERKSt11slice_arrayISoE");

      function New_valarray (uu_ga : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:659
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayISoEC1ERKSt12gslice_arrayISoE");

      function New_valarray (uu_ma : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:670
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayISoEC1ERKSt10mask_arrayISoE");

      function New_valarray (uu_ia : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:679
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayISoEC1ERKSt14indirect_arrayISoE");

      procedure Delete_valarray (this : access valarray);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:702
      pragma Import (CPP, Delete_valarray, "_ZNSt8valarrayISoED1Ev");

      function operator_as (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:710
      pragma Import (CPP, operator_as, "_ZNSt8valarrayISoEaSERKS0_");

      function operator_as (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:774
      pragma Import (CPP, operator_as, "_ZNSt8valarrayISoEaSERKSo");

      function operator_as (this : access valarray; uu_sa : System.Address) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:782
      pragma Import (CPP, operator_as, "_ZNSt8valarrayISoEaSERKSt11slice_arrayISoE");

      function operator_as (this : access valarray; uu_ga : System.Address) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:792
      pragma Import (CPP, operator_as, "_ZNSt8valarrayISoEaSERKSt12gslice_arrayISoE");

      function operator_as (this : access valarray; uu_ma : System.Address) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:802
      pragma Import (CPP, operator_as, "_ZNSt8valarrayISoEaSERKSt10mask_arrayISoE");

      function operator_as (this : access valarray; uu_ia : System.Address) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:812
      pragma Import (CPP, operator_as, "_ZNSt8valarrayISoEaSERKSt14indirect_arrayISoE");

      function operator_ob (this : access valarray; uu_i : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return access cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:578
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayISoEixEm");

      function operator_ob (this : access constant valarray; uu_i : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:570
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayISoEixEm");

      function operator_ob (this : access constant valarray; uu_s : cpp_4_7_4_bits_slice_array_h.Class_slice.slice) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:831
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayISoEixESt5slice");

      function operator_ob (this : access valarray; uu_s : cpp_4_7_4_bits_slice_array_h.Class_slice.slice) return cpp_4_7_4_bits_slice_array_h.slice_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:839
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayISoEixESt5slice");

      function operator_ob (this : access constant valarray; uu_gs : access constant cpp_4_7_4_bits_gslice_h.Class_gslice.gslice) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:844
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayISoEixERKSt6gslice");

      function operator_ob (this : access valarray; uu_gs : access constant cpp_4_7_4_bits_gslice_h.Class_gslice.gslice) return cpp_4_7_4_bits_gslice_array_h.gslice_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:853
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayISoEixERKSt6gslice");

      function operator_ob (this : access constant valarray; uu_m : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:861
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayISoEixERKS_IbE");

      function operator_ob (this : access valarray; uu_m : System.Address) return cpp_4_7_4_bits_mask_array_h.mask_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:873
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayISoEixERKS_IbE");

      function operator_ob (this : access constant valarray; uu_i : System.Address) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:884
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayISoEixERKS_ImE");

      function operator_ob (this : access valarray; uu_i : System.Address) return cpp_4_7_4_bits_indirect_array_h.indirect_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:892
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayISoEixERKS_ImE");

      function operator_p (this : access constant valarray) return u_Rt;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1062
      pragma Import (CPP, operator_p, "_ZNKSt8valarrayISoEpsEv");

      function operator_m (this : access constant valarray) return u_Rt;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1063
      pragma Import (CPP, operator_m, "_ZNKSt8valarrayISoEngEv");

      function operator_ti (this : access constant valarray) return u_Rt;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1064
      pragma Import (CPP, operator_ti, "_ZNKSt8valarrayISoEcoEv");

      function operator_u (this : access constant valarray) return u_Rt;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1065
      pragma Import (CPP, operator_u, "_ZNKSt8valarrayISoEntEv");

      function operator_ta (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1090
      pragma Import (CPP, operator_ta, "_ZNSt8valarrayISoEmLERKSo");

      function operator_da (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1091
      pragma Import (CPP, operator_da, "_ZNSt8valarrayISoEdVERKSo");

      function operator%_as (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1092
      pragma Import (CPP, operator%_as, "_ZNSt8valarrayISoErMERKSo");

      function operator_pa (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1088
      pragma Import (CPP, operator_pa, "_ZNSt8valarrayISoEpLERKSo");

      function operator_ma (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1089
      pragma Import (CPP, operator_ma, "_ZNSt8valarrayISoEmIERKSo");

      function operator_xe (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1093
      pragma Import (CPP, operator_xe, "_ZNSt8valarrayISoEeOERKSo");

      function operator_ae (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1094
      pragma Import (CPP, operator_ae, "_ZNSt8valarrayISoEaNERKSo");

      function operator_oe (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1095
      pragma Import (CPP, operator_oe, "_ZNSt8valarrayISoEoRERKSo");

      function operator_sl_as (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1096
      pragma Import (CPP, operator_sl_as, "_ZNSt8valarrayISoElSERKSo");

      function operator_sr_as (this : access valarray; uu_t : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream'Class) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1097
      pragma Import (CPP, operator_sr_as, "_ZNSt8valarrayISoErSERKSo");

      function operator_ta (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1090
      pragma Import (CPP, operator_ta, "_ZNSt8valarrayISoEmLERKS0_");

      function operator_da (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1091
      pragma Import (CPP, operator_da, "_ZNSt8valarrayISoEdVERKS0_");

      function operator%_as (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1092
      pragma Import (CPP, operator%_as, "_ZNSt8valarrayISoErMERKS0_");

      function operator_pa (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1088
      pragma Import (CPP, operator_pa, "_ZNSt8valarrayISoEpLERKS0_");

      function operator_ma (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1089
      pragma Import (CPP, operator_ma, "_ZNSt8valarrayISoEmIERKS0_");

      function operator_xe (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1093
      pragma Import (CPP, operator_xe, "_ZNSt8valarrayISoEeOERKS0_");

      function operator_oe (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1095
      pragma Import (CPP, operator_oe, "_ZNSt8valarrayISoEoRERKS0_");

      function operator_ae (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1094
      pragma Import (CPP, operator_ae, "_ZNSt8valarrayISoEaNERKS0_");

      function operator_sl_as (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1096
      pragma Import (CPP, operator_sl_as, "_ZNSt8valarrayISoElSERKS0_");

      function operator_sr_as (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1097
      pragma Import (CPP, operator_sr_as, "_ZNSt8valarrayISoErSERKS0_");

      function size (this : access constant valarray) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:910
      pragma Import (CPP, size, "_ZNKSt8valarrayISoE4sizeEv");

      function sum (this : access constant valarray) return cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:915
      pragma Import (CPP, sum, "_ZNKSt8valarrayISoE3sumEv");

      function min (this : access constant valarray) return cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1022
      pragma Import (CPP, min, "_ZNKSt8valarrayISoE3minEv");

      function max (this : access constant valarray) return cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1030
      pragma Import (CPP, max, "_ZNKSt8valarrayISoE3maxEv");

      function shift (this : access constant valarray; uu_n : int) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:923
      pragma Import (CPP, shift, "_ZNKSt8valarrayISoE5shiftEi");

      function cshift (this : access constant valarray; uu_n : int) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:964
      pragma Import (CPP, cshift, "_ZNKSt8valarrayISoE6cshiftEi");

      function apply (this : access constant valarray; func : access function (arg1 : cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream) return cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1038
      pragma Import (CPP, apply, "_ZNKSt8valarrayISoE5applyEPFSoSoE");

      function apply (this : access constant valarray; func : access function (arg1 : access constant cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream) return cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1046
      pragma Import (CPP, apply, "_ZNKSt8valarrayISoE5applyEPFSoRKSoE");

      procedure resize
        (this : access valarray;
         uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;
         uu_c : cpp_4_7_4_ostream.Class_basic_ostream.basic_ostream);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1005
      pragma Import (CPP, resize, "_ZNSt8valarrayISoE6resizeEmSo");

   end;
   use valarray_Class_basic_ostream.basic_ostream;

   package valarray_double is
      type valarray is limited record
         u_M_size : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:562
         u_M_data : access double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:563
      end record;
      pragma Import (CPP, valarray);

      function New_valarray return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:607
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayIdEC1Ev");

      function New_valarray (uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:611
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayIdEC1Em");

      function New_valarray (uu_t : access double; uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:617
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayIdEC1ERKdm");

      function New_valarray (uu_p : access double; uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:623
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayIdEC1EPKdm");

      function New_valarray (uu_sa : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:650
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayIdEC1ERKSt11slice_arrayIdE");

      function New_valarray (uu_ga : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:659
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayIdEC1ERKSt12gslice_arrayIdE");

      function New_valarray (uu_ma : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:670
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayIdEC1ERKSt10mask_arrayIdE");

      function New_valarray (uu_ia : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:679
      pragma CPP_Constructor (New_valarray, "_ZNSt8valarrayIdEC1ERKSt14indirect_arrayIdE");

      procedure Delete_valarray (this : access valarray);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:702
      pragma Import (CPP, Delete_valarray, "_ZNSt8valarrayIdED1Ev");

      function operator_as (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:710
      pragma Import (CPP, operator_as, "_ZNSt8valarrayIdEaSERKS0_");

      function operator_as (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:774
      pragma Import (CPP, operator_as, "_ZNSt8valarrayIdEaSERKd");

      function operator_as (this : access valarray; uu_sa : System.Address) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:782
      pragma Import (CPP, operator_as, "_ZNSt8valarrayIdEaSERKSt11slice_arrayIdE");

      function operator_as (this : access valarray; uu_ga : System.Address) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:792
      pragma Import (CPP, operator_as, "_ZNSt8valarrayIdEaSERKSt12gslice_arrayIdE");

      function operator_as (this : access valarray; uu_ma : System.Address) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:802
      pragma Import (CPP, operator_as, "_ZNSt8valarrayIdEaSERKSt10mask_arrayIdE");

      function operator_as (this : access valarray; uu_ia : System.Address) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:812
      pragma Import (CPP, operator_as, "_ZNSt8valarrayIdEaSERKSt14indirect_arrayIdE");

      function operator_ob (this : access valarray; uu_i : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return access double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:578
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayIdEixEm");

      function operator_ob (this : access constant valarray; uu_i : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return access double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:570
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayIdEixEm");

      function operator_ob (this : access constant valarray; uu_s : cpp_4_7_4_bits_slice_array_h.Class_slice.slice) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:831
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayIdEixESt5slice");

      function operator_ob (this : access valarray; uu_s : cpp_4_7_4_bits_slice_array_h.Class_slice.slice) return cpp_4_7_4_bits_slice_array_h.slice_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:839
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayIdEixESt5slice");

      function operator_ob (this : access constant valarray; uu_gs : access constant cpp_4_7_4_bits_gslice_h.Class_gslice.gslice) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:844
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayIdEixERKSt6gslice");

      function operator_ob (this : access valarray; uu_gs : access constant cpp_4_7_4_bits_gslice_h.Class_gslice.gslice) return cpp_4_7_4_bits_gslice_array_h.gslice_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:853
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayIdEixERKSt6gslice");

      function operator_ob (this : access constant valarray; uu_m : System.Address) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:861
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayIdEixERKS_IbE");

      function operator_ob (this : access valarray; uu_m : System.Address) return cpp_4_7_4_bits_mask_array_h.mask_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:873
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayIdEixERKS_IbE");

      function operator_ob (this : access constant valarray; uu_i : System.Address) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:884
      pragma Import (CPP, operator_ob, "_ZNKSt8valarrayIdEixERKS_ImE");

      function operator_ob (this : access valarray; uu_i : System.Address) return cpp_4_7_4_bits_indirect_array_h.indirect_array;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:892
      pragma Import (CPP, operator_ob, "_ZNSt8valarrayIdEixERKS_ImE");

      function operator_p (this : access constant valarray) return u_Rt;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1062
      pragma Import (CPP, operator_p, "_ZNKSt8valarrayIdEpsEv");

      function operator_m (this : access constant valarray) return u_Rt;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1063
      pragma Import (CPP, operator_m, "_ZNKSt8valarrayIdEngEv");

      function operator_ti (this : access constant valarray) return u_Rt;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1064
      pragma Import (CPP, operator_ti, "_ZNKSt8valarrayIdEcoEv");

      function operator_u (this : access constant valarray) return u_Rt;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1065
      pragma Import (CPP, operator_u, "_ZNKSt8valarrayIdEntEv");

      function operator_ta (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1090
      pragma Import (CPP, operator_ta, "_ZNSt8valarrayIdEmLERKd");

      function operator_da (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1091
      pragma Import (CPP, operator_da, "_ZNSt8valarrayIdEdVERKd");

      function operator%_as (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1092
      pragma Import (CPP, operator%_as, "_ZNSt8valarrayIdErMERKd");

      function operator_pa (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1088
      pragma Import (CPP, operator_pa, "_ZNSt8valarrayIdEpLERKd");

      function operator_ma (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1089
      pragma Import (CPP, operator_ma, "_ZNSt8valarrayIdEmIERKd");

      function operator_xe (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1093
      pragma Import (CPP, operator_xe, "_ZNSt8valarrayIdEeOERKd");

      function operator_ae (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1094
      pragma Import (CPP, operator_ae, "_ZNSt8valarrayIdEaNERKd");

      function operator_oe (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1095
      pragma Import (CPP, operator_oe, "_ZNSt8valarrayIdEoRERKd");

      function operator_sl_as (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1096
      pragma Import (CPP, operator_sl_as, "_ZNSt8valarrayIdElSERKd");

      function operator_sr_as (this : access valarray; uu_t : access double) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1097
      pragma Import (CPP, operator_sr_as, "_ZNSt8valarrayIdErSERKd");

      function operator_ta (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1090
      pragma Import (CPP, operator_ta, "_ZNSt8valarrayIdEmLERKS0_");

      function operator_da (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1091
      pragma Import (CPP, operator_da, "_ZNSt8valarrayIdEdVERKS0_");

      function operator%_as (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1092
      pragma Import (CPP, operator%_as, "_ZNSt8valarrayIdErMERKS0_");

      function operator_pa (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1088
      pragma Import (CPP, operator_pa, "_ZNSt8valarrayIdEpLERKS0_");

      function operator_ma (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1089
      pragma Import (CPP, operator_ma, "_ZNSt8valarrayIdEmIERKS0_");

      function operator_xe (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1093
      pragma Import (CPP, operator_xe, "_ZNSt8valarrayIdEeOERKS0_");

      function operator_oe (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1095
      pragma Import (CPP, operator_oe, "_ZNSt8valarrayIdEoRERKS0_");

      function operator_ae (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1094
      pragma Import (CPP, operator_ae, "_ZNSt8valarrayIdEaNERKS0_");

      function operator_sl_as (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1096
      pragma Import (CPP, operator_sl_as, "_ZNSt8valarrayIdElSERKS0_");

      function operator_sr_as (this : access valarray; uu_v : access constant valarray) return access valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1097
      pragma Import (CPP, operator_sr_as, "_ZNSt8valarrayIdErSERKS0_");

      function size (this : access constant valarray) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:910
      pragma Import (CPP, size, "_ZNKSt8valarrayIdE4sizeEv");

      function sum (this : access constant valarray) return double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:915
      pragma Import (CPP, sum, "_ZNKSt8valarrayIdE3sumEv");

      function min (this : access constant valarray) return double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1022
      pragma Import (CPP, min, "_ZNKSt8valarrayIdE3minEv");

      function max (this : access constant valarray) return double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1030
      pragma Import (CPP, max, "_ZNKSt8valarrayIdE3maxEv");

      function shift (this : access constant valarray; uu_n : int) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:923
      pragma Import (CPP, shift, "_ZNKSt8valarrayIdE5shiftEi");

      function cshift (this : access constant valarray; uu_n : int) return valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:964
      pragma Import (CPP, cshift, "_ZNKSt8valarrayIdE6cshiftEi");

      function apply (this : access constant valarray; func : access function (arg1 : double) return double) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1038
      pragma Import (CPP, apply, "_ZNKSt8valarrayIdE5applyEPFddE");

      function apply (this : access constant valarray; func : access function (arg1 : access double) return double) return cpp_4_7_4_bits_valarray_after_h.u_Expr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1046
      pragma Import (CPP, apply, "_ZNKSt8valarrayIdE5applyEPFdRKdE");

      procedure resize
        (this : access valarray;
         uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;
         uu_c : double);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/valarray:1005
      pragma Import (CPP, resize, "_ZNSt8valarrayIdE6resizeEmd");

   end;
   use valarray_double;



end cpp_4_7_4_valarray;
