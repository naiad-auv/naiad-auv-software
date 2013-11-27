with visionBindings_hpp;
with interfaces.C; use interfaces.C;
with interfaces.C.strings; use interfaces.C.strings;

package body Vision.Image_Processing is
   processingWrap : aliased visionBindings_hpp.Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased visionBindings_hpp.Class_Preprocessing_Wrap.Preprocessing_Wrap;
   CoreWrap : aliased visionBindings_hpp.Class_Core_Wrap.Core_Wrap;

   function DummyTest return Boolean is
   begin
      return True;
   end DummyTest;

   procedure Convert_To_Greyscale(iImageSource, iGreyScaleLocation, iGreyFilter : in Interfaces.C.int) is
   begin
      processingWrap.cvtColor(iImageSource,iGreyScaleLocation, iGreyFilter);
      CoreWrap.imwrite(New_String("why so grey.jpg"), iGreyScaleLocation);--show image for debug purposes
      --CoreWrap.waitKey(0);
   end Convert_To_Greyscale;

   --Canny_Wrap(3, 3, 50, 150, 3);
   procedure Canny(iImageSource,iGreyScaleLocation,iCannyLocation,iCannyLowThres, iCannyHighThres, iCannyKernelSize: in Interfaces.C.int) is
   begin
      processingWrap.cvtColor(iImageSource,iGreyScaleLocation, 6);
      processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
      CoreWrap.imwrite(New_String("why so canny.jpg"), iCannyLocation);--show image for debug purposes
      --CoreWrap.waitKey(0);
   end Canny;

   procedure Gaussian_Blur(iImageSource, iGaussianBlurLocation, GaussianKerSize : in interfaces.C.int; GaussianSigmaX, GaussianSigmaY: in interfaces.C.double) is
   begin
      processingWrap.gaussianBlur(iImageSource, iGaussianBlurLocation, GaussianKerSize, GaussianSigmaX, GaussianSigmaY);
      CoreWrap.imwrite(New_String("Why so Gaussian.jpg"), iGaussianBlurLocation);--show image for debug purposes
      --CoreWrap.waitKey(0);
   end Gaussian_Blur;

   procedure Convert_To_HSI(iImageSource, iHSILocation, iHSIFilter: in Interfaces.C.Int) is
   begin
      processingWrap.cvtColor(iImageSource, iHSILocation, iHSIFilter);
      CoreWrap.imwrite(New_String("Why so HSI.jpg"),iHSILocation);
      --CoreWrap.waitKey(0);
   end Convert_To_HSI;

   procedure Threshold_Image(iImageSource,iHSILocation, iThreshedImageLocation, iBlueLow, iBlueUp, iGreenLow, iGreenUp, iRedLow, iRedUp : in Interfaces.C.int) is
   begin
      processingWrap.cvtColor(iImageSource, iHSILocation, 40);
      processingWrap.thresh(iHSILocation, iThreshedImageLocation, iBlueLow, iBlueUp, iGreenLow, iGreenUp, iRedLow, iRedUp);
      CoreWrap.imwrite(New_String("why so after mask.jpg"),iThreshedImageLocation);
   end Threshold_Image;

   procedure Invert_Image(iImageSource, iInvertImageLocation: in Interfaces.C.int) is
   begin
      processingWrap.invertImage(iImageSource, iInvertImageLocation);
      CoreWrap.imwrite(New_String("why so negative.jpg"), iInvertImageLocation);--show image for debug purposes
      --CoreWrap.waitKey(0);
   end Invert_Image;

   procedure Hough_Circles(iImageSource,iGreyScaleLocation,iCirclesLocation,inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius: in Interfaces.C.Int) is
   begin
      processingWrap.cvtColor(iImageSource,iGreyScaleLocation, 6);
      processingWrap.HoughCircles(iGreyScaleLocation, inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius);
      processingWrap.DrawHoughCircles(iImageSource,iCirclesLocation);
      CoreWrap.imwrite(New_String("why so circly.jpg"), iCirclesLocation);--show image for debug purposes
      processingWrap.FindCircleCenters;
      --CoreWrap.waitKey(0);
   end Hough_Circles;

   procedure Apply_Contours(iImageSource,iGreyScaleLocation,iContourLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize : in Interfaces.C.Int) is
   begin
         processingWrap.cvtColor(iImageSource,iGreyScaleLocation, 6);
         processingWrap.Canny(iGreyScaleLocation,iCannyLocation, iCannyLowThres, iCannyHighThres, iCannyKernelSize);
         processingWrap.Contours(iCannyLocation);
         processingWrap.showContours(iImageSource,contourOut => iContourLocation,contourId  => -1 ,thickness  => 1 );
         CoreWrap.imwrite(New_String("Why with the contours.jpg"),iContourLocation);
      --CoreWrap.waitKey(0);
   end Apply_Contours;

   procedure Track_Object(iContourLocation,iGreyScaleLocation: in Interfaces.C.Int) is
   begin
      processingWrap.cvtColor(iContourLocation,iGreyScaleLocation, 6);
      processingWrap.approxPolyDP(1.2, 1);
      processingWrap.goodFeatures(iGreyScaleLocation);
      processingWrap.objectTracking(iContourLocation);
   end Track_Object;


end Vision.Image_Processing;
