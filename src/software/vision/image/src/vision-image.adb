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

   function DummyShow2 return Boolean is
   begin
      Put_Line("In vision-image module dummyshow2");
      return True;
   end DummyShow2;

end Vision.Image;
