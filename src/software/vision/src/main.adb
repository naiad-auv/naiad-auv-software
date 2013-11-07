with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--with Vision.Image_Processing;

procedure main is

   --user decisions
   iDoUseBuffer : Integer := 1;
   iDoUseStatic : Integer := 0;
   iDoShowOriginal : Integer := 1;
   iDoGaussian : Integer := 0;
   iDoSplit : Integer := 0;
   iDoCvtGrey : Integer := 0;
   iDoCvtHSI : Integer := 0;
   iDoHistoBGR : Integer := 0;
   iDoHistoHSI : Integer := 0;
   iDoCanny : Integer := 0;
   iDoThresh : Integer := 0;
   iDoHoughCircles : Integer := 0;
   iDoContours : Integer := 0;
   iDoApproxPoly : Integer := 0;
   iDoObjectTracking : Integer := 0;
   iDoFusion : Integer := 0;
   iDoVelocityMode : Integer :=0;
   iDoInvertImage : Integer := 0;
   iDoSharpenImage : Integer := 0;
   iDoCompareHistograms : Integer := 0;
   iDoMakeMovie : Integer := 0;
   iDoMatchTemplete : Integer := 1;


   iImageSource : Interfaces.C.Int;
   iEnhancedImageSource : Interfaces.C.int;
   iPreviousImageLocation : Interfaces.C.int;
   iEnhancedPreviousImage : Interfaces.C.int;
   iImageDestination : Interfaces.C.Int;
   iCannyLocation : Interfaces.C.Int;
   iGreyScaleLocation : Interfaces.C.Int;
   iHSILocation : Interfaces.C.Int;
   iContourLocation : Interfaces.C.Int;
   iCirclesLocation : Interfaces.C.Int;
   iGaussianBlurLocation : Interfaces.C.int;
   iThreshedImageLocation : Interfaces.C.int;
   iFusionOut : Interfaces.C.int;
   iInvertImageLocation : Interfaces.C.int;
   iTemplate1 : Interfaces.C.int;
   iTemplate2 : Interfaces.C.int;
   iTemplate3 : Interfaces.C.int;
   iTemplate4 : Interfaces.C.int;
   itemplateTempStorage : Interfaces.C.int;

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

   --hist comparison
   iCorrelation : interfaces.c.int;
   iChiSquare : interfaces.c.int;
   iIntersection : interfaces.c.int;
   iBhattacharyyaDistance : interfaces.c.int;
   compareHistResult : interfaces.c.double;

   --video
   videoOpen : integer:=0;

   --templates
   iTemplateSize : integer := 4;
   templateIndex : integer := 1;
   loadTemplates : integer :=0;
   iTemplate :interfaces.c.int := 30;
   bestTempleteMatchFound : interfaces.c.int;

   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;

