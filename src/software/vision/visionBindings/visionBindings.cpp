#include "visionBindings.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/opencv.hpp"
#include <vector>


std::vector<cv::Mat> img;
std::vector<cv::Vec3f> circles;
std::vector<cv::Vec2f> lines;
std::vector<cv::Mat> contours;
cv::VideoCapture cap;

void Core_Wrap::push_back(char * src)
{
  img.push_back(cv::imread(src));
}

void Core_Wrap::imread(char * name)
{
  cv::imread(name);
}

int Core_Wrap::imwrite(char * name, int src)
{
  if (cv::imwrite(name, img.at(src)))
    return 1;
  else
    return 0;
}

void Core_Wrap::imshow(char * name, int src)
{
  cv::imshow(name, img.at(src));
}

void Core_Wrap::waitKey(int time)
{
  cv::waitKey(time);
}

int Core_Wrap::size(void)
{
   return img.size();
}

Core_Wrap::Core_Wrap(){}

//processing functions in openCV!!
void Processing_Wrap::cvtColor(int src, int dst, int filter)
{
  cv::cvtColor(img.at(src), img.at(dst), filter);
}

void Processing_Wrap::Canny(int src, int dst, int lThresh, int hThresh, int kernelSize)
{
  cv::Canny(img.at(src), img.at(dst), lThresh, hThresh, kernelSize);
}

//void tester(std::vector<Item*>&);std::vector<cv::Vec3f*>&circles
void Processing_Wrap::HoughCircles(int src,int inverseRatioOfResolution,int minDistBetweenCenters,int cannyUpThres, int centerDetectionThreshold, int minRadius,int maxRadius )
{
  cv::HoughCircles( img.at(src), circles, CV_HOUGH_GRADIENT, inverseRatioOfResolution, minDistBetweenCenters, cannyUpThres, centerDetectionThreshold, minRadius, maxRadius );

}

///////////////////////////////IN PROGRESS ///////////////////////////////////////////////
/// Draw the hough circles detected
void Processing_Wrap::DrawHoughCircles(int src)
{
  int i;

  for( size_t i = 0; i < circles.size(); i++ )
  {
      cv::Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
      int radius = cvRound(circles[i][2]);
      // circle center im source, center of circle, radius, color, thickness, linetype, shift
      cv::circle( img.at(src), center, 3, cv::Scalar(0,255,0), -1, 8, 0 );
      // circle outline
      cv::circle( img.at(src), center, radius, cv::Scalar(0,0,255), 3, 8, 0 );
   }
}
///////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////HOUGH LINES////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

void Processing_Wrap::HoughLines(int src, int rho, float theta, int intersectionThreshold)
{
  //std::vector<cv::Mat> cdst;
  
  cv::HoughLines( img.at(src), lines, rho, theta, intersectionThreshold, 0, 0 );	
 
}


///////////////////////////////DRAW HOUGH LINES////////////////////////////////////////////

void Processing_Wrap::DrawHoughLines(int cdst)
{
  int i;

  for( size_t i = 0; i < lines.size(); i++ )
  {
	float rho = lines[i][0], theta = lines[i][1];
	cv::Point pt1, pt2;
	double a = cos(theta), b = sin(theta);
	double x0 = a*rho, y0 = b *rho;

	pt1.x = cvRound(x0 + 1000*(-b));
	pt1.y = cvRound(y0 + 1000*(a));
	pt2.x = cvRound(x0 + 1000*(-b));
	pt2.y = cvRound(y0 + 1000*(a));
	line( img.at(cdst), pt1, pt2, cv::Scalar(0,0,255), 10, CV_AA);
	cv::imshow("liney", img.at(cdst));
	
      
   }
}

///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// Contours ////////////////////////////////////////////

void Processing_Wrap::Contours(int src) // TO DO : include image-ROI
{
	cv::Mat G;
	if(img.at(src).data)
	{
		std::cout<<"in contour \n";
		cv::waitKey(0);
	}
	else
	{
		std::cout<<"img not found";
		cv::waitKey(0);
	}
	cv::Mat F=img.at(1).clone();
	cv::imshow("precanny", F);
	cv::waitKey(0);
	cv::Canny(F,G,50,450,3);
	std::cout<<"wait after canny";
	cv::waitKey(0);
	cv::imshow("super canny",G);
	cv::waitKey(0);
	
	cv::findContours( G, contours, CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE);
	cv::waitKey(0);
	char* name = "in contours";
	cv::imshow(name, img.at(src)); //TO DO : REMOVE
	cv::waitKey(0);
}

/////////////////////////////////////// display ///////////////////////////////////////////

void Processing_Wrap::showContours(int contourOut, int contourId = -1, int thickness = 3)
{
	cv::drawContours(img.at(contourOut), contours, contourId, cv::Scalar(0,0,255), thickness, CV_AA );
	cv::waitKey(0);	
}

///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

Processing_Wrap::Processing_Wrap(){}
// VideoCapture test - Stream

void Preprocessing_Wrap::VideoCaptureOpen(void)
{
  cap.open(0);
}

void Preprocessing_Wrap::namedWindow(char * name, int num)
{
  cv::namedWindow(name, num);
}

void Preprocessing_Wrap::nextFrame(int dst)
{
  cap >> img.at(dst);
}

Preprocessing_Wrap::Preprocessing_Wrap(){}

