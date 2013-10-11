with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
--with Vision.Image; use Vision.Image;
with Vision.Image_Preprocessing; use Vision.Image_Preprocessing;
with Vision.Image_Processing;

procedure main is
   iImageSource : integer;
   iImageDestination : integer;
   iGreyFilter : integer;
   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;
begin

   iImageSource := 1;
   iImageDestination := 1;
   iGreyFilter := 6;
   --CHECK FOR INSTRUCTION--to be implemented, for now just working on default mode

   --GET IMAGE-- read from buffer, but for now just read in png
   CoreWrap.push_back(New_String("lena.png"));
   CoreWrap.push_back(New_String("rosie.jpeg"));
   CoreWrap.waitKey(0);
   CoreWrap.imshow(New_String("Lady Rosie"), 1);--show image for debug purposes
   CoreWrap.waitKey(0);

   --CLEAN IMAGE--to be implemented
   --CONVERT IMAGE TO GREYSCALE FOR CANNY
   --image_processing.convertToGreyscale(image)
   --call convertToGreyscale procedure
   Vision.Image_Processing.Convert_To_Greyscale(iImageSource,iImageDestination, iGreyFilter);

   --USE CANNY ON GREYSCALE IMAGE
   --processing.canny(imageSource,imageDestination)
   --processingWrap.cvtColor(1, 1, 6);
   --Class_Processing_Wrap.cvtColor(imageSource, imageDestination, greyFilter);
   CoreWrap.imshow(New_String("why so grey rosie?"), 1);--show image for debug purposes
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
