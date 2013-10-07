pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package math_h is

   --  unsupported macro: FP_NAN FP_NAN
   --  unsupported macro: FP_INFINITE FP_INFINITE
   --  unsupported macro: FP_ZERO FP_ZERO
   --  unsupported macro: FP_SUBNORMAL FP_SUBNORMAL
   --  unsupported macro: FP_NORMAL FP_NORMAL

   MATH_ERRNO : constant := 1;  --  /usr/include/math.h:282
   MATH_ERREXCEPT : constant := 2;  --  /usr/include/math.h:283
   --  unsupported macro: math_errhandling (MATH_ERRNO | MATH_ERREXCEPT)

   X_TLOSS : constant := 1.41484755040568800000e+16;  --  /usr/include/math.h:337

   DOMAIN : constant := 1;  --  /usr/include/math.h:340
   SING : constant := 2;  --  /usr/include/math.h:341
   OVERFLOW : constant := 3;  --  /usr/include/math.h:342
   UNDERFLOW : constant := 4;  --  /usr/include/math.h:343
   TLOSS : constant := 5;  --  /usr/include/math.h:344
   PLOSS : constant := 6;  --  /usr/include/math.h:345

   HUGE : constant := 3.40282347e+38F;  --  /usr/include/math.h:348

   M_E : constant := 2.7182818284590452354;  --  /usr/include/math.h:362
   M_LOG2E : constant := 1.4426950408889634074;  --  /usr/include/math.h:363
   M_LOG10E : constant := 8#.43429448190325182765#;  --  /usr/include/math.h:364
   M_LN2 : constant := 8#.69314718055994530942#;  --  /usr/include/math.h:365
   M_LN10 : constant := 2.30258509299404568402;  --  /usr/include/math.h:366
   M_PI : constant := 3.14159265358979323846;  --  /usr/include/math.h:367
   M_PI_2 : constant := 1.57079632679489661923;  --  /usr/include/math.h:368
   M_PI_4 : constant := 8#.78539816339744830962#;  --  /usr/include/math.h:369
   M_1_PI : constant := 8#.31830988618379067154#;  --  /usr/include/math.h:370
   M_2_PI : constant := 8#.63661977236758134308#;  --  /usr/include/math.h:371
   M_2_SQRTPI : constant := 1.12837916709551257390;  --  /usr/include/math.h:372
   M_SQRT2 : constant := 1.41421356237309504880;  --  /usr/include/math.h:373
   M_SQRT1_2 : constant := 8#.70710678118654752440#;  --  /usr/include/math.h:374

   M_El : constant := 2.7182818284590452353602874713526625;  --  /usr/include/math.h:381
   M_LOG2El : constant := 1.4426950408889634073599246810018921;  --  /usr/include/math.h:382
   M_LOG10El : constant := 8#.4342944819032518276511289189166051#;  --  /usr/include/math.h:383
   M_LN2l : constant := 8#.6931471805599453094172321214581766#;  --  /usr/include/math.h:384
   M_LN10l : constant := 2.3025850929940456840179914546843642;  --  /usr/include/math.h:385
   M_PIl : constant := 3.1415926535897932384626433832795029;  --  /usr/include/math.h:386
   M_PI_2l : constant := 1.5707963267948966192313216916397514;  --  /usr/include/math.h:387
   M_PI_4l : constant := 8#.7853981633974483096156608458198757#;  --  /usr/include/math.h:388
   M_1_PIl : constant := 8#.3183098861837906715377675267450287#;  --  /usr/include/math.h:389
   M_2_PIl : constant := 8#.6366197723675813430755350534900574#;  --  /usr/include/math.h:390
   M_2_SQRTPIl : constant := 1.1283791670955125738961589031215452;  --  /usr/include/math.h:391
   M_SQRT2l : constant := 1.4142135623730950488016887242096981;  --  /usr/include/math.h:392
   M_SQRT1_2l : constant := 8#.7071067811865475244008443621048490#;  --  /usr/include/math.h:393

   signgam : aliased int;  -- /usr/include/math.h:162
   pragma Import (C, signgam, "signgam");

   subtype u_LIB_VERSION_TYPE is unsigned;
   u_IEEE_u : constant u_LIB_VERSION_TYPE := -1;
   u_SVID_u : constant u_LIB_VERSION_TYPE := 0;
   u_XOPEN_u : constant u_LIB_VERSION_TYPE := 1;
   u_POSIX_u : constant u_LIB_VERSION_TYPE := 2;
   u_ISOC_u : constant u_LIB_VERSION_TYPE := 3;  -- /usr/include/math.h:303

   type uu_exception is record
      c_type : aliased int;  -- /usr/include/math.h:324
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/math.h:325
      arg1 : aliased double;  -- /usr/include/math.h:326
      arg2 : aliased double;  -- /usr/include/math.h:327
      retval : aliased double;  -- /usr/include/math.h:328
   end record;
   pragma Convention (C_Pass_By_Copy, uu_exception);  -- /usr/include/math.h:319

   function matherr (uu_exc : access uu_exception) return int;  -- /usr/include/math.h:332
   pragma Import (C, matherr, "matherr");

end math_h;
