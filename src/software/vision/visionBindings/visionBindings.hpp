#include <stdlib.h>
#include <stdio.h>
#include <string>

//defines
#define IMAGE_BUFFER_SIZE 10
#define FRAME_RATE 1.0 //images per second
#define NUMBER_OF_TEMPLATES 4
#define IMAGE_STORE_SIZE 40


class Core_Wrap{

virtual void push_back_templeteStore(char * src);

virtual void imread(char * name);

virtual int imwrite(char * name, int src);

virtual void imshow(char * name, int src);

virtual void waitKey(int time);

virtual int size(void);

virtual void img_buffer(void);

virtual void imstore(int src, char * name);

virtual void printNum(int num);

Core_Wrap();

};


class Processing_Wrap{

virtual void cvtColor(int src, int dst, int filter);

virtual void Canny(int src, int dst, int lThresh, int hThresh, int kernelSize);

virtual void HoughCircles(int src,int inverseRatioOfResolution,int minDistBetweenCenters,int cannyUpThres, int centerDetectionThreshold, int minRadius,int maxRadius );

virtual void DrawHoughCircles(int src,int dest);

virtual void FindCircleCenters(void);

virtual void HoughLines(int src, int rho, float theta, int intersectionThreshold);

virtual void HoughLinesP(int src);

virtual void DrawHoughLines(int cdst);

virtual void Contours(int src);

virtual void showContours(int src,int contourOut, int contourId, int thickness);

virtual void BGRHistogram(int numSourceArray, int histDimensionality, int histSize, float range[],bool uniform, bool accumulate);

virtual void HSIHistogram(int src,int numSourceArray, int channels[], int histSize[],float hrange[],float srange[], int histDimensionality,bool uniform, bool accumulate);

virtual void showBGRHistogram(int histSize);

virtual void showHSIHistogram(int histSize[]);

virtual double compareHSVHistograms(int src1,int src2,int compareMethod);

virtual void approxPolyDP(double epsilon, bool closed);

virtual void splitChannels(int src);

virtual void showBlueChannel();

virtual void showGreenChannel();

virtual void thresh(int src, int dst, int blueLow, int blueUp, int greenLow, int greenUp, int redLow, int redUp);

virtual void showRedChannel();

virtual void LabelPoints(int src);

virtual void gaussianBlur(int src, int dest, int kersize, double sigmaX, double sigmaY);

virtual void objectTracking(int src);

virtual void roi(int src, int dst);

virtual void goodFeatures(int src);

virtual void fusion(int src, int dst);

virtual float estimateVelocity(void);

virtual void GaussianBlurSharpener(int src,int destination,int accuracy);

virtual void estPosition(void);

virtual void invertImage(int src, int dst);

virtual int matchImage(int src);

virtual void cloneImage(int src,int dst);

virtual void enhanceColors(int src,int dest,int channel,double level);

virtual void fillInPoly(void);//possibly redundant function, leaving in as might be useful when testing the system

virtual void classifyMatch(int bestMatch);

Processing_Wrap();
};


// VideoCapture test - Stream

class Preprocessing_Wrap{
virtual void VideoCaptureOpen(void);

virtual void namedWindow(char * name, int num);

virtual void nextFrame(int dst);

virtual void contrast(int src, int dst, int gain, int bias);

virtual void quaterNionSwitchingFilter(int src, int dst, double QNSFThresh);

Preprocessing_Wrap();
};
