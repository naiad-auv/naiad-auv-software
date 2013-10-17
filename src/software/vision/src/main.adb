with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Vision.Image_Preprocessing; use Vision.Image_Preprocessing;
with Vision.Image_Processing;

procedure main is
   iImageSource : integer;
   iImageDestination : integer;
   iImageCannyOut : integer;
   iGreyFilter : integer;
   iCannyKernelSize :integer;
   iCannyLowThres : integer;
   iCannyHighThres : integer;
   ret : Interfaces.C.int;

   --hough cirlces variables
   --src use destination of canny as source for hough circles
   inverseRatioOfResolution : integer;
   minDistBetweenCenters : integer;
   --cannyUpThres : integer; use canny high thres declared above
   houghCannyUpThres : integer;
   centerDetectionThreshold : integer;
   minRadius : integer;
   maxRadius : integer;

   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;
begin
   --canny declarations
   iImageSource := 0;
   iImageDestination := 0;
   iImageCannyOut := 4;
   iGreyFilter := 6;
   iCannyLowThres := 50;
   iCannyHighThres := 100;
   iCannyKernelSize := 3;

   --hough circle declarations
   --src use destination of canny as source for hough circles
     inverseRatioOfResolution := 1;
   minDistBetweenCenters := 10;
   houghCannyUpThres := 200;
   centerDetectionThreshold := 100;
   minRadius := 0;--zero used if unknown
   maxRadius :=	 0;--zero used if unknown
   --     inverseRatioOfResolution := 1;
   --     minDistBetweenCenters := 10;
   --     houghCannyUpThres := 180;
   --     centerDetectionThreshold := 100;
   --     minRadius := 0;--zero used if unknown
   --     maxRadius :=	 0;--zero used if unknown

   --CHECK FOR INSTRUCTION--to be implemented, for now just working on default mode
  
   --GET IMAGE-- read from buffer, but for now just read in png
   CoreWrap.push_back(New_String("rosie.png"));
   CoreWrap.push_back(New_String("rosie.png"));
   --CoreWrap.push_back(New_String("circle3.jpg"));
   --CoreWrap.push_back(New_String("circle3.jpg"));
   --CoreWrap.waitKey(0);
   
   Endless_Loop:
   loop
   CoreWrap.test_func;--load image to img.at(0)
   CoreWrap.imshow(New_String("Why so normal?"), 0);--show image for debug purposes
   CoreWrap.waitKey(0);



   --CLEAN IMAGE--to be implemented
   --CONVERT IMAGE TO GREYSCALE FOR CANNY
   --call convertToGreyscale procedure
   Vision.Image_Processing.Convert_To_Greyscale(iImageSource,iImageDestination, iGreyFilter);
   CoreWrap.imshow(New_String("why so grey?"), 0);--show image for debug purposes
   CoreWrap.waitKey(0);

   --USE CANNY ON GREYSCALE IMAGE
     Vision.Image_Processing.Canny(iImageDestination,iImageDestination, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
     CoreWrap.imshow(New_String("why so canny Sir star fish?"), 0);--show image for debug purposes
     CoreWrap.waitKey(0);
   end loop Endless_Loop;
     --Vision.Image_Processing.Canny(iImageDestination,iImageDestination, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
   --CoreWrap.imshow(New_String("why so canny Sir star fish?"), 2);--show image for debug purposes
   --CoreWrap.waitKey(0);
   --ret := CoreWrap.imwrite(name => New_String("CannyOut.jpg"),
   --                      src  => 2 );
   --CoreWrap.push_back(New_String("CannyOut.jpg"));

   --HOUGH CIRCLES
   --     Vision.Image_Processing.Hough_Circles(iImageDestination, inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius);
   --     Vision.Image_Processing.Draw_Hough_Circles(iImageSource);
   --     CoreWrap.imshow(New_String("why so circly?"), 1);--show image for debug purposes
   --     CoreWrap.waitKey(0);
   --     ret := CoreWrap.imwrite(name => New_String("HoughOut.jpg"),
   --                      src  => 1 );


   --HOUGH CIRCLES
   -- Vision.Image_Processing.Hough_Circles(iImageDestination, inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius);
   -- Vision.Image_Processing.Draw_Hough_Circles(iImageSource);
   --CoreWrap.imshow(New_String("why so circly?"), 1);--show image for debug purposes
   --CoreWrap.waitKey(0);
   --Put("here now");
   --CoreWrap.waitKey(0);

   --HOUGH LINES
   --Vision.Image_Processing.Convert_To_Greyscale(iImageDestination,iImageSource, 8);
   --CoreWrap.imshow(New_String("back to BGR"), 1);--show image for debug purposes
   --CoreWrap.waitKey(0);

   --processingWrap.HoughLines(src                   => Interfaces.C.int(iImageDestination),
   --                        rho                   => 1,
   --                      theta                 => Standard.Float(1),
   --                    intersectionThreshold => 100);
   --processingWrap.DrawHoughLines(cdst => Interfaces.C.int(iImageSource));
   --CoreWrap.imshow(name => New_String("Lines disp"),
   --              src  => Interfaces.C.int(iImageSource));
   --CoreWrap.waitKey(0);
   --processingWrap.LabelPoints(Interfaces.C.int(2));
   --  Vision.Image_Processing.Convert_To_Greyscale(iImageDestination,iImageSource, 8);
   --  CoreWrap.imshow(New_String("back to BGR"), 1);--show image for debug purposes
   --  CoreWrap.waitKey(0);

   --     processingWrap.HoughLines(src                   => Interfaces.C.int(iImageDestination),
   --                               rho                   => 1,
   --                               theta                 => Standard.Float(1),
   --                               intersectionThreshold => 2);
   --     processingWrap.DrawHoughLines(cdst => Interfaces.C.int(iImageSource));
   --     CoreWrap.imshow(name => New_String("Lines disp"),
   --                     src  => Interfaces.C.int(iImageSource));
   --     CoreWrap.waitKey(0);

   --lines
   --processingWrap.LabelPoints(Interfaces.C.int(4));

   --Contours
     --CoreWrap.imshow(name => New_String("test_disp"),
       --              src  => 1);
   --CoreWrap.waitKey(0);

--   processingWrap.Contours(src    => Interfaces.C.int(1));
--   processingWrap.showContours(contourOut => Interfaces.C.int(1),
 --                              contourId  => -1 ,
 --                              thickness  => 3 );
  -- CoreWrap.imshow(name => New_String("contour_out"),
   --                src  => 1);
   --CoreWrap.waitKey(0);
  -- ret := CoreWrap.imwrite(name => New_String("Contours.jpg"),
   --                        src  => 1);
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
