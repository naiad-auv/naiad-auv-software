with processing_wrap_hpp; use processing_wrap_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;

procedure main is
begin
   appendImg_Wrap(New_String("ada_lovelace.jpg"));
   appendImg_Wrap(New_String("ada_lovelace.jpg"));
   appendImg_Wrap(New_String("ada_lovelace.jpg"));
   appendImg_Wrap(New_String("ada_lovelace.jpg"));

  imshow_Wrap(New_String("Lady Ada"), 0);
  waitKey_Wrap;

   imshow_Wrap(New_String("Canny Filter"), 1);
  waitKey_Wrap;

   cvtColor_Wrap(1, 1, 6);
  imshow_Wrap(New_String("Filtered Ada"), 1);
   waitKey_Wrap;

   Canny_Wrap(1, 2, 50, 150, 3);
   waitKey_Wrap;
  imshow_Wrap(New_String("Canny Filter 2"), 2);
  waitKey_Wrap;

end main;
