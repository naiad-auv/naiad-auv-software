with Ada.Text_IO; use Ada.Text_IO;

package body Vision is
   function DummyTest return Boolean is
   begin
      return True;
   end DummyTest;

   function mission1 return Boolean is
      begin
      Put_Line("In mission 1");
      return True;
   end mission1;
end Vision;
