package Vision.Image_Processing is
   function DummyTest return Boolean;
   procedure Convert_To_Greyscale(iImageSource, iImageDestination, iImageFilter: in integer);
   procedure Canny(iImageSource, iImageDestination, iLowThreshold, iHighThreshold, iKernelSize: in integer);

   --function cleanup
   --function histogram analysis
   --function edge detection
   --function Edge_Canny(TImage) return TImage;
   --function find location of detected edge
end Vision.Image_Processing;
