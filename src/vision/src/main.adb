with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Vision.Image; use Vision.Image;
with Vision.Image_Preprocessing; use Vision.Image_Preprocessing;

procedure main is
   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;
begin

   --CHECK FOR INSTRUCTION--to be implemented, for now just working on default mode

   --GET IMAGE-- read from buffer, but for now just read in png
   CoreWrap.push_back(New_String("lena.png"));
   CoreWrap.push_back(New_String("rosie.jpeg"));
   CoreWrap.waitKey(0);
   CoreWrap.imshow(New_String("Lady Rosie"), 1);--show image for debug purposes
   CoreWrap.waitKey(0);

   --CLEAN IMAGE--to be implemented
   --CONVERT IMAGE TO GREYSCALE FOR CANNY
   processingWrap.cvtColor(1, 1, 6);
   CoreWrap.imshow(New_String("why so grey rosie?"), 1);--show image for debug purposes
   Put_Line("Bye Borky!");
   Put_Line("Hello Gerry!");
   if(Vision.Image.DummyTest) then
      Put_Line("Works!");
   else
   Put_Line("Doesn't Work!");
   end if;
   if(Vision.Image.DummyShow) then
      Put_Line("Second Works!");
   else
   Put_Line("Second Doesn't Work!");
   end if;

   if(Vision.Image_Preprocessing.DummyTest) then
      Put_Line("Prepro Works!");
   else
   Put_Line("Prepro Doesn't Work!");
   end if;
end main;


--LOOP:
--//look for instruction

-- if instruction
--//go to mission wrap

--else
--//dont go to mission wrap!
--	//get image
--	//clean image
--	//find/calculate position/velocity
--	//check for object
--		if ojbect detected
--			//figure out what oject is
--			//figure out where object is
--
--END LOOP
