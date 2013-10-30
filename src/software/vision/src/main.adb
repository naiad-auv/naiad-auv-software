with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Vision.Image_Processing;

procedure main is

   --user decisions
   iUseBuffer : Integer;
   iUseStatic : Integer;
   iShowOriginal : Integer;
   iDoGaussian : Integer;
   iDoSplit : Integer;
   iDoCvtGrey : Integer;
   iDoCvtHSI : Integer;
   iDoHistoBGR : Integer;
   iDoHistoHSI : Integer;
   iDoCanny : Integer;
   iDoThresh : Integer;
   iDoHoughCircles : Integer;
   iDoContours : Integer;
   iDoApproxPoly : Integer;
   iDoObjectTracking : Integer;
   iDoVelocityMode : Integer;

   iImageSource : Interfaces.C.Int;
   iEnhancedImageSource : Interfaces.C.int;
   iPreviousImageLocation : Interfaces.C.int;
   iImageDestination : Interfaces.C.Int;
   iCannyLocation : Interfaces.C.Int;
   iGreyScaleLocation : Interfaces.C.Int;
   iHSILocation : Interfaces.C.Int;
   iContourLocation : Interfaces.C.Int;
   iCirclesLocation : Interfaces.C.Int;
   iGaussianBlurLocation : Interfaces.C.int;
   iThreshedImageLocation : Interfaces.C.int;

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

   --Gaussian
   GaussianKerSize : interfaces.c.int;
   GaussianSigmaX : interfaces.c.double;
   GaussianSigmaY : interfaces.c.double;

   --est vel
   estVel:float;
   velCount:integer:=1;

   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;

