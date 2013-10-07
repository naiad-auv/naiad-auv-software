pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package bits_mathcalls_h is

   function acosl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:55
   pragma Import (C, acosl, "acosl");

   function acosf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:55
   pragma Import (C, acosf, "acosf");

   function acos (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:55
   pragma Import (C, acos, "acos");

   function asinl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:57
   pragma Import (C, asinl, "asinl");

   function asinf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:57
   pragma Import (C, asinf, "asinf");

   function asin (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:57
   pragma Import (C, asin, "asin");

   function atanl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:59
   pragma Import (C, atanl, "atanl");

   function atanf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:59
   pragma Import (C, atanf, "atanf");

   function atan (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:59
   pragma Import (C, atan, "atan");

   function atan2l (uu_y : long_double; uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:61
   pragma Import (C, atan2l, "atan2l");

   function atan2f (uu_y : float; uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:61
   pragma Import (C, atan2f, "atan2f");

   function atan2 (uu_y : double; uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:61
   pragma Import (C, atan2, "atan2");

   function cosl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:64
   pragma Import (C, cosl, "cosl");

   function cosf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:64
   pragma Import (C, cosf, "cosf");

   function cos (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:64
   pragma Import (C, cos, "cos");

   function sinl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:66
   pragma Import (C, sinl, "sinl");

   function sinf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:66
   pragma Import (C, sinf, "sinf");

   function sin (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:66
   pragma Import (C, sin, "sin");

   function tanl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:68
   pragma Import (C, tanl, "tanl");

   function tanf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:68
   pragma Import (C, tanf, "tanf");

   function tan (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:68
   pragma Import (C, tan, "tan");

   function coshl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:73
   pragma Import (C, coshl, "coshl");

   function coshf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:73
   pragma Import (C, coshf, "coshf");

   function cosh (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:73
   pragma Import (C, cosh, "cosh");

   function sinhl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:75
   pragma Import (C, sinhl, "sinhl");

   function sinhf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:75
   pragma Import (C, sinhf, "sinhf");

   function sinh (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:75
   pragma Import (C, sinh, "sinh");

   function tanhl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:77
   pragma Import (C, tanhl, "tanhl");

   function tanhf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:77
   pragma Import (C, tanhf, "tanhf");

   function tanh (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:77
   pragma Import (C, tanh, "tanh");

   procedure sincos
     (uu_x : double;
      uu_sinx : access double;
      uu_cosx : access double);  -- /usr/include/bits/mathcalls.h:82
   pragma Import (C, sincos, "sincos");

   procedure sincosl
     (uu_x : long_double;
      uu_sinx : access long_double;
      uu_cosx : access long_double);  -- /usr/include/bits/mathcalls.h:83
   pragma Import (C, sincosl, "sincosl");

   procedure sincosf
     (uu_x : float;
      uu_sinx : access float;
      uu_cosx : access float);  -- /usr/include/bits/mathcalls.h:83
   pragma Import (C, sincosf, "sincosf");

   function acoshl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:89
   pragma Import (C, acoshl, "acoshl");

   function acoshf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:89
   pragma Import (C, acoshf, "acoshf");

   function acosh (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:89
   pragma Import (C, acosh, "acosh");

   function asinhl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:91
   pragma Import (C, asinhl, "asinhl");

   function asinhf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:91
   pragma Import (C, asinhf, "asinhf");

   function asinh (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:91
   pragma Import (C, asinh, "asinh");

   function atanhl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:93
   pragma Import (C, atanhl, "atanhl");

   function atanhf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:93
   pragma Import (C, atanhf, "atanhf");

   function atanh (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:93
   pragma Import (C, atanh, "atanh");

   function expl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:101
   pragma Import (C, expl, "expl");

   function expf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:101
   pragma Import (C, expf, "expf");

   function exp (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:101
   pragma Import (C, exp, "exp");

   function frexpl (uu_x : long_double; uu_exponent : access int) return long_double;  -- /usr/include/bits/mathcalls.h:104
   pragma Import (C, frexpl, "frexpl");

   function frexpf (uu_x : float; uu_exponent : access int) return float;  -- /usr/include/bits/mathcalls.h:104
   pragma Import (C, frexpf, "frexpf");

   function frexp (uu_x : double; uu_exponent : access int) return double;  -- /usr/include/bits/mathcalls.h:104
   pragma Import (C, frexp, "frexp");

   function ldexpl (uu_x : long_double; uu_exponent : int) return long_double;  -- /usr/include/bits/mathcalls.h:107
   pragma Import (C, ldexpl, "ldexpl");

   function ldexpf (uu_x : float; uu_exponent : int) return float;  -- /usr/include/bits/mathcalls.h:107
   pragma Import (C, ldexpf, "ldexpf");

   function ldexp (uu_x : double; uu_exponent : int) return double;  -- /usr/include/bits/mathcalls.h:107
   pragma Import (C, ldexp, "ldexp");

   function logl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:110
   pragma Import (C, logl, "logl");

   function logf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:110
   pragma Import (C, logf, "logf");

   function log (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:110
   pragma Import (C, log, "log");

   function log10l (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:113
   pragma Import (C, log10l, "log10l");

   function log10f (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:113
   pragma Import (C, log10f, "log10f");

   function log10 (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:113
   pragma Import (C, log10, "log10");

   function modfl (uu_x : long_double; uu_iptr : access long_double) return long_double;  -- /usr/include/bits/mathcalls.h:116
   pragma Import (C, modfl, "modfl");

   function modff (uu_x : float; uu_iptr : access float) return float;  -- /usr/include/bits/mathcalls.h:116
   pragma Import (C, modff, "modff");

   function modf (uu_x : double; uu_iptr : access double) return double;  -- /usr/include/bits/mathcalls.h:116
   pragma Import (C, modf, "modf");

   function exp10l (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:122
   pragma Import (C, exp10l, "exp10l");

   function exp10f (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:122
   pragma Import (C, exp10f, "exp10f");

   function exp10 (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:122
   pragma Import (C, exp10, "exp10");

   function pow10l (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:124
   pragma Import (C, pow10l, "pow10l");

   function pow10f (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:124
   pragma Import (C, pow10f, "pow10f");

   function pow10 (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:124
   pragma Import (C, pow10, "pow10");

   function expm1l (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:130
   pragma Import (C, expm1l, "expm1l");

   function expm1f (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:130
   pragma Import (C, expm1f, "expm1f");

   function expm1 (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:130
   pragma Import (C, expm1, "expm1");

   function log1pl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:133
   pragma Import (C, log1pl, "log1pl");

   function log1pf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:133
   pragma Import (C, log1pf, "log1pf");

   function log1p (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:133
   pragma Import (C, log1p, "log1p");

   function logbl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:136
   pragma Import (C, logbl, "logbl");

   function logbf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:136
   pragma Import (C, logbf, "logbf");

   function logb (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:136
   pragma Import (C, logb, "logb");

   function exp2l (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:143
   pragma Import (C, exp2l, "exp2l");

   function exp2f (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:143
   pragma Import (C, exp2f, "exp2f");

   function exp2 (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:143
   pragma Import (C, exp2, "exp2");

   function log2l (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:146
   pragma Import (C, log2l, "log2l");

   function log2f (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:146
   pragma Import (C, log2f, "log2f");

   function log2 (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:146
   pragma Import (C, log2, "log2");

   function powl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:155
   pragma Import (C, powl, "powl");

   function powf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:155
   pragma Import (C, powf, "powf");

   function pow (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:155
   pragma Import (C, pow, "pow");

   function sqrtl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:158
   pragma Import (C, sqrtl, "sqrtl");

   function sqrtf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:158
   pragma Import (C, sqrtf, "sqrtf");

   function sqrt (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:158
   pragma Import (C, sqrt, "sqrt");

   function hypotl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:164
   pragma Import (C, hypotl, "hypotl");

   function hypotf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:164
   pragma Import (C, hypotf, "hypotf");

   function hypot (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:164
   pragma Import (C, hypot, "hypot");

   function cbrtl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:171
   pragma Import (C, cbrtl, "cbrtl");

   function cbrtf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:171
   pragma Import (C, cbrtf, "cbrtf");

   function cbrt (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:171
   pragma Import (C, cbrt, "cbrt");

   function ceill (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:180
   pragma Import (C, ceill, "ceill");

   function ceilf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:180
   pragma Import (C, ceilf, "ceilf");

   function ceil (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:180
   pragma Import (C, ceil, "ceil");

   function fabsl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:183
   pragma Import (C, fabsl, "fabsl");

   function fabsf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:183
   pragma Import (C, fabsf, "fabsf");

   function fabs (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:183
   pragma Import (C, fabs, "fabs");

   function floorl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:186
   pragma Import (C, floorl, "floorl");

   function floorf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:186
   pragma Import (C, floorf, "floorf");

   function floor (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:186
   pragma Import (C, floor, "floor");

   function fmodl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:189
   pragma Import (C, fmodl, "fmodl");

   function fmodf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:189
   pragma Import (C, fmodf, "fmodf");

   function fmod (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:189
   pragma Import (C, fmod, "fmod");

   function isinfl (uu_value : long_double) return int;  -- /usr/include/bits/mathcalls.h:203
   pragma Import (C, isinfl, "isinfl");

   function isinff (uu_value : float) return int;  -- /usr/include/bits/mathcalls.h:203
   pragma Import (C, isinff, "isinff");

   function isinf (uu_value : double) return int;  -- /usr/include/bits/mathcalls.h:203
   pragma Import (C, isinf, "isinf");

   function finitel (uu_value : long_double) return int;  -- /usr/include/bits/mathcalls.h:206
   pragma Import (C, finitel, "finitel");

   function finitef (uu_value : float) return int;  -- /usr/include/bits/mathcalls.h:206
   pragma Import (C, finitef, "finitef");

   function finite (uu_value : double) return int;  -- /usr/include/bits/mathcalls.h:206
   pragma Import (C, finite, "finite");

   function dreml (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:209
   pragma Import (C, dreml, "dreml");

   function dremf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:209
   pragma Import (C, dremf, "dremf");

   function drem (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:209
   pragma Import (C, drem, "drem");

   function significandl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:213
   pragma Import (C, significandl, "significandl");

   function significandf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:213
   pragma Import (C, significandf, "significandf");

   function significand (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:213
   pragma Import (C, significand, "significand");

   function copysignl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:219
   pragma Import (C, copysignl, "copysignl");

   function copysignf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:219
   pragma Import (C, copysignf, "copysignf");

   function copysign (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:219
   pragma Import (C, copysign, "copysign");

   function nanl (uu_tagb : Interfaces.C.Strings.chars_ptr) return long_double;  -- /usr/include/bits/mathcalls.h:226
   pragma Import (C, nanl, "nanl");

   function nanf (uu_tagb : Interfaces.C.Strings.chars_ptr) return float;  -- /usr/include/bits/mathcalls.h:226
   pragma Import (C, nanf, "nanf");

   function nan (uu_tagb : Interfaces.C.Strings.chars_ptr) return double;  -- /usr/include/bits/mathcalls.h:226
   pragma Import (C, nan, "nan");

   function isnanl (uu_value : long_double) return int;  -- /usr/include/bits/mathcalls.h:236
   pragma Import (C, isnanl, "isnanl");

   function isnanf (uu_value : float) return int;  -- /usr/include/bits/mathcalls.h:236
   pragma Import (C, isnanf, "isnanf");

   function isnan (uu_value : double) return int;  -- /usr/include/bits/mathcalls.h:236
   pragma Import (C, isnan, "isnan");

   function j0l (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:239
   pragma Import (C, j0l, "j0l");

   function j0f (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:239
   pragma Import (C, j0f, "j0f");

   function j0 (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:239
   pragma Import (C, j0, "j0");

   function j1l (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:240
   pragma Import (C, j1l, "j1l");

   function j1f (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:240
   pragma Import (C, j1f, "j1f");

   function j1 (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:240
   pragma Import (C, j1, "j1");

   function jnl (arg1 : int; arg2 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:241
   pragma Import (C, jnl, "jnl");

   function jnf (arg1 : int; arg2 : float) return float;  -- /usr/include/bits/mathcalls.h:241
   pragma Import (C, jnf, "jnf");

   function jn (arg1 : int; arg2 : double) return double;  -- /usr/include/bits/mathcalls.h:241
   pragma Import (C, jn, "jn");

   function y0l (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:242
   pragma Import (C, y0l, "y0l");

   function y0f (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:242
   pragma Import (C, y0f, "y0f");

   function y0 (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:242
   pragma Import (C, y0, "y0");

   function y1l (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:243
   pragma Import (C, y1l, "y1l");

   function y1f (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:243
   pragma Import (C, y1f, "y1f");

   function y1 (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:243
   pragma Import (C, y1, "y1");

   function ynl (arg1 : int; arg2 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:244
   pragma Import (C, ynl, "ynl");

   function ynf (arg1 : int; arg2 : float) return float;  -- /usr/include/bits/mathcalls.h:244
   pragma Import (C, ynf, "ynf");

   function yn (arg1 : int; arg2 : double) return double;  -- /usr/include/bits/mathcalls.h:244
   pragma Import (C, yn, "yn");

   function erfl (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:251
   pragma Import (C, erfl, "erfl");

   function erff (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:251
   pragma Import (C, erff, "erff");

   function erf (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:251
   pragma Import (C, erf, "erf");

   function erfcl (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:252
   pragma Import (C, erfcl, "erfcl");

   function erfcf (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:252
   pragma Import (C, erfcf, "erfcf");

   function erfc (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:252
   pragma Import (C, erfc, "erfc");

   function lgammal (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:253
   pragma Import (C, lgammal, "lgammal");

   function lgammaf (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:253
   pragma Import (C, lgammaf, "lgammaf");

   function lgamma (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:253
   pragma Import (C, lgamma, "lgamma");

   function tgammal (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:260
   pragma Import (C, tgammal, "tgammal");

   function tgammaf (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:260
   pragma Import (C, tgammaf, "tgammaf");

   function tgamma (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:260
   pragma Import (C, tgamma, "tgamma");

   function gammal (arg1 : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:266
   pragma Import (C, gammal, "gammal");

   function gammaf (arg1 : float) return float;  -- /usr/include/bits/mathcalls.h:266
   pragma Import (C, gammaf, "gammaf");

   function gamma (arg1 : double) return double;  -- /usr/include/bits/mathcalls.h:266
   pragma Import (C, gamma, "gamma");

   function lgammal_r (arg1 : long_double; uu_signgamp : access int) return long_double;  -- /usr/include/bits/mathcalls.h:273
   pragma Import (C, lgammal_r, "lgammal_r");

   function lgammaf_r (arg1 : float; uu_signgamp : access int) return float;  -- /usr/include/bits/mathcalls.h:273
   pragma Import (C, lgammaf_r, "lgammaf_r");

   function lgamma_r (arg1 : double; uu_signgamp : access int) return double;  -- /usr/include/bits/mathcalls.h:273
   pragma Import (C, lgamma_r, "lgamma_r");

   function rintl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:281
   pragma Import (C, rintl, "rintl");

   function rintf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:281
   pragma Import (C, rintf, "rintf");

   function rint (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:281
   pragma Import (C, rint, "rint");

   function nextafterl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:284
   pragma Import (C, nextafterl, "nextafterl");

   function nextafterf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:284
   pragma Import (C, nextafterf, "nextafterf");

   function nextafter (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:284
   pragma Import (C, nextafter, "nextafter");

   function nexttowardl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:286
   pragma Import (C, nexttowardl, "nexttowardl");

   function nexttowardf (uu_x : float; uu_y : long_double) return float;  -- /usr/include/bits/mathcalls.h:286
   pragma Import (C, nexttowardf, "nexttowardf");

   function nexttoward (uu_x : double; uu_y : long_double) return double;  -- /usr/include/bits/mathcalls.h:286
   pragma Import (C, nexttoward, "nexttoward");

   function remainderl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:290
   pragma Import (C, remainderl, "remainderl");

   function remainderf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:290
   pragma Import (C, remainderf, "remainderf");

   function remainder (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:290
   pragma Import (C, remainder, "remainder");

   function scalbnl (uu_x : long_double; uu_n : int) return long_double;  -- /usr/include/bits/mathcalls.h:294
   pragma Import (C, scalbnl, "scalbnl");

   function scalbnf (uu_x : float; uu_n : int) return float;  -- /usr/include/bits/mathcalls.h:294
   pragma Import (C, scalbnf, "scalbnf");

   function scalbn (uu_x : double; uu_n : int) return double;  -- /usr/include/bits/mathcalls.h:294
   pragma Import (C, scalbn, "scalbn");

   function ilogbl (uu_x : long_double) return int;  -- /usr/include/bits/mathcalls.h:298
   pragma Import (C, ilogbl, "ilogbl");

   function ilogbf (uu_x : float) return int;  -- /usr/include/bits/mathcalls.h:298
   pragma Import (C, ilogbf, "ilogbf");

   function ilogb (uu_x : double) return int;  -- /usr/include/bits/mathcalls.h:298
   pragma Import (C, ilogb, "ilogb");

   function scalblnl (uu_x : long_double; uu_n : long) return long_double;  -- /usr/include/bits/mathcalls.h:303
   pragma Import (C, scalblnl, "scalblnl");

   function scalblnf (uu_x : float; uu_n : long) return float;  -- /usr/include/bits/mathcalls.h:303
   pragma Import (C, scalblnf, "scalblnf");

   function scalbln (uu_x : double; uu_n : long) return double;  -- /usr/include/bits/mathcalls.h:303
   pragma Import (C, scalbln, "scalbln");

   function nearbyintl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:307
   pragma Import (C, nearbyintl, "nearbyintl");

   function nearbyintf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:307
   pragma Import (C, nearbyintf, "nearbyintf");

   function nearbyint (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:307
   pragma Import (C, nearbyint, "nearbyint");

   function roundl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:311
   pragma Import (C, roundl, "roundl");

   function roundf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:311
   pragma Import (C, roundf, "roundf");

   function round (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:311
   pragma Import (C, round, "round");

   function truncl (uu_x : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:315
   pragma Import (C, truncl, "truncl");

   function truncf (uu_x : float) return float;  -- /usr/include/bits/mathcalls.h:315
   pragma Import (C, truncf, "truncf");

   function trunc (uu_x : double) return double;  -- /usr/include/bits/mathcalls.h:315
   pragma Import (C, trunc, "trunc");

   function remquol
     (uu_x : long_double;
      uu_y : long_double;
      uu_quo : access int) return long_double;  -- /usr/include/bits/mathcalls.h:320
   pragma Import (C, remquol, "remquol");

   function remquof
     (uu_x : float;
      uu_y : float;
      uu_quo : access int) return float;  -- /usr/include/bits/mathcalls.h:320
   pragma Import (C, remquof, "remquof");

   function remquo
     (uu_x : double;
      uu_y : double;
      uu_quo : access int) return double;  -- /usr/include/bits/mathcalls.h:320
   pragma Import (C, remquo, "remquo");

   function lrintl (uu_x : long_double) return long;  -- /usr/include/bits/mathcalls.h:327
   pragma Import (C, lrintl, "lrintl");

   function lrintf (uu_x : float) return long;  -- /usr/include/bits/mathcalls.h:327
   pragma Import (C, lrintf, "lrintf");

   function lrint (uu_x : double) return long;  -- /usr/include/bits/mathcalls.h:327
   pragma Import (C, lrint, "lrint");

   function llrintl (uu_x : long_double) return Long_Long_Integer;  -- /usr/include/bits/mathcalls.h:328
   pragma Import (C, llrintl, "llrintl");

   function llrintf (uu_x : float) return Long_Long_Integer;  -- /usr/include/bits/mathcalls.h:328
   pragma Import (C, llrintf, "llrintf");

   function llrint (uu_x : double) return Long_Long_Integer;  -- /usr/include/bits/mathcalls.h:328
   pragma Import (C, llrint, "llrint");

   function lroundl (uu_x : long_double) return long;  -- /usr/include/bits/mathcalls.h:332
   pragma Import (C, lroundl, "lroundl");

   function lroundf (uu_x : float) return long;  -- /usr/include/bits/mathcalls.h:332
   pragma Import (C, lroundf, "lroundf");

   function lround (uu_x : double) return long;  -- /usr/include/bits/mathcalls.h:332
   pragma Import (C, lround, "lround");

   function llroundl (uu_x : long_double) return Long_Long_Integer;  -- /usr/include/bits/mathcalls.h:333
   pragma Import (C, llroundl, "llroundl");

   function llroundf (uu_x : float) return Long_Long_Integer;  -- /usr/include/bits/mathcalls.h:333
   pragma Import (C, llroundf, "llroundf");

   function llround (uu_x : double) return Long_Long_Integer;  -- /usr/include/bits/mathcalls.h:333
   pragma Import (C, llround, "llround");

   function fdiml (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:337
   pragma Import (C, fdiml, "fdiml");

   function fdimf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:337
   pragma Import (C, fdimf, "fdimf");

   function fdim (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:337
   pragma Import (C, fdim, "fdim");

   function fmaxl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:340
   pragma Import (C, fmaxl, "fmaxl");

   function fmaxf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:340
   pragma Import (C, fmaxf, "fmaxf");

   function fmax (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:340
   pragma Import (C, fmax, "fmax");

   function fminl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:343
   pragma Import (C, fminl, "fminl");

   function fminf (uu_x : float; uu_y : float) return float;  -- /usr/include/bits/mathcalls.h:343
   pragma Import (C, fminf, "fminf");

   function fmin (uu_x : double; uu_y : double) return double;  -- /usr/include/bits/mathcalls.h:343
   pragma Import (C, fmin, "fmin");

   function fmal
     (uu_x : long_double;
      uu_y : long_double;
      uu_z : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:356
   pragma Import (C, fmal, "fmal");

   function fmaf
     (uu_x : float;
      uu_y : float;
      uu_z : float) return float;  -- /usr/include/bits/mathcalls.h:356
   pragma Import (C, fmaf, "fmaf");

   function fma
     (uu_x : double;
      uu_y : double;
      uu_z : double) return double;  -- /usr/include/bits/mathcalls.h:356
   pragma Import (C, fma, "fma");

   function scalbl (uu_x : long_double; uu_n : long_double) return long_double;  -- /usr/include/bits/mathcalls.h:365
   pragma Import (C, scalbl, "scalbl");

   function scalbf (uu_x : float; uu_n : float) return float;  -- /usr/include/bits/mathcalls.h:365
   pragma Import (C, scalbf, "scalbf");

   function scalb (uu_x : double; uu_n : double) return double;  -- /usr/include/bits/mathcalls.h:365
   pragma Import (C, scalb, "scalb");

end bits_mathcalls_h;
