with visionBindings_hpp; use visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;
--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Vision.Image_Processing;
with Vision.Image_Preprocessing;

procedure main is

   --user decisions
   iDoUseBuffer : Integer := 0;
   iDoUseStatic : Integer := 1;
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
   iDoInvertImage : Integer := 0; --iDoCreateNegativity
   iDoSharpenImage : Integer := 0;
   iDoCompareHistograms : Integer := 0;
   iDoMakeMovie : Integer := 0;
   iDoMatchTemplete : Integer := 0;
   iDoWriteImageToFile : Integer :=0;
   iDoEnhanceColors : Integer :=0;
   iDoContrast : Integer := 1;
   iDoQuaternionSwitchingFilter : Integer := 1;


   --image locations
   iImageSource : Interfaces.C.Int :=0;
   iPreviousImageLocation : Interfaces.C.int := 1;
   iImageDestination : Interfaces.C.Int:=2;
   iEnhancedImageSource : Interfaces.C.int:=3;
   iEnhancedPreviousImage : Interfaces.C.int:=4;

   iInvertImageLocation : Interfaces.C.int:=5;
   iGreyScaleLocation : Interfaces.C.Int:=6;
   iCannyLocation : Interfaces.C.Int:=7;
   iHSILocation : Interfaces.C.Int:=8;
   iContourLocation : Interfaces.C.Int:=9;
   iCirclesLocation : Interfaces.C.Int:=10;
   iGaussianBlurLocation : Interfaces.C.int:=11;
   iThreshedImageLocation : Interfaces.C.int:=12;
   iFusionOutLocation : Interfaces.C.int:=13;
   iContrastOut : Interfaces.C.int := 14;
   iQNSFLocation : Interfaces.C.int := 15;

   itemplateTempStorage : Interfaces.C.int:=20;
   iTemplate1 : Interfaces.C.int:=21;
   iTemplate2 : Interfaces.C.int:=22;
   iTemplate3 : Interfaces.C.int:=23;
   iTemplate4 : Interfaces.C.int:=24;

   --filter settings
   iGreyFilter : Interfaces.C.Int:=6;
   iHSIFilter : Interfaces.C.Int:=40;

   --canny settings
   iCannyKernelSize :Interfaces.C.int:=3;
   iCannyLowThres : Interfaces.C.int:=20;
   iCannyHighThres : Interfaces.C.int:=200;

   --hough cirlces variables
   inverseRatioOfResolution : Interfaces.C.int:=1;
   minDistBetweenCenters : Interfaces.C.int:=10;
   houghCannyUpThres : Interfaces.C.int:=200;
   centerDetectionThreshold : Interfaces.C.int:=100;
   minRadius : Interfaces.C.int:= 0;--zero used if unknown;
   maxRadius : Interfaces.C.int:= 0;--zero used if unknown;

   --histo variables
   rangeLower : Standard.Float;
   rangeHigher : Standard.Float;
   bgrHistSize : Interfaces.C.Int:=256;
   bgrNumSourceArray: interfaces.C.int:=1;
   bgrChannelsToBeMeasured:interfaces.C.int:=0;
   bgrHistDimensionality:interfaces.C.int:=1;
   bgrRange : aliased array(integer range 1..2) of aliased standard.Float;

   hsiNumSourceArray:interfaces.C.int:=1;
   hsiSize : aliased array(integer range 1..2) of aliased Interfaces.C.int;
   channels : aliased array(integer range 1..2) of aliased Interfaces.C.int;
   hrange : aliased array(integer range 1..2) of aliased standard.Float;
   srange : aliased array(integer range 1..2) of aliased standard.Float;
   histDimensionality : Interfaces.C.int:=2;
   uniform : interfaces.C.unsigned_char:=1;
   accumulate : interfaces.C.unsigned_char:=0;

   --threshold
   confirmThres : integer:=0;
   lowLimit :interfaces.C.int:=200;
   upLimit :interfaces.C.int:=250;
   iBlueLow : interfaces.C.Int := 0;
   iBlueUp : interfaces.C.Int := 0;
   iGreenLow : interfaces.C.Int := 0;
   iGreenUp : interfaces.C.Int := 0;
   iRedLow : interfaces.C.Int := 0;
   iRedUp : interfaces.C.Int := 255;

   --Gaussian
   iGaussianKerSize : interfaces.c.int:=31;
   dGaussianSigmaX : interfaces.c.double:=0.0;
   dGaussianSigmaY : interfaces.c.double:=0.0;
   iSharpenAccuracy : interfaces.c.int :=1;

   --est vel
   estVel:float:=0.0;
   velCount:integer:=1;

   --hist comparison
   compareHistResult : interfaces.c.double;
   iHistogramCompareMethod : Interfaces.C.int := 1;--iCorrelation : 1;iChiSquare : 2;iIntersection : 3;iBhattacharyyaDistance : 4;

   --video
   videoOpen : integer:=0;

   --templates
   iTemplateSize : integer := 4;
   templateIndex : integer := 1;
   loadTemplates : integer :=0;
   iTemplate :interfaces.c.int;--MUST BE SET TO FIRST TEMPLETE POSITION
   bestTempleteMatchFound : interfaces.c.int;

   --enhance
   iEnhanceLevel : interfaces.c.Double:=20.0;
   iEnhanceChannel : interfaces.C.Int:=1;

   --contrast
   iGain : Interfaces.C.int := 5;
   iBias : Interfaces.C.int := 0;

   --QNSF
   iQNSFThresh : Interfaces.C.Double := 30.0;

   --wait time when displaying images
   iWaitTime : interfaces.c.int := 0;
   ret : interfaces.c.int;

   CoreWrap : aliased Class_Core_Wrap.Core_Wrap;
   processingWrap : aliased Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased Class_Preprocessing_Wrap.Preprocessing_Wrap;

