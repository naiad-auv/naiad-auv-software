with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Vision.Image_Processing;

procedure main is
   iImageSource : Interfaces.C.Int;
   iImageDestination : Interfaces.C.Int;
   iCannyLocation : Interfaces.C.Int;
   iGreyScaleLocation : Interfaces.C.Int;
   iHSILocation : Interfaces.C.Int;
   iContourLocation : Interfaces.C.Int;

   iGreyFilter : Interfaces.C.Int;
   iHSIFilter : Interfaces.C.Int;
   iCannyKernelSize :Interfaces.C.int;
   iCannyLowThres : Interfaces.C.int;
   iCannyHighThres : Interfaces.C.int;
   ret : Interfaces.C.int;

   --hough cirlces variables
   inverseRatioOfResolution : Interfaces.C.int;
   minDistBetweenCenters : Interfaces.C.int;
   houghCannyUpThres : Interfaces.C.int;
   centerDetectionThreshold : Interfaces.C.int;
   minRadius : Interfaces.C.int;
   maxRadius : Interfaces.C.int;

   --histo variables
   rangeLower : Standard.Float;
   rangeHigher : Standard.Float;
   bgrHistSize : Interfaces.C.Int;
   bgrnumSourceArray: interfaces.C.int;
   bgrChannelsToBeMeasured:interfaces.C.int;
   bgrHistDimensionality:interfaces.C.int;
   bgrRange : aliased array(integer range 1..2) of aliased standard.Float;

   hsiNumSourceArray:interfaces.C.int;
   hsiSize : aliased array(integer range 1..2) of aliased Interfaces.C.int;
   channels : aliased array(integer range 1..2) of aliased Interfaces.C.int;
   hrange : aliased array(integer range 1..2) of aliased standard.Float;
   srange : aliased array(integer range 1..2) of aliased standard.Float;
   histDimensionality : Interfaces.C.int;
   uniform : interfaces.C.unsigned_char;
   accumulate : interfaces.C.unsigned_char;

   --thres
   confirmThres : integer;
   lowLimit :interfaces.C.int;
   upLimit :interfaces.C.int;

   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;

