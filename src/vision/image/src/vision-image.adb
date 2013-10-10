with Ada.Text_IO; use Ada.Text_IO;

package body Vision.Image is
   function DummyTest return Boolean is
   begin
      Put_Line("In Image Dummy");
      return True;
   end DummyTest;

   function DummyShow return Boolean is
   begin
      Put_Line("In vision-image module");
      return True;
   end DummyShow;

end Vision.Image;
