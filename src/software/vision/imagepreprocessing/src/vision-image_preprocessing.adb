with visionBindings_hpp;
with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;

package body Vision.Image_Preprocessing is
   processingWrap : aliased visionBindings_hpp.Class_Processing_Wrap.Processing_Wrap;
   preprocessingWrap : aliased visionBindings_hpp.Class_Preprocessing_Wrap.Preprocessing_Wrap;
   CoreWrap : aliased visionBindings_hpp.Class_Core_Wrap.Core_Wrap;

   function DummyTest return Boolean is
   begin
      return True;
   end DummyTest;

   procedure Show_Original_Image(iImageSource,iWaitTime : in Interfaces.C.int) is
   begin
      CoreWrap.imshow(New_String("Why so normal?"), iImageSource);--show image for debug purposes
      CoreWrap.waitKey(iWaitTime);
   end Show_Original_Image;

   procedure Capture_Video(iImageSource, iWaitTime : in Interfaces.C.int;videoOpen : in Integer) is
   begin
      if (videoOpen=0) then
         preprocessingWrap.VideoCaptureOpen;
      end if;

      preprocessingWrap.nextFrame(iImageSource);
      CoreWrap.imshow(New_String("test video"), iImageSource);
      CoreWrap.waitKey(iWaitTime);
   end Capture_Video;

   procedure Gaussian_Sharpen_Image(iImageSource,iEnhancedImageSource,iSharpenAccuracy : in Interfaces.C.Int) is
   begin
      processingWrap.GaussianBlurSharpener(iImageSource,iEnhancedImageSource,iSharpenAccuracy);
      CoreWrap.imshow(New_String("why so sharp?"),iEnhancedImageSource);
      CoreWrap.waitKey(0);
   end Gaussian_Sharpen_Image;

   procedure Fusion(iImageSource,iFusionOutLocation : in Interfaces.C.int) is
   begin
      processingWrap.fusion(iImageSource, iFusionOutLocation);
      CoreWrap.imshow(New_String("why so fused?"), iFusionOutLocation);
      CoreWrap.waitKey(0);
   end Fusion;

   procedure Enhance_Colors(iImageSource,iImageDestination,iEnhanceChannel : in Interfaces.C.Int;iEnhanceLevel : in Interfaces.C.Double) is
   begin
      processingWrap.enhanceColors(iImageSource,iImageDestination,iEnhanceChannel,iEnhanceLevel);
      CoreWrap.imshow(New_String("enhanced image.jpg"),iImageDestination);
      CoreWrap.waitKey(0);
   end Enhance_Colors;


end Vision.Image_Preprocessing;
