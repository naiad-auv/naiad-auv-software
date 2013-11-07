with interfaces.C; use interfaces.C;

package Vision.Image_Processing is
   function DummyTest return Boolean;
   procedure Convert_To_Greyscale(iImageSource, iGreyScaleLocation, iGreyFilter: in Interfaces.C.int);
   procedure Canny(iImageSource,iGreyScaleLocation,iCannyLocation,iCannyLowThres, iCannyHighThres, iCannyKernelSize: in Interfaces.C.Int);
   procedure Gaussian_Blur(iImageSource, iGaussianBlurLocation, GaussianKerSize : in interfaces.C.int; GaussianSigmaX, GaussianSigmaY : in interfaces.C.double);
   procedure Convert_To_HSI(iImageSource, iHSILocation, iHSIFilter: in Interfaces.C.Int);
   procedure Threshold_Image(iImageSource,iHSILocation, iThreshedImageLocation, iBlueLow, iBlueUp, iGreenLow, iGreenUp, iRedLow, iRedUp : in Interfaces.C.int);


end Vision.Image_Processing;
