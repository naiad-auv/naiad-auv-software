pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Strings;
with xlocale_h;

package string_h is

   --  arg-macro: function strdupa (s)
   --    return __extension__ ({ __const char *__old := (s); size_t __len := strlen (__old) + 1; char *__new := (char *) __builtin_alloca (__len); (char *) memcpy (__new, __old, __len); });
   --  arg-macro: function strndupa (s, n)
   --    return __extension__ ({ __const char *__old := (s); size_t __len := strnlen (__old, (n)); char *__new := (char *) __builtin_alloca (__len + 1); __new(__len) := Character'Val (0); (char *) memcpy (__new, __old, __len); });
   function memcpy
     (uu_dest : System.Address;
      uu_src : System.Address;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:44
   pragma Import (C, memcpy, "memcpy");

   function memmove
     (uu_dest : System.Address;
      uu_src : System.Address;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:49
   pragma Import (C, memmove, "memmove");

   function memccpy
     (uu_dest : System.Address;
      uu_src : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:57
   pragma Import (C, memccpy, "memccpy");

   function memset
     (uu_s : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:65
   pragma Import (C, memset, "memset");

   function memcmp
     (uu_s1 : System.Address;
      uu_s2 : System.Address;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/string.h:68
   pragma Import (C, memcmp, "memcmp");

   function memchr
     (uu_s : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:75
   pragma Import (C, memchr, "memchr");

   function memchr
     (uu_s : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:77
   pragma Import (C, memchr, "memchr");

   function rawmemchr (uu_s : System.Address; uu_c : int) return System.Address;  -- /usr/include/string.h:104
   pragma Import (C, rawmemchr, "rawmemchr");

   function rawmemchr (uu_s : System.Address; uu_c : int) return System.Address;  -- /usr/include/string.h:106
   pragma Import (C, rawmemchr, "rawmemchr");

   function memrchr
     (uu_s : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:115
   pragma Import (C, memrchr, "memrchr");

   function memrchr
     (uu_s : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:117
   pragma Import (C, memrchr, "memrchr");

   function strcpy (uu_dest : Interfaces.C.Strings.chars_ptr; uu_src : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:128
   pragma Import (C, strcpy, "strcpy");

   function strncpy
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:131
   pragma Import (C, strncpy, "strncpy");

   function strcat (uu_dest : Interfaces.C.Strings.chars_ptr; uu_src : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:136
   pragma Import (C, strcat, "strcat");

   function strncat
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:139
   pragma Import (C, strncat, "strncat");

   function strcmp (uu_s1 : Interfaces.C.Strings.chars_ptr; uu_s2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/string.h:143
   pragma Import (C, strcmp, "strcmp");

   function strncmp
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/string.h:146
   pragma Import (C, strncmp, "strncmp");

   function strcoll (uu_s1 : Interfaces.C.Strings.chars_ptr; uu_s2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/string.h:150
   pragma Import (C, strcoll, "strcoll");

   function strxfrm
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/include/string.h:153
   pragma Import (C, strxfrm, "strxfrm");

   function strcoll_l
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_l : xlocale_h.uu_locale_t) return int;  -- /usr/include/string.h:165
   pragma Import (C, strcoll_l, "strcoll_l");

   function strxfrm_l
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_l : xlocale_h.uu_locale_t) return stddef_h.size_t;  -- /usr/include/string.h:168
   pragma Import (C, strxfrm_l, "strxfrm_l");

   function strdup (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:175
   pragma Import (C, strdup, "strdup");

   function strndup (uu_string : Interfaces.C.Strings.chars_ptr; uu_n : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:183
   pragma Import (C, strndup, "strndup");

   function strchr (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:215
   pragma Import (C, strchr, "strchr");

   function strchr (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:217
   pragma Import (C, strchr, "strchr");

   function strrchr (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:242
   pragma Import (C, strrchr, "strrchr");

   function strrchr (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:244
   pragma Import (C, strrchr, "strrchr");

   function strchrnul (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:271
   pragma Import (C, strchrnul, "strchrnul");

   function strchrnul (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:273
   pragma Import (C, strchrnul, "strchrnul");

   function strcspn (uu_s : Interfaces.C.Strings.chars_ptr; uu_reject : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t;  -- /usr/include/string.h:284
   pragma Import (C, strcspn, "strcspn");

   function strspn (uu_s : Interfaces.C.Strings.chars_ptr; uu_accept : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t;  -- /usr/include/string.h:288
   pragma Import (C, strspn, "strspn");

   function strpbrk (uu_s : Interfaces.C.Strings.chars_ptr; uu_accept : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:294
   pragma Import (C, strpbrk, "strpbrk");

   function strpbrk (uu_s : Interfaces.C.Strings.chars_ptr; uu_accept : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:296
   pragma Import (C, strpbrk, "strpbrk");

   function strstr (uu_haystack : Interfaces.C.Strings.chars_ptr; uu_needle : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:321
   pragma Import (C, strstr, "strstr");

   function strstr (uu_haystack : Interfaces.C.Strings.chars_ptr; uu_needle : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:323
   pragma Import (C, strstr, "strstr");

   function strtok (uu_s : Interfaces.C.Strings.chars_ptr; uu_delim : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:348
   pragma Import (C, strtok, "strtok");

   function strtok_r
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_delim : Interfaces.C.Strings.chars_ptr;
      uu_save_ptr : System.Address) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:359
   pragma Import (C, strtok_r, "strtok_r");

   function strcasestr (uu_haystack : Interfaces.C.Strings.chars_ptr; uu_needle : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:367
   pragma Import (C, strcasestr, "strcasestr");

   function strcasestr (uu_haystack : Interfaces.C.Strings.chars_ptr; uu_needle : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:369
   pragma Import (C, strcasestr, "strcasestr");

   function memmem
     (uu_haystack : System.Address;
      uu_haystacklen : stddef_h.size_t;
      uu_needle : System.Address;
      uu_needlelen : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:382
   pragma Import (C, memmem, "memmem");

   function mempcpy
     (uu_dest : System.Address;
      uu_src : System.Address;
      uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:391
   pragma Import (C, mempcpy, "mempcpy");

   function strlen (uu_s : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t;  -- /usr/include/string.h:399
   pragma Import (C, strlen, "strlen");

   function strnlen (uu_string : Interfaces.C.Strings.chars_ptr; uu_maxlen : stddef_h.size_t) return stddef_h.size_t;  -- /usr/include/string.h:406
   pragma Import (C, strnlen, "strnlen");

   function strerror (uu_errnum : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:413
   pragma Import (C, strerror, "strerror");

   function strerror_r
     (uu_errnum : int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:438
   pragma Import (C, strerror_r, "strerror_r");

   function strerror_l (uu_errnum : int; uu_l : xlocale_h.uu_locale_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:445
   pragma Import (C, strerror_l, "strerror_l");

   procedure bcopy
     (uu_src : System.Address;
      uu_dest : System.Address;
      uu_n : stddef_h.size_t);  -- /usr/include/string.h:455
   pragma Import (C, bcopy, "bcopy");

   procedure bzero (uu_s : System.Address; uu_n : stddef_h.size_t);  -- /usr/include/string.h:459
   pragma Import (C, bzero, "bzero");

   function bcmp
     (uu_s1 : System.Address;
      uu_s2 : System.Address;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/string.h:462
   pragma Import (C, bcmp, "bcmp");

   function index (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:469
   pragma Import (C, index, "index");

   function index (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:471
   pragma Import (C, index, "index");

   function rindex (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:497
   pragma Import (C, rindex, "rindex");

   function rindex (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:499
   pragma Import (C, rindex, "rindex");

   function ffs (uu_i : int) return int;  -- /usr/include/string.h:523
   pragma Import (C, ffs, "ffs");

   function ffsl (uu_l : long) return int;  -- /usr/include/string.h:528
   pragma Import (C, ffsl, "ffsl");

   function ffsll (uu_ll : Long_Long_Integer) return int;  -- /usr/include/string.h:530
   pragma Import (C, ffsll, "ffsll");

   function strcasecmp (uu_s1 : Interfaces.C.Strings.chars_ptr; uu_s2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/string.h:536
   pragma Import (C, strcasecmp, "strcasecmp");

   function strncasecmp
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/string.h:540
   pragma Import (C, strncasecmp, "strncasecmp");

   function strcasecmp_l
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_loc : xlocale_h.uu_locale_t) return int;  -- /usr/include/string.h:547
   pragma Import (C, strcasecmp_l, "strcasecmp_l");

   function strncasecmp_l
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_loc : xlocale_h.uu_locale_t) return int;  -- /usr/include/string.h:551
   pragma Import (C, strncasecmp_l, "strncasecmp_l");

   function strsep (uu_stringp : System.Address; uu_delim : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:559
   pragma Import (C, strsep, "strsep");

   function strsignal (uu_sig : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:566
   pragma Import (C, strsignal, "strsignal");

   function stpcpy (uu_dest : Interfaces.C.Strings.chars_ptr; uu_src : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:571
   pragma Import (C, stpcpy, "stpcpy");

   function stpncpy
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:579
   pragma Import (C, stpncpy, "stpncpy");

   function strverscmp (uu_s1 : Interfaces.C.Strings.chars_ptr; uu_s2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/string.h:586
   pragma Import (C, strverscmp, "strverscmp");

   function strfry (uu_string : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:590
   pragma Import (C, strfry, "strfry");

   function memfrob (uu_s : System.Address; uu_n : stddef_h.size_t) return System.Address;  -- /usr/include/string.h:593
   pragma Import (C, memfrob, "memfrob");

   function basename (uu_filename : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:601
   pragma Import (C, basename, "basename");

   function basename (uu_filename : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/string.h:603
   pragma Import (C, basename, "basename");

end string_h;
