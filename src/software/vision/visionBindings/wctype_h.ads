pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;
with Interfaces.C.Strings;
with bits_types_h;
with xlocale_h;

package wctype_h is

   subtype wctype_t is unsigned_long;  -- /usr/include/wctype.h:53

   function iswalnum (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:112
   pragma Import (C, iswalnum, "iswalnum");

   function iswalpha (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:118
   pragma Import (C, iswalpha, "iswalpha");

   function iswcntrl (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:121
   pragma Import (C, iswcntrl, "iswcntrl");

   function iswdigit (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:125
   pragma Import (C, iswdigit, "iswdigit");

   function iswgraph (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:129
   pragma Import (C, iswgraph, "iswgraph");

   function iswlower (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:134
   pragma Import (C, iswlower, "iswlower");

   function iswprint (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:137
   pragma Import (C, iswprint, "iswprint");

   function iswpunct (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:142
   pragma Import (C, iswpunct, "iswpunct");

   function iswspace (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:147
   pragma Import (C, iswspace, "iswspace");

   function iswupper (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:152
   pragma Import (C, iswupper, "iswupper");

   function iswxdigit (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:157
   pragma Import (C, iswxdigit, "iswxdigit");

   function iswblank (uu_wc : stddef_h.wint_t) return int;  -- /usr/include/wctype.h:163
   pragma Import (C, iswblank, "iswblank");

   function wctype (uu_property : Interfaces.C.Strings.chars_ptr) return wctype_t;  -- /usr/include/wctype.h:172
   pragma Import (C, wctype, "wctype");

   function iswctype (uu_wc : stddef_h.wint_t; uu_desc : wctype_t) return int;  -- /usr/include/wctype.h:176
   pragma Import (C, iswctype, "iswctype");

   type wctrans_t is access all bits_types_h.uu_int32_t;  -- /usr/include/wctype.h:187

   function towlower (uu_wc : stddef_h.wint_t) return stddef_h.wint_t;  -- /usr/include/wctype.h:195
   pragma Import (C, towlower, "towlower");

   function towupper (uu_wc : stddef_h.wint_t) return stddef_h.wint_t;  -- /usr/include/wctype.h:198
   pragma Import (C, towupper, "towupper");

   function wctrans (uu_property : Interfaces.C.Strings.chars_ptr) return wctrans_t;  -- /usr/include/wctype.h:219
   pragma Import (C, wctrans, "wctrans");

   function towctrans (uu_wc : stddef_h.wint_t; uu_desc : wctrans_t) return stddef_h.wint_t;  -- /usr/include/wctype.h:222
   pragma Import (C, towctrans, "towctrans");

   function iswalnum_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:231
   pragma Import (C, iswalnum_l, "iswalnum_l");

   function iswalpha_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:237
   pragma Import (C, iswalpha_l, "iswalpha_l");

   function iswcntrl_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:240
   pragma Import (C, iswcntrl_l, "iswcntrl_l");

   function iswdigit_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:244
   pragma Import (C, iswdigit_l, "iswdigit_l");

   function iswgraph_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:248
   pragma Import (C, iswgraph_l, "iswgraph_l");

   function iswlower_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:253
   pragma Import (C, iswlower_l, "iswlower_l");

   function iswprint_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:256
   pragma Import (C, iswprint_l, "iswprint_l");

   function iswpunct_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:261
   pragma Import (C, iswpunct_l, "iswpunct_l");

   function iswspace_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:266
   pragma Import (C, iswspace_l, "iswspace_l");

   function iswupper_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:271
   pragma Import (C, iswupper_l, "iswupper_l");

   function iswxdigit_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:276
   pragma Import (C, iswxdigit_l, "iswxdigit_l");

   function iswblank_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:281
   pragma Import (C, iswblank_l, "iswblank_l");

   function wctype_l (uu_property : Interfaces.C.Strings.chars_ptr; uu_locale : xlocale_h.uu_locale_t) return wctype_t;  -- /usr/include/wctype.h:285
   pragma Import (C, wctype_l, "wctype_l");

   function iswctype_l
     (uu_wc : stddef_h.wint_t;
      uu_desc : wctype_t;
      uu_locale : xlocale_h.uu_locale_t) return int;  -- /usr/include/wctype.h:290
   pragma Import (C, iswctype_l, "iswctype_l");

   function towlower_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return stddef_h.wint_t;  -- /usr/include/wctype.h:299
   pragma Import (C, towlower_l, "towlower_l");

   function towupper_l (uu_wc : stddef_h.wint_t; uu_locale : xlocale_h.uu_locale_t) return stddef_h.wint_t;  -- /usr/include/wctype.h:302
   pragma Import (C, towupper_l, "towupper_l");

   function wctrans_l (uu_property : Interfaces.C.Strings.chars_ptr; uu_locale : xlocale_h.uu_locale_t) return wctrans_t;  -- /usr/include/wctype.h:306
   pragma Import (C, wctrans_l, "wctrans_l");

   function towctrans_l
     (uu_wc : stddef_h.wint_t;
      uu_desc : wctrans_t;
      uu_locale : xlocale_h.uu_locale_t) return stddef_h.wint_t;  -- /usr/include/wctype.h:310
   pragma Import (C, towctrans_l, "towctrans_l");

end wctype_h;
