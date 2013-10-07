pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_cvstd_hpp;
limited with cpp_4_7_4_bits_stringfwd_h;
limited with cpp_4_7_4_iosfwd;
limited with opencv2_core_mat_hpp;

package opencv2_core_cvstd_inl_hpp is

   function operator_p (lhs : access constant opencv2_core_cvstd_hpp.Class_String.String; rhs : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:113
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_6StringERKSs");

   function operator_p (lhs : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string; rhs : access constant opencv2_core_cvstd_hpp.Class_String.String) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:124
   pragma Import (CPP, operator_p, "_ZN2cvplERKSsRKNS_6StringE");

   function operator_sl (os : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class; str : access constant opencv2_core_cvstd_hpp.Class_String.String) return access cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:157
   pragma Import (CPP, operator_sl, "_ZN2cvlsERSoRKNS_6StringE");

   function operator_sl (c_out : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class; fmtd : access opencv2_core_cvstd_hpp.Class_Ptr.Ptr) return access cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:163
   pragma Import (CPP, operator_sl, "_ZN2cvlsERSoNS_3PtrINS_9FormattedEEE");

   function operator_sl (c_out : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class; mtx : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access cpp_4_7_4_iosfwd.Class_ostream.ostream;  -- /usr/local/include/opencv2/core/cvstd.inl.hpp:172
   pragma Import (CPP, operator_sl, "_ZN2cvlsERSoRKNS_3MatE");

end opencv2_core_cvstd_inl_hpp;
