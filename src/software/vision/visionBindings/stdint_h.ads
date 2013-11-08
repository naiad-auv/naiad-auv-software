pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package stdint_h is

   subtype uint8_t is unsigned_char;  -- /usr/include/stdint.h:49

   subtype uint16_t is unsigned_short;  -- /usr/include/stdint.h:50

   subtype uint32_t is unsigned;  -- /usr/include/stdint.h:52

   subtype uint64_t is unsigned_long;  -- /usr/include/stdint.h:56

   subtype int_least8_t is signed_char;  -- /usr/include/stdint.h:66

   subtype int_least16_t is short;  -- /usr/include/stdint.h:67

   subtype int_least32_t is int;  -- /usr/include/stdint.h:68

   subtype int_least64_t is long;  -- /usr/include/stdint.h:70

   subtype uint_least8_t is unsigned_char;  -- /usr/include/stdint.h:77

   subtype uint_least16_t is unsigned_short;  -- /usr/include/stdint.h:78

   subtype uint_least32_t is unsigned;  -- /usr/include/stdint.h:79

   subtype uint_least64_t is unsigned_long;  -- /usr/include/stdint.h:81

   subtype int_fast8_t is signed_char;  -- /usr/include/stdint.h:91

   subtype int_fast16_t is long;  -- /usr/include/stdint.h:93

   subtype int_fast32_t is long;  -- /usr/include/stdint.h:94

   subtype int_fast64_t is long;  -- /usr/include/stdint.h:95

   subtype uint_fast8_t is unsigned_char;  -- /usr/include/stdint.h:104

   subtype uint_fast16_t is unsigned_long;  -- /usr/include/stdint.h:106

   subtype uint_fast32_t is unsigned_long;  -- /usr/include/stdint.h:107

   subtype uint_fast64_t is unsigned_long;  -- /usr/include/stdint.h:108

   subtype intptr_t is long;  -- /usr/include/stdint.h:120

   subtype uintptr_t is unsigned_long;  -- /usr/include/stdint.h:123

   subtype intmax_t is long;  -- /usr/include/stdint.h:135

   subtype uintmax_t is unsigned_long;  -- /usr/include/stdint.h:136

end stdint_h;
