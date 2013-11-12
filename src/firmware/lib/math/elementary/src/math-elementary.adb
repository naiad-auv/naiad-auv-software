
package body Math.Elementary is



   function Sqrt (X : in float) return float is
      function c_sqrt(Num : float) return float;
      pragma Import (C, c_sqrt, "sqrt");
   begin
      return c_sqrt(X);
   end Sqrt;

   function Sin (X : in float) return float is
      function c_sin(Num : float) return float;
      pragma Import (C, c_sin, "sin");
   begin
      return c_sin(X);
   end Sin;

   function Cos (X : in float) return float is
      function c_cos(Num : float) return float;
      pragma Import (C, c_cos, "cos");
   begin
      return c_cos(X);
   end Cos;

   function Asin (X : in float) return float is
      function c_asin(Num : float) return float;
      pragma Import (C, c_asin, "asin");
   begin
      return c_asin(X);
   end Asin;

   function Acos (X : in float) return float is
      function c_acos(Num : float) return float;
      pragma Import (C, c_acos, "acos");
   begin
      return c_acos(X);
   end Acos;


end Math.Elementary;
