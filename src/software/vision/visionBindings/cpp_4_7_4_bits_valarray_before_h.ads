pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_bits_valarray_before_h is

   package Class_u_Abs is
      type u_Abs is limited record
         null;
      end record;
      pragma Import (CPP, u_Abs);


   end;
   use Class_u_Abs;
   package Class_u_Cos is
      type u_Cos is limited record
         null;
      end record;
      pragma Import (CPP, u_Cos);


   end;
   use Class_u_Cos;
   package Class_u_Acos is
      type u_Acos is limited record
         null;
      end record;
      pragma Import (CPP, u_Acos);


   end;
   use Class_u_Acos;
   package Class_u_Cosh is
      type u_Cosh is limited record
         null;
      end record;
      pragma Import (CPP, u_Cosh);


   end;
   use Class_u_Cosh;
   package Class_u_Sin is
      type u_Sin is limited record
         null;
      end record;
      pragma Import (CPP, u_Sin);


   end;
   use Class_u_Sin;
   package Class_u_Asin is
      type u_Asin is limited record
         null;
      end record;
      pragma Import (CPP, u_Asin);


   end;
   use Class_u_Asin;
   package Class_u_Sinh is
      type u_Sinh is limited record
         null;
      end record;
      pragma Import (CPP, u_Sinh);


   end;
   use Class_u_Sinh;
   package Class_u_Tan is
      type u_Tan is limited record
         null;
      end record;
      pragma Import (CPP, u_Tan);


   end;
   use Class_u_Tan;
   package Class_u_Atan is
      type u_Atan is limited record
         null;
      end record;
      pragma Import (CPP, u_Atan);


   end;
   use Class_u_Atan;
   package Class_u_Tanh is
      type u_Tanh is limited record
         null;
      end record;
      pragma Import (CPP, u_Tanh);


   end;
   use Class_u_Tanh;
   package Class_u_Exp is
      type u_Exp is limited record
         null;
      end record;
      pragma Import (CPP, u_Exp);


   end;
   use Class_u_Exp;
   package Class_u_Log is
      type u_Log is limited record
         null;
      end record;
      pragma Import (CPP, u_Log);


   end;
   use Class_u_Log;
   package Class_u_Log10 is
      type u_Log10 is limited record
         null;
      end record;
      pragma Import (CPP, u_Log10);


   end;
   use Class_u_Log10;
   package Class_u_Sqrt is
      type u_Sqrt is limited record
         null;
      end record;
      pragma Import (CPP, u_Sqrt);


   end;
   use Class_u_Sqrt;
   package Class_uu_unary_plus is
      type uu_unary_plus is limited record
         null;
      end record;
      pragma Import (CPP, uu_unary_plus);


   end;
   use Class_uu_unary_plus;
   package Class_uu_negate is
      type uu_negate is limited record
         null;
      end record;
      pragma Import (CPP, uu_negate);


   end;
   use Class_uu_negate;
   package Class_uu_bitwise_not is
      type uu_bitwise_not is limited record
         null;
      end record;
      pragma Import (CPP, uu_bitwise_not);


   end;
   use Class_uu_bitwise_not;
   package Class_uu_plus is
      type uu_plus is limited record
         null;
      end record;
      pragma Import (CPP, uu_plus);


   end;
   use Class_uu_plus;
   package Class_uu_minus is
      type uu_minus is limited record
         null;
      end record;
      pragma Import (CPP, uu_minus);


   end;
   use Class_uu_minus;
   package Class_uu_multiplies is
      type uu_multiplies is limited record
         null;
      end record;
      pragma Import (CPP, uu_multiplies);


   end;
   use Class_uu_multiplies;
   package Class_uu_divides is
      type uu_divides is limited record
         null;
      end record;
      pragma Import (CPP, uu_divides);


   end;
   use Class_uu_divides;
   package Class_uu_modulus is
      type uu_modulus is limited record
         null;
      end record;
      pragma Import (CPP, uu_modulus);


   end;
   use Class_uu_modulus;
   package Class_uu_bitwise_xor is
      type uu_bitwise_xor is limited record
         null;
      end record;
      pragma Import (CPP, uu_bitwise_xor);


   end;
   use Class_uu_bitwise_xor;
   package Class_uu_bitwise_and is
      type uu_bitwise_and is limited record
         null;
      end record;
      pragma Import (CPP, uu_bitwise_and);


   end;
   use Class_uu_bitwise_and;
   package Class_uu_bitwise_or is
      type uu_bitwise_or is limited record
         null;
      end record;
      pragma Import (CPP, uu_bitwise_or);


   end;
   use Class_uu_bitwise_or;
   package Class_uu_shift_left is
      type uu_shift_left is limited record
         null;
      end record;
      pragma Import (CPP, uu_shift_left);


   end;
   use Class_uu_shift_left;
   package Class_uu_shift_right is
      type uu_shift_right is limited record
         null;
      end record;
      pragma Import (CPP, uu_shift_right);


   end;
   use Class_uu_shift_right;
   package Class_uu_logical_and is
      type uu_logical_and is limited record
         null;
      end record;
      pragma Import (CPP, uu_logical_and);


   end;
   use Class_uu_logical_and;
   package Class_uu_logical_or is
      type uu_logical_or is limited record
         null;
      end record;
      pragma Import (CPP, uu_logical_or);


   end;
   use Class_uu_logical_or;
   package Class_uu_logical_not is
      type uu_logical_not is limited record
         null;
      end record;
      pragma Import (CPP, uu_logical_not);


   end;
   use Class_uu_logical_not;
   package Class_uu_equal_to is
      type uu_equal_to is limited record
         null;
      end record;
      pragma Import (CPP, uu_equal_to);


   end;
   use Class_uu_equal_to;
   package Class_uu_not_equal_to is
      type uu_not_equal_to is limited record
         null;
      end record;
      pragma Import (CPP, uu_not_equal_to);


   end;
   use Class_uu_not_equal_to;
   package Class_uu_less is
      type uu_less is limited record
         null;
      end record;
      pragma Import (CPP, uu_less);


   end;
   use Class_uu_less;
   package Class_uu_greater is
      type uu_greater is limited record
         null;
      end record;
      pragma Import (CPP, uu_greater);


   end;
   use Class_uu_greater;
   package Class_uu_less_equal is
      type uu_less_equal is limited record
         null;
      end record;
      pragma Import (CPP, uu_less_equal);


   end;
   use Class_uu_less_equal;
   package Class_uu_greater_equal is
      type uu_greater_equal is limited record
         null;
      end record;
      pragma Import (CPP, uu_greater_equal);


   end;
   use Class_uu_greater_equal;
   package Class_u_Atan2 is
      type u_Atan2 is limited record
         null;
      end record;
      pragma Import (CPP, u_Atan2);


   end;
   use Class_u_Atan2;
   package Class_u_Pow is
      type u_Pow is limited record
         null;
      end record;
      pragma Import (CPP, u_Pow);


   end;
   use Class_u_Pow;
end cpp_4_7_4_bits_valarray_before_h;
