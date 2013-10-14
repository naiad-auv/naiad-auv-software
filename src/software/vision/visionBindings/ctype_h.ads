pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with xlocale_h;

package ctype_h is

   function isalnum (arg1 : int) return int;  -- /usr/include/ctype.h:112
   pragma Import (C, isalnum, "isalnum");

   function isalpha (arg1 : int) return int;  -- /usr/include/ctype.h:113
   pragma Import (C, isalpha, "isalpha");

   function iscntrl (arg1 : int) return int;  -- /usr/include/ctype.h:114
   pragma Import (C, iscntrl, "iscntrl");

   function isdigit (arg1 : int) return int;  -- /usr/include/ctype.h:115
   pragma Import (C, isdigit, "isdigit");

   function islower (arg1 : int) return int;  -- /usr/include/ctype.h:116
   pragma Import (C, islower, "islower");

   function isgraph (arg1 : int) return int;  -- /usr/include/ctype.h:117
   pragma Import (C, isgraph, "isgraph");

   function isprint (arg1 : int) return int;  -- /usr/include/ctype.h:118
   pragma Import (C, isprint, "isprint");

   function ispunct (arg1 : int) return int;  -- /usr/include/ctype.h:119
   pragma Import (C, ispunct, "ispunct");

   function isspace (arg1 : int) return int;  -- /usr/include/ctype.h:120
   pragma Import (C, isspace, "isspace");

   function isupper (arg1 : int) return int;  -- /usr/include/ctype.h:121
   pragma Import (C, isupper, "isupper");

   function isxdigit (arg1 : int) return int;  -- /usr/include/ctype.h:122
   pragma Import (C, isxdigit, "isxdigit");

   function tolower (uu_c : int) return int;  -- /usr/include/ctype.h:126
   pragma Import (C, tolower, "tolower");

   function toupper (uu_c : int) return int;  -- /usr/include/ctype.h:129
   pragma Import (C, toupper, "toupper");

   function isblank (arg1 : int) return int;  -- /usr/include/ctype.h:138
   pragma Import (C, isblank, "isblank");

   function isctype (uu_c : int; uu_mask : int) return int;  -- /usr/include/ctype.h:145
   pragma Import (C, isctype, "isctype");

   function isascii (uu_c : int) return int;  -- /usr/include/ctype.h:152
   pragma Import (C, isascii, "isascii");

   function toascii (uu_c : int) return int;  -- /usr/include/ctype.h:156
   pragma Import (C, toascii, "toascii");

   --  skipped func _toupper

   --  skipped func _tolower

   function isalnum_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:273
   pragma Import (C, isalnum_l, "isalnum_l");

   function isalpha_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:274
   pragma Import (C, isalpha_l, "isalpha_l");

   function iscntrl_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:275
   pragma Import (C, iscntrl_l, "iscntrl_l");

   function isdigit_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:276
   pragma Import (C, isdigit_l, "isdigit_l");

   function islower_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:277
   pragma Import (C, islower_l, "islower_l");

   function isgraph_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:278
   pragma Import (C, isgraph_l, "isgraph_l");

   function isprint_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:279
   pragma Import (C, isprint_l, "isprint_l");

   function ispunct_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:280
   pragma Import (C, ispunct_l, "ispunct_l");

   function isspace_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:281
   pragma Import (C, isspace_l, "isspace_l");

   function isupper_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:282
   pragma Import (C, isupper_l, "isupper_l");

   function isxdigit_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:283
   pragma Import (C, isxdigit_l, "isxdigit_l");

   function isblank_l (arg1 : int; arg2 : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:285
   pragma Import (C, isblank_l, "isblank_l");

   function tolower_l (uu_c : int; uu_l : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:290
   pragma Import (C, tolower_l, "tolower_l");

   function toupper_l (uu_c : int; uu_l : xlocale_h.uu_locale_t) return int;  -- /usr/include/ctype.h:294
   pragma Import (C, toupper_l, "toupper_l");

end ctype_h;
