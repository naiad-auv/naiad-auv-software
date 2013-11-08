pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package cpp_4_7_4_limits is

   subtype float_round_style is unsigned;
   round_indeterminate : constant float_round_style := -1;
   round_toward_zero : constant float_round_style := 0;
   round_to_nearest : constant float_round_style := 1;
   round_toward_infinity : constant float_round_style := 2;
   round_toward_neg_infinity : constant float_round_style := 3;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:157

   subtype float_denorm_style is unsigned;
   denorm_indeterminate : constant float_denorm_style := -1;
   denorm_absent : constant float_denorm_style := 0;
   denorm_present : constant float_denorm_style := 1;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:172

   package Class_uu_numeric_limits_base is
      type uu_numeric_limits_base is record
         null;
      end record;
      pragma Convention (C_Pass_By_Copy, uu_numeric_limits_base);

      is_specialized : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:196
      pragma Import (CPP, is_specialized, "_ZNSt21__numeric_limits_base14is_specializedE");

      c_digits : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:201
      pragma Import (CPP, c_digits, "_ZNSt21__numeric_limits_base6digitsE");

      digits10 : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:204
      pragma Import (CPP, digits10, "_ZNSt21__numeric_limits_base8digits10E");

      is_signed : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:213
      pragma Import (CPP, is_signed, "_ZNSt21__numeric_limits_base9is_signedE");

      is_integer : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:217
      pragma Import (CPP, is_integer, "_ZNSt21__numeric_limits_base10is_integerE");

      is_exact : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:223
      pragma Import (CPP, is_exact, "_ZNSt21__numeric_limits_base8is_exactE");

      radix : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:227
      pragma Import (CPP, radix, "_ZNSt21__numeric_limits_base5radixE");

      min_exponent : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:231
      pragma Import (CPP, min_exponent, "_ZNSt21__numeric_limits_base12min_exponentE");

      min_exponent10 : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:235
      pragma Import (CPP, min_exponent10, "_ZNSt21__numeric_limits_base14min_exponent10E");

      max_exponent : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:240
      pragma Import (CPP, max_exponent, "_ZNSt21__numeric_limits_base12max_exponentE");

      max_exponent10 : aliased int;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:244
      pragma Import (CPP, max_exponent10, "_ZNSt21__numeric_limits_base14max_exponent10E");

      has_infinity : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:247
      pragma Import (CPP, has_infinity, "_ZNSt21__numeric_limits_base12has_infinityE");

      has_quiet_NaN : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:251
      pragma Import (CPP, has_quiet_NaN, "_ZNSt21__numeric_limits_base13has_quiet_NaNE");

      has_signaling_NaN : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:255
      pragma Import (CPP, has_signaling_NaN, "_ZNSt21__numeric_limits_base17has_signaling_NaNE");

      has_denorm : aliased float_denorm_style;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:258
      pragma Import (CPP, has_denorm, "_ZNSt21__numeric_limits_base10has_denormE");

      has_denorm_loss : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:262
      pragma Import (CPP, has_denorm_loss, "_ZNSt21__numeric_limits_base15has_denorm_lossE");

      is_iec559 : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:266
      pragma Import (CPP, is_iec559, "_ZNSt21__numeric_limits_base9is_iec559E");

      is_bounded : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:271
      pragma Import (CPP, is_bounded, "_ZNSt21__numeric_limits_base10is_boundedE");

      is_modulo : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:277
      pragma Import (CPP, is_modulo, "_ZNSt21__numeric_limits_base9is_moduloE");

      traps : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:280
      pragma Import (CPP, traps, "_ZNSt21__numeric_limits_base5trapsE");

      tinyness_before : aliased Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:283
      pragma Import (CPP, tinyness_before, "_ZNSt21__numeric_limits_base15tinyness_beforeE");

      round_style : aliased float_round_style;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/limits:289
      pragma Import (CPP, round_style, "_ZNSt21__numeric_limits_base11round_styleE");
   end;
   use Class_uu_numeric_limits_base;
end cpp_4_7_4_limits;
