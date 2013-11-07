with interfaces.C.strings; use interfaces.C.strings;
with interfaces.C; use interfaces.C;

package Vision.Image_Preprocessing is
   function DummyTest return Boolean;
   procedure Capture_Video(iImageSource, iWaitTime : in Interfaces.C.int;videoOpen : in Integer);
   procedure Show_Original_Image(iImageSource,iWaitTime : in Interfaces.C.int);
   procedure Gaussian_Sharpen_Image(iImageSource,iEnhancedImageSource,iSharpenAccuracy : in Interfaces.C.Int);
   procedure Fusion(iImageSource,iFusionOutLocation : in Interfaces.C.int);
end Vision.Image_Preprocessing;
