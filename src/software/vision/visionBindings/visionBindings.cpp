#include "visionBindings.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/opencv.hpp"
#include <vector>
#include<iostream>
#include<vector>

std::vector<cv::Mat> img;
std::vector<cv::Vec3f> circles;
std::vector<cv::Vec2f> lines;
std::vector<cv::Mat> contours;
std::vector<cv::MatND> hist;
cv::VideoCapture cap;

//std::vector<float> hrange(0,180);
//std::vector<float> srange(0,256);
//std::vector<float*> ranges(hrange,srange);

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


//labeler func
void Processing_Wrap::LabelPoints(int src)
{
int x,y;
x=y=0;


cv::Size dim = img.at(src).size();
//cv::Mat G;
cv::Mat F = img.at(src).clone();
cv::imshow("test func image", F);
cv::waitKey(0);
//cv::Scalar intensity = F.at<uchar>(cv::Point(x, y));
//cv::Vec3b intensity = F.at<cv::Vec3b>(cv::Point(x, y));

std::cout<<"width of image is"<<dim.width;
std::cout<<"made it here";
cv::waitKey(0);
//cv::Canny(F, G, 50, 450, 3);
//cv::imshow("cannied that bitch", G);
//cv::waitKey(0);
cv::Scalar intensity;

cv::waitKey(0);

    for(int heightIndex=0;heightIndex<dim.height;++heightIndex)
    {
	std::cout<<"change height";
	for(int widthIndex=0;widthIndex<dim.width;++widthIndex)
	{
		intensity = F .at<uchar>(cv::Point(widthIndex,heightIndex));
		std::cout<< intensity.val[0];
	}
	std::cout<<std::endl;
    }
	std::cout<<"height"<<dim.height<<"width"<<dim.width;
	cv::waitKey(0);
}


///////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////HOUGH LINES////////////////////////////////////////////

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
	cv::Mat F=img.at(2).clone();
	cv::imshow("precanny", F);
	cv::waitKey(0);
	cv::Canny(F, G, 50, 450, 3);
	std::cout<<"wait after canny";
	cv::waitKey(0);
	cv::imshow("super canny",G);
	cv::waitKey(0);
	
	cv::findContours( G, contours, CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE);
	cv::waitKey(0);
	//char* name = "in contours";
	cv::imshow("in contours", img.at(src)); //TO DO : REMOVE
	cv::waitKey(0);
}

/////////////////////////////////////// display ///////////////////////////////////////////

void Processing_Wrap::showContours(int contourOut, int contourId = -1, int thickness = 3)
{
	std::cout<<"in show contour \n";
	cv::waitKey(0);
	cv::drawContours(img.at(contourOut), contours, contourId, cv::Scalar(0,0,255), thickness, CV_AA );
	cv::waitKey(0);	
}

///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// HISTOGRAM ////////////////////////////////////////////

void Processing_Wrap::Histogram(int src)
{
	//cv::Mat hsv;

	//convert to hsv
	//cv::cvtColor(img.at(src), hsv, 40);
	//cv::imshow("HSV",hsv);
	//cv::waitKey(0);

	cv::vector<cv::Mat> bgr;
  	cv::split( img.at(src), bgr );	

	int hbins=10, sbins=10;
	int histSize=256;
	
	float hranges[]={0,180};
	float sranges[]={0,256};
	
	cv::MatND hist;

	int channels[]={0,1};
	float range[]={0,256};
	const float *histRange[]={0,256};
	cv::Mat b_hist;
	const int *histSize1=&histSize;

	calcHist( &bgr[0], 1, 0, cv::Mat(), b_hist, 1, &histSize, &histRange, true, false );
//	cv::calcHist(&hsv,1,channels, cv::Mat(),hist,2,histSize,ranges,true,false);
/*
	double maxVal=0;
	minMaxLoc(hist,0,&maxVal,0,0);

	int scale=10;

	 cv::Mat histImg = cv::Mat::zeros(sbins*scale, hbins*10, CV_8UC3);

    for( int h = 0; h < hbins; h++ )
        for( int s = 0; s < sbins; s++ )
        {
            float binVal = hist.at<float>(h, s);
            int intensity = cvRound(binVal*255/maxVal);
            rectangle( histImg, cv::Point(h*scale, s*scale),
                        cv::Point( (h+1)*scale - 1, (s+1)*scale - 1),
                        cv::Scalar::all(intensity),
                        CV_FILLED );
        }
    
    cv::imshow( "H-S Histogram", histImg );
    cv::waitKey();*/
}

///////////////////////////////////// display /////////////////////////////////////////////
/*
void Processing_Wrap::showHistogram()
{
	std::cout<<"Histogram : "<< &hist;
}
*/
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