begin
   --bgr histo
   bgrRange(1):= standard.Float(0.0);
   bgrRange(2):= standard.Float(256.0);

   --hsi histo
   hsiSize(1) := Interfaces.C.int(30);
   hsiSize(2) := Interfaces.C.int(32);
   channels(1) := Interfaces.C.int(0);
   channels(2) := Interfaces.C.int(1);
   hrange(1) := standard.Float(0.0);
   hrange(2) := standard.Float(180.0);
   srange(1) := standard.Float(0.0);
   srange(2) := standard.Float(256.0);

   -----------------------------MAIN LOOP --------------------------------------------------------
   Endless_Loop:
   loop
      --Get image
      if (iDoUseBuffer = 1) then -- read from buffer
         CoreWrap.img_buffer;
      elsif (iDoUseStatic =1) then --read in single image
         CoreWrap.imstore(iImageSource,New_String("noise.jpg"));
      elsif (iDoMakeMovie = 1) then --capture from video
         Vision.Image_Preprocessing.Capture_Video(iImageSource,iWaitTime,videoOpen);
         videoOpen:=1;
      end if;

      --display image source
      if (iDoShowOriginal = 1) then
         Vision.Image_Preprocessing.Show_Original_Image(iImageSource,iWaitTime);
      end if;

      --convert image to greyscale
      if (iDoCvtGrey = 1) then
         Vision.Image_Processing.Convert_To_Greyscale(iImageSource,iGreyScaleLocation,iGreyFilter);
      end if;

      --canny image
      if (iDoCanny = 1) then
         Vision.Image_Processing.Canny(iImageSource,iGreyScaleLocation,iCannyLocation,iCannyLowThres, iCannyHighThres, iCannyKernelSize);
      end if;

      --convert image to hsi
      if (iDoCvtHSI = 1) then
         Vision.Image_Processing.Convert_To_HSI(iImageSource, iHSILocation, iHSIFilter);
      end if;

      --Gaussian Blur
      if (iDoGaussian = 1) then
         Vision.Image_Processing.Gaussian_Blur(iImageSource, iGaussianBlurLocation, iGaussianKerSize, dGaussianSigmaX, dGaussianSigmaY);
      end if;

      --threshold image, apply mask
      if (iDoThresh = 1) then
         Vision.Image_Processing.Threshold_Image(iImageSource,iHSILocation, iThreshedImageLocation, iBlueLow, iBlueUp, iGreenLow, iGreenUp, iRedLow, iRedUp);
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

      --compare histograms
      if(iDoCompareHistograms = 1) then
         compareHistResult:=processingWrap.compareHSVHistograms(iImageSource,iPreviousImageLocation,iHistogramCompareMethod);
      end if;

      --invert image
      if (iDoInvertImage = 1) then
         Vision.Image_Processing.Invert_Image(iImageSource, iInvertImageLocation);
      end if;

      --sharpen image
      if(iDoSharpenImage = 1) then
         Vision.Image_Preprocessing.Gaussian_Sharpen_Image(iImageSource,iEnhancedImageSource,iSharpenAccuracy);
      end if;

      --hough circles
      if (iDoHoughCircles = 1) then
         Vision.Image_Processing.Hough_Circles(iImageSource,iGreyScaleLocation,iCirclesLocation,inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius);
      end if;

      --Contour Analysis
      if (iDoContours = 1) then
         Vision.Image_Processing.Apply_Contours(iImageSource,iGreyScaleLocation,iContourLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
      end if;

      ---Approx Poly
      if (iDoApproxPoly = 1) then
         processingWrap.approxPolyDP(1.2, 1);
      end if;

      --Fusion
      if (iDoFusion = 1) then
         Vision.Image_Preprocessing.Fusion(iImageSource,iFusionOutLocation);
      end if;

      --Object tracking
      if(iDoObjectTracking = 1) then
         Vision.Image_Processing.Threshold_Image(iImageSource,iHSILocation, iThreshedImageLocation, 10, 70, 50, 255, 50, 255);
         Vision.Image_Processing.Apply_Contours(iThreshedImageLocation,iGreyScaleLocation,iContourLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         Vision.Image_Processing.Track_Object(iContourLocation,iGreyScaleLocation);
      end if;

      --Velocity mode
      if(iDoVelocityMode =1) then
         Vision.Image_Processing.Threshold_Image(iImageSource,iHSILocation, iThreshedImageLocation, 30, 60, 50, 255, 50, 255);
         Vision.Image_Processing.Apply_Contours(iThreshedImageLocation,iGreyScaleLocation,iContourLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         Vision.Image_Processing.Track_Object(iContourLocation,iGreyScaleLocation);
         processingWrap.estPosition;

         if velCount>0 then
            processingWrap.GaussianBlurSharpener(iImageSource,2,3);
            processingWrap.GaussianBlurSharpener(1,3,3);
            estVel:=processingWrap.estimateVelocity;
         end if;
         velCount:=1;
      end if;

      --write image to file
      if(iDoWriteImageToFile =1) then
         ret := CoreWrap.imwrite(New_String("CannyOut.jpg"),iImageSource);
      end if;

      --enhance colors in image
      if(iDoEnhanceColors = 1) then
         Vision.Image_Preprocessing.Enhance_Colors(iImageSource,iImageDestination,iEnhanceChannel,iEnhanceLevel);
      end if;


      if(iDoMatchTemplete =1) then
         if (loadTemplates = 0) then
            --load templates
            CoreWrap.imstore(iTemplate1,New_String("redTrident.jpg"));
            CoreWrap.imstore(iTemplate2,New_String("redSword.jpg"));
            CoreWrap.imstore(iTemplate3,New_String("redHoneycomb.jpg"));
            CoreWrap.imstore(iTemplate4,New_String("redCircle.jpg"));

            --cleanup templates
            iTemplate:=iTemplate1;
            for iTemplateIndex in 1 .. iTemplateSize loop
               processingWrap.enhanceColors(iTemplate,iTemplate,1,30.0);
               processingWrap.GaussianBlurSharpener(iTemplate,iTemplate,2);
               processingWrap.cvtColor(iTemplate, itemplateTempStorage, iHSIFilter);
               processingWrap.thresh(itemplateTempStorage, itemplateTempStorage, 0, 0, 0, 0, 50, 255);
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
         processingWrap.thresh(iHSILocation,iThreshedImageLocation, 0, 0, 0, 0, 50, 255);

         processingWrap.gaussianBlur(iThreshedImageLocation,iThreshedImageLocation,11,0.0,0.0);
         processingWrap.GaussianBlurSharpener(iThreshedImageLocation,iThreshedImageLocation,4);
         processingWrap.cvtColor(iThreshedImageLocation,iGreyScaleLocation, iGreyFilter);
         CoreWrap.imshow(New_String("test grey"),iGreyScaleLocation);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, 100, 300, iCannyKernelSize);
         bestTempleteMatchFound:=processingWrap.matchImage(iCannyLocation);
         processingWrap.classifyMatch(bestTempleteMatchFound);
      end if;

      if(iDoContrast = 1) then
         Vision.Image_Preprocessing.Do_Contrast(iImageSource, iContrastOut, iGain, iBias );
      end if;

      if(iDoQuaternionSwitchingFilter =1) then
         Vision.Image_Preprocessing.QNSF(iImageSource, iQNSFLocation, iQNSFThresh);
         Vision.Image_Preprocessing.QNSF(iQNSFLocation, iQNSFLocation, iQNSFThresh);
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
