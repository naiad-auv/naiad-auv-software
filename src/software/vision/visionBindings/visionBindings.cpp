#include "visionBindings.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/opencv.hpp"
#include <vector>
#include<iostream>
#include<vector>
#include<string>
#include<queue>

std::vector<cv::Mat> img;
std::vector<cv::Vec3f> circles;
std::vector<cv::Vec2f> lines;
std::vector<cv::Mat> contours;
cv::VideoCapture cap;
std::queue <cv::Mat> imageBuf; // Declare a queue
int imageName=0;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////    IMAGE BUFFER FUNC   ////////////////////////////////////////////////////////////////////////
//func that loads in images in buffer of size IMAGE_BUFFER_SIZE(uses queue func from c++, and creates a queue of IMAGE_BUFFER_SIZE
//It loads buffer and replaces the image at img.at(0)
//NB takes images from a folder at the minute, this will need to be changed when the real input method for the system
//becomes available. 
void Core_Wrap::test_func()
{
  char strStorage[50]; // enough to hold all numbers up to 64-bits
  int bufSize=0;
  
  std::string folderPath = "/home/vision/Documents/project/cdt508/Robosub2012_logging/Loggning/log 3/Bottom/";
  std::string result;
  std::string imageType = ".jpg";
  
  if (imageBuf.size()==0)//load image, then pop image and enter do loop
  {
	sprintf(strStorage, "%d", imageName);//imageName global, set to 1, and increases as prog scrolls through images in folder
  	result = folderPath + strStorage + imageType;
  	cv::Mat F=cv::imread(result,1);//<0 unchanged, 0 greyscale, >0 rgb
  	imageBuf.push(F);
   }
   img.at(0)=imageBuf.front();
   imageBuf.pop();
	
    //load buffer
   do{
   sprintf(strStorage, "%d", imageName);
   result = folderPath + strStorage + imageType;
   cv::Mat F=cv::imread(result,1);//<0 unchanged, 0 greyscale, >0 rgb
   imageBuf.push(F);
   imageName=imageName+1;
   bufSize=imageBuf.size();
   }while (bufSize<IMAGE_BUFFER_SIZE);
   
   std::cout<<imageName;
}

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
////////////////////////////////////////CANNY/////////////////////////////////////////////////////
// NB Canny works on an input greyscale image
void Processing_Wrap::Canny(int src, int dst, int lThresh, int hThresh, int kernelSize)
{
  cv::Canny(img.at(src), img.at(dst), lThresh, hThresh, kernelSize);
}

//////////////////////////////////////HOUGH CIRCLES//////////////////////////////////////////////////////////////
// Takes in source image index, stores result in circles vector defined above
void Processing_Wrap::HoughCircles(int src,int inverseRatioOfResolution,int minDistBetweenCenters,int cannyUpThres, int centerDetectionThreshold, int minRadius,int maxRadius )
{
int circCount;
//cv::imshow("super circles",img.at(src));
//	cv::waitKey(0);
  cv::HoughCircles( img.at(src), circles, CV_HOUGH_GRADIENT, inverseRatioOfResolution, minDistBetweenCenters, cannyUpThres, centerDetectionThreshold, minRadius, maxRadius );
circCount=circles.size();
std::cout<<"circles:\t"<<circCount<<std::endl;

}

///////////////////////////////DRAW CIRCLES ///////////////////////////////////////////////
// Draw the hough circles detected, Gets input from circles vector defined above, 
// NB This function will be removed, only used for testing
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

/////////////////////////////// IMAGE INTENSITY FUNCTION////////////////////////////////////7
// This function searches through an image at img.at(src) pixel by pixel and prints the intensity
// value for each picture
//NB "print" has to be changed to "add to a storage vector" if it is decided that this function
//is needed. At the minute it is surplus to requirements but this will more than likely change
void Processing_Wrap::LabelPoints(int src)
{
int x,y;
x=y=0;
cv::Size dim = img.at(src).size();
cv::Mat F = img.at(src).clone();
cv::Scalar intensity;

    for(int heightIndex=0;heightIndex<dim.height;++heightIndex)
    {
	std::cout<<"change height";
	for(int widthIndex=0;widthIndex<dim.width;++widthIndex)
	{
		intensity = F .at<uchar>(cv::Point(widthIndex,heightIndex));
		std::cout<< intensity.val[0];
	}
    }
	std::cout<<"height"<<dim.height<<"width"<<dim.width;
	cv::waitKey(0);
}



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
	//cv::Mat G;
	if(img.at(src).data)
	{
		//std::cout<<"in contour \n";
		//cv::waitKey(0);
	}
	else
	{
		std::cout<<"img not found";
		cv::waitKey(0);
	}
	//cv::Mat F=img.at(src).clone();
	//cv::imshow("precontours", F);
	//cv::waitKey(0);
//	cv::Canny(F, G, 50, 450, 3);
//	std::cout<<"wait after canny";
//	cv::waitKey(0);
//	cv::imshow("super canny",G);
//	cv::waitKey(0);
	
	cv::findContours( img.at(src), contours, CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE);
	//cv::waitKey(0);
	//cv::imshow("in contours", img.at(src)); //TO DO : REMOVE
	//cv::waitKey(0);
}

/////////////////////////////////////// display ///////////////////////////////////////////

void Processing_Wrap::showContours(int contourOut, int contourId = -1, int thickness = 1)
{
	//std::cout<<"in show contour \n";
	//cv::waitKey(0);
	cv::drawContours(img.at(contourOut), contours, contourId, cv::Scalar(0,0,255), thickness, CV_AA );
	//cv::waitKey(0);	
}

//////////////////////////aprox poly //////////////////////////////////////////////////////
void Processing_Wrap::approxPolyDP(double epsilon, bool closed)
{
   //std::cout<<"in aprox poly \n";
int count,triCount = 0;
   std::vector<cv::Point> polys;
   //std::vector<cv::Mat>fourPolys;

   for (int i =0;i<contours.size();i++)
	{
	cv::approxPolyDP(contours[i], polys, arcLength(cv::Mat(contours[i]), true)*0.02,closed);
	if (polys.size()==4)
	{
	
   //     std::cout<<"\n polys : "<<polys<<"\n";

	count++;
	//cv::waitKey(0);
	}
	if (polys.size()==3)
	{
	triCount++;
	}
//	else 
//	{
	//std::cout<<"no square \n";	
//	}	
	}
	
    std::cout<<"rectangles:\t"<<count;
    std::cout<<"\ntriangles:\t"<<triCount<<std::endl;
  //cv::drawContours(img.at(0), fourPolys, -1, cv::Scalar(255,0,0), 3, CV_AA );
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

