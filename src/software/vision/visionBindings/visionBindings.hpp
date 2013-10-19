#include <stdlib.h>
#include <stdio.h>
#include <string>

#define IMAGE_STORE_SIZE 15

class Core_Wrap{

virtual void push_back(char * src);

virtual void imread(char * name);

virtual int imwrite(char * name, int src);

virtual void imshow(char * name, int src);

virtual void waitKey(int time);

virtual int size(void);

virtual void imstore(int src, char * name);

Core_Wrap();

};


class Processing_Wrap{
virtual void split(int src);

virtual void cvtColor(int src, int dst, int filter);

virtual void Canny(int src, int dst, int lThresh, int hThresh, int kernelSize);

//std::vector<cv::Vec3f*>&circles,
virtual void HoughCircles(int src,int inverseRatioOfResolution,int minDistBetweenCenters,int cannyUpThres, int centerDetectionThreshold, int minRadius,int maxRadius );
virtual void DrawHoughCircles(int src);

//HoughLines
virtual void HoughLines(int src, int rho, float theta, int intersectionThreshold);
virtual void DrawHoughLines(int cdst);

//Contours
virtual void Contours(int src);
virtual void showContours(int contourOut, int contourId, int thickness);

//Histogram

virtual void BGRHistogram(int histSize, float rangeLower, float rangeHigher);
virtual void showBGRHistogram(int histSize);
//virtual void showHistogram();


virtual void LabelPoints(int src);

Processing_Wrap();
};


// VideoCapture test - Stream

class Preprocessing_Wrap{
virtual void VideoCaptureOpen(void);

virtual void namedWindow(char * name, int num);

virtual void nextFrame(int dst);

Preprocessing_Wrap();
};

/* mission wrap
class Mission_Handler_Wrap{
virtual void VideoCaptureOpen(void);

virtual void namedWindow(char * name, int num);

virtual void nextFrame(int dst);

Highgui_Wrap();
};*/
