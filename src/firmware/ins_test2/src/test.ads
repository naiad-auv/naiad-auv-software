
--with Math.Elementary;

package test is

 type my_type is tagged private;

   function xCreate(fX, fY, fZ : float) return my_type;
private
   type my_type is tagged
      record
         fX : float;
         fY : float;
         fZ : float;
      end record;
end test;

