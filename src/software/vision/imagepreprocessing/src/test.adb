with coreAda_hpp;
with Interfaces.C.Strings;
with Interfaces.C;
with Ada.Text_IO;

procedure Test is
begin
   coreAda_hpp.appendImg_Wrap
     (Interfaces.C.Strings.New_String("lena.png"));

   coreAda_hpp.imshow_Wrap
     (Interfaces.C.Strings.New_String("Original"),0);
   coreAda_hpp.waitKey_Wrap;

   coreAda_hpp.Canny_Wrap(0,0,10,400,3);
   coreAda_hpp.imshow_Wrap(Interfaces.C.Strings.New_String("Canny"),0);
   coreAda_hpp.waitKey_Wrap;
end Test;
