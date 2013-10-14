with visionBindings_hpp;
with interfaces.C; use interfaces.C;

package body Vision.Image_Processing is
   processingWrap : aliased visionBindings_hpp.Class_Processing_Wrap.Processing_Wrap;

   function DummyTest return Boolean is
   begin
      return True;
   end DummyTest;

   procedure Convert_To_Greyscale(iImageSource, iImageDestination, iImageFilter : in Integer) is
   begin
      processingWrap.cvtColor(interfaces.C.int(iImageSource),
                              Interfaces.C.int(iImageDestination),
                              interfaces.C.int(iImageFilter));
   end Convert_To_Greyscale;

   procedure Canny(iImageSource, iImageDestination, iLowThreshold, iHighThreshold, iKernelSize: in integer) is
   begin
      processingWrap.Canny(interfaces.C.int(iImageSource), Interfaces.C.int(iImageDestination), interfaces.C.int(iLowThreshold),interfaces.C.int(iHighThreshold), interfaces.C.int(iKernelSize));
   end Canny;

   procedure Hough_Circles(iImageDestination, inverseRatioOfResolution, minDistBetweenCenters, houghCannyUpThres, centerDetectionThreshold, minRadius, maxRadius: in integer) is
   begin
      processingWrap.HoughCircles(interfaces.C.int(iImageDestination), interfaces.C.int(inverseRatioOfResolution),interfaces.C.int(minDistBetweenCenters),interfaces.C.int(houghCannyUpThres),interfaces.C.int(centerDetectionThreshold),interfaces.C.int(minRadius),interfaces.C.int(maxRadius));
   end Hough_Circles;

   procedure Draw_Hough_Circles(iImageSource: in integer) is
   begin
      processingWrap.DrawHoughCircles(interfaces.C.int(iImageSource));
   end Draw_Hough_Circles;

   --function histogram analysis
   --function edge detection
   --function Edge_Canny(TImage) return TImage;
   --function find location of detected edge
end Vision.Image_Processing;
