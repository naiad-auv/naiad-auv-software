with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Vision.Image; use Vision.Image;
with Vision.Image_Preprocessing; use Vision.Image_Preprocessing;
with Vision.Image_Processing; use Vision.Image_Processing;
--with Vision.Mission_Handler; use Vision.Mission_Handler;

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
   CoreWrap.waitKey(0);
   Put_Line("test changes to main vision");
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
   --test image
   if(Vision.Image.DummyShow2) then
      Put_Line("image Works!");
   else
   Put_Line("image Doesn't Work!");
   end if;
   --test prepro
   if(Vision.Image_Preprocessing.DummyTest2) then
      Put_Line("prepro Works!");
   else
   Put_Line("prepro Doesn't Work!");
   end if;
   --test pro
   if(Vision.Image_Processing.DummyTest2) then
      Put_Line("pro Works!");
   else
   Put_Line("pro Doesn't Work!");
   end if;
   --test mission
   --if(Vision.Mission_Handler.DummyTest) then
      --Put_Line("mission Works!");
   --else
   --Put_Line("mission Doesn't Work!");
   --end if;
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
