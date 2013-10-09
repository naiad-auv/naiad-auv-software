with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;

procedure main is
   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;
begin

   --CHECK FOR INSTRUCTION--to be implemented, for now just working on default mode

   --GET IMAGE-- read from buffer, but for now just read in jpg
   CoreWrap.push_back(New_String("people.jpg"));
   CoreWrap.push_back(New_String("people.jpg"));
   CoreWrap.waitKey(0);
   CoreWrap.imshow(New_String("Lady Ada"), 0);--show image for debug purposes
   CoreWrap.waitKey(0);

   --CLEAN IMAGE--to be implemented
   --CONVERT IMAGE TO GREYSCALE FOR CANNY
   processingWrap.cvtColor(1, 1, 6);
   CoreWrap.imshow(New_String("Filtered Ada"), 1);--show image for debug purposes
   CoreWrap.waitKey(0);

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
