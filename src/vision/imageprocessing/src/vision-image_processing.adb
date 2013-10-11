with visionBindings_hpp;
with interfaces.C; use interfaces.C;

package body Vision.Image_Processing is
   function DummyTest return Boolean is
   begin
      return True;
   end DummyTest;

   procedure Convert_To_Greyscale(iImageSource, iImageDestination, iImageFilter : in Integer) is
      processingWrap : aliased visionBindings_hpp.Class_Processing_Wrap.Processing_Wrap;
   begin
      processingWrap.cvtColor(interfaces.C.int(iImageSource), Interfaces.C.int(iImageDestination), interfaces.C.int(iImageFilter));
   end Convert_To_Greyscale;

   --function histogram analysis
   --function edge detection
   --function Edge_Canny(TImage) return TImage;
   --function find location of detected edge
end Vision.Image_Processing;