begin
   iImageSource := 0;
   iPreviousImageLocation := 1;
   iImageDestination := 2;
   iEnhancedImageSource := 3;
   iEnhancedPreviousImage := 4;
   itemplateTempStorage := 18;
   iInvertImageLocation := 19;
   iGreyScaleLocation :=20;
   iCannyLocation :=21;
   iHSILocation := 22;
   iContourLocation := 23;
   iCirclesLocation := 24;
   iGaussianBlurLocation :=25;
   iThreshedImageLocation := 26;
   iFusionOut := 27;
   iTemplate1 := 30;
   iTemplate2 := 31;
   iTemplate3 := 32;
   iTemplate4 := 33;

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

   --compare histogram
   iCorrelation :=1;
   iChiSquare :=2;
   iIntersection :=3;
   iBhattacharyyaDistance :=4;




   -----------------------------MAIN LOOP --------------------------------------------------------
   Endless_Loop:
   loop
      --GET IMAGE-- read from buffer
      if (iDoUseBuffer = 1) then
         CoreWrap.img_buffer; --load image to img.at(0)
      elsif (iDoUseStatic =1) then
         --, or just read in single image NEW, READS IN IMAGE AND STORES IN INDEX "IMAGESOURCE" OF "img.at()"
         CoreWrap.imstore(iImageSource,New_String("shapes3.jpg"));
      elsif (iDoMakeMovie = 1) then
         --capture from video
         if (videoOpen=0) then
            preprocessingWrap.VideoCaptureOpen;
            videoOpen:=1;
         end if;

         preprocessingWrap.nextFrame(iImageSource);
         CoreWrap.imshow(New_String("test video"), iImageSource);
         CoreWrap.waitKey(0);
      end if;


      --CLEAN IMAGE (TODO)

      --convert image to hsi
      if (iDoCvtHSI = 1) then
         processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
         CoreWrap.imshow(New_String("Why so HSI?"),iHSILocation);
         CoreWrap.waitKey(0);
      end if;

      --display image source
      if (iDoShowOriginal = 1) then
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
         ret := processingWrap.thresh(iHSILocation, iThreshedImageLocation, 0, 0, 0, 0, 0, 255);
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
         ret := processingWrap.thresh(iHSILocation, iThreshedImageLocation, 10, 70, 50, 255, 50, 255);

         processingWrap.cvtColor(iThreshedImageLocation,iGreyScaleLocation, iGreyFilter);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         processingWrap.Contours(iCannyLocation);
         processingWrap.showContours(iThreshedImageLocation,contourOut => iContourLocation,contourId  => -1 ,thickness  => 3 );

         processingWrap.cvtColor(iContourLocation,iGreyScaleLocation, iGreyFilter);

         processingWrap.approxPolyDP(1.2, 1);

         processingWrap.goodFeatures(iGreyScaleLocation);
         processingWrap.objectTracking;
      end if;

      --USE VELOCITY MODE
      if(iDoVelocityMode =1) then
         processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
         ret := processingWrap.thresh(iHSILocation, iThreshedImageLocation, 30, 60, 50, 255, 50, 255);

         processingWrap.cvtColor(iThreshedImageLocation,iGreyScaleLocation, iGreyFilter);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         processingWrap.Contours(iCannyLocation);
         processingWrap.showContours(iThreshedImageLocation,contourOut => iContourLocation,contourId  => -1 ,thickness  => 3 );

         processingWrap.cvtColor(iContourLocation,iGreyScaleLocation, iGreyFilter);

         processingWrap.approxPolyDP(1.2, 1);
         processingWrap.estPosition;
         processingWrap.goodFeatures(iGreyScaleLocation);
         processingWrap.objectTracking;

         if velCount>0 then
            processingWrap.GaussianBlurSharpener(iImageSource,2,3);
            processingWrap.GaussianBlurSharpener(1,3,3);
            estVel:=processingWrap.estimateVelocity;
         end if;
         velCount:=1;
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
         processingWrap.cvtColor(iThreshedImageLocation,iGreyScaleLocation, iGreyFilter);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         processingWrap.Contours(iCannyLocation);
         processingWrap.showContours(iThreshedImageLocation,contourOut => iContourLocation,contourId  => -1 ,thickness  => 1 );
         CoreWrap.imshow(New_String("Whats with the contours?"),iContourLocation);
         CoreWrap.waitKey(0);
      end if;

      ---Approx Poly
      if (iDoApproxPoly = 1) then
         processingWrap.approxPolyDP(1.2, 1);
      end if;


      --Fusion
      if (iDoFusion = 1) then
         processingWrap.fusion(iImageSource, iFusionOut);
         --           CoreWrap.imshow(New_String("why so fused?"), iFusionOut);
         --           CoreWrap.waitKey(0);
         --
         --debug / test
         processingWrap.cvtColor(iFusionOut,iGreyScaleLocation, iGreyFilter);
         --           CoreWrap.imshow(New_String("fusedf gray"),iGreyScaleLocation);
         --           CoreWrap.waitKey(0);
         processingWrap.Canny(iGreyScaleLocation, iImageDestination, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         CoreWrap.imshow(New_String("why so fused canny?"), iImageDestination);--show image for debug purposes
         CoreWrap.waitKey(0);

      end if;

      --invert image
      if (iDoInvertImage = 1) then
         processingWrap.invertImage(iImageSource, iInvertImageLocation);
         CoreWrap.imshow(New_String("why so negative?"), iInvertImageLocation);--show image for debug purposes
         CoreWrap.waitKey(0);
      end if;

      if(iDoSharpenImage = 1) then
         processingWrap.GaussianBlurSharpener(iImageSource,iEnhancedImageSource,3);
         CoreWrap.imshow(New_String("why so sharp?"),iEnhancedImageSource);
         CoreWrap.waitKey(0);
      end if;

      if(iDoCompareHistograms = 1) then
         compareHistResult:=processingWrap.compareHSVHistograms(iImageSource,iPreviousImageLocation,iChiSquare);
         --        iCorrelation : 1;
         --     iChiSquare : 2;
         --     iIntersection : 3;
         --     iBhattacharyyaDistance : 4;
      end if;

      if(iDoMatchTemplete =1) then
         if (loadTemplates = 0) then
            --load templates
            CoreWrap.imstore(iTemplate1,New_String("redTrident.jpg"));
            CoreWrap.imstore(iTemplate2,New_String("redSword.jpg"));
            CoreWrap.imstore(iTemplate3,New_String("redHoneycomb.jpg"));
            CoreWrap.imstore(iTemplate4,New_String("redCircle.jpg"));

            --cleanup templates
            for iTemplateIndex in 1 .. iTemplateSize loop
               processingWrap.enhanceColors(iTemplate,iTemplate,1,30.0);
               processingWrap.GaussianBlurSharpener(iTemplate,iTemplate,2);
               processingWrap.cvtColor(iTemplate, itemplateTempStorage, iHSIFilter);
               ret := processingWrap.thresh(itemplateTempStorage, itemplateTempStorage, 0, 0, 0, 0, 50, 255);
               processingWrap.gaussianBlur(itemplateTempStorage,itemplateTempStorage,11,0.0,0.0);
               processingWrap.GaussianBlurSharpener(itemplateTempStorage,itemplateTempStorage,4);
               processingWrap.cvtColor(itemplateTempStorage,itemplateTempStorage, iGreyFilter);
               processingWrap.Canny(itemplateTempStorage,iTemplate, 100, 300, iCannyKernelSize);
               iTemplate:=iTemplate+1;
            end loop;
         end if;
         loadTemplates:=1;
         Put_Line("exit loop");
         --coreWrap.waitKey(0);

         --cleanup source image
         processingWrap.enhanceColors(iImageSource,iImageSource,1,30.0);
         processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
         ret := processingWrap.thresh(iHSILocation,iThreshedImageLocation, 0, 0, 0, 0, 50, 255);

         processingWrap.gaussianBlur(iThreshedImageLocation,iThreshedImageLocation,11,0.0,0.0);
         processingWrap.GaussianBlurSharpener(iThreshedImageLocation,iThreshedImageLocation,4);
         processingWrap.cvtColor(iThreshedImageLocation,iGreyScaleLocation, iGreyFilter);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, 100, 300, iCannyKernelSize);
         bestTempleteMatchFound:=processingWrap.matchImage(iCannyLocation);
         processingWrap.classifyMatch(bestTempleteMatchFound);
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
