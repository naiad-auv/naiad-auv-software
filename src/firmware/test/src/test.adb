
with Math.Elementary;

package body test is

   -------------
   -- xCreate --
   -------------

   function xCreate (fX, fY, fZ : float) return my_type is
      temp : float;
   begin

      temp := Math.Elementary.Sin(0.0);


      return my_type'(fX => fX,
                      fY => fY,
                      fZ => fZ );
   end xCreate;

end test;
