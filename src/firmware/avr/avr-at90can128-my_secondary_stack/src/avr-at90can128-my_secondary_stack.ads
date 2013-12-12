
-- Copy from: https://forge.open-do.org/scm/viewvc.php/*checkout*/trunk/couverture/tools/xcov/examples/support/src/secondary_stack.ads?revision=2545&root=couverture&pathrev=2545

-- By Nils


------------------------------------------------------------------------------
--                                                                          --
--                              Couverture                                  --
--                                                                          --
--                        Copyright (C) 2010, AdaCore                       --
--                                                                          --
-- Couverture is free software; you can redistribute it  and/or modify it   --
-- under terms of the GNU General Public License as published by the Free   --
-- Software Foundation; either version 2, or (at your option) any later     --
-- version.  Couverture is distributed in the hope that it will be useful,  --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHAN-  --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License  for more details. You  should  have  received a copy of the GNU --
-- General Public License  distributed with GNAT; see file COPYING. If not, --
-- write  to  the Free  Software  Foundation,  59 Temple Place - Suite 330, --
-- Boston, MA 02111-1307, USA.                                              --
--                                                                          --
------------------------------------------------------------------------------

with System;

package AVR.AT90CAN128.My_Secondary_Stack is

   function Get_Sec_Stack return System.Address;
   pragma Export (C, Get_Sec_Stack, "__gnat_get_secondary_stack");

end AVR.AT90CAN128.My_Secondary_Stack;
