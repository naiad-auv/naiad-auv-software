#include <stdlib.h>
#include <stdio.h>
#include <string>


//defines
#define IMAGE_BUFFER_SIZE 10
#define IMAGE_STORE_SIZE 30


class Core_Wrap{

virtual void push_back(char * src);

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

virtual void DrawHoughCircles(int src);

virtual void FindCircleCenters(void);

virtual void HoughLines(int src, int rho, float theta, int intersectionThreshold);

virtual void DrawHoughLines(int cdst);

virtual void Contours(int src);

virtual void showContours(int contourOut, int contourId, int thickness);

virtual void BGRHistogram(int numSourceArray, int histDimensionality, int histSize, float range[],bool uniform, bool accumulate);

virtual void HSIHistogram(int src,int numSourceArray, int channels[], int histSize[],float hrange[],float srange[], int histDimensionality,bool uniform, bool accumulate);

virtual void showBGRHistogram(int histSize);

virtual void showHSIHistogram(int histSize[]);

virtual void approxPolyDP(double epsilon, bool closed);

virtual void splitChannels(int src);

virtual void showBlueChannel();

virtual void showGreenChannel();

virtual int thresh(int src, int lowLimit, int upLimit, int ch);

virtual void showRedChannel();

virtual void LabelPoints(int src);

virtual void gaussianBlur(int src, int dest, int kersize, double sigmaX, double sigmaY);

Processing_Wrap();
};


// VideoCapture test - Stream

class Preprocessing_Wrap{
virtual void VideoCaptureOpen(void);

virtual void namedWindow(char * name, int num);

virtual void nextFrame(int dst);

Preprocessing_Wrap();
};