begin
   iImageSource := 0;
   iImageDestination := 1;
   iGreyScaleLocation :=20;
   iCannyLocation :=21;
   iHSILocation := 22;
   iContourLocation := 23;

   iGreyFilter := 6;
   iHSIFilter :=40;
   iCannyLowThres := 20;
   iCannyHighThres := 200;
   iCannyKernelSize := 3;

   --bgr histo
   bgrNumSourceArray:=1;
   bgrHistSize :=256;
   bgrChannelsToBeMeasured :=0;
   bgrHistDimensionality := 1;
   bgrRange(1):= standard.Float(0.0);
   bgrRange(2):= standard.Float(256.0);
   uniform := 1;
   accumulate := 0;
   --hsi histo
   histDimensionality := 2;
   hsiNumSourceArray := 1;
   hsiSize(1) := Interfaces.C.int(30);
   hsiSize(2) := Interfaces.C.int(32);
   channels(1) := Interfaces.C.int(0);
   channels(2) := Interfaces.C.int(1);
   hrange(1) := standard.Float(0.0);
   hrange(2) := standard.Float(180.0);
   srange(1) := standard.Float(0.0);
   srange(2) := standard.Float(256.0);

   --hough circle declarations
   inverseRatioOfResolution := 1;
   minDistBetweenCenters := 10;
   houghCannyUpThres := 200;
   centerDetectionThreshold := 100;
   minRadius := 0;--zero used if unknown
   maxRadius :=	 0;--zero used if unknown

   --thres
   confirmThres := 0;
   lowLimit := 200;
   upLimit := 250;

   -----------------------------MAIN LOOP --------------------------------------------------------
   Endless_Loop:
   loop
      --GET IMAGE-- read from buffer
      CoreWrap.img_buffer;--load image to img.at(0)


      --, or just read in single image NEW, READS IN IMAGE AND STORES IN INDEX "IMAGESOURCE" OF "img.at()"
      --CoreWrap.imstore(iImageSource,New_String("62.jpg"));
   	--split channels of image
   	--processingWrap.splitChannels(iImageSource);

   --CLEAN IMAGE (TODO)
   processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
      CoreWrap.imshow(New_String("Why so HSI?"),iHSILocation);
      CoreWrap.waitKey(0);

      --display image source
      CoreWrap.imshow(New_String("Why so normal?"), iImageSource);--show image for debug purposes
      CoreWrap.waitKey(0);

      --test thresh
      ret := processingWrap.thresh(iHSILocation, lowLimit, upLimit, 0);
      --

      --split channels of image
      --processingWrap.splitChannels(iImageSource);

      --run bgr histo and show result
      --processingWrap.BGRHistogram(bgrNumSourceArray,bgrHistDimensionality,bgrHistSize, bgrRange(1)'Access,uniform,accumulate);
      --processingWrap.showBGRHistogram(bgrHistSize);

      --convert image to hsi
      --processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
      --CoreWrap.imshow(New_String("Why so HSI?"),iHSILocation);
      --CoreWrap.waitKey(0);

      --hsi histo
      --processingWrap.HSIHistogram(iHSILocation,hsiNumSourceArray,channels(1)'Access,hsiSize(1)'Access,hrange(1)'Access,srange(1)'Access,histDimensionality,uniform,accumulate);
      --processingWrap.showHSIHistogram(hsiSize(1)'Access);

      --CLEAN IMAGE--to be implemented

      --CONVERT IMAGE TO GREYSCALE
      --processingWrap.cvtColor(iImageSource,iGreyScaleLocation, iGreyFilter);
      --CoreWrap.imshow(New_String("why so grey?"), iGreyScaleLocation);--show image for debug purposes
      --CoreWrap.waitKey(0);

      --USE CANNY ON GREYSCALE IMAGE
      --processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
      --CoreWrap.imshow(New_String("why so canny?"), iCannyLocation);--show image for debug purposes
      --CoreWrap.waitKey(0);

      --test Channels
      --processingWrap.splitChannels(iImageSource);
      --processingWrap.showRedChannel;

      --write image to file
      --ret := CoreWrap.imwrite(New_String("CannyOut.jpg"),2 );

      --HOUGH CIRCLES
        --processingWrap.HoughCircles(iGreyScaleLocation, inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius);

      --     Vision.Image_Processing.Hough_Circles(iImageDestination, inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius);
      --     Vision.Image_Processing.Draw_Hough_Circles(iImageSource);
      --     CoreWrap.imshow(New_String("why so circly?"), 1);--show image for debug purposes
      --     CoreWrap.waitKey(0);
      --     ret := CoreWrap.imwrite(New_String("HoughOut.jpg"), 1 );

      --HOUGH LINES
      --processingWrap.HoughLines(src                   => Interfaces.C.int(iImageDestination),
      --                        rho                   => 1,
      --                      theta                 => Standard.Float(1),
      --                    intersectionThreshold => 100);
      --processingWrap.DrawHoughLines(cdst => Interfaces.C.int(iImageSource));
      --CoreWrap.imshow(name => New_String("Lines disp"),
      --              src  => Interfaces.C.int(iImageSource));
      --CoreWrap.waitKey(0);

      --lines
      --processingWrap.LabelPoints(Interfaces.C.int(4));

      --CONTOURS
       -- processingWrap.Contours(iCannyLocation);
     -- processingWrap.showContours(contourOut => iContourLocation,contourId  => -1 ,thickness  => 3 );
      --CoreWrap.imshow(New_String("Whats with the contours?"),iContourLocation);
     -- CoreWrap.waitKey(0);

      --processingWrap.HoughCircles(Interfaces.C.int(1), inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius);
      --ret := CoreWrap.imwrite(name => New_String("Contours.jpg"),
      --               src  => 0);

      --processingWrap.approxPolyDP(1.2, 1);

   end loop Endless_Loop;
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
