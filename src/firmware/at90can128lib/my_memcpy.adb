
--copied from http://docs.adacore.com/gnat-hie-docs/html/gnathie_ug_3.html
--By Nils


with Digital_IO;

with Ada.Unchecked_Conversion;
function My_Memcpy (dest, src : Address;
                 n         : size_t) return Address is
   subtype mem is char_array (size_t);
   type memptr is access mem;
   function to_memptr is
      new Ada.Unchecked_Conversion (address, memptr);
   dest_p : constant memptr := to_memptr (dest);
   src_p  : constant memptr := to_memptr (src);

begin

   Digital_IO.Make_Output_Pin(3);
   Digital_IO.Set_Pin(3);

   if n > 0 then  -- need to guard against n=0 since size_t is a modular type
    for J in 0 .. n - 1 loop
       dest_p (J) := src_p (J);
    end loop;
  end if;

   Digital_IO.Make_Output_Pin(4);
   Digital_IO.Set_Pin(4);

  return dest;
end My_Memcpy;
