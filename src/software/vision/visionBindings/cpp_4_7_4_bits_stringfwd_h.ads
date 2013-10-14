pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_basic_string_h;

package cpp_4_7_4_bits_stringfwd_h is

   subtype string is cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string;

   subtype wstring is cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string;

end cpp_4_7_4_bits_stringfwd_h;
