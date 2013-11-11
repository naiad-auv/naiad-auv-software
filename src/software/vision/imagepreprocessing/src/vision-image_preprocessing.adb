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
      CoreWrap.imshow(New_String("why so video"), iImageSource);
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
      CoreWrap.imshow(New_String("Why so enhanced?"),iImageDestination);
      CoreWrap.waitKey(0);
   end Enhance_Colors;

   procedure Load_Templates (iTemplate1,iTemplate2,iTemplate3,iTemplate4 : in Interfaces.C.int) is
   begin
      CoreWrap.imstore(iTemplate1,New_String("redTrident.jpg"));
      CoreWrap.imstore(iTemplate2,New_String("redSword.jpg"));
      CoreWrap.imstore(iTemplate3,New_String("redHoneycomb.jpg"));
      CoreWrap.imstore(iTemplate4,New_String("redCircle.jpg"));
   end Load_Templates;

   --function not needed yet
   procedure Cleanup_Templates(iTemplate,itemplateTempStorage : in Interfaces.C.int;iTemplateSize : in Integer) is
   tempIndex : interfaces.c.int := iTemplate;
   begin
      for iTemplateIndex in 1 .. iTemplateSize loop
         processingWrap.enhanceColors(iTemplate,iTemplate,1,30.0);
         processingWrap.GaussianBlurSharpener(iTemplate,iTemplate,2);
         processingWrap.cvtColor(iTemplate, itemplateTempStorage, 40);
         processingWrap.thresh(itemplateTempStorage, itemplateTempStorage, 0, 0, 0, 0, 50, 255);
         processingWrap.gaussianBlur(itemplateTempStorage,itemplateTempStorage,11,0.0,0.0);
         processingWrap.GaussianBlurSharpener(itemplateTempStorage,itemplateTempStorage,4);
         processingWrap.cvtColor(itemplateTempStorage,itemplateTempStorage, 6);
         processingWrap.Canny(itemplateTempStorage,iTemplate, 100, 300, 3);
         --iTemplate:=iTemplate+1;
         tempIndex:=tempIndex+1;
      end loop;
   end Cleanup_Templates;

end Vision.Image_Preprocessing;