begin
   iImageSource := 0;
   iPreviousImageLocation := 1;
   iEnhancedImageSource :=2;
   iGreyScaleLocation :=20;
   iCannyLocation :=21;
   iHSILocation := 22;
   iContourLocation := 23;
   iCirclesLocation := 24;
   iGaussianBlurLocation :=25;
   iThreshedImageLocation := 26;

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
   maxRadius :=     0;--zero used if unknown

   --thres
   confirmThres := 0;
   lowLimit := 200;
   upLimit := 250;

   --Gaussian
   GaussianKerSize := 31;
   GaussianSigmaX := 0.0;
   GaussianSigmaY := 0.0;

   --est velocity
   estVel :=0.0;

   --user decisions
   iUseBuffer := 1;
   iUseStatic := 0;
   iShowOriginal := 1;
   iDoGaussian := 0;
   iDoSplit := 0;
   iDoCvtGrey := 0;
   iDoCvtHSI := 0;
   iDoHistoBGR := 0;
   iDoHistoHSI := 0;
   iDoCanny := 0;
   iDoThresh := 0;
   iDoHoughCircles := 0;
   iDoContours := 0;
   iDoApproxPoly := 0;
   iDoObjectTracking := 0;
   iDoVelocityMode := 1;

   -----------------------------MAIN LOOP --------------------------------------------------------
   Endless_Loop:
   loop
      --GET IMAGE-- read from buffer
      if (iUseBuffer = 1) then
         CoreWrap.img_buffer; --load image to img.at(0)
      elsif (iUseStatic =1) then
         --, or just read in single image NEW, READS IN IMAGE AND STORES IN INDEX "IMAGESOURCE" OF "img.at()"
         CoreWrap.imstore(iImageSource,New_String("62.jpg"));
      end if;


      --CLEAN IMAGE (TODO)

      --convert image to hsi
      if (iDoCvtHSI = 1) then
         processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
         CoreWrap.imshow(New_String("Why so HSI?"),iHSILocation);
         CoreWrap.waitKey(0);
      end if;

      --display image source
      if (iShowOriginal = 1) then
         CoreWrap.imshow(New_String("Why so normal?"), iImageSource);--show image for debug purposes
         CoreWrap.waitKey(400);
      end if;

      --Gaussian Blur
      if (iDoGaussian = 1) then
         processingWrap.gaussianBlur(iImageSource, iGaussianBlurLocation, GaussianKerSize, GaussianSigmaX, GaussianSigmaY);
         CoreWrap.imshow(New_String("Why so Gaussian?"), iGaussianBlurLocation);--show image for debug purposes
         CoreWrap.waitKey(0);
      end if;

      --test thresh
      if (iDoThresh = 1) then
         ret := processingWrap.thresh(iHSILocation, 10, 70, 50, 255, 50, 255);
         CoreWrap.imshow(New_String("why so after mask?"),iThreshedImageLocation);
      end if;

      --split channels of image
      if (iDoSplit = 1) then
         processingWrap.splitChannels(iImageSource);
      end if;

      --run bgr histo and show result
      if (iDoHistoBGR = 1) then
         processingWrap.BGRHistogram(bgrNumSourceArray,bgrHistDimensionality,bgrHistSize, bgrRange(1)'Access,uniform,accumulate);
         processingWrap.showBGRHistogram(bgrHistSize);
      end if;

      --hsi histo
      if (iDoHistoHSI = 1) then
         processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
         processingWrap.HSIHistogram(iHSILocation,hsiNumSourceArray,channels(1)'Access,hsiSize(1)'Access,hrange(1)'Access,srange(1)'Access,histDimensionality,uniform,accumulate);
         processingWrap.showHSIHistogram(hsiSize(1)'Access);
      end if;

      --CLEAN IMAGE--to be implemented

      --CONVERT IMAGE TO GREYSCALE
      if (iDoCvtGrey = 1) then
         processingWrap.cvtColor(iImageSource,iGreyScaleLocation, iGreyFilter);
         CoreWrap.imshow(New_String("why so grey?"), iGreyScaleLocation);--show image for debug purposes
         CoreWrap.waitKey(0);
      end if;

      --USE CANNY ON GREYSCALE IMAGE
      if (iDoCanny = 1) then
         processingWrap.cvtColor(iImageSource,iGreyScaleLocation, iGreyFilter);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         CoreWrap.imshow(New_String("why so canny?"), iCannyLocation);--show image for debug purposes
         CoreWrap.waitKey(0);
      end if;

      --USE OBJECT TRACKING
      if(iDoObjectTracking = 1) then
         processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
         ret := processingWrap.thresh(iHSILocation, 10, 70, 50, 255, 50, 255);

         processingWrap.cvtColor(iThreshedImageLocation,iGreyScaleLocation, iGreyFilter);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         processingWrap.Contours(iCannyLocation);
         processingWrap.showContours(contourOut => iContourLocation,contourId  => -1 ,thickness  => 3 );

         processingWrap.cvtColor(iContourLocation,iGreyScaleLocation, iGreyFilter);

         processingWrap.approxPolyDP(1.2, 1);

         processingWrap.goodFeatures(iGreyScaleLocation);
         processingWrap.objectTracking;
      end if;

      --USE VELOCITY MODE
      if(iDoVelocityMode =1) then
         processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
         ret := processingWrap.thresh(iHSILocation, 30, 60, 50, 255, 50, 255);

         processingWrap.cvtColor(iThreshedImageLocation,iGreyScaleLocation, iGreyFilter);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         processingWrap.Contours(iCannyLocation);
         processingWrap.showContours(contourOut => iContourLocation,contourId  => -1 ,thickness  => 3 );

         processingWrap.cvtColor(iContourLocation,iGreyScaleLocation, iGreyFilter);
         processingWrap.gaussianBlur(iGreyScaleLocation, iGaussianBlurLocation, 10, GaussianSigmaX, GaussianSigmaY);
         processingWrap.HoughLinesP(iGaussianBlurLocation);
         --CoreWrap.imshow(New_String("sending this to tracking?"), iGreyScaleLocation);
         --CoreWrap.waitKey(0);

         processingWrap.approxPolyDP(1.2, 1);

         processingWrap.goodFeatures(iGreyScaleLocation);
         processingWrap.objectTracking;
         if velCount>0 then
         processingWrap.GaussianBlurSharpener(iImageSource,2,3);
         processingWrap.GaussianBlurSharpener(1,3,3);
            estVel:=processingWrap.estimateVelocity;
         end if;
         velCount:=velCount+1;
      end if;

      --write image to file
      --ret := CoreWrap.imwrite(New_String("CannyOut.jpg"),2 );

      --HOUGH CIRCLES
      if (iDoHoughCircles = 1) then
         processingWrap.cvtColor(iImageSource,iGreyScaleLocation, iGreyFilter);
         processingWrap.HoughCircles(iGreyScaleLocation, inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius);
         processingWrap.DrawHoughCircles(iImageSource);
         CoreWrap.imshow(New_String("why so circly?"), iCirclesLocation);--show image for debug purposes
         processingWrap.FindCircleCenters;
         CoreWrap.waitKey(0);
         ret := CoreWrap.imwrite(New_String("HoughOut.jpg"), 1 );
      end if;

      --CONTOURS
      if (iDoContours = 1) then
         processingWrap.cvtColor(iImageSource,iGreyScaleLocation, iGreyFilter);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         processingWrap.Contours(iCannyLocation);
         processingWrap.showContours(contourOut => iContourLocation,contourId  => -1 ,thickness  => 3 );
         CoreWrap.imshow(New_String("Whats with the contours?"),iContourLocation);
         CoreWrap.waitKey(0);
      end if;

      ---Approx Poly
      if (iDoApproxPoly = 1) then
         processingWrap.approxPolyDP(1.2, 1);
      end if;

   end loop Endless_Loop;
end main;


--LOOP:
--//look for instruction

-- if instruction
--//go to mission wrap

--else
--//dont go to mission wrap!
--    //get image
--    //clean image
--    //find/calculate position/velocity
--    //check for object
--        if ojbect detected
--            //figure out what oject is
--            //figure out where object is
--
--END LOOP
