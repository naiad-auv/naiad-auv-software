

--  with Digital_IO;

package body My_Last_Chance_Handler is

   procedure Last_Chance_Handler(Source_Location : System.Address; Line : Integer) is
   begin
      --        null;

--        Digital_IO.Make_Output_Pin(7);
--        Digital_IO.Set_Pin(7);

      loop
         null;
      end loop;

   end Last_Chance_Handler;

end My_Last_Chance_Handler;
