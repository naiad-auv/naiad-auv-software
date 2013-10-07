with coreada_hpp; use coreada_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;

procedure main is
begin
  appendImg_Wrap(New_String("lena.jpg"));
  appendImg_Wrap(New_String("lena.jpg"));
  appendImg_Wrap(New_String("lena.jpg"));
  appendImg_Wrap(New_String("lena.jpg"));

  imshow_Wrap(New_String("Lady Ada"), 0);
  waitKey_Wrap;

  cvtColor_Wrap(1, 1, 6);
  imshow_Wrap(New_String("Filtered Ada"), 1);
  waitKey_Wrap;

  cvtColor_Wrap(1, 2, 8);
  imshow_Wrap(New_String("Other Filter"), 2);
  waitKey_Wrap;
 
  Canny_Wrap(3, 3, 50, 150, 3);
  imshow_Wrap(New_String("Canny Filter"), 3);
  waitKey_Wrap;
  
  if (imwrite_Wrap(New_String("picture.png"), 3) < 1) then
    Put_Line("Error Mr. Robinson");
  end if;

   appendImg_Wrap(New_String("picture.png"));
   imshow_Wrap(New_String("Loaded"), size_Wrap - 1);
   waitKey_Wrap;
   

   Put_Line("Knock!!");
   Put_Line("Knock Gerry!");
   Put_Line("Knock-knock Gerry!");
   
end main;
