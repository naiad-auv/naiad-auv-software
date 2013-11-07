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

end Vision.Image_Preprocessing;
