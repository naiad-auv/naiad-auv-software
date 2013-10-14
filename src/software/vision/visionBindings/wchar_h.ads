pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;
with xlocale_h;
with System;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
limited with stdio_h;
limited with time_h;

package wchar_h is

   --  unsupported macro: WCHAR_MIN __WCHAR_MIN
   --  unsupported macro: WCHAR_MAX __WCHAR_MAX

   WEOF : constant := (16#ffffffff#);  --  /usr/include/wchar.h:119

   subtype uu_mbstate_t_uu_wchb_array is Interfaces.C.char_array (0 .. 3);
   type anon_20 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wch : aliased unsigned;  -- /usr/include/wchar.h:89
         when others =>
            uu_wchb : aliased uu_mbstate_t_uu_wchb_array;  -- /usr/include/wchar.h:93
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_20);
   pragma Unchecked_Union (anon_20);
   type uu_mbstate_t is record
      uu_count : aliased int;  -- /usr/include/wchar.h:85
      uu_value : anon_20;  -- /usr/include/wchar.h:94
   end record;
   pragma Convention (C_Pass_By_Copy, uu_mbstate_t);  -- /usr/include/wchar.h:95

   --  skipped anonymous struct anon_19

   subtype mbstate_t is uu_mbstate_t;

   function wcscpy (uu_dest : access wchar_t; uu_src : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:144
   pragma Import (C, wcscpy, "wcscpy");

   function wcsncpy
     (uu_dest : access wchar_t;
      uu_src : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:147
   pragma Import (C, wcsncpy, "wcsncpy");

   function wcscat (uu_dest : access wchar_t; uu_src : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:152
   pragma Import (C, wcscat, "wcscat");

   function wcsncat
     (uu_dest : access wchar_t;
      uu_src : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:155
   pragma Import (C, wcsncat, "wcsncat");

   function wcscmp (uu_s1 : access wchar_t; uu_s2 : access wchar_t) return int;  -- /usr/include/wchar.h:160
   pragma Import (C, wcscmp, "wcscmp");

   function wcsncmp
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/wchar.h:163
   pragma Import (C, wcsncmp, "wcsncmp");

   function wcscasecmp (uu_s1 : access wchar_t; uu_s2 : access wchar_t) return int;  -- /usr/include/wchar.h:169
   pragma Import (C, wcscasecmp, "wcscasecmp");

   function wcsncasecmp
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/wchar.h:172
   pragma Import (C, wcsncasecmp, "wcsncasecmp");

   function wcscasecmp_l
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_loc : xlocale_h.uu_locale_t) return int;  -- /usr/include/wchar.h:179
   pragma Import (C, wcscasecmp_l, "wcscasecmp_l");

   function wcsncasecmp_l
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t;
      uu_loc : xlocale_h.uu_locale_t) return int;  -- /usr/include/wchar.h:182
   pragma Import (C, wcsncasecmp_l, "wcsncasecmp_l");

   function wcscoll (uu_s1 : access wchar_t; uu_s2 : access wchar_t) return int;  -- /usr/include/wchar.h:189
   pragma Import (C, wcscoll, "wcscoll");

   function wcsxfrm
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/include/wchar.h:193
   pragma Import (C, wcsxfrm, "wcsxfrm");

   function wcscoll_l
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_loc : xlocale_h.uu_locale_t) return int;  -- /usr/include/wchar.h:203
   pragma Import (C, wcscoll_l, "wcscoll_l");

   function wcsxfrm_l
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t;
      uu_loc : xlocale_h.uu_locale_t) return stddef_h.size_t;  -- /usr/include/wchar.h:209
   pragma Import (C, wcsxfrm_l, "wcsxfrm_l");

   function wcsdup (uu_s : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:213
   pragma Import (C, wcsdup, "wcsdup");

   function wcschr (uu_wcs : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:219
   pragma Import (C, wcschr, "wcschr");

   function wcschr (uu_wcs : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:221
   pragma Import (C, wcschr, "wcschr");

   function wcsrchr (uu_wcs : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:229
   pragma Import (C, wcsrchr, "wcsrchr");

   function wcsrchr (uu_wcs : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:231
   pragma Import (C, wcsrchr, "wcsrchr");

   function wcschrnul (uu_s : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:242
   pragma Import (C, wcschrnul, "wcschrnul");

   function wcscspn (uu_wcs : access wchar_t; uu_reject : access wchar_t) return stddef_h.size_t;  -- /usr/include/wchar.h:249
   pragma Import (C, wcscspn, "wcscspn");

   function wcsspn (uu_wcs : access wchar_t; uu_accept : access wchar_t) return stddef_h.size_t;  -- /usr/include/wchar.h:253
   pragma Import (C, wcsspn, "wcsspn");

   function wcspbrk (uu_wcs : access wchar_t; uu_accept : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:257
   pragma Import (C, wcspbrk, "wcspbrk");

   function wcspbrk (uu_wcs : access wchar_t; uu_accept : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:259
   pragma Import (C, wcspbrk, "wcspbrk");

   function wcsstr (uu_haystack : access wchar_t; uu_needle : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:268
   pragma Import (C, wcsstr, "wcsstr");

   function wcsstr (uu_haystack : access wchar_t; uu_needle : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:270
   pragma Import (C, wcsstr, "wcsstr");

   function wcstok
     (uu_s : access wchar_t;
      uu_delim : access wchar_t;
      uu_ptr : System.Address) return access wchar_t;  -- /usr/include/wchar.h:279
   pragma Import (C, wcstok, "wcstok");

   function wcslen (uu_s : access wchar_t) return stddef_h.size_t;  -- /usr/include/wchar.h:284
   pragma Import (C, wcslen, "wcslen");

   function wcswcs (uu_haystack : access wchar_t; uu_needle : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:290
   pragma Import (C, wcswcs, "wcswcs");

   function wcswcs (uu_haystack : access wchar_t; uu_needle : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:292
   pragma Import (C, wcswcs, "wcswcs");

   function wcsnlen (uu_s : access wchar_t; uu_maxlen : stddef_h.size_t) return stddef_h.size_t;  -- /usr/include/wchar.h:303
   pragma Import (C, wcsnlen, "wcsnlen");

   function wmemchr
     (uu_s : access wchar_t;
      uu_c : wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:311
   pragma Import (C, wmemchr, "wmemchr");

   function wmemchr
     (uu_s : access wchar_t;
      uu_c : wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:313
   pragma Import (C, wmemchr, "wmemchr");

   function wmemcmp
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/wchar.h:322
   pragma Import (C, wmemcmp, "wmemcmp");

   function wmemcpy
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:326
   pragma Import (C, wmemcpy, "wmemcpy");

   function wmemmove
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:331
   pragma Import (C, wmemmove, "wmemmove");

   function wmemset
     (uu_s : access wchar_t;
      uu_c : wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:335
   pragma Import (C, wmemset, "wmemset");

   function wmempcpy
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:341
   pragma Import (C, wmempcpy, "wmempcpy");

   function btowc (uu_c : int) return stddef_h.wint_t;  -- /usr/include/wchar.h:350
   pragma Import (C, btowc, "btowc");

   function wctob (uu_c : stddef_h.wint_t) return int;  -- /usr/include/wchar.h:354
   pragma Import (C, wctob, "wctob");

   function mbsinit (uu_ps : System.Address) return int;  -- /usr/include/wchar.h:358
   pragma Import (C, mbsinit, "mbsinit");

   function mbrtowc
     (uu_pwc : access wchar_t;
      uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_p : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:362
   pragma Import (C, mbrtowc, "mbrtowc");

   function wcrtomb
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_wc : wchar_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:367
   pragma Import (C, wcrtomb, "wcrtomb");

   function mbrlen
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:373
   pragma Import (C, mbrlen, "mbrlen");

   function mbsrtowcs
     (uu_dst : access wchar_t;
      uu_src : System.Address;
      uu_len : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:405
   pragma Import (C, mbsrtowcs, "mbsrtowcs");

   function wcsrtombs
     (uu_dst : Interfaces.C.Strings.chars_ptr;
      uu_src : System.Address;
      uu_len : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:411
   pragma Import (C, wcsrtombs, "wcsrtombs");

   function mbsnrtowcs
     (uu_dst : access wchar_t;
      uu_src : System.Address;
      uu_nmc : stddef_h.size_t;
      uu_len : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:420
   pragma Import (C, mbsnrtowcs, "mbsnrtowcs");

   function wcsnrtombs
     (uu_dst : Interfaces.C.Strings.chars_ptr;
      uu_src : System.Address;
      uu_nwc : stddef_h.size_t;
      uu_len : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:426
   pragma Import (C, wcsnrtombs, "wcsnrtombs");

   function wcwidth (uu_c : wchar_t) return int;  -- /usr/include/wchar.h:436
   pragma Import (C, wcwidth, "wcwidth");

   function wcswidth (uu_s : access wchar_t; uu_n : stddef_h.size_t) return int;  -- /usr/include/wchar.h:440
   pragma Import (C, wcswidth, "wcswidth");

   function wcstod (uu_nptr : access wchar_t; uu_endptr : System.Address) return double;  -- /usr/include/wchar.h:447
   pragma Import (C, wcstod, "wcstod");

   function wcstof (uu_nptr : access wchar_t; uu_endptr : System.Address) return float;  -- /usr/include/wchar.h:454
   pragma Import (C, wcstof, "wcstof");

   function wcstold (uu_nptr : access wchar_t; uu_endptr : System.Address) return long_double;  -- /usr/include/wchar.h:456
   pragma Import (C, wcstold, "wcstold");

   function wcstol
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return long;  -- /usr/include/wchar.h:465
   pragma Import (C, wcstol, "wcstol");

   function wcstoul
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return unsigned_long;  -- /usr/include/wchar.h:470
   pragma Import (C, wcstoul, "wcstoul");

   function wcstoll
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer;  -- /usr/include/wchar.h:480
   pragma Import (C, wcstoll, "wcstoll");

   function wcstoull
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long;  -- /usr/include/wchar.h:487
   pragma Import (C, wcstoull, "wcstoull");

   function wcstoq
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer;  -- /usr/include/wchar.h:497
   pragma Import (C, wcstoq, "wcstoq");

   function wcstouq
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long;  -- /usr/include/wchar.h:504
   pragma Import (C, wcstouq, "wcstouq");

   function wcstol_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return long;  -- /usr/include/wchar.h:527
   pragma Import (C, wcstol_l, "wcstol_l");

   function wcstoul_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return unsigned_long;  -- /usr/include/wchar.h:531
   pragma Import (C, wcstoul_l, "wcstoul_l");

   function wcstoll_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return Long_Long_Integer;  -- /usr/include/wchar.h:536
   pragma Import (C, wcstoll_l, "wcstoll_l");

   function wcstoull_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return Extensions.unsigned_long_long;  -- /usr/include/wchar.h:541
   pragma Import (C, wcstoull_l, "wcstoull_l");

   function wcstod_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return double;  -- /usr/include/wchar.h:546
   pragma Import (C, wcstod_l, "wcstod_l");

   function wcstof_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return float;  -- /usr/include/wchar.h:550
   pragma Import (C, wcstof_l, "wcstof_l");

   function wcstold_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return long_double;  -- /usr/include/wchar.h:554
   pragma Import (C, wcstold_l, "wcstold_l");

   function wcpcpy (uu_dest : access wchar_t; uu_src : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:563
   pragma Import (C, wcpcpy, "wcpcpy");

   function wcpncpy
     (uu_dest : access wchar_t;
      uu_src : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:568
   pragma Import (C, wcpncpy, "wcpncpy");

   function open_wmemstream (uu_bufloc : System.Address; uu_sizeloc : access stddef_h.size_t) return access stdio_h.uu_FILE;  -- /usr/include/wchar.h:577
   pragma Import (C, open_wmemstream, "open_wmemstream");

   function fwide (uu_fp : access stdio_h.uu_FILE; uu_mode : int) return int;  -- /usr/include/wchar.h:584
   pragma Import (C, fwide, "fwide");

   function fwprintf (uu_stream : access stdio_h.uu_FILE; uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:591
   pragma Import (C, fwprintf, "fwprintf");

   function wprintf (uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:598
   pragma Import (C, wprintf, "wprintf");

   function swprintf
     (uu_s : access wchar_t;
      uu_n : stddef_h.size_t;
      uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:601
   pragma Import (C, swprintf, "swprintf");

   function vfwprintf
     (uu_s : access stdio_h.uu_FILE;
      uu_format : access wchar_t;
      uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:609
   pragma Import (C, vfwprintf, "vfwprintf");

   function vwprintf (uu_format : access wchar_t; uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:617
   pragma Import (C, vwprintf, "vwprintf");

   function vswprintf
     (uu_s : access wchar_t;
      uu_n : stddef_h.size_t;
      uu_format : access wchar_t;
      uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:622
   pragma Import (C, vswprintf, "vswprintf");

   function fwscanf (uu_stream : access stdio_h.uu_FILE; uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:632
   pragma Import (C, fwscanf, "fwscanf");

   function wscanf (uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:639
   pragma Import (C, wscanf, "wscanf");

   function swscanf (uu_s : access wchar_t; uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:642
   pragma Import (C, swscanf, "swscanf");

   function vfwscanf
     (uu_s : access stdio_h.uu_FILE;
      uu_format : access wchar_t;
      uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:686
   pragma Import (C, vfwscanf, "vfwscanf");

   function vwscanf (uu_format : access wchar_t; uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:694
   pragma Import (C, vwscanf, "vwscanf");

   function vswscanf
     (uu_s : access wchar_t;
      uu_format : access wchar_t;
      uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:698
   pragma Import (C, vswscanf, "vswscanf");

   function fgetwc (uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:742
   pragma Import (C, fgetwc, "fgetwc");

   function getwc (uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:743
   pragma Import (C, getwc, "getwc");

   function getwchar return stddef_h.wint_t;  -- /usr/include/wchar.h:749
   pragma Import (C, getwchar, "getwchar");

   function fputwc (uu_wc : wchar_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:756
   pragma Import (C, fputwc, "fputwc");

   function putwc (uu_wc : wchar_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:757
   pragma Import (C, putwc, "putwc");

   function putwchar (uu_wc : wchar_t) return stddef_h.wint_t;  -- /usr/include/wchar.h:763
   pragma Import (C, putwchar, "putwchar");

   function fgetws
     (uu_ws : access wchar_t;
      uu_n : int;
      uu_stream : access stdio_h.uu_FILE) return access wchar_t;  -- /usr/include/wchar.h:771
   pragma Import (C, fgetws, "fgetws");

   function fputws (uu_ws : access wchar_t; uu_stream : access stdio_h.uu_FILE) return int;  -- /usr/include/wchar.h:778
   pragma Import (C, fputws, "fputws");

   function ungetwc (uu_wc : stddef_h.wint_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:786
   pragma Import (C, ungetwc, "ungetwc");

   function getwc_unlocked (uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:798
   pragma Import (C, getwc_unlocked, "getwc_unlocked");

   function getwchar_unlocked return stddef_h.wint_t;  -- /usr/include/wchar.h:799
   pragma Import (C, getwchar_unlocked, "getwchar_unlocked");

   function fgetwc_unlocked (uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:807
   pragma Import (C, fgetwc_unlocked, "fgetwc_unlocked");

   function fputwc_unlocked (uu_wc : wchar_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:815
   pragma Import (C, fputwc_unlocked, "fputwc_unlocked");

   function putwc_unlocked (uu_wc : wchar_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:824
   pragma Import (C, putwc_unlocked, "putwc_unlocked");

   function putwchar_unlocked (uu_wc : wchar_t) return stddef_h.wint_t;  -- /usr/include/wchar.h:825
   pragma Import (C, putwchar_unlocked, "putwchar_unlocked");

   function fgetws_unlocked
     (uu_ws : access wchar_t;
      uu_n : int;
      uu_stream : access stdio_h.uu_FILE) return access wchar_t;  -- /usr/include/wchar.h:834
   pragma Import (C, fgetws_unlocked, "fgetws_unlocked");

   function fputws_unlocked (uu_ws : access wchar_t; uu_stream : access stdio_h.uu_FILE) return int;  -- /usr/include/wchar.h:843
   pragma Import (C, fputws_unlocked, "fputws_unlocked");

   function wcsftime
     (uu_s : access wchar_t;
      uu_maxsize : stddef_h.size_t;
      uu_format : access wchar_t;
      uu_tp : access constant time_h.tm) return stddef_h.size_t;  -- /usr/include/wchar.h:852
   pragma Import (C, wcsftime, "wcsftime");

   function wcsftime_l
     (uu_s : access wchar_t;
      uu_maxsize : stddef_h.size_t;
      uu_format : access wchar_t;
      uu_tp : access constant time_h.tm;
      uu_loc : xlocale_h.uu_locale_t) return stddef_h.size_t;  -- /usr/include/wchar.h:862
   pragma Import (C, wcsftime_l, "wcsftime_l");

end wchar_h;
