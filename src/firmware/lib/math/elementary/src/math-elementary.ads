with Math;

package Math.Elementary is

   Pi : constant :=
     3.14159_26535_89793_23846_26433_83279_50288_41971_69399_37511;

   function sqrt(Num : float) return float;
   pragma Import (C, sqrt, "sqrt");

   function sin(Num : float) return float;
   pragma Import (C, sin, "sin");

   function cos(Num : float) return float;
   pragma Import (C, cos, "cos");

   function asin(Num : float) return float;
   pragma Import (C, asin, "asin");

   function acos(Num : float) return float;
   pragma Import (C, acos, "acos");

end Math.Elementary;
