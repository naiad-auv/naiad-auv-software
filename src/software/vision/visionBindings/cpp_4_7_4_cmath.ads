pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_cmath is

   function c_abs (uu_x : double) return double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:84
   pragma Import (CPP, c_abs, "_ZSt3absd");

   function c_abs (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:90
   pragma Import (CPP, c_abs, "_ZSt3absf");

   function c_abs (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:94
   pragma Import (CPP, c_abs, "_ZSt3abse");

   function acos (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:109
   pragma Import (CPP, acos, "_ZSt4acosf");

   function acos (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:113
   pragma Import (CPP, acos, "_ZSt4acose");

   function asin (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:128
   pragma Import (CPP, asin, "_ZSt4asinf");

   function asin (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:132
   pragma Import (CPP, asin, "_ZSt4asine");

   function atan (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:147
   pragma Import (CPP, atan, "_ZSt4atanf");

   function atan (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:151
   pragma Import (CPP, atan, "_ZSt4atane");

   function atan2 (uu_y : float; uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:166
   pragma Import (CPP, atan2, "_ZSt5atan2ff");

   function atan2 (uu_y : long_double; uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:170
   pragma Import (CPP, atan2, "_ZSt5atan2ee");

   function ceil (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:187
   pragma Import (CPP, ceil, "_ZSt4ceilf");

   function ceil (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:191
   pragma Import (CPP, ceil, "_ZSt4ceile");

   function cos (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:206
   pragma Import (CPP, cos, "_ZSt3cosf");

   function cos (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:210
   pragma Import (CPP, cos, "_ZSt3cose");

   function cosh (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:225
   pragma Import (CPP, cosh, "_ZSt4coshf");

   function cosh (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:229
   pragma Import (CPP, cosh, "_ZSt4coshe");

   function exp (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:244
   pragma Import (CPP, exp, "_ZSt3expf");

   function exp (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:248
   pragma Import (CPP, exp, "_ZSt3expe");

   function fabs (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:263
   pragma Import (CPP, fabs, "_ZSt4fabsf");

   function fabs (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:267
   pragma Import (CPP, fabs, "_ZSt4fabse");

   function floor (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:282
   pragma Import (CPP, floor, "_ZSt5floorf");

   function floor (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:286
   pragma Import (CPP, floor, "_ZSt5floore");

   function fmod (uu_x : float; uu_y : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:301
   pragma Import (CPP, fmod, "_ZSt4fmodff");

   function fmod (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:305
   pragma Import (CPP, fmod, "_ZSt4fmodee");

   function frexp (uu_x : float; uu_exp : access int) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:322
   pragma Import (CPP, frexp, "_ZSt5frexpfPi");

   function frexp (uu_x : long_double; uu_exp : access int) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:326
   pragma Import (CPP, frexp, "_ZSt5frexpePi");

   function ldexp (uu_x : float; uu_exp : int) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:341
   pragma Import (CPP, ldexp, "_ZSt5ldexpfi");

   function ldexp (uu_x : long_double; uu_exp : int) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:345
   pragma Import (CPP, ldexp, "_ZSt5ldexpei");

   function log (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:360
   pragma Import (CPP, log, "_ZSt3logf");

   function log (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:364
   pragma Import (CPP, log, "_ZSt3loge");

   function log10 (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:379
   pragma Import (CPP, log10, "_ZSt5log10f");

   function log10 (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:383
   pragma Import (CPP, log10, "_ZSt5log10e");

   function modf (uu_x : float; uu_iptr : access float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:398
   pragma Import (CPP, modf, "_ZSt4modffPf");

   function modf (uu_x : long_double; uu_iptr : access long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:402
   pragma Import (CPP, modf, "_ZSt4modfePe");

   function pow (uu_x : float; uu_y : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:410
   pragma Import (CPP, pow, "_ZSt3powff");

   function pow (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:414
   pragma Import (CPP, pow, "_ZSt3powee");

   function pow (uu_x : double; uu_i : int) return double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:421
   pragma Import (CPP, pow, "_ZSt3powdi");

   function pow (uu_x : float; uu_n : int) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:425
   pragma Import (CPP, pow, "_ZSt3powfi");

   function pow (uu_x : long_double; uu_n : int) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:429
   pragma Import (CPP, pow, "_ZSt3powei");

   function sin (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:447
   pragma Import (CPP, sin, "_ZSt3sinf");

   function sin (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:451
   pragma Import (CPP, sin, "_ZSt3sine");

   function sinh (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:466
   pragma Import (CPP, sinh, "_ZSt4sinhf");

   function sinh (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:470
   pragma Import (CPP, sinh, "_ZSt4sinhe");

   function sqrt (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:485
   pragma Import (CPP, sqrt, "_ZSt4sqrtf");

   function sqrt (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:489
   pragma Import (CPP, sqrt, "_ZSt4sqrte");

   function tan (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:504
   pragma Import (CPP, tan, "_ZSt3tanf");

   function tan (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:508
   pragma Import (CPP, tan, "_ZSt3tane");

   function tanh (uu_x : float) return float;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:523
   pragma Import (CPP, tanh, "_ZSt4tanhf");

   function tanh (uu_x : long_double) return long_double;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cmath:527
   pragma Import (CPP, tanh, "_ZSt4tanhe");

end cpp_4_7_4_cmath;
