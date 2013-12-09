
--copied from http://docs.adacore.com/gnat-hie-docs/html/gnathie_ug_3.html
--By Nils


with System; use System;
with Interfaces.C; use Interfaces.C;
function AVR.AT90CAN128.My_Memcpy (dest, src : Address;
                 n         : size_t) return Address;
pragma Export (C, My_Memcpy, "memcpy");
