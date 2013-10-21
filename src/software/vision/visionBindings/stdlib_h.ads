pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with Interfaces.C.Extensions;
with xlocale_h;
with stddef_h;
with sys_types_h;

package stdlib_h is

   --  arg-macro: procedure WEXITSTATUS (status)
   --    __WEXITSTATUS (__WAIT_INT (status))
   --  arg-macro: procedure WTERMSIG (status)
   --    __WTERMSIG (__WAIT_INT (status))
   --  arg-macro: procedure WSTOPSIG (status)
   --    __WSTOPSIG (__WAIT_INT (status))
   --  arg-macro: procedure WIFEXITED (status)
   --    __WIFEXITED (__WAIT_INT (status))
   --  arg-macro: procedure WIFSIGNALED (status)
   --    __WIFSIGNALED (__WAIT_INT (status))
   --  arg-macro: procedure WIFSTOPPED (status)
   --    __WIFSTOPPED (__WAIT_INT (status))
   --  arg-macro: procedure WIFCONTINUED (status)
   --    __WIFCONTINUED (__WAIT_INT (status))

   RAND_MAX : constant := 2147483647;  --  /usr/include/stdlib.h:129

   EXIT_FAILURE : constant := 1;  --  /usr/include/stdlib.h:134
   EXIT_SUCCESS : constant := 0;  --  /usr/include/stdlib.h:135
   --  unsupported macro: MB_CUR_MAX (__ctype_get_mb_cur_max ())

   type div_t is record
      quot : aliased int;  -- /usr/include/stdlib.h:100
      c_rem : aliased int;  -- /usr/include/stdlib.h:101
   end record;
   pragma Convention (C_Pass_By_Copy, div_t);  -- /usr/include/stdlib.h:102

   --  skipped anonymous struct anon_2

   package Class_ldiv_t is
      type ldiv_t is limited record
         quot : aliased long;  -- /usr/include/stdlib.h:108
         c_rem : aliased long;  -- /usr/include/stdlib.h:109
      end record;
      pragma Import (CPP, ldiv_t);

      function New_ldiv_t return ldiv_t;  -- /usr/include/stdlib.h:110
      pragma CPP_Constructor (New_ldiv_t, "_ZN6ldiv_tC1Ev");


   end;
   use Class_ldiv_t;
   --  skipped anonymous struct anon_3

   package Class_lldiv_t is
      type lldiv_t is limited record
         quot : aliased Long_Long_Integer;  -- /usr/include/stdlib.h:120
         c_rem : aliased Long_Long_Integer;  -- /usr/include/stdlib.h:121
      end record;
      pragma Import (CPP, lldiv_t);

      function New_lldiv_t return lldiv_t;  -- /usr/include/stdlib.h:122
      pragma CPP_Constructor (New_lldiv_t, "_ZN7lldiv_tC1Ev");


   end;
   use Class_lldiv_t;
   --  skipped anonymous struct anon_4

   function atof (uu_nptr : Interfaces.C.Strings.chars_ptr) return double;  -- /usr/include/stdlib.h:145
   pragma Import (C, atof, "atof");

   function atoi (uu_nptr : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:148
   pragma Import (C, atoi, "atoi");

   function atol (uu_nptr : Interfaces.C.Strings.chars_ptr) return long;  -- /usr/include/stdlib.h:151
   pragma Import (C, atol, "atol");

   function atoll (uu_nptr : Interfaces.C.Strings.chars_ptr) return Long_Long_Integer;  -- /usr/include/stdlib.h:158
   pragma Import (C, atoll, "atoll");

   function strtod (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return double;  -- /usr/include/stdlib.h:165
   pragma Import (C, strtod, "strtod");

   function strtof (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return float;  -- /usr/include/stdlib.h:173
   pragma Import (C, strtof, "strtof");

   function strtold (uu_nptr : Interfaces.C.Strings.chars_ptr; uu_endptr : System.Address) return long_double;  -- /usr/include/stdlib.h:176
   pragma Import (C, strtold, "strtold");

   function strtol
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return long;  -- /usr/include/stdlib.h:184
   pragma Import (C, strtol, "strtol");

   function strtoul
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return unsigned_long;  -- /usr/include/stdlib.h:188
   pragma Import (C, strtoul, "strtoul");

   function strtoq
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer;  -- /usr/include/stdlib.h:196
   pragma Import (C, strtoq, "strtoq");

   function strtouq
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long;  -- /usr/include/stdlib.h:201
   pragma Import (C, strtouq, "strtouq");

   function strtoll
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer;  -- /usr/include/stdlib.h:210
   pragma Import (C, strtoll, "strtoll");

   function strtoull
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long;  -- /usr/include/stdlib.h:215
   pragma Import (C, strtoull, "strtoull");

   function strtol_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return long;  -- /usr/include/stdlib.h:240
   pragma Import (C, strtol_l, "strtol_l");

   function strtoul_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return unsigned_long;  -- /usr/include/stdlib.h:244
   pragma Import (C, strtoul_l, "strtoul_l");

   function strtoll_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return Long_Long_Integer;  -- /usr/include/stdlib.h:250
   pragma Import (C, strtoll_l, "strtoll_l");

   function strtoull_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return Extensions.unsigned_long_long;  -- /usr/include/stdlib.h:256
   pragma Import (C, strtoull_l, "strtoull_l");

   function strtod_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return double;  -- /usr/include/stdlib.h:261
   pragma Import (C, strtod_l, "strtod_l");

   function strtof_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return float;  -- /usr/include/stdlib.h:265
   pragma Import (C, strtof_l, "strtof_l");

   function strtold_l
     (uu_nptr : Interfaces.C.Strings.chars_ptr;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return long_double;  -- /usr/include/stdlib.h:269
   pragma Import (C, strtold_l, "strtold_l");

   function l64a (uu_n : long) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:311
   pragma Import (C, l64a, "l64a");

   function a64l (uu_s : Interfaces.C.Strings.chars_ptr) return long;  -- /usr/include/stdlib.h:314
   pragma Import (C, a64l, "a64l");

   function random return long;  -- /usr/include/stdlib.h:327
   pragma Import (C, random, "random");

   procedure srandom (uu_seed : unsigned);  -- /usr/include/stdlib.h:330
   pragma Import (C, srandom, "srandom");

   function initstate
     (uu_seed : unsigned;
      uu_statebuf : Interfaces.C.Strings.chars_ptr;
      uu_statelen : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:336
   pragma Import (C, initstate, "initstate");

   function setstate (uu_statebuf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:341
   pragma Import (C, setstate, "setstate");

   type random_data is record
      fptr : access sys_types_h.int32_t;  -- /usr/include/stdlib.h:351
      rptr : access sys_types_h.int32_t;  -- /usr/include/stdlib.h:352
      state : access sys_types_h.int32_t;  -- /usr/include/stdlib.h:353
      rand_type : aliased int;  -- /usr/include/stdlib.h:354
      rand_deg : aliased int;  -- /usr/include/stdlib.h:355
      rand_sep : aliased int;  -- /usr/include/stdlib.h:356
      end_ptr : access sys_types_h.int32_t;  -- /usr/include/stdlib.h:357
   end record;
   pragma Convention (C_Pass_By_Copy, random_data);  -- /usr/include/stdlib.h:349

   function random_r (uu_buf : access random_data; uu_result : access sys_types_h.int32_t) return int;  -- /usr/include/stdlib.h:360
   pragma Import (C, random_r, "random_r");

   function srandom_r (uu_seed : unsigned; uu_buf : access random_data) return int;  -- /usr/include/stdlib.h:363
   pragma Import (C, srandom_r, "srandom_r");

   function initstate_r
     (uu_seed : unsigned;
      uu_statebuf : Interfaces.C.Strings.chars_ptr;
      uu_statelen : stddef_h.size_t;
      uu_buf : access random_data) return int;  -- /usr/include/stdlib.h:366
   pragma Import (C, initstate_r, "initstate_r");

   function setstate_r (uu_statebuf : Interfaces.C.Strings.chars_ptr; uu_buf : access random_data) return int;  -- /usr/include/stdlib.h:371
   pragma Import (C, setstate_r, "setstate_r");

   function rand return int;  -- /usr/include/stdlib.h:380
   pragma Import (C, rand, "rand");

   procedure srand (uu_seed : unsigned);  -- /usr/include/stdlib.h:382
   pragma Import (C, srand, "srand");

   function rand_r (uu_seed : access unsigned) return int;  -- /usr/include/stdlib.h:387
   pragma Import (C, rand_r, "rand_r");

   function drand48 return double;  -- /usr/include/stdlib.h:395
   pragma Import (C, drand48, "drand48");

   function erand48 (uu_xsubi : access unsigned_short) return double;  -- /usr/include/stdlib.h:396
   pragma Import (C, erand48, "erand48");

   function lrand48 return long;  -- /usr/include/stdlib.h:399
   pragma Import (C, lrand48, "lrand48");

   function nrand48 (uu_xsubi : access unsigned_short) return long;  -- /usr/include/stdlib.h:400
   pragma Import (C, nrand48, "nrand48");

   function mrand48 return long;  -- /usr/include/stdlib.h:404
   pragma Import (C, mrand48, "mrand48");

   function jrand48 (uu_xsubi : access unsigned_short) return long;  -- /usr/include/stdlib.h:405
   pragma Import (C, jrand48, "jrand48");

   procedure srand48 (uu_seedval : long);  -- /usr/include/stdlib.h:409
   pragma Import (C, srand48, "srand48");

   function seed48 (uu_seed16v : access unsigned_short) return access unsigned_short;  -- /usr/include/stdlib.h:410
   pragma Import (C, seed48, "seed48");

   procedure lcong48 (uu_param : access unsigned_short);  -- /usr/include/stdlib.h:412
   pragma Import (C, lcong48, "lcong48");

   type drand48_data_uu_x_array is array (0 .. 2) of aliased unsigned_short;
   type drand48_data_uu_old_x_array is array (0 .. 2) of aliased unsigned_short;
   type drand48_data is record
      uu_x : aliased drand48_data_uu_x_array;  -- /usr/include/stdlib.h:420
      uu_old_x : aliased drand48_data_uu_old_x_array;  -- /usr/include/stdlib.h:421
      uu_c : aliased unsigned_short;  -- /usr/include/stdlib.h:422
      uu_init : aliased unsigned_short;  -- /usr/include/stdlib.h:423
      uu_a : aliased Extensions.unsigned_long_long;  -- /usr/include/stdlib.h:424
   end record;
   pragma Convention (C_Pass_By_Copy, drand48_data);  -- /usr/include/stdlib.h:418

   function drand48_r (uu_buffer : access drand48_data; uu_result : access double) return int;  -- /usr/include/stdlib.h:428
   pragma Import (C, drand48_r, "drand48_r");

   function erand48_r
     (uu_xsubi : access unsigned_short;
      uu_buffer : access drand48_data;
      uu_result : access double) return int;  -- /usr/include/stdlib.h:430
   pragma Import (C, erand48_r, "erand48_r");

   function lrand48_r (uu_buffer : access drand48_data; uu_result : access long) return int;  -- /usr/include/stdlib.h:435
   pragma Import (C, lrand48_r, "lrand48_r");

   function nrand48_r
     (uu_xsubi : access unsigned_short;
      uu_buffer : access drand48_data;
      uu_result : access long) return int;  -- /usr/include/stdlib.h:438
   pragma Import (C, nrand48_r, "nrand48_r");

   function mrand48_r (uu_buffer : access drand48_data; uu_result : access long) return int;  -- /usr/include/stdlib.h:444
   pragma Import (C, mrand48_r, "mrand48_r");

   function jrand48_r
     (uu_xsubi : access unsigned_short;
      uu_buffer : access drand48_data;
      uu_result : access long) return int;  -- /usr/include/stdlib.h:447
   pragma Import (C, jrand48_r, "jrand48_r");

   function srand48_r (uu_seedval : long; uu_buffer : access drand48_data) return int;  -- /usr/include/stdlib.h:453
   pragma Import (C, srand48_r, "srand48_r");

   function seed48_r (uu_seed16v : access unsigned_short; uu_buffer : access drand48_data) return int;  -- /usr/include/stdlib.h:456
   pragma Import (C, seed48_r, "seed48_r");

   function lcong48_r (uu_param : access unsigned_short; uu_buffer : access drand48_data) return int;  -- /usr/include/stdlib.h:459
   pragma Import (C, lcong48_r, "lcong48_r");

   function malloc (uu_size : stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:471
   pragma Import (C, malloc, "malloc");

   function calloc (uu_nmemb : stddef_h.size_t; uu_size : stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:473
   pragma Import (C, calloc, "calloc");

   function realloc (uu_ptr : System.Address; uu_size : stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:485
   pragma Import (C, realloc, "realloc");

   procedure free (uu_ptr : System.Address);  -- /usr/include/stdlib.h:488
   pragma Import (C, free, "free");

   procedure cfree (uu_ptr : System.Address);  -- /usr/include/stdlib.h:493
   pragma Import (C, cfree, "cfree");

   function valloc (uu_size : stddef_h.size_t) return System.Address;  -- /usr/include/stdlib.h:503
   pragma Import (C, valloc, "valloc");

   procedure c_abort;  -- /usr/include/stdlib.h:514
   pragma Import (C, c_abort, "abort");

   function atexit (uu_func : access procedure) return int;  -- /usr/include/stdlib.h:518
   pragma Import (C, atexit, "atexit");

   function at_quick_exit (uu_func : access procedure) return int;  -- /usr/include/stdlib.h:525
   pragma Import (C, at_quick_exit, "at_quick_exit");

   function on_exit (uu_func : access procedure (arg1 : int; arg2 : System.Address); uu_arg : System.Address) return int;  -- /usr/include/stdlib.h:536
   pragma Import (C, on_exit, "on_exit");

   procedure c_exit (uu_status : int);  -- /usr/include/stdlib.h:544
   pragma Import (C, c_exit, "exit");

   procedure quick_exit (uu_status : int);  -- /usr/include/stdlib.h:552
   pragma Import (C, quick_exit, "quick_exit");

   --  skipped func _Exit

   function getenv (uu_name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:567
   pragma Import (C, getenv, "getenv");

   function putenv (uu_string : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:579
   pragma Import (C, putenv, "putenv");

   function setenv
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_value : Interfaces.C.Strings.chars_ptr;
      uu_replace : int) return int;  -- /usr/include/stdlib.h:585
   pragma Import (C, setenv, "setenv");

   function unsetenv (uu_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:589
   pragma Import (C, unsetenv, "unsetenv");

   function clearenv return int;  -- /usr/include/stdlib.h:596
   pragma Import (C, clearenv, "clearenv");

   function mktemp (uu_template : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:606
   pragma Import (C, mktemp, "mktemp");

   function mkstemp (uu_template : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:620
   pragma Import (C, mkstemp, "mkstemp");

   function mkstemp64 (uu_template : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:630
   pragma Import (C, mkstemp64, "mkstemp64");

   function mkstemps (uu_template : Interfaces.C.Strings.chars_ptr; uu_suffixlen : int) return int;  -- /usr/include/stdlib.h:642
   pragma Import (C, mkstemps, "mkstemps");

   function mkstemps64 (uu_template : Interfaces.C.Strings.chars_ptr; uu_suffixlen : int) return int;  -- /usr/include/stdlib.h:652
   pragma Import (C, mkstemps64, "mkstemps64");

   function mkdtemp (uu_template : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:663
   pragma Import (C, mkdtemp, "mkdtemp");

   function mkostemp (uu_template : Interfaces.C.Strings.chars_ptr; uu_flags : int) return int;  -- /usr/include/stdlib.h:674
   pragma Import (C, mkostemp, "mkostemp");

   function mkostemp64 (uu_template : Interfaces.C.Strings.chars_ptr; uu_flags : int) return int;  -- /usr/include/stdlib.h:684
   pragma Import (C, mkostemp64, "mkostemp64");

   function mkostemps
     (uu_template : Interfaces.C.Strings.chars_ptr;
      uu_suffixlen : int;
      uu_flags : int) return int;  -- /usr/include/stdlib.h:694
   pragma Import (C, mkostemps, "mkostemps");

   function mkostemps64
     (uu_template : Interfaces.C.Strings.chars_ptr;
      uu_suffixlen : int;
      uu_flags : int) return int;  -- /usr/include/stdlib.h:706
   pragma Import (C, mkostemps64, "mkostemps64");

   function c_system (uu_command : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:717
   pragma Import (C, c_system, "system");

   function canonicalize_file_name (uu_name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:724
   pragma Import (C, canonicalize_file_name, "canonicalize_file_name");

   function realpath (uu_name : Interfaces.C.Strings.chars_ptr; uu_resolved : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:734
   pragma Import (C, realpath, "realpath");

   type uu_compar_fn_t is access function (arg1 : System.Address; arg2 : System.Address) return int;
   pragma Convention (C, uu_compar_fn_t);  -- /usr/include/stdlib.h:742

   subtype comparison_fn_t is uu_compar_fn_t;  -- /usr/include/stdlib.h:745

   type uu_compar_d_fn_t is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return int;
   pragma Convention (C, uu_compar_d_fn_t);  -- /usr/include/stdlib.h:749

   function bsearch
     (uu_key : System.Address;
      uu_base : System.Address;
      uu_nmemb : stddef_h.size_t;
      uu_size : stddef_h.size_t;
      uu_compar : uu_compar_fn_t) return System.Address;  -- /usr/include/stdlib.h:755
   pragma Import (C, bsearch, "bsearch");

   procedure qsort
     (uu_base : System.Address;
      uu_nmemb : stddef_h.size_t;
      uu_size : stddef_h.size_t;
      uu_compar : uu_compar_fn_t);  -- /usr/include/stdlib.h:761
   pragma Import (C, qsort, "qsort");

   procedure qsort_r
     (uu_base : System.Address;
      uu_nmemb : stddef_h.size_t;
      uu_size : stddef_h.size_t;
      uu_compar : uu_compar_d_fn_t;
      uu_arg : System.Address);  -- /usr/include/stdlib.h:764
   pragma Import (C, qsort_r, "qsort_r");

   function c_abs (uu_x : int) return int;  -- /usr/include/stdlib.h:771
   pragma Import (C, c_abs, "abs");

   function labs (uu_x : long) return long;  -- /usr/include/stdlib.h:772
   pragma Import (C, labs, "labs");

   function llabs (uu_x : Long_Long_Integer) return Long_Long_Integer;  -- /usr/include/stdlib.h:776
   pragma Import (C, llabs, "llabs");

   function div (uu_numer : int; uu_denom : int) return div_t;  -- /usr/include/stdlib.h:785
   pragma Import (C, div, "div");

   function ldiv (uu_numer : long; uu_denom : long) return ldiv_t;  -- /usr/include/stdlib.h:787
   pragma Import (C, ldiv, "ldiv");

   function lldiv (uu_numer : Long_Long_Integer; uu_denom : Long_Long_Integer) return lldiv_t;  -- /usr/include/stdlib.h:793
   pragma Import (C, lldiv, "lldiv");

   function ecvt
     (uu_value : double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:808
   pragma Import (C, ecvt, "ecvt");

   function fcvt
     (uu_value : double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:814
   pragma Import (C, fcvt, "fcvt");

   function gcvt
     (uu_value : double;
      uu_ndigit : int;
      uu_buf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:820
   pragma Import (C, gcvt, "gcvt");

   function qecvt
     (uu_value : long_double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:826
   pragma Import (C, qecvt, "qecvt");

   function qfcvt
     (uu_value : long_double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:829
   pragma Import (C, qfcvt, "qfcvt");

   function qgcvt
     (uu_value : long_double;
      uu_ndigit : int;
      uu_buf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:832
   pragma Import (C, qgcvt, "qgcvt");

   function ecvt_r
     (uu_value : double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_len : stddef_h.size_t) return int;  -- /usr/include/stdlib.h:838
   pragma Import (C, ecvt_r, "ecvt_r");

   function fcvt_r
     (uu_value : double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_len : stddef_h.size_t) return int;  -- /usr/include/stdlib.h:841
   pragma Import (C, fcvt_r, "fcvt_r");

   function qecvt_r
     (uu_value : long_double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_len : stddef_h.size_t) return int;  -- /usr/include/stdlib.h:845
   pragma Import (C, qecvt_r, "qecvt_r");

   function qfcvt_r
     (uu_value : long_double;
      uu_ndigit : int;
      uu_decpt : access int;
      uu_sign : access int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_len : stddef_h.size_t) return int;  -- /usr/include/stdlib.h:849
   pragma Import (C, qfcvt_r, "qfcvt_r");

   function mblen (uu_s : Interfaces.C.Strings.chars_ptr; uu_n : stddef_h.size_t) return int;  -- /usr/include/stdlib.h:860
   pragma Import (C, mblen, "mblen");

   function mbtowc
     (uu_pwc : access wchar_t;
      uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/stdlib.h:863
   pragma Import (C, mbtowc, "mbtowc");

   function wctomb (uu_s : Interfaces.C.Strings.chars_ptr; uu_wchar : wchar_t) return int;  -- /usr/include/stdlib.h:867
   pragma Import (C, wctomb, "wctomb");

   function mbstowcs
     (uu_pwcs : access wchar_t;
      uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/include/stdlib.h:871
   pragma Import (C, mbstowcs, "mbstowcs");

   function wcstombs
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_pwcs : access wchar_t;
      uu_n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/include/stdlib.h:874
   pragma Import (C, wcstombs, "wcstombs");

   function rpmatch (uu_response : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/stdlib.h:885
   pragma Import (C, rpmatch, "rpmatch");

   function getsubopt
     (uu_optionp : System.Address;
      uu_tokens : System.Address;
      uu_valuep : System.Address) return int;  -- /usr/include/stdlib.h:896
   pragma Import (C, getsubopt, "getsubopt");

   procedure setkey (uu_key : Interfaces.C.Strings.chars_ptr);  -- /usr/include/stdlib.h:905
   pragma Import (C, setkey, "setkey");

   function posix_openpt (uu_oflag : int) return int;  -- /usr/include/stdlib.h:913
   pragma Import (C, posix_openpt, "posix_openpt");

   function grantpt (uu_fd : int) return int;  -- /usr/include/stdlib.h:921
   pragma Import (C, grantpt, "grantpt");

   function unlockpt (uu_fd : int) return int;  -- /usr/include/stdlib.h:925
   pragma Import (C, unlockpt, "unlockpt");

   function ptsname (uu_fd : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/stdlib.h:930
   pragma Import (C, ptsname, "ptsname");

   function ptsname_r
     (uu_fd : int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t) return int;  -- /usr/include/stdlib.h:937
   pragma Import (C, ptsname_r, "ptsname_r");

   function getpt return int;  -- /usr/include/stdlib.h:941
   pragma Import (C, getpt, "getpt");

   function getloadavg (uu_loadavg : access double; uu_nelem : int) return int;  -- /usr/include/stdlib.h:948
   pragma Import (C, getloadavg, "getloadavg");

end stdlib_h;
